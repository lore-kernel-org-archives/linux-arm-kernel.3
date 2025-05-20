Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 255AAC3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 06:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yvo4/pmeL+3CEHcV8Tj6ktdvYoy8AQyUu++tnK36+Kg=; b=W5p8IzWWuk4gWlezIh/w0aR8dq
	3yXHns+3Fget4PGPGJspJPoCOqGMwarU09XLyYeavivQExwrDDv9zNsFkeb1K7xkjB4X9RU8qTAdt
	MetkPLd63bCJZhFWu7Diee2jYcDrAPHdwKtdVZ7ggaLOdZL1C5VrtNnvLusHUTzNK36Nnwqht6EPt
	et7vylr4KAacelSy1UkXLJ1uZfiFfaxunRG6OM3nuxvV4D7Py7qVzpmnX5az7nK38qbs0+tncHYxW
	IeUAMt5vhM+Un/BWlXnmrQx2b7TZ2RQ2ZBnvO/rpjqMnaBtspcW0MdG8t4wXB7K+aGoIQbC3/8d99
	zIelrRiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHGfG-0000000Bjbx-2w4Z;
	Tue, 20 May 2025 06:41:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHGYx-0000000BiUd-0T7e
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 06:34:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id ACFDC4A301;
	Tue, 20 May 2025 06:34:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7E2B4C4CEE9;
	Tue, 20 May 2025 06:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747722893;
	bh=MaCkDQE8U2QDmRDmED4Ce+Q4F2+F5eALbfrUvn+NHJQ=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=VnZdlAAticMb/HhGTojh/GQp/I16M6VuHn/FfRqGi3np+TYxL0WWGTyRe89RK7c5u
	 j0L5XH3O+rNEYT4B+ihDjMFIWPK/my58MZM9ivjuI1Gf6y8ipE4QBC55vFoQtybWkE
	 7/AhBCzCcEWE6hYxXHDMw4vJdzJ8PZdeOvYgrJCD4WYTsbsMkSqHlxK1I3EuxpdDRH
	 mzpbb8VH1r9iE4is0vVRS11+oSpDl9PPhe2v+I9/D0zdmkI7dRzyOGk5QXuihYnrnP
	 Kf21stZG9v27XQoFSIgUWJSpul+cvwT084L4QDmj4roJ9+4p4n8xrlPZdTyRLWluGP
	 YHhu7uuL7ULsw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 644F6C3ABDA;
	Tue, 20 May 2025 06:34:53 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Subject: [PATCH v7 0/8] arm64: dts: freescale: Add support for the
 GOcontroll Moduline Display
Date: Tue, 20 May 2025 08:34:49 +0200
Message-Id: <20250520-initial_display-v7-0-a8f0195420aa@gocontroll.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIkiLGgC/3XPzWoDIRDA8VcJnmvR8TunvkcJxXU1EbZr0GVJC
 PvuNblkQXv8D8xvmAcqPkdf0PHwQNmvscQ011AfB+Qudj57HMfaCAgIAsBxnOMS7fQzxnKd7B0
 HqwGo9kR6gerWNfsQby/x+1T7EsuS8v11YKXP6f/WSjHBwrlhCJIywdnXObk0LzlN06dLv+gJr
 rBHZItARYAFGyxlRFPVRdgbYaBahFWEe228pVJJO3QR/kY4gRbhFTFBG62ZtlryLiJ2CBUtIio
 SGKnOqCg3povIPdJ5R1aEORnkCNwpGxpk27Y/1jJmPAwCAAA=
X-Change-ID: 20250224-initial_display-fa82218e06e5
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maudspierings@gocontroll.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747722892; l=4059;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=MaCkDQE8U2QDmRDmED4Ce+Q4F2+F5eALbfrUvn+NHJQ=;
 b=sX+e/W5gyP6cgDk/CGRsehxUQzRmluCed7s/xWuO4IpWq/A+pT52Q8KmJd8MFSG8m0B0qMgvr
 6YIkBKGll72DcN0w5iCr0PQxDJyPiKtUmBD03WVzk9IXMaGsqNLVSH9
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_233455_673727_84D16B67 
X-CRM114-Status: GOOD (  18.39  )
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
Reply-To: maudspierings@gocontroll.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Add inital support for 2 variants of the Moduline Display controller.
This system is powered by the Ka-Ro Electronics tx8p-ml81 COM, which
features an imx8mp SoC.

Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
---
Changes in v7:
- Fix indentation as requested by Shawn
- Set alias for fec to ethernet1 so eqos actually becomes end0 throught
  systemd, without that alias eqos was both ethernet0 and ethernet1, and
  it would become end1 instead of the desired end0.
