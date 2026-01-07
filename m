Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9329FCF6BE3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 02:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3sxSjctQeqczWp9KoQgtmdXe3lJ6iSY0bfziuKBOD50=; b=4FzZNfWnuSOt+s
	j+f+QzNAaSdzLCk0r8bmkzDrhnZECGD7p9UxypDXl2qPf9oRdmE0gcwH7GHn0alrtQ1v8iIpq8Cg0
	0GncvbC+mZxYUQRvedvS6WqVrC4wFe33YH058RDeeAciMetze4xUYod6fyzSwc0K8An1eZOpgM/zB
	Alkzmz1HMD6YI1bP68OhGv6uB8/Ac5vopUnM3yzaJjOqSDe/DyhrqLe4JnL8/pEnMR8hmuYH3dNGb
	IyKCsaMdMxmMQSJ//BY0y0/gSjJYwvs0F05jRF0Ia8OQ04qLqMZmMK4vQNMK7cWkVIgAgFvaFmclp
	3oi91jqGVkUdE0iGYBaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdIzw-0000000E28e-3Dxr;
	Wed, 07 Jan 2026 02:10:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdIzw-0000000E28D-0U38;
	Wed, 07 Jan 2026 02:10:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E21D06013C;
	Wed,  7 Jan 2026 02:10:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7942CC116C6;
	Wed,  7 Jan 2026 02:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767751806;
	bh=WERmRKo5gKNIwlgqfGfG9M+0JRo4MDAa1A9k3uXlqrw=;
	h=From:Subject:Date:To:Cc:From;
	b=ZeQJfl1z35nc+23NKjAkxJqSDzEBZYxH5IBlr9aO0ypaxHoB5fRIII0PwjvBFre1Z
	 ZCmdI9NlUqh3T0xH6+ZbUY3Vz5vGwEBYvX8e9BXLev15tXIDnIUE7pWnWlgiSurB3q
	 F0gIjd67Rgf4C6QjL2UwX1Rc0EtRDxGt61otZkAECW2fKlCAcAxlJgz0gIiyms/IyJ
	 A01yfwGxIJWgmi3xnTJuyV4mQDHh+xThK/REKI/cMefQHgO8rS2INhdx453Z9ozr+J
	 LQ4MWy2wh5u+buTqe7FAyvH57motJlWPgWxfgu+PPWgobG8mZXNY/QLVW1gof07svz
	 CZaBfxsCgu1Ng==
From: "Rob Herring (Arm)" <robh@kernel.org>
Subject: [PATCH 00/13] dts: broadcom: Fix remaining DT warnings
Date: Tue, 06 Jan 2026 20:09:39 -0600
Message-Id: <20260106-dt-dtbs-broadcom-fixes-v1-0-ba45874e4553@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGPAXWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQwMz3ZQSIEoq1k0qyk9MSc7P1U3LrEgFck0tUwzNE82NE43TlICaC4p
 SwRJAvdGxtbUAAnaXQ2gAAAA=
X-Change-ID: 20260106-dt-dtbs-broadcom-fixes-b59d17a73a3f
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>
Cc: devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15-dev
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

This series fixes most of the remaining DT warnings for Broadcom 
platforms. There's a few left after this which requires some reworking 
of the MTD partition schemas which I will send out later.

Not tested on any platforms.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
Rob Herring (Arm) (13):
      ARM: dts: broadcom: bcm2711: Fix 'simple-bus' node names
      ARM: dts: broadcom: bcm2835-rpi: Move non simple-bus nodes to root level
      arm64: dts: broadcom: bcm2712: Move non simple-bus nodes to root level
      arm64: dts: broadcom: Remove unused and undocumented nodes
      arm64: dts: broadcom: stingray: Rework clock nodes
      arm64: dts: broadcom: stingray: Fix 'simple-bus' node names
      arm64: dts: broadcom: stingray: Move raid nodes out of bus
      arm64: dts: broadcom: Use preferred node names
      arm64: dts: broadcom: ns2-svk: Use non-deprecated at25 properties
      arm64: dts: broadcom: northstar2: Rework clock nodes
      arm64: dts: broadcom: northstar2: Drop unused and undocumented "brcm,pcie-ob-oarr-size" properties
      arm64: dts: broadcom: northstar2: Drop QSPI "clock-names"
      arm64: dts: broadcom: northstar2: Drop "arm,cci-400-pmu" fallback compatible

 arch/arm/boot/dts/broadcom/bcm2711.dtsi            |   4 +-
 arch/arm/boot/dts/broadcom/bcm2835-common.dtsi     |   7 +-
 arch/arm/boot/dts/broadcom/bcm2835-rpi.dtsi        |  16 +-
 .../boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts  |  49 +++---
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi          |   8 +-
 .../boot/dts/broadcom/northstar2/ns2-clock.dtsi    | 105 ------------
 .../arm64/boot/dts/broadcom/northstar2/ns2-svk.dts |  26 +--
 .../arm64/boot/dts/broadcom/northstar2/ns2-xmc.dts |   2 +-
 arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi   |  87 ++++++++--
 .../boot/dts/broadcom/stingray/bcm958742-base.dtsi |   2 +-
 .../boot/dts/broadcom/stingray/stingray-clock.dtsi | 182 ---------------------
 .../boot/dts/broadcom/stingray/stingray-fs4.dtsi   | 114 ++++++-------
 .../boot/dts/broadcom/stingray/stingray-pcie.dtsi  |   2 +-
 .../dts/broadcom/stingray/stingray-pinctrl.dtsi    |   2 +-
 .../boot/dts/broadcom/stingray/stingray-usb.dtsi   |  21 +--
 .../arm64/boot/dts/broadcom/stingray/stingray.dtsi | 148 +++++++++++++++--
 16 files changed, 315 insertions(+), 460 deletions(-)
---
base-commit: 6cd6c12031130a349a098dbeb19d8c3070d2dfbe
change-id: 20260106-dt-dtbs-broadcom-fixes-b59d17a73a3f

Best regards,
--  
Rob Herring (Arm) <robh@kernel.org>


