Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46CD3C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 10:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EAESDW/7jCSPVaKPQ9/uLiimzACzDSjMXvuVDbRi/d4=; b=0XVe6NT103LpRFNqNxMJJ2CjbT
	1nCCg3NfITT86KdgJ0pR8YXmnCFrdtuwQxb9tj+5UCefcvPyYeOBZYEFGUxLwZ/vNh84So4eKSyTl
	ma5pBkPTzdYUI8Z/uyitfeIaVWAW7v36jtPiwx4wORquVHUm0cevoXncOdM2Y+h7lypmCcQhHtTqH
	lEE2wUQcO5XW3hQWZC4xJjN2pWcO4IAqXA0l28F5ckQPreWcvF3796CA3dTyt2geeJEM5iAr9Z7eb
	VTxmTiDT5oTGhcayiXaIBNsYz0VwcmSeP2DRNDlsRyQlQjrosudwN79/zjtR926bcBKVwlh9DkNJ6
	y13wlcQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKapy-0000000FY4e-0zHK;
	Thu, 29 May 2025 10:50:14 +0000
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKanp-0000000FXaV-2OT9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 10:48:02 +0000
Received: by mail-ej1-x642.google.com with SMTP id a640c23a62f3a-ad55d6aeb07so118859266b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 May 2025 03:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748515679; x=1749120479; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=EAESDW/7jCSPVaKPQ9/uLiimzACzDSjMXvuVDbRi/d4=;
        b=OpBeTV0jhIVyc+/I0lF39Msy2tyNfu9z2NEw7FKDdrX/DK4vJG+L2ukUCIFenhyLoQ
         pMxbT96ryNpi9iYu+VQ6uMuRFbmYr+2SS0+04kDQln4cQZvPckZaknq4NFo2ls1iTt3/
         AfIoa4oGQ2V67caUx8mmfAVgKB+0WWkwiONl4az/IrmxJIXE5yyFAJTvybMHU6Wry3Xo
         vz2PDq1WtsAVULapfMingkIsUcIp6TW9yuoyqHFcdyQpWRiwyT1Bk30ZJWTYvVOKkv+X
         0vIMcfsjNGGc3ibf6oKyIfcnf/vnTDzmSZKYrORvLyNaIlV6qB52tdKEZJAzzWDxc6pR
         GD9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748515679; x=1749120479;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EAESDW/7jCSPVaKPQ9/uLiimzACzDSjMXvuVDbRi/d4=;
        b=q8pmZmks5wyvybzljCH6K3WaJSL2YEn3Rw0/x3i/+MaSHcXWk+MdIloqZQht5ZEz57
         s9AiHHIePmRKOwvFmCSEP64qBliHbqpUF05ajP77+sH3MzAeTuRP2WJ0L/IfSkfBH0CV
         HijDLidhl1sZS+y84xxKpjH7YIUpZjZY5gNYFDTvtIJDnGFLy/bbJFgjDmnPg9hlLAQQ
         BRKv9ndalVFDy6GosD8E2XrveR2CsnyN/iZFmdL23PykDDxSDynRL7Vd/LyjKUMmf5R8
         gXHuIfR/6FYCC890t6ASfu+y9SUEPzJwbVPiOkVEgRb24EeK+rTIrZDmszVJE0uFTVon
         jZUA==
X-Forwarded-Encrypted: i=1; AJvYcCUWo5sTGB+wtABK1bv4s4Pt0AcSsa27IeeoBsLh3F3FnRaB6X0+j4NljRX5EPA3S9CwsQnmQbNBwLL2oK1soRBe@lists.infradead.org
X-Gm-Message-State: AOJu0YwTB4jh8vZSlWfvzRTpEDLnS/sKurqYgTKV0CjGKkpzi7QD1bf5
	Sqhtci68ErJY3X0PjfiAqiy8crMP7Bs40lVzsRQVIpr3XrEZXFTJTbwqeApu5ghAxsQ=
X-Gm-Gg: ASbGncs79XkZqRAH4APs4eJj+zB+IicY8EhK9vDVw951QeEqmQngNUk0uvWghevzR5H
	TDCLBstYDcgTn51D/lYh6fXlcxMURLoQzMKIBNAf1eJnykrWor/vuEgKYeZEpK6lmNqNgpgKvrz
	8uqG/7knz4K7A611kXtGnpHVme07IcMHVwFpiUcSYzGs2FWB5yCK3AdXwchoobocitrFnYP9amC
	ecqgwFzoS9Lpk4ifNtyZbwG/F5MIewHWVNw1ZJMhdsz+5DO3lV0fYbR0jv3kEuiZE9BAweC/Cck
	YDtIiGM/ay8byRDUc70jJ/tyyYIMNDlGtKfyk/jPR9QL+56/WqVFWcqLygk0nrGpjcQUBikSOpH
	oFddVWG0IYZjU6JVAv1aOwQl6dKvv3pRB
X-Google-Smtp-Source: AGHT+IHUFGHnG9AjxmrJqcXz/LbzZ6SrWKFB/alTR21Pzmob3zURAwQjqtx36Bhs9JKybPZL4Rvl5g==
X-Received: by 2002:a17:907:9713:b0:ad8:9e80:6bc8 with SMTP id a640c23a62f3a-ad89e807b84mr616689066b.19.1748515679011;
        Thu, 29 May 2025 03:47:59 -0700 (PDT)
