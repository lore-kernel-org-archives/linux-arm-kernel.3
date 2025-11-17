Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A59B2CEBF93
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 12:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cVtBbGpwiPbk5yGKMCAfVLSSZ1D6MnO5tcKuZZzty68=; b=hKwO9WlmcCY1vje77djqgrhhym
	akwz13oX+xZtyxUWJX9bUd+araHRBjHv9KDvIquM2Iv8fiqw0+wC9kNhYkhbMxmscoaJDjLDm33pm
	k/yD6OT956hr7vOiR9pjEAM6wIOYJd9GEvxGhgK9dgmaBnNJEU9uOeUDw0cYt/E2Pp8jLpibXPUX/
	i+bV/PFRnvT5Q1FTmIt3FOmTrNnckIbvIAnev99rSTHAolBO9JqHpadcp2xheMAjiicMVgeRyiRyQ
	ZRfSe863heoq8MDe3jV1yMqRfJMmhaflFqc3c2WNP30EqQwrSZK3xvABNgNUTx1qUxGgbHH9D/zl/
	9jrZEz0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKyRM-0000000G43v-21Dn;
	Mon, 17 Nov 2025 12:34:40 +0000
Received: from mail-m16.yeah.net ([220.197.32.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKyRH-0000000G42T-0Rc6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 12:34:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version:
	Content-Type; bh=cVtBbGpwiPbk5yGKMCAfVLSSZ1D6MnO5tcKuZZzty68=;
	b=Z97VO8IaAoKZHUJCWp8+2JcPbx1f574rTpwymEDba77d5Fp2eHKNM78wqWESTq
	v0khAKKkcGuh7lFlD8bgQg8C9hveGiynKg+UwwJSCVoomXxdILZ2qPWS9HCzwDvl
	iNExLIOH+513DhD6J7MRIzVxXA0If00sq3WpMWvBLQIUA=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgAnXIhOFhtpoZUoAg--.8347S4;
	Mon, 17 Nov 2025 20:34:25 +0800 (CST)
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/5] i.MX ARM device tree changes for 6.19
Date: Mon, 17 Nov 2025 20:33:49 +0800
Message-ID: <20251117123358.2009662-3-shawnguo2@yeah.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251117123358.2009662-1-shawnguo2@yeah.net>
References: <20251117123358.2009662-1-shawnguo2@yeah.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: M88vCgAnXIhOFhtpoZUoAg--.8347S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxuFW3tF13AF4kXr4DJFyDAwb_yoWxWr13pa
	yfursxGan7Gr1fK3sxArWUK390yw18Ar1rZry5Gay8KF43Za47Zr9akwn3try3XFWrWw1S
	gr1kur9rJ34DWaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jL3kAUUUUU=
X-Originating-IP: [117.82.150.42]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNBK6IGkbFlITpwAA3+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_043435_486466_35A3F2C5 
X-CRM114-Status: GOOD (  13.52  )
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

From: Shawn Guo <shawnguo@kernel.org>

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-dt-6.19

for you to fetch changes up to 6f813b7814d305cac27b81d5cabe3ebdebd1d8f2:

  ARM: dts: imx6qdl: make VAR-SOM SoM SoC-agnostic (2025-11-16 21:03:49 +0800)

----------------------------------------------------------------
i.MX ARM device tree changes for 6.19:

- A bunch of dt-schema warning cleanup patches from Frank Li
- A couple of imx6dl-yapp4 board update from Michal Vokáč to enable
  pwm-beeper and model the RGB LED as a single multi-led part
- Enable PMIC RTC on imx53-qsrb board
- Correct rtc compatible for imx6q-evi board
- Add sy7636 support for e70k02 board
- Replace license text comment with SPDX identifier for imx53-usbarmory
  board
- Add I2S audio support for imx28-amarula-rmm board

----------------------------------------------------------------
Alexander Kurz (1):
      ARM: dts: imx53: enable PMIC RTC on imx53-qsrb

Alexandre Belloni (1):
      ARM: dts: imx6q-evi: fix rtc compatible

Andreas Kemnade (1):
      ARM: dts: imx: e70k02: add sy7636

Bence Csókás (1):
      ARM: dts: imx53-usbarmory: Replace license text comment with SPDX identifier

Dario Binacchi (1):
      ARM: dts: imx28-amarula-rmm: add I2S audio

Frank Li (21):
      ARM: dts: imx6: rename stmpgpio to gpio
      ARM: dts: imx6: rename touch-thermal0 to touch-0-thermal
      ARM: dts: imx6: rename m95m02 to eeprom
      ARM: dts: imx6qdl-ts4900: rename ngpio to ngpios
      ARM: dts: imx6: remove gpio suffix for regulator
      ARM: dts: imx6: change voltage-divider's io-channel-cells to 1
      ARM: dts: imx6: remove pinctrl-name if pinctrl-0 doesn't exist
      ARM: dts: imx6-tbs2910: rename ir_recv to ir-receiver
      ARM: dts: imx6q-utilite-pro: add missing required property for pci
      ARM: dts: imx6ull-phytec-tauri: remove extra space before jedec,spi-nor
      ARM: dts: imx6qdl-nitrogen6_max: rename i2c<n>mux to i2c
      ARM: dts: imx: add power-supply for lcd panel
      ARM: dts: imx6ull-dhcom-pdk2: rename power-supply to vcc-supply for touchscreen
      ARM: dts: imx: remove redundant linux,phandle
      ARM: dts: imx6qdl-skov-cpu fix typo interrupt
      ARM: dts: imx6q-cm-fx6.dts: add supplies for wm8731
      ARM: dts: Add bus type for parallel ov5640
      ARM: dts: add device_type for memory node
      ARM: dts: remove undocumented clock-names for ov5642
      ARM: dts: imx7ulp: remove bias-pull-up
      ARM: dts: imx: add vdd-supply and vddio-supply for fsl,mpl3115

Michal Vokáč (2):
      ARM: dts: imx6dl-yapp43: Enable pwm-beeper on boards with speaker
      ARM: dts: imx6dl-yapp4: Model the RGB LED as a single multi-led part

Stefan Prisacariu (1):
      ARM: dts: imx6qdl: make VAR-SOM SoM SoC-agnostic

 arch/arm/boot/dts/nxp/imx/e70k02.dtsi              | 25 ++++++++-
 arch/arm/boot/dts/nxp/imx/imx53-ppd.dts            |  2 +
 arch/arm/boot/dts/nxp/imx/imx53-qsrb.dts           |  1 +
 arch/arm/boot/dts/nxp/imx/imx53-usbarmory.dts      | 39 +-------------
 .../boot/dts/nxp/imx/imx6dl-aristainetos2_7.dts    |  1 +
 arch/arm/boot/dts/nxp/imx/imx6dl-b1x5v2.dtsi       |  3 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-lanmcu.dts        |  8 +++
 arch/arm/boot/dts/nxp/imx/imx6dl-plym2m.dts        |  4 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-prtvt7.dts        |  8 +--
 arch/arm/boot/dts/nxp/imx/imx6dl-qmx6.dtsi         |  1 +
 arch/arm/boot/dts/nxp/imx/imx6dl-victgo.dts        | 10 ++--
 arch/arm/boot/dts/nxp/imx/imx6dl-yapp4-common.dtsi | 44 ++++++++-------
 arch/arm/boot/dts/nxp/imx/imx6dl-yapp4-lynx.dts    |  8 +++
 .../arm/boot/dts/nxp/imx/imx6dl-yapp43-common.dtsi | 63 +++++++++++++++-------
 arch/arm/boot/dts/nxp/imx/imx6q-bosch-acc.dts      |  1 +
 arch/arm/boot/dts/nxp/imx/imx6q-bx50v3.dtsi        |  4 ++
 arch/arm/boot/dts/nxp/imx/imx6q-cm-fx6.dts         | 34 +++++++++++-
 arch/arm/boot/dts/nxp/imx/imx6q-dmo-edmqmx6.dts    | 10 +++-
 arch/arm/boot/dts/nxp/imx/imx6q-evi.dts            | 12 ++++-
 arch/arm/boot/dts/nxp/imx/imx6q-icore-ofcap10.dts  |  1 +
 arch/arm/boot/dts/nxp/imx/imx6q-icore-ofcap12.dts  |  1 +
 arch/arm/boot/dts/nxp/imx/imx6q-pistachio.dts      |  3 +-
 arch/arm/boot/dts/nxp/imx/imx6q-prti6q.dts         |  8 +++
 arch/arm/boot/dts/nxp/imx/imx6q-tbs2910.dts        |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6q-utilite-pro.dts    |  5 +-
 .../boot/dts/nxp/imx/imx6q-var-mx6customboard.dts  |  1 +
 arch/arm/boot/dts/nxp/imx/imx6q-yapp4-pegasus.dts  |  8 +++
 arch/arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi     |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw560x.dtsi      |  1 -
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw5903.dtsi      |  2 -
 arch/arm/boot/dts/nxp/imx/imx6qdl-nit6xlite.dtsi   |  1 +
 .../boot/dts/nxp/imx/imx6qdl-nitrogen6_max.dtsi    |  9 ++--
 .../boot/dts/nxp/imx/imx6qdl-nitrogen6_som2.dtsi   |  3 ++
 arch/arm/boot/dts/nxp/imx/imx6qdl-nitrogen6x.dtsi  |  2 +
 arch/arm/boot/dts/nxp/imx/imx6qdl-sabrelite.dtsi   |  5 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi     | 11 +++-
 arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi    |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-ts4900.dtsi      |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-tx6-mb7.dtsi     |  3 ++
 arch/arm/boot/dts/nxp/imx/imx6qdl-var-som.dtsi     |  3 --
 .../boot/dts/nxp/imx/imx6qp-yapp4-pegasus-plus.dts |  8 +++
 arch/arm/boot/dts/nxp/imx/imx6sl-tolino-vision.dts |  1 -
 .../arm/boot/dts/nxp/imx/imx6sl-tolino-vision5.dts | 24 +++++++++
 .../arm/boot/dts/nxp/imx/imx6sll-kobo-librah2o.dts | 24 +++++++++
 arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi          |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6ul-14x14-evk.dtsi    |  8 +++
 arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi        | 12 +++--
 arch/arm/boot/dts/nxp/imx/imx6ul-pico-dwarf.dts    |  2 +
 arch/arm/boot/dts/nxp/imx/imx6ull-dhcom-pdk2.dts   |  2 +-
 .../arm/boot/dts/nxp/imx/imx6ull-phytec-tauri.dtsi |  2 +-
 arch/arm/boot/dts/nxp/imx/imx7d-nitrogen7.dts      |  8 +++
 arch/arm/boot/dts/nxp/imx/imx7d-pico-dwarf.dts     |  2 +
 arch/arm/boot/dts/nxp/imx/imx7d-sdb.dts            |  2 +
 arch/arm/boot/dts/nxp/imx/imx7s-warp.dts           |  9 ++++
 arch/arm/boot/dts/nxp/imx/imx7ulp-evk.dts          |  1 -
 arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts    | 50 +++++++++++++++++
 56 files changed, 388 insertions(+), 122 deletions(-)


