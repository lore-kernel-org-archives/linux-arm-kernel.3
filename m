Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFC73D7830C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 11:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gjHlwSiznG7ZMzHVL1AbaIvEmzPENJ2D8a0GdBICd5U=; b=1qCARUVFTlWSWtNYMbZYWfho0/
	9C+xxcNSfUXQlqs//Batv6ouEa8OFZ958RKg2IbBJxvR0wuaZAZJiYoOdhV97iIQtymTAf7JLEUpr
	if4J4bQIMiQVsgWzLILPaQ9AhzIp/ooDPdhTkjuKp5eCHf94kDOLEYqwWs7njWm33++oQoyQQtapN
	NGiP0jlMlq80utThlVhM7daZc67xs8xLnbKeMpnf64Ntl0rKVjDQjT7Znt19LpUWJro2wu0HAuQYO
	lcyhhPUNpLD7hGf43aHCKFNhG7Rr5u0Eb8QEJNiGT6LBJcHq4+JgFjtf/hM5G3w+VGQr8Wql8cxwq
	ubRkLzcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI4VF-00000005s6v-1bdP;
	Mon, 02 Dec 2024 11:22:09 +0000
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI4SH-00000005rFG-1QF3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 11:19:09 +0000
Received: by mail-ej1-x644.google.com with SMTP id a640c23a62f3a-a9f1c590ecdso697759366b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 03:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733138343; x=1733743143; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=gjHlwSiznG7ZMzHVL1AbaIvEmzPENJ2D8a0GdBICd5U=;
        b=BVyU96bk89/WvcUsjQC080C30qTD+MBAWdGkZD/k0cb+MLXxKkqow4dUokgFzT+kup
         ijBCJDi8A5mPw2z7zZwjoCFoBHwyESQTs1WUsSPeU2Wrue3OuRfuEYwyaV7NxiKImAV3
         +e5vlvs2DHndj3aDBNXC36AeylT/Z9myAafTYZq7BG/2LUqnXIi8Z7xlP0pvTe5lmU7T
         Fs6+gqAP08HiMWtVVh7+5MZE9zAIu1qnAsfV2Dsq17Uz3b4Bq+QQ3dYRO9fdaiQggD8D
         NXhxphIDKQ5SOTYjNKzCY6jt3SVO0IktIzEppyDr5jG1gcp59kTlxhGCuGzX/IkLURPz
         M/4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733138343; x=1733743143;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gjHlwSiznG7ZMzHVL1AbaIvEmzPENJ2D8a0GdBICd5U=;
        b=dJ+ZMFb71JAUp4k1beG2+OOqHLEpstfEYg0U5JdQFkdixa+NEJMllz660EP1GoRkSo
         XgemyCB/PizLF9VJDie0QUkPIHRNkpF497iWM0+gFAAT9FegSpc/2t8N9GcR9x2N0wSr
         3Wulj6n97l158hPvshfS7xSZo0fPkIPwuAFHJRDE5SijHYJ58olTpuFjYq17mGRdWm+u
         3S/TFKwvyDR69HGfp1Fc0rqH/R08AHQkbeTsPlQdet7AmkhfkxiT85Nijkg+gs3ezyHz
         GAUeTLJgWA9+ZBPPylK40rYqMYW9Iw1K/C3ZCLlTrFVZIpCQTJyP2Mmg645A5imky2rm
         5oQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFC6X1wtRh1eXG59TYW3+f6QE6e7Tc2xKyhoI8mE1087Om9R5/GFlRJv63J2W9NwbqAf6ge1NJQi2azIxxj+FI@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6hq4u8MvXDNYSagNb06nIOtqwQT2QolE+XFrNBqReNosqG43d
	LqgtAs1N38J7yjIYqOfs9EPjEl+OGH8RQn5SH61P5/O301Xdbfio3EhghI2SPsk=
X-Gm-Gg: ASbGncszkI23bKwBU5KpwbfWvrknExgERb/5IaAEyZdhxgUwGaqTGZ8bvAUQw1+sfSz
	YieVcgflBpxrVTsu1GNkhmbG/tyUNsFPvJYaJVRe04j9fXbx5kd83bFnMX6d7bVE60EsVMQk+Rk
	cv0bHBsaJLvmV9ZGvjW3MhhkBzjvzK/u+vH2cG4D8kdcSW4JpoUUAbMbnQEtuj/Ng1hBY91PPzJ
	a9XAVV/BQVyidW2wHcd1ipf5UVxJOd9eoY88hme2L1opDccXRsp3whq5IbFgTEVHfaVW2dfLmdY
	LlEU7uASNmbtNdq2K1RG
