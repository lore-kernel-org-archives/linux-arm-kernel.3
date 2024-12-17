Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE7BAE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 14:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=heBY326wXWjK91lSQdYkByNH1gV44iWJasMWTaSTgrk=; b=GeVba8gn4Eakr6cdyon7s+sFVf
	MmTDcqn4Js8euiBNUt0MtiGR6gGq/evdrv2/zdOQAc+XcZvm7/fvTpIGcuORTICiceyJNl1KPvhlj
	deYduiyUvBaHl/Jo2POZe8gUb52IAcUxms+jg0oTVK/arGCeMyvO/Qztid5C5pprRtXbkR3+nNIe9
	10LzeqrS/UgwAj+J7IR1a+Qa0yJU3IOH8vxygMycNfR+1uILry39B+FzTVGE+BWFAEcTWYqmQcLSi
	8XbVoH/TCaHnzz0daif6Mid9phmjeLQmiMJNeg5L4iC4Tkgm5UGPKIR8TK6/uc1fAm0Kfys3pj7az
	WB5SxgCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNYVP-0000000Djw1-00TW;
	Tue, 17 Dec 2024 14:24:59 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNXRG-0000000DXKt-1zS4;
	Tue, 17 Dec 2024 13:16:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 63E69A412F3;
	Tue, 17 Dec 2024 13:14:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6638C4CED3;
	Tue, 17 Dec 2024 13:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734441396;
	bh=2ZJ0ETzEGovT3C+Lhgx2MC2gLEcVqJCSkAbyfxj/Rj0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t11yFRtDXZXYf7U/turp3S/eLXdXyGIa3s7eAy2myGUTN7Gzb+yZYbXAhGF12FSrf
	 4zwItyNXBM6iVo1U73e8rgNsrnM0uJL9Plf3F1tJQ7ADUjAbp+TV0CTe1P1BnNen5g
	 Pceba5qP/FIbztkrQ5ar85yQI9eKTNiS+zjipfpUK6iBwtEmex91RIMbFfg1HJB69X
	 ejQgLxNUuzKIJlQYpgv5iTm7azYq1z2UpI2OHWPe3aXgp40LluKoUzZH1AkFS2ttNw
	 W7CJ09HlujP08DuullW2BgsV72tW4rVuu+DzJ87KXvfDwkDS3RTRISYKZkM5UEF2x1
	 ssrvm9mZ517sw==
Date: Tue, 17 Dec 2024 13:16:29 +0000
From: Lee Jones <lee@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: jikos@kernel.org, jic23@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, jdelvare@suse.com, linux@roeck-us.net,
	srinivas.pandruvada@linux.intel.com, bentiss@kernel.org,
	dmitry.torokhov@gmail.com, pavel@ucw.cz, ukleinek@debian.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-input@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-leds@vger.kernel.org
Subject: [GIT PULL] Immutable branch between MFD, HID, HWMON, Input and LEDs
 due for the v6.14 merge window
Message-ID: <20241217131629.GJ2418536@google.com>
References: <20241107114712.538976-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241107114712.538976-1-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_051638_637967_E37E9DE8 
X-CRM114-Status: GOOD (  12.76  )
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

Enjoy!

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git tags/ib-mfd-hid-hwmon-input-leds-v6.14

for you to fetch changes up to 9855caf5d4eb1d8b8bba60be256186ea8e0f907c:

  hwmon: add driver for the hwmon parts of qnap-mcu devices (2024-12-17 13:14:48 +0000)

----------------------------------------------------------------
Immutable branch between MFD, HID, HWMON, Input and LEDs due for the v6.14 merge window

----------------------------------------------------------------
Heiko Stuebner (7):
      HID: hid-sensor-hub: don't use stale platform-data on remove
      mfd: core: Make platform_data pointer const in struct mfd_cell
      dt-bindings: mfd: Add binding for qnap,ts433-mcu devices
      mfd: Add base driver for qnap-mcu devices
      leds: Add driver for LEDs from qnap-mcu devices
      Input: add driver for the input part of qnap-mcu devices
      hwmon: add driver for the hwmon parts of qnap-mcu devices

 .../devicetree/bindings/mfd/qnap,ts433-mcu.yaml    |  42 +++
 Documentation/hwmon/index.rst                      |   1 +
 Documentation/hwmon/qnap-mcu-hwmon.rst             |  27 ++
 MAINTAINERS                                        |   9 +
 drivers/hid/hid-sensor-hub.c                       |  21 +-
 drivers/hwmon/Kconfig                              |  12 +
 drivers/hwmon/Makefile                             |   1 +
 drivers/hwmon/qnap-mcu-hwmon.c                     | 364 +++++++++++++++++++++
 drivers/input/misc/Kconfig                         |  12 +
 drivers/input/misc/Makefile                        |   1 +
 drivers/input/misc/qnap-mcu-input.c                | 153 +++++++++
 drivers/leds/Kconfig                               |  11 +
 drivers/leds/Makefile                              |   1 +
 drivers/leds/leds-qnap-mcu.c                       | 227 +++++++++++++
 drivers/mfd/Kconfig                                |  13 +
 drivers/mfd/Makefile                               |   2 +
 drivers/mfd/qnap-mcu.c                             | 338 +++++++++++++++++++
 include/linux/mfd/core.h                           |   2 +-
 include/linux/mfd/qnap-mcu.h                       |  26 ++
 19 files changed, 1255 insertions(+), 8 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/qnap,ts433-mcu.yaml
 create mode 100644 Documentation/hwmon/qnap-mcu-hwmon.rst
 create mode 100644 drivers/hwmon/qnap-mcu-hwmon.c
 create mode 100644 drivers/input/misc/qnap-mcu-input.c
 create mode 100644 drivers/leds/leds-qnap-mcu.c
 create mode 100644 drivers/mfd/qnap-mcu.c
 create mode 100644 include/linux/mfd/qnap-mcu.h

-- 
Lee Jones [李琼斯]

