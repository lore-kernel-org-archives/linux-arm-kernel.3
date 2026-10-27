Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3EA7606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 09:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=doPy4L38;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=V4Ggy6z3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=kxDEiSmJOiwfSYua1Zz9+AGsc9tKlOqwY2WHmMR/V1I=; b=doPy4L38ui0T8xAAzHA1aDvoBZ
	jlJ9yM9e674svPV3OdPOu2tiLQeG6YM90eTgPV2o+j3yB6h31X5656OyNlQnWa5xHfqg2BELPElAy
	2IgcfJXE2IMREfEI1VA/6CoXAPd4yWdHTzL/N9qtKy4jsp3O+nl5aH0KT9SxymGknkgeSuh683qcH
	5JJ4E/hfI0x9PinB0A8Uyo0amBRkOZpV2rSFpY8yWGgl8qRkWk67x/zEQksF7fDQNgRBiDQmsKeAh
	K8n5x9f83rYpNz3Qdb9QSsaINtO/Y5YOYpR5q+SAHcAh1ZDXOST1zFqHmZ0QiIiCCPkN8SBLgNh7H
	Bzw2YsRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLdkn-00000004Cjb-21ij;
	Tue, 27 Oct 2026 09:46:01 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLdkk-00000004Cie-2u66
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 09:46:00 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4a208d93758so44925175e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 02:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793094356; x=1793699156; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kxDEiSmJOiwfSYua1Zz9+AGsc9tKlOqwY2WHmMR/V1I=;
        b=V4Ggy6z3pKsGkZvUX27zUINN243txuDEBa8zVER2fbRoLv/MdMz14qXbMW+EQNUrFQ
         1nmeE3sbCE1iP+bWJEBEHE+EDMUHOcyldT12ozMZqmQ4C/kbNur2PbzcpJZtZg5GeLZc
         jdDpzaSOrqs3cxBYbwzxh910DSy3mjSzSxU+i7oH8MiEUSuqfpu6Ghqf050lfczdYXlT
         PlKEVSMnPWX3/13cGiFfRFP5VeJjvqu6YO+vLjW4Y6iHjXRTqCR3Tmsl/G8BOlATotFR
         4hYg+NxNQ6cyRNQYIzz7sFxxEh1yW4xdsgcXwqs7Nbunx6GdvvvnQs/Md5r79noIRBHv
         cvPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793094356; x=1793699156;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kxDEiSmJOiwfSYua1Zz9+AGsc9tKlOqwY2WHmMR/V1I=;
        b=XAcp6fZyWFqEedHaGqhfTJmMUq33byIEkipwBCu+4j7lBe+WgGWDNhRFXXgeyKoSq8
         U5x98pxKkTyVCt9URfST5IwUE5WqY7mfwqTIAxGOOyjQm+wP8c4R5zHCJpbbwyha1fi5
         3WgRYDo2bdQIChhScjmdE/lfljNX8kBU8L4YD8kaHbciVe60kXHaVZdYx2OQPwIC+CVk
         1WQgKhc/QKxPhqP5vEo2BhOMUEr+lPkHl6/pEnKMe4M/gviOQYU4zvSP+AvU+9gwbjhl
         G6uM6kKV9gHGEtfskYLoyWC7T8NbS+4fCKHl4XrZpVMtHjfRoWI1Srx3n82lXjfDDMd2
         bgvQ==
X-Forwarded-Encrypted: i=1; AKwUvBwXqRPVMkkSB/p7PGxKNJ34clQATV10ruOrft5WxwMoE3OjpgB5DoQ5fKx2QnsG1l9NjNI9thZMpIvRUB8J4dsZ@lists.infradead.org
X-Gm-Message-State: AFq9FYJ2WkYXAsl/D86EKSvsvyuZzEIW6dYH4w+RWhHzSqzKjD+iVf4m
	WdSiqxLktnNr7a/Quo748ChSNwlu5XhilBBK672NWD8cKVjaR6Lm7OvcR1NxDu+XmHM=
