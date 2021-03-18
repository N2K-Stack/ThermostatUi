#ifndef SYSTEMCONTROLLER_H
#define SYSTEMCONTROLLER_H

#include <QObject>

class systemcontroller : public QObject
{
    Q_OBJECT


public:
    explicit systemcontroller(QObject *parent = nullptr);

    Q_PROPERTY(int currentSystemTemperature READ currentSystemTemperature WRITE setcurrentSystemTemperature NOTIFY currentSystemTemperatureChanged)
    Q_PROPERTY(int targetTemp READ targetTemp WRITE setTargetTemp NOTIFY targetTempChanged)
    Q_PROPERTY(QString systemStatusMessage READ systemStatusMessage WRITE setSystemStatusMessage NOTIFY systemStatusMessageChanged)
    Q_PROPERTY(HeatSelectState systemState READ systemState WRITE setSystemState NOTIFY systemStateChanged)

    enum HeatSelectState {
        HEATING,
        COOLING,
        AUTO
    };

    Q_ENUM( HeatSelectState )

    int currentSystemTemperature() const;
    int targetTemp() const;
    QString systemStatusMessage() const;

    HeatSelectState systemState() const;

public slots:
    void setcurrentSystemTemperature(int currentSystemTemperature);
    void setTargetTemp(int targetTemp);
    void setSystemStatusMessage(QString systemStatusMessage);
    void setSystemState(HeatSelectState systemState);


signals:

    void currentSystemTemperatureChanged(int currentSystemTemperature);
    void targetTempChanged(int targetTemp);
    void systemStatusMessageChanged(QString systemStatusMessage);
    void systemStateChanged(HeatSelectState systemState);

private:
    int m_currentSystemTemperature;
    int m_targetTemp;
    QString m_systemStatusMessage;
    HeatSelectState m_systemState;

private:
   void checkSystemStatus();
};

#endif // SYSTEMCONTROLLER_H