X-Google-Smtp-Source: AGHT+IEs4gB+Ysjlt8eU17nb3Ci2yczcmJ4H3W58u7P8uDa3tV/VvmLR86S0tSbUkR8W6jLjqNnUhQ==
X-Received: by 2002:a17:906:32c3:b0:aa5:449e:1a1d with SMTP id a640c23a62f3a-aa580edd946mr1994683366b.2.1733138343233;
        Mon, 02 Dec 2024 03:19:03 -0800 (PST)
Received: from localhost (host-87-20-211-251.retail.telecomitalia.it. [87.20.211.251])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5996dbee1sm496958166b.45.2024.12.02.03.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 03:19:02 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
To: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH v5 00/10] Add support for RaspberryPi RP1 PCI device using a DT overlay
Date: Mon,  2 Dec 2024 12:19:24 +0100
Message-ID: <cover.1733136811.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_031905_380885_7D243C73 
X-CRM114-Status: GOOD (  27.50  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

RP1 is an MFD chipset that acts as a south-bridge PCIe endpoint sporting
a pletora of subdevices (i.e.  Ethernet, USB host controller, I2C, PWM,
etc.) whose registers are all reachable starting from an offset from the
BAR address.  The main point here is that while the RP1 as an endpoint
itself is discoverable via usual PCI enumeraiton, the devices it contains
are not discoverable and must be declared e.g. via the devicetree.

This patchset is an attempt to provide a minimum infrastructure to allow
the RP1 chipset to be discovered and perpherals it contains to be added
from a devictree overlay loaded during RP1 PCI endpoint enumeration.
Followup patches should add support for the several peripherals contained
in RP1.

This work is based upon dowstream drivers code and the proposal from RH
et al. (see [1] and [2]). A similar approach is also pursued in [3].

The patches are ordered as follows:

-PATCHES 1 to 4: add binding schemas for clock, gpio and RP1 peripherals.
 They are needed to support the other peripherals, e.g. the ethernet mac
 depends on a clock generated by RP1 and the phy is reset though the
 on-board gpio controller.

-PATCH 5 and 6: add clock and gpio device drivers.

-PATCH 7: the devicetree overlay describing the RP1 chipset. Please
 note that this patch should be taken by the same maintainer that will
 also take patch 11, since txeieh dtso is compiled in as binary blob and is
 closely coupled to the driver.

-PATCH 8: this is the main patch to support RP1 chipset and peripherals
 enabling through dtb overlay. The dtso since is intimately coupled with
 the driver and will be linked in as binary blob in the driver obj.
 The real dtso is in devicetree folder while the dtso in driver folder is
 just a placeholder to include the real dtso.
 In this way it is possible to check the dtso against dt-bindings.
 The reason why drivers/misc has been selected as containing folder
 for this driver can be seen in [6], [7] and [8].

-PATCH 9: add the external clock node (used by RP1) to the main dts.

-PATCH 10: add the relevant kernel CONFIG_ options to defconfig.

This patchset is also a first attempt to be more agnostic wrt hardware
description standards such as OF devicetree and ACPI, where 'agnostic'
means "using DT in coexistence with ACPI", as been already promoted
by e.g. AL (see [4]). Although there's currently no evidence it will also
run out of the box on purely ACPI system, it is a first step towards
that direction.

Please note that albeit this patchset has no prerequisites in order to
be applied cleanly, it still depends on Stanimir's WIP patchset for BCM2712
PCIe controller (see [5]) in order to work at runtime.

Many thanks,
Andrea della Porta

Links:
- [1]: https://lpc.events/event/17/contributions/1421/attachments/1337/2680/LPC2023%20Non-discoverable%20devices%20in%20PCI.pdf
- [2]: https://lore.kernel.org/lkml/20230419231155.GA899497-robh@kernel.org/t/
- [3]: https://lore.kernel.org/all/20240808154658.247873-1-herve.codina@bootlin.com/#t
- [4]: https://lore.kernel.org/all/73e05c77-6d53-4aae-95ac-415456ff0ae4@lunn.ch/
- [5]: https://lore.kernel.org/all/20240626104544.14233-1-svarbanov@suse.de/
- [6]: https://lore.kernel.org/all/20240612140208.GC1504919@google.com/
- [7]: https://lore.kernel.org/all/83f7fa09-d0e6-4f36-a27d-cee08979be2a@app.fastmail.com/
- [8]: https://lore.kernel.org/all/2024081356-mutable-everyday-6f9d@gregkh/


CHANGES IN V5:

PATCH RELATED -------------------------------------------------

- patch 1 and 2: added: 'Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>'

- patch 6 and 10: added 'Reviewed-by: Stefan Wahren <wahrenst@gmx.net>'

- rebased on v6.13-rc1


KCONFIG -----------------------------------------

- drivers/misc/rp1/Kconfig: leading spaces converted to tab


RP1 MISC DRIVER -----------------------------------

- added a comment to describe ovcs_id field from struct rp1_dev

- added braces around a single line if statement followed by a braced
  else condition

- removed a double space character


GPIO/PINCTRL --------------------------------------

- moved a multiplication (*) sign to the line it belongs to (code style
  fixup)


DTS -----------------------------------------

- Moved clk_rp1_xosc from SoC DTS to board DTS


BINDINGS ------------------------------------

- pci1de4,1.yaml: adjusted ranges and reg properties in the example
  to better reflect the address from RP1 documentation. These refelcts
  the same convention used in the dtso

- raspberrypi,rp1-gpio.yaml: fixed 'pins' pattern to go at most up to 53

- raspberrypi,rp1-gpio.yaml: using single quotes consistently over double
  quotes

- raspberrypi,rp1-gpio.yaml: added some pin config option supported by the
  hw/driver but missing in the schema


Andrea della Porta (10):
  dt-bindings: clock: Add RaspberryPi RP1 clock bindings
  dt-bindings: pinctrl: Add RaspberryPi RP1 gpio/pinctrl/pinmux bindings
  dt-bindings: pci: Add common schema for devices accessible through PCI
    BARs
  dt-bindings: misc: Add device specific bindings for RaspberryPi RP1
  clk: rp1: Add support for clocks provided by RP1
  pinctrl: rp1: Implement RaspberryPi RP1 gpio support
  arm64: dts: rp1: Add support for RaspberryPi's RP1 device
  misc: rp1: RaspberryPi RP1 misc driver
  arm64: dts: bcm2712: Add external clock for RP1 chipset on Rpi5
  arm64: defconfig: Enable RP1 misc/clock/gpio drivers

 .../clock/raspberrypi,rp1-clocks.yaml         |   58 +
 .../devicetree/bindings/misc/pci1de4,1.yaml   |   73 +
 .../devicetree/bindings/pci/pci-ep-bus.yaml   |   58 +
 .../pinctrl/raspberrypi,rp1-gpio.yaml         |  198 +++
 MAINTAINERS                                   |   14 +
 .../boot/dts/broadcom/bcm2712-rpi-5-b.dts     |    7 +
 arch/arm64/boot/dts/broadcom/rp1.dtso         |   58 +
 arch/arm64/configs/defconfig                  |    3 +
 drivers/clk/Kconfig                           |    9 +
 drivers/clk/Makefile                          |    1 +
 drivers/clk/clk-rp1.c                         | 1527 +++++++++++++++++
 drivers/misc/Kconfig                          |    1 +
 drivers/misc/Makefile                         |    1 +
 drivers/misc/rp1/Kconfig                      |   21 +
 drivers/misc/rp1/Makefile                     |    3 +
 drivers/misc/rp1/rp1-pci.dtso                 |    8 +
 drivers/misc/rp1/rp1_pci.c                    |  366 ++++
 drivers/misc/rp1/rp1_pci.h                    |   14 +
 drivers/pci/quirks.c                          |    1 +
 drivers/pinctrl/Kconfig                       |   11 +
 drivers/pinctrl/Makefile                      |    1 +
 drivers/pinctrl/pinctrl-rp1.c                 |  789 +++++++++
 .../clock/raspberrypi,rp1-clocks.h            |   61 +
 include/linux/pci_ids.h                       |    3 +
 24 files changed, 3286 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml
 create mode 100644 Documentation/devicetree/bindings/misc/pci1de4,1.yaml
 create mode 100644 Documentation/devicetree/bindings/pci/pci-ep-bus.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/raspberrypi,rp1-gpio.yaml
 create mode 100644 arch/arm64/boot/dts/broadcom/rp1.dtso
 create mode 100644 drivers/clk/clk-rp1.c
 create mode 100644 drivers/misc/rp1/Kconfig
 create mode 100644 drivers/misc/rp1/Makefile
 create mode 100644 drivers/misc/rp1/rp1-pci.dtso
 create mode 100644 drivers/misc/rp1/rp1_pci.c
 create mode 100644 drivers/misc/rp1/rp1_pci.h
 create mode 100644 drivers/pinctrl/pinctrl-rp1.c
 create mode 100644 include/dt-bindings/clock/raspberrypi,rp1-clocks.h

-- 
2.35.3