X-Gm-Gg: AYBFou1IoyNRyW8TAbo6R9ILsbdmsLAFZA1cevCLCM9HPJnLB11kwBsA1WpwyMyxswK
	9CXnWrHQVvn9KekCHxjPEuiMRZd/0H5+AmT3zelxOJbz5RfXUFVHQFrNBqYDPHjL+LB34wU6MPU
	hbhdLRytcTXXT9EtL4ICPYS7jG0VJLHAx7s3rktIioABlKsoDBTwbJeTbo5CHbydM3ZdtdFwzx7
	q/BD6CG3fj0oi4gJ3Mj+o6dmM+zT8DvmSYdvnvUlh9oXIdeECRSDHHOFIB7R32K9/TgClIYlQus
	ZM8bRHZlQHHCoidbvIUKMercw8iCYymHFs//Maz57snsEqxqhW4aTGmGW2AvkfSJ1sDrjl3GPFz
	v+NxumTL64ESUnQ0cI032Y9trcASs5Xa8NKwcUXkW5hWs5HIzGAKCjhI5U7L3CyWCH2WiZbXg50
	kpislfHLAjghDyHUFITHdQkmF12EaQBfOtFTKbjVvfaxoeJQY0EjJkpP0ARqAmVYDTwdkQ29VGc
	h3vGfvV0ixXg1MtL2gql71JHz2kohGXFAC2WUnuC7bDvZ5eezayhiM=
X-Received: by 2002:a05:600c:4f0f:b0:4a0:27eb:49b with SMTP id 5b1f17b1804b1-4a35acba87fmr202982885e9.30.1793094356233;
        Tue, 27 Oct 2026 02:45:56 -0700 (PDT)
Received: from localhost ([82.192.120.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a2d9280sm251609365e9.13.2026.10.27.02.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 02:45:55 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Tue, 27 Oct 2026 10:49:48 +0100
To: Guenter Roeck <linux@roeck-us.net>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Gregor Herburger <gregor.herburger@linutronix.de>,
	Stanimir Varbanov <svarbanov@suse.de>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-pwm@vger.kernel.org,
	Gary Guo <gary@garyguo.net>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH RFC 0/4] hwmon: Add fan tachometer support for Raspberry
 Pi RP1
Message-ID: <auBzvB8TsvIK8Hik@apocalypse>
References: <cover.1792748690.git.andrea.porta@suse.com>
 <7df58d42-517c-4936-88b0-9d044d30882c@roeck-us.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7df58d42-517c-4936-88b0-9d044d30882c@roeck-us.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_024558_763007_EA7FB83E 
X-CRM114-Status: GOOD (  39.76  )
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
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Guenter,

On 09:24 Mon 26 Oct     , Guenter Roeck wrote:
> On 10/23/26 03:15, Andrea della Porta wrote:
> > Hi,
> > 
> > This patch series adds fan tachometer / RPM monitoring support for the
> > Raspberry Pi RP1 southbridge found on the Raspberry Pi 5.
> > Please note that the patchset in [1] is a prerequisite for this one.
> > 
> > On the Raspberry Pi RP1, the active cooling fan speed is controlled via
> > the RP1 PWM controller. In addition to generating PWM signals, the RP1
> > monitors fan tachometer pulses. The pulse measurement and RPM calculation
> > are performed autonomously by the RP1's onboard Cortex-M microcontroller
> > core, which periodically writes the computed RPM value directly into
> > dedicated MMIO registers located within the RP1 PWM hardware block.
> > 
> > During earlier discussions, Uwe Kleine-König explicitly indicated a
> > preference to keep the core PWM controller driver (drivers/pwm/pwm-rp1.c)
> > focused strictly on PWM duties, rather than bloating it by registering an
> > hwmon device directly from within the PWM driver (see [2]).
> > 
> > Because the Linux PWM subsystem currently lacks a generic framework or
> > consumer API for reporting hardware-calculated tachometer readings, this
> > series implements a standalone hwmon driver (rp1-fan) using the following
> > structure:
> > 
> > -  The PWM driver exposes and exports rp1_pwm_read_tachometer() within a
> >     dedicated symbol namespace ('RP1_PWM') to read the RPM value from
> >     the MMIO block.
> > -  A companion DT binding (raspberrypi,rp1-fan.yaml) introduces a vendor
> >     property, 'raspberrypi,pwm-tachometer', to link the fan node to the
> >     PWM controller node without overloading or abusing the standard 'pwms'
> >     property.
> > -  The rp1-fan hwmon driver parses this phandle, establishes a device link
> >     for proper runtime and unbind dependency management, and registers the
> >     standard hwmon 'fan1_input' sysfs attribute.
> > 
> > An alternative architectural approach to the DT phandle + exported helper
> > method would be to model the tachometer as a child device using the
> > auxiliary bus framework (drivers/base/auxiliary.c). In that model, the RP1
> > PWM driver would instantiate an auxiliary device for the tachometer, and
> > the hwmon driver would bind to that auxiliary bus device without requiring
> > a separate DT node.
> > 
> > However, adopting the auxiliary bus would require a more significant
> > rework and refactoring of the existing RP1 PWM driver.
> > 
> > I'd appreciate any feedback on whether the current companion driver with
> > a dedicated DT property is acceptable, or if an auxiliary bus-based
> > refactoring of the PWM driver is the preferred upstream path.
> > 
> > Patch Breakdown
> > ---------------
> > Patch 1: pwm: rp1: Export helper to read fan tachometer RPM
> > Patch 2: dt-bindings: hwmon: Add Raspberry Pi RP1 fan binding
> > Patch 3: hwmon: Add driver for Raspberry Pi RP1 fan tachometer
> 
> This seems conceptually wrong.
> 
> Have you considered implementing the hwmon driver as auxiliary driver
> and accessing the register in question through regmap ?

Yes, I also proposed that in the cover letter because auxbus seems also a viable
solution.

The current implementation is a consequence to the discussion about the companion
PWM driver, from here (and the revisions that followed):

https://lore.kernel.org/all/cover.1775223441.git.andrea.porta@suse.com/

To give a short and hopefully coherent view of the decisions, here's a breakdown:

- first proposal: PWM driver + fan hwmon (to read the RPM), all in the same driver

- V2: Uwe preferred to split the PWM driver from the hwmon one, so the hwmon was
  dropped from teh PWM driver in favor of a future (fan) driver. To accomplish this,
  I moved from readl/writel to regmap + syscon.

- V8: Gary proposed to export a function to read the fan RPM as a viable
  solution. As a result, the regmap/syscon was dropped as it was no longer needed
  and the function has been exported from the PWM driver

- new patchset for fan driver: the now independent hwmon moodle just call the
  exported function from thw PWM driver.

If the auxiliary bus is indeed the preferred approach, I'd like to ensure we are
all aligned, as this would also require refactoring the PWM driver.

> 
>  > Patch 4: arm64: dts: broadcom: bcm2712-rpi-5-b: Add RP1 fan tachometer node
> > 
> > Thanks,
> > Andrea
> > 
> > 
> > LINKS:
> > [1] - https://lore.kernel.org/all/cover.1790686331.git.andrea.porta@suse.com/
> > [2] - https://lore.kernel.org/all/adLTwOTbkJ0VQXy6@monoceros/
> > 
> > Andrea della Porta (4):
> >    pwm: rp1: Export helper to read fan tachometer RPM
> >    dt-bindings: hwmon: Add Raspberry Pi RP1 fan binding
> >    hwmon: Add driver for Raspberry Pi RP1 fan tachometer
> >    arm64: dts: broadcom: bcm2712-rpi-5-b: Add RP1 fan tachometer node
> > 
> >   .../bindings/hwmon/raspberrypi,rp1-fan.yaml   |  39 +++++
> >   Documentation/hwmon/index.rst                 |   1 +
> >   Documentation/hwmon/rp1-fan.rst               |  41 ++++++
> >   MAINTAINERS                                   |   1 +
> >   .../boot/dts/broadcom/bcm2712-rpi-5-b.dts     |   5 +
> >   drivers/hwmon/Kconfig                         |  11 ++
> >   drivers/hwmon/Makefile                        |   1 +
> >   drivers/hwmon/rp1-hwmon.c                     | 136 ++++++++++++++++++
> >   drivers/pwm/pwm-rp1.c                         |  27 ++++
> 
> Either case, there is no such driver in mainline or linux-next.

As stated in the cover letter, the pwm driver comes from the prerequisite in [1].

Many thanks,
Andrea

> 
> Guenter
> 
> >   include/soc/bcm2835/raspberrypi-pwm-rp1.h     |  10 ++
> >   10 files changed, 272 insertions(+)
> >   create mode 100644 Documentation/devicetree/bindings/hwmon/raspberrypi,rp1-fan.yaml
> >   create mode 100644 Documentation/hwmon/rp1-fan.rst
> >   create mode 100644 drivers/hwmon/rp1-hwmon.c
> >   create mode 100644 include/soc/bcm2835/raspberrypi-pwm-rp1.h
> > 
> 

