class Patient

    @@all = []

    attr_accessor :name

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def appointments
        Appointment.all.select do |appt|
            appt.patient == self
        end
    end

    def doctors
        self.appointments.map do |appt|
            appt.doctor
        end
    end

    def new_appointment(doctor, date)
        Appointment.new(date, self, doctor)
    end

end