Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E3D6C5DF70
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 08:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2i+XMUvEqKzc7yHTfRvhcQY8Gt+wl/MWYpn41allwYo=; b=RQBkcfU+YSG3ZfiLsYaBU+spFD
	fG3NTk/wQSHwS+pNLLni4T7EI7zCENq9xgD6CD2GiwvYhDZzBVSlXTSEE16ufJ7T8Ycr9ZLuS2XVB
	rpA7MASvVCT8DSdDJA/cPZr/hnwCvaxJvT8bu1UcaO9QBT3+OH6maZIWgQTz0UOC9mXPVgXgchLYk
	IcTrlu+w4dW/SKPCpd9zVhn9RKvSQG6HuxT9VZ/2xxzlsT7E0XB/GdZEaBssnWC3ofO+SjMMxQ9TD
	QmGSbPyDxWrKfy5RTf6FPtnvBMi7phOAqg+oDEqaRA4EwxnoR3sKsSOwBosgvXznNfE7CUW4sWetw
	IcyVoOJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvsoe-00000005hdQ-0Kxy;
	Mon, 17 Aug 2026 08:35:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvsoc-00000005hb4-1qOw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 08:35:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8A70360A58;
	Mon, 17 Aug 2026 08:35:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5752CC2BCF4;
	Mon, 17 Aug 2026 08:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786955729;
	bh=SvjmVxHpX/hgBe0iVy00oZ1C75QjIjSINEhU8j+fUs8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=bWA7/VCtwbRYsD6+O8bnlYvM2i4e1iXd2/7e9soZS6i345NgYs025t9H8gM0tRanK
	 NF+A2ILww07UKgM62ra7piBWwUqpeKsAKMeP5dv5hqgOhqoBkdxGrj4MSK7RCml7Ag
	 8JLsPkR3ikYcTU0eb2FdF1pw8BKtj1orN5J/dHl64qT8sF0dL7PcJyP3n/f/o85p54
	 ojzBaunohN2yh+1OrCmQpghFdWqJJbO9XC3+ETYL0jg88hUWhdeqNlYWXOtPPaUyNr
	 kvEXmU/PPx8fWT1Ee8U2NTEyfNiRYwlNIOQPF0+nMtEWS19OJ2ObL+GAjjVZytfUDj
	 tzs1Ci816yuwg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4285FC5DF7A;
	Mon, 17 Aug 2026 08:35:29 +0000 (UTC)
From: Pankaj Gupta via B4 Relay <devnull+pankaj.gupta.oss.nxp.com@kernel.org>
Date: Mon, 17 Aug 2026 19:36:04 +0530
Subject: [PATCH v36 6/7] arm64: dts: imx8ulp: add secure enclave node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260817-imx-se-if-v36-6-45c42847bfd8@oss.nxp.com>
References: <20260817-imx-se-if-v36-0-45c42847bfd8@oss.nxp.com>
In-Reply-To: <20260817-imx-se-if-v36-0-45c42847bfd8@oss.nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786975564; l=1532;
 i=pankaj.gupta@oss.nxp.com; s=20260817; h=from:subject:message-id;
 bh=Fey7Yf+dWHev0BhTzN9X8KrA/PpJDRs7p80ZHkKltXs=;
 b=w2GconMBd0dYHTE5ApbdfS96cndjnT9e+BGyG2V/YVY0xKMDWfdvitQ5lILGfSfZXkAzjAZS7
 braODXjroWhDNUeY70fy9gde1aeSyEflbE+MkBeyA1NfiXWH3KQSfyj
X-Developer-Key: i=pankaj.gupta@oss.nxp.com; a=ed25519;
 pk=g4ZgzIWbpXnSxRsoH+l6PWLP78a+Mzpl8e6RQe74d5Y=
X-Endpoint-Received: by B4 Relay for pankaj.gupta@oss.nxp.com/20260817 with
 auth_id=955
X-Original-From: "Pankaj Gupta (OSS)" <pankaj.gupta@oss.nxp.com>
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
Reply-To: pankaj.gupta@oss.nxp.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Pankaj Gupta <pankaj.gupta@nxp.com>

Add the EdgeLock Enclave (ELE) secure-enclave node to the i.MX8ULP SoC
dtsi, together with a label for sram@2201f000 that the node references.

Keep the node disabled in the SoC dtsi so it does not impose a
reserved-memory requirement on every board. Boards enable the enclave and
provide its memory-region by including imx8ulp-firmware.dtsi.

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
index c6d1bb9edf38..38233dd74ee3 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0+ OR MIT)
 /*
- * Copyright 2021 NXP
+ * Copyright 2021, 2025 NXP
  */
 
 #include <dt-bindings/clock/imx8ulp-clock.h>
@@ -153,7 +153,7 @@ sosc: clock-sosc {
 		#clock-cells = <0>;
 	};
 
-	sram@2201f000 {
+	sram0: sram@2201f000 {
 		compatible = "mmio-sram";
 		reg = <0x0 0x2201f000 0x0 0x1000>;
 
@@ -185,6 +185,14 @@ scmi_sensor: protocol@15 {
 				#thermal-sensor-cells = <1>;
 			};
 		};
+
+		hsm0: secure-enclave {
+			compatible = "fsl,imx8ulp-se-ele-hsm";
+			mbox-names = "tx", "rx";
+			mboxes = <&s4muap 0 0>, <&s4muap 1 0>;
+			sram = <&sram0>;
+			status = "disabled";
+		};
 	};
 
 	cm33: remoteproc-cm33 {

-- 
2.43.0