- Link to v6: https://lore.kernel.org/r/20250417-initial_display-v6-0-3c6f6d24c7af@gocontroll.com

Changes in v6:
- Fix spi cs formatting in baseboard dts
- Add model to baseboard dts
- Fix commit typo in karo tx8p ml81 dtsi
- Link to v5: https://lore.kernel.org/r/20250415-initial_display-v5-0-f309f8d71499@gocontroll.com

Changes in v5:
- Merge the makefile patch into the two dtso patches
- Fix references to the root node in the dtso patches
- Enable the USB bus going to the adapter board in the mainboard dts
- Fix some formatting issues in the mainboard dts
- Fix some formatting issues in the COM dts
- Change a clock as suggested in the COM dts
- Fix the maintainers entries, remove devicetree list and imx list
- Rebase on latest linux-next
- Link to v4: https://lore.kernel.org/r/20250402-initial_display-v4-0-9f898838a864@gocontroll.com

Changes in v4:
- Add imx mailing list to ka-ro tx8p maintainer entry
- Fix several small indentation and ordering issues in devicetrees
- Change the two display adapter boards to overlays
- Add the missing patch for the Makefile to actually be able to build
  the new devicetrees
- Link to v3: https://lore.kernel.org/r/20250327-initial_display-v3-0-4e89ea1676ab@gocontroll.com

Changes in v3:
- Set regulator-boot-on and always-on on LDO5 of the pmic, after 20 ish
  seconds it auto disabled this LDO causing weird behaviour like
  ethernet droping out, wifi not working anymore. This LDO can control
  the IO voltage level of certain pins, just let it keep the u-boot
  value.
- Fix the comment style in imx8mp-pinfunc.h
- Rebase on newest next tag
- Link to v2: https://lore.kernel.org/r/20250226-initial_display-v2-0-23fafa130817@gocontroll.com

Changes in v2:
- Dropped the trivial-devices patch
- Added a patch with bindings for the gocontroll,moduline-module-slot
- Added a patch to spidev.c to enable the spidev driver for the module
  slot
- Added a missing usb-c connector in the av101hdt-a10 variant dts
- Switched to the new bindings for the module slots in the base dts
- Fixed some commit typos
- Link to v1: https://lore.kernel.org/r/20250224-initial_display-v1-0-5ccbbf613543@gocontroll.com

---
Maud Spierings (8):
      dt-bindings: arm: fsl: Add GOcontroll Moduline Display
      arm64: dts: imx8mp: Add pinctrl config definitions
      MAINTAINERS: add maintainer for the Ka-Ro tx8p-ml81 COM module
      MAINTAINERS: add maintainer for the GOcontroll Moduline controllers
      arm64: dts: freescale: add Ka-Ro Electronics tx8p-ml81 COM
      arm64: dts: freescale: Add the GOcontroll Moduline Display baseboard
      arm64: dts: freescale: Add the BOE av101hdt-a10 variant of the Moduline Display
      arm64: dts: freescale: Add the BOE av123z7m-n17 variant of the Moduline Display

 Documentation/devicetree/bindings/arm/fsl.yaml     |   1 +
 MAINTAINERS                                        |  12 +
 arch/arm64/boot/dts/freescale/Makefile             |   8 +
 arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h     |  33 ++
 ...x8p-ml81-moduline-display-106-av101hdt-a10.dtso |  94 ++++
 ...x8p-ml81-moduline-display-106-av123z7m-n17.dtso | 139 ++++++
 .../imx8mp-tx8p-ml81-moduline-display-106.dts      | 527 ++++++++++++++++++++
 .../arm64/boot/dts/freescale/imx8mp-tx8p-ml81.dtsi | 548 +++++++++++++++++++++
 8 files changed, 1362 insertions(+)
---
base-commit: fb44e19e78df2950877a9f7b4f24b58db790d293
change-id: 20250224-initial_display-fa82218e06e5

Best regards,
-- 
Maud Spierings <maudspierings@gocontroll.com>



