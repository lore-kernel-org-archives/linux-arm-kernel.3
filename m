Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683FA606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 10:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Oe0hycFm;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Seay3C2J
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=xOkdMQgEfZtJLgU0fFwbDzze1EactQ9BVvcxXQMDTo4=; b=Oe0hycFmWepwx/wOo6UuCqI/EU
	vn+PyMy+pEs5Km7JrTsLApwu3CcgW8C1wpEWXODLycwu1efxqoXl+DPu2ikrWNf5LSPKDPuaZZbFK
	nHcoVyqn5WNCThb+xM8CFbleCjDmqr0LWAddDkhFvBmmbKgOd71xaVEcL1jKhb52Yv3e4fPdmG/0u
	qn/po0cX37bpGlol6MLxfn6BG1w5uynB4vEWydWbhBQV3D0KcfuiZh4V12G70uf9BlGOr8Kvx5/ls
	4VqO/jwaSsZgpLtCAnahBde/XJJ3pgkPhnYvoUu73aOsULnsROTiCeEH7PVBwlfVj3FYiHTrZ9o8t
	GKBk3HcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKCG8-0000000G7Yp-10RX;
	Fri, 23 Oct 2026 10:12:24 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKCFz-0000000G7TO-0at1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 10:12:18 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-48e0d885929so422166f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 03:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792750333; x=1793355133; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xOkdMQgEfZtJLgU0fFwbDzze1EactQ9BVvcxXQMDTo4=;
        b=Seay3C2JrFsmjg1eWfcaBCUy6/WxfjnyuHDQHc3i6HVqvna038GNLSO1JEMgmigR7g
         GwjgfH9Lxk5GFFehgw43EwZIP5tQGaLT7VGkNZ3rcLZubbMx5Bs053l06CbsQvuFYe68
         IJDvYfJwfcrsK5mg40MkHYCmL9wBBImip2D/bCreQQdAwLjLNVO4CVJ17sq6U6DYbFYM
         1BnflEncyRlnzpd8Xbp4aLMoJ1JU63HVnM4gj/K7DoEB7aO0vX4OcNzj1fJvetSF4D11
         +Tw/9EEVK/RGmXxkePuGd8hNQTYYBG6XpfMlRAXCEQcTCyMFddTE7/R1MrsKDYH5nBjq
         PW3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792750333; x=1793355133;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xOkdMQgEfZtJLgU0fFwbDzze1EactQ9BVvcxXQMDTo4=;
        b=EfKu6PhapYHIZBM5VuoAh+V4IysS3ESlfOStZS+dDV1oMZM4/g2YuHKk4jpX7B5H9j
         S/hvxIB9QrwGpl3y9Ub/KYvAyEveSdY9O5v1BTdTiZboGk+L9jRaI7R9mG5GcbuqlCP8
         lgskEzjU2YlQptQBw+iPUZ+awJLb4hAMV3eAjLuBWzzvEBoPnhva4RVBjrMktgiaQNqu
         VUN9MnACc6rS9nN+IvH8IflTzb21gPo5PBUmS2I07u9h5jCQUzP7xBK1VPrB7sFdHgUx
         AaqBQaoNABOkNR7BiYEjS0lBVp23QyyICNG2LORnVkV8ssbZnw3rlfhgEJfTHe9KlDTR
         u2mQ==
X-Forwarded-Encrypted: i=1; AKwUvBxsqsdMGcjxU2QqKID2Jo9ppp0wVDu4xm+SRcLd3PEnSl8MuUr2oWIwjM675IcJ5zNZ48dQDKns5IfqGkb8GoDK@lists.infradead.org
X-Gm-Message-State: AFq9FYKmd3bSy25zNMYSlUwG/9vZzCzOwZXZXfIQzf0/RR1bd7Wkjjc4
	NaTQava6Z5gbuLvcbezJfzmPBMdK8S5a+rFt/HXN54lVxymUzrZrTs4Qls+tHR8ksxk=
X-Gm-Gg: AYBFou1CNXJ5fQiwKoxC0CZZkbPxANvOTTLHPqZXxAZYrP1OsshLANfJ8iHDjqDm5eR
	eaGInqzG7rTuzL0p1/uyp6knDpAPWDyaqDN42nDfyDeeSXwx1f8ygLduC6TqmWPEBcGpfE7TtOF
	Y8k+AQTzdF8qnpbb31q+A4RdoAEcCa73jgo/oKsSr2LWVDS9Ym9haIAXU9cSLbvNI3nY2HvMftr
	rKrPZZSqWSLqbv+P8YyiIFXPpcUWfDzyUnxtuIm355Cmyp6VGGl4s7GrB062jG0poMS6DBcuFS9
	9smNIXrZ05qXwwzXGbJyKzv2UMLTXVXFE3gdNxKhWfSqaDBsGKkuHSqh42AmxJbqc1gagGbSPM6
	+vZw9GFoB8A75LaFPLLZwAa8RzWSk65OQoD/3vUGyD/KNeV+Z+94kzXgGNSZWRrTqSlJmGAWRVo
	xrl1ENqh7OMrCGYr8fSSOQ2YaMknmgQNsSGSODPVjtAXrP9jykTjw6iPAZPBHSIsQw7oXnZDmBJ
	Wy2Uy/uixCkZ9hF209/JNMswfrty8DxYugIyJ9e5ah+5PlCAukSiMY=