Received: from localhost (host-87-21-228-106.retail.telecomitalia.it. [87.21.228.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5dd043a9sm119264966b.89.2025.05.29.03.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 03:47:58 -0700 (PDT)
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
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com,
	Matthias Brugger <mbrugger@suse.com>
Subject: [PATCH v10 0/13] Add support for RaspberryPi RP1 PCI device using a DT overlay
Date: Thu, 29 May 2025 12:49:17 +0200
Message-ID: <cover.1748514765.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_034801_623749_25B2B9C3 
X-CRM114-Status: GOOD (  24.37  )
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
from a devictree overlay loaded during RP1 PCI endpoint enumeration. To
ensure compatibility with downstream, a devicetree already comprising the
RP1 node is also provided, so it's not strictly necessary to use the
dynamically loaded overlay if the devicetree is already fully defined at
the origin.
To achieve this modularity, the RP1 node DT definitions are arranged by
file inclusion as per following schema (the arrow points to the includer,
see also [9]):
 
 rp1-pci.dtso         rp1.dtso
     ^                    ^
     |                    |
rp1-common.dtsi ----> rp1-nexus.dtsi ----> bcm2712-rpi-5-b.dts
                                               ^
                                               |
                                           bcm2712-rpi-5-b-ovl-rp1.dts

Followup patches should add support for the several peripherals contained
in RP1.

This work is based upon dowstream drivers code and the proposal from RH
et al. (see [1] and [2]). A similar approach is also pursued in [3].

The patches are ordered as follows:

-PATCHES 1 to 3: add binding schemas for clock, gpio and RP1 peripherals.
 They are needed to support the other peripherals, e.g. the ethernet mac
 depends on a clock generated by RP1 and the phy is reset through the
 on-board gpio controller.

-PATCH 4 and 5: add clock and gpio device drivers.

-PATCH 6: the devicetree node describing the RP1 chipset. 

-PATCH 7: this is the main patch to support RP1 chipset. It can work
 either with a fully defined devicetree (i.e. one that already included
 the rp1 node since boot time) or with a runtime loaded dtb overlay
 which is linked as binary blob in the driver obj. This duality is
 useful to comply with both downstream and upstream needs (see [9]).
 The real dtso is in devicetree folder while the dtso in driver folder is
 just a placeholder to include the real dtso.
 In this way it is possible to check the dtso against dt-bindings.
 The reason why drivers/misc has been selected as containing folder
 for this driver can be seen in [6], [7] and [8].

-PATCH 8: add the external clock node (used by RP1) to the main dts.

-PATCH 9: the fully fledged devictree containing also the rp1 node.
 This devicetree is functionally similar to the one downstream is using.

-PATCH 10 (OPTIONAL): this patch introduces a new scenario about how
 the rp1 node is specified and loaded in DT. On top of the base DT
 (without rp1 node), the fw loads this overlay and the end result is
 the same devicetree as in patch 9, which is then passed to the next
 stage (either the kernel or u-boot/bootloader).
 While this patch is not strictly necessary and can therefore be dropped
 (see [10]), it's not introducing much extra work and maybe can come
 in handy while debugging.

-PATCH 11: add the relevant kernel CONFIG_ options to defconfig.

-PATCH 12: enable CONFIG_OF_OVERLAY in order for 'make defconfig'
 to produce a configuration valid for the RP1 driver. Without this
 patch, the user has to explicitly enable it since the misc driver
 depends on OF_OVERLAY.

-PATCH 13: collect all changes for MAINTAINERS file.

This patchset is also a first attempt to be more agnostic wrt hardware
description standards such as OF devicetree and ACPI, where 'agnostic'
means "using DT in coexistence with ACPI", as been already promoted
by e.g. AL (see [4]). Although there's currently no evidence it will also
run out of the box on purely ACPI system, it is a first step towards
that direction.

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
- [9]: https://lore.kernel.org/all/Z87wTfChRC5Ruwc0@apocalypse/
- [10]: https://lore.kernel.org/all/CAMEGJJ0f4YUgdWBhxvQ_dquZHztve9KO7pvQjoDWJ3=zd3cgcg@mail.gmail.com/#t

CHANGES IN V10


PATCH RELATED -------------------------------------------------

- Patch 10,11,12: Added: Reviewed-by: Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>

- Patches reworked to apply cleanly on broadcom/stblinux branches:
  patch 1,2,3,6,8,9,10 -> devicetree/next
  patch 11,12 -> defconfig/next
  patch 4,5,7 -> drivers/next
  patch 13 -> maintainers/next

- Patch 13: new patch gathering all changes for MAINTAINERS


RP1 CLOCK DRIVER ------------------------------------

- Dropped some WARN_ONCE() lines that are basically useless

- rp1_clock_set_parent() now returns EINVAL in case the parent check
  is failing. As a result, rp1_clock_set_rate_and_parent() has also
  been adapted to return rp1_clock_set_parent() retcode.

- Return an ERR_PTR from rp1_register_clock() instead of just NULL

- Dropped some unaesthetic blank lines

- Disabled the builtin locking in regmap since we're already dealing
  with concurrency in the code

- rp1_clk_probe(): dropped dev_err_probe() as redundant due to commit
  12a0fd23e870 ("clk: Print an error when clk registration fails")


