#include "systemcontroller.h"

systemcontroller::systemcontroller(QObject *parent)
        : QObject(parent)
        , m_currentSystemTemperature( 65 )
        , m_targetTemp( 70)
        , m_systemStatusMessage("Heating...")
        , m_systemState(HEATING)
{
}

int systemcontroller::currentSystemTemperature() const
{
    return m_currentSystemTemperature;
}

int systemcontroller::targetTemp() const
{
    return m_targetTemp;
}

QString systemcontroller::systemStatusMessage() const
{
    return m_systemStatusMessage;
}

systemcontroller::HeatSelectState systemcontroller::systemState() const
{
    return m_systemState;
}

void systemcontroller::setcurrentSystemTemperature(int currentSystemTemperature)
{
    if (m_currentSystemTemperature == currentSystemTemperature)
        return;

    m_currentSystemTemperature = currentSystemTemperature;
    emit currentSystemTemperatureChanged(m_currentSystemTemperature);
}

void systemcontroller::setTargetTemp(int targetTemp)
{
    if (m_targetTemp == targetTemp)
        return;

    m_targetTemp = targetTemp;
    emit targetTempChanged(m_targetTemp);
    checkSystemStatus();
}

void systemcontroller::setSystemStatusMessage(QString systemStatusMessage)
{
    if (m_systemStatusMessage == systemStatusMessage)
        return;

    m_systemStatusMessage = systemStatusMessage;
    emit systemStatusMessageChanged(m_systemStatusMessage);
    checkSystemStatus();
}

void systemcontroller::setSystemState(systemcontroller::HeatSelectState systemState)
{
    if (m_systemState == systemState)
        return;

    m_systemState = systemState;
    emit systemStateChanged(m_systemState);
}

void systemcontroller::checkSystemStatus()
{
    if(currentSystemTemperature() < targetTemp() && (systemState() == HEATING) )
        setSystemStatusMessage("Heating...");

    else if(currentSystemTemperature() > targetTemp() && (systemState() == COOLING))
        setSystemStatusMessage("Cooling...");

    else if(m_systemState == AUTO) {
        if((m_currentSystemTemperature < m_targetTemp))
            setSystemStatusMessage("Heating...");
        else if((m_currentSystemTemperature > m_targetTemp))
            setSystemStatusMessage("Cooling...");
        else
            setSystemStatusMessage("Holding...");

    }
    else
        setSystemStatusMessage("Holding...");
}
