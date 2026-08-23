Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD98DC5DF8C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Aug 2026 22:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=j9C1iPF4ZEMa6VEifcus3DSe6CTk1WSW6z66vHKWYnk=; b=fG3N/6OHeS7xUMVaK/tVb30FW5
	Tr7qwS0fXGTWl0ByuTJ6SvV26rvGARBVJFWXE5blc0tlyIdG9i5OjsU8rIVC3ILXN7RlzzFUTEAVb
	FQootsA4pnrb+Apch0Y5RzEaJifw2KbBYI/2sF0NGC+MaiPPPzc4tIdx+ML77so+R8slE7/2FBHle
	trDnEaRt5aiT3GpnYpbXWJTS8m1mKrFWA6OpAVDNia48hA5fehGNZGCnSzriS2xZZoB2lXymPhOmC
	S0301SfrtCCTwpC7ZZ9DMCwdmk81Nk2gTPhfWrWhQXOpVDookCdOytF5vUbTdHCdEr+RkVJuvkqeI
	K6S3Q9HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyGcl-0000000FeKD-37vw;
	Sun, 23 Aug 2026 22:25:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyGck-0000000FeK7-0qXK
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Aug 2026 22:25:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8D96243CF9;
	Sun, 23 Aug 2026 22:25:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 668A1C2BCB8;
	Sun, 23 Aug 2026 22:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787523905;
	bh=cq1hYsxSF8q8kGHGEdS0KX9Ra636QhedZrafPgp9MF4=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=G1e+R70kZaq6JfUd4XQR/TVBzuSQmU8TWfyq9UiSZxswyqovfTUoT8A07B4+ZBRKj
	 P0LUxLvrOa+6eJ8CO2b+4EbiaL5eWXAi71gwbZu/f0Hw+GM7nLw1GJvwlxIFJcaBxZ
	 P+9cniXYPA54HeqKB0UvYbOXOfcQQh/XlhoG6C6CPUQ6AxHEh8j3oJiyTidyYOeTRP
	 TiUnXGvlHOcXRS6JMHoHJ9AwYDmvRzykxyPORZGYOpUzZdJsJKshZLS5yj8VJXauOK
	 H9CDqeB3C4buXwkqScazqn4yC3HLOUGwbdPBdL9qVW+IliMflzw5c0spJwAtMzxQM1
	 w0HdMBlVpZwzQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E72EC5DF97;
	Sun, 23 Aug 2026 22:25:05 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Mon, 24 Aug 2026 00:24:56 +0200
Subject: [PATCH] arm64: dts: lx2160a: fix incorrect pinmux
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-for-upstream-lx2160a-pinmux-fix-v1-1-33a3c8d5ea8a@free.fr>
X-B4-Tracking: v=1; b=H4sIADdzi2oC/x2NQQqDMBAAvyJ7diEubdB+pXiIZm0XNIaNkYD49
 4YeZw4zFyRW4QSv5gLlU5LsoULXNjB/Xfgwiq8MZMianh647Io5pkPZbbgW6qxxGCVsueAiBa0
 3A/c0+ec8Qa1E5ar/h/d43z/EZGZkcQAAAA==
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Josua Mayer <josua@solid-run.com>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Vincent Jardin <vjardin@free.fr>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787523904; l=1744;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=v7b3i0icYOPqdG+BqtL6lYNtCLmPe90OESWp1UB4moI=;
 b=ezvxDYGXs6w7Ps/jMEObsLtPsg3EUttJ5frsgrfiS1kdS3jut+ZHF5FBxc6FpWlv0zBsho0Pc
 UYsr1nbTKn0DQLloefJC+hR9tYSMkslaNs5TIRd93+OqdiSsPlxadad
X-Developer-Key: i=vjardin@free.fr; a=ed25519;
 pk=hppgLeFpGpKOi7LNwGEZ4jOYofJCoGd4Jf1ltAabiLw=
X-Endpoint-Received: by B4 Relay for vjardin@free.fr/20260525 with
 auth_id=871
X-Original-From: Vincent Jardin <vjardin@free.fr>
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
Reply-To: vjardin@free.fr
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Vincent Jardin <vjardin@free.fr>

For gpio1 value set for pinctrl is outside the mask and so will do
nothing.
Add the missing offset for value field to be the same as the mask as
expected.

Fixes: 284ad7064aaa ("arm64: dts: lx2160a: complete pinmux for rcwsr12 configuration word")
Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
index 1d73abffa6b7..b9f079c49e19 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
@@ -1803,7 +1803,7 @@ fspi_data74_pins: xspi1-data74-pins {
 			};
 
 			gpio1_31_28_pins: xspi1-data74-gpio-pins {
-				pinctrl-single,bits = <0x0 0x1 (0x7 << 15)>;
+				pinctrl-single,bits = <0x0 (0x1 << 15) (0x7 << 15)>;
 			};
 
 			fspi_data30_pins: xspi1-data30-pins {
@@ -1811,7 +1811,7 @@ fspi_data30_pins: xspi1-data30-pins {
 			};
 
 			gpio1_27_24_pins: xspi1-data30-gpio-pins {
-				pinctrl-single,bits = <0x0 0x1 (0x7 << 18)>;
+				pinctrl-single,bits = <0x0 (0x1 << 18) (0x7 << 18)>;
 			};
 
 			fspi_dqs_sck_cs10_pins: xspi1-base-pins {
@@ -1819,7 +1819,7 @@ fspi_dqs_sck_cs10_pins: xspi1-base-pins {
 			};
 
 			gpio1_23_20_pins: xspi1-base-gpio-pins {
-				pinctrl-single,bits = <0x0 0x1 (0x7 << 21)>;
+				pinctrl-single,bits = <0x0 (0x1 << 21) (0x7 << 21)>;
 			};
 
 			esdhc0_cmd_data30_clk_vsel_pins: sdhc1-base-sdhc-vsel-pins {

---
base-commit: 3d6d817622b0a9721e3cc404df3469171582be13
change-id: 20260824-for-upstream-lx2160a-pinmux-fix-6d09e82bd5cb

Best regards,
-- 
Vincent Jardin <vjardin@free.fr>