X-Received: by 2002:a5d:6f18:0:b0:48e:f47:273c with SMTP id ffacd0b85a97d-48e3854f342mr2931502f8f.8.1792750331152;
        Fri, 23 Oct 2026 03:12:11 -0700 (PDT)
Received: from localhost ([82.192.120.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3804ccb4sm4289462f8f.38.2026.10.23.03.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 03:12:10 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Andrea della Porta <andrea.porta@suse.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Gregor Herburger <gregor.herburger@linutronix.de>,
	Stanimir Varbanov <svarbanov@suse.de>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	Gary Guo <gary@garyguo.net>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH RFC 0/4] hwmon: Add fan tachometer support for Raspberry Pi RP1
Date: Fri, 23 Oct 2026 12:15:53 +0200
Message-ID: <cover.1792748690.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_031215_206764_343EB080 
X-CRM114-Status: GOOD (  20.89  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

This patch series adds fan tachometer / RPM monitoring support for the
Raspberry Pi RP1 southbridge found on the Raspberry Pi 5.
Please note that the patchset in [1] is a prerequisite for this one.

On the Raspberry Pi RP1, the active cooling fan speed is controlled via
the RP1 PWM controller. In addition to generating PWM signals, the RP1
monitors fan tachometer pulses. The pulse measurement and RPM calculation
are performed autonomously by the RP1's onboard Cortex-M microcontroller
core, which periodically writes the computed RPM value directly into
dedicated MMIO registers located within the RP1 PWM hardware block.

During earlier discussions, Uwe Kleine-König explicitly indicated a
preference to keep the core PWM controller driver (drivers/pwm/pwm-rp1.c)
focused strictly on PWM duties, rather than bloating it by registering an
hwmon device directly from within the PWM driver (see [2]).

Because the Linux PWM subsystem currently lacks a generic framework or
consumer API for reporting hardware-calculated tachometer readings, this
series implements a standalone hwmon driver (rp1-fan) using the following
structure:

-  The PWM driver exposes and exports rp1_pwm_read_tachometer() within a
   dedicated symbol namespace ('RP1_PWM') to read the RPM value from
   the MMIO block.
-  A companion DT binding (raspberrypi,rp1-fan.yaml) introduces a vendor
   property, 'raspberrypi,pwm-tachometer', to link the fan node to the
   PWM controller node without overloading or abusing the standard 'pwms'
   property.
-  The rp1-fan hwmon driver parses this phandle, establishes a device link
   for proper runtime and unbind dependency management, and registers the
   standard hwmon 'fan1_input' sysfs attribute.

An alternative architectural approach to the DT phandle + exported helper
method would be to model the tachometer as a child device using the
auxiliary bus framework (drivers/base/auxiliary.c). In that model, the RP1
PWM driver would instantiate an auxiliary device for the tachometer, and
the hwmon driver would bind to that auxiliary bus device without requiring
a separate DT node.

However, adopting the auxiliary bus would require a more significant
rework and refactoring of the existing RP1 PWM driver. 

I'd appreciate any feedback on whether the current companion driver with
a dedicated DT property is acceptable, or if an auxiliary bus-based
refactoring of the PWM driver is the preferred upstream path.

Patch Breakdown
---------------
Patch 1: pwm: rp1: Export helper to read fan tachometer RPM
Patch 2: dt-bindings: hwmon: Add Raspberry Pi RP1 fan binding
Patch 3: hwmon: Add driver for Raspberry Pi RP1 fan tachometer
Patch 4: arm64: dts: broadcom: bcm2712-rpi-5-b: Add RP1 fan tachometer node

Thanks,
Andrea


LINKS:
[1] - https://lore.kernel.org/all/cover.1790686331.git.andrea.porta@suse.com/
[2] - https://lore.kernel.org/all/adLTwOTbkJ0VQXy6@monoceros/

Andrea della Porta (4):
  pwm: rp1: Export helper to read fan tachometer RPM
  dt-bindings: hwmon: Add Raspberry Pi RP1 fan binding
  hwmon: Add driver for Raspberry Pi RP1 fan tachometer
  arm64: dts: broadcom: bcm2712-rpi-5-b: Add RP1 fan tachometer node

 .../bindings/hwmon/raspberrypi,rp1-fan.yaml   |  39 +++++
 Documentation/hwmon/index.rst                 |   1 +
 Documentation/hwmon/rp1-fan.rst               |  41 ++++++
 MAINTAINERS                                   |   1 +
 .../boot/dts/broadcom/bcm2712-rpi-5-b.dts     |   5 +
 drivers/hwmon/Kconfig                         |  11 ++
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/rp1-hwmon.c                     | 136 ++++++++++++++++++
 drivers/pwm/pwm-rp1.c                         |  27 ++++
 include/soc/bcm2835/raspberrypi-pwm-rp1.h     |  10 ++
 10 files changed, 272 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/raspberrypi,rp1-fan.yaml
 create mode 100644 Documentation/hwmon/rp1-fan.rst
 create mode 100644 drivers/hwmon/rp1-hwmon.c
 create mode 100644 include/soc/bcm2835/raspberrypi-pwm-rp1.h

-- 
2.35.3


