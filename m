Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FB08D148A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 06:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fWYmcjhvg9y3N/u/OOKx04aj1aGuI0a8sXoAGDiMrKs=; b=a64OImdKv/7Ff6AWqlwf5WvNPL
	/mnd79rXjAtuB9/+fkaQJd5tob62ObWWjXHz3D/e7k9pUVGwh7DHEK1cN1jZrBAIR0H068lhGU3ZZ
	qZQmfq/N2xUPvhWZ+G39lz+1fdy14hC3TGE3s/6BJVx/1ZcX2OCLTQx08MMcxvsCTTQWv/ErGIGf8
	VuCKaQQxqbHtr959v7nHP1K3AnBjInmljOeaXkARxfcrGA0+rq3DXhDOHvo57vvI9XTOrywqbfgFP
	gCt0Jt9HWlstJxhAqY77MD+Eab8hhi6/OaCitdDagY38vCXwDyKmhl32Zxu2dNyXRsw29ClKIwKnN
	xJMUl9cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdjCI-0000000FyvT-0Ega;
	Thu, 08 Jan 2026 06:08:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdjC8-0000000Fyjc-3wTz;
	Thu, 08 Jan 2026 06:08:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 62AD444418;
	Thu,  8 Jan 2026 06:08:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 268DDC2BCB8;
	Thu,  8 Jan 2026 06:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767852506;
	bh=X2LgKGxvc+yiUAPkHyPMwzAGhXvItiDTlNdNw6TQWqo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=HfOD6BUNRY2AsXZSsaXbSpT0Y1rjKxypgvbHp4hH1mjb8aD2Ow3+NfNbVl8idpLD3
	 dSuYOKbEadbo0ukPcjjz3Imk5FPQdqfqWP2RMPqgCCIRzEBkwM4MYTmH1oLelPVVqg
	 WVSTm2clt5rp84JKvsAdjgWROGHugckAm/7C/4UrD3SHEiNa92VnQXJJcEbed85nwu
	 eq36v+o6PxcUUznMfxiem9wxVJcArQUjWyh/0HHIFjkcFg59MYW5ORliSHsm8RnrpS
	 5mCpZibUpb30L0jIS6HcPZTOte0ZBZNeoRoeJUgWlj/f8T/vVUUMlnvWmS97wK6jUP
	 4e6XBHkM9kC5w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FA79D148A5;
	Thu,  8 Jan 2026 06:08:26 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Thu, 08 Jan 2026 14:08:21 +0800
Subject: [PATCH v5 7/8] arm64: dts: amlogic: A5: Add PLL controller node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-a5-clk-v5-7-9a69fc1ef00a@amlogic.com>
References: <20260108-a5-clk-v5-0-9a69fc1ef00a@amlogic.com>
In-Reply-To: <20260108-a5-clk-v5-0-9a69fc1ef00a@amlogic.com>
To: Chuan Liu <chuan.liu@amlogic.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767852503; l=1163;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=W8yE0gYMnw2TeYIsOkbQZ2yJTdvcybUThyiQBa5vAa4=;
 b=t/vFbrbKMOqOpCzd6cxF8C5mfXd4bTixDvCpsNGDNNux+2+UfsXTjHXOWPtPbccyI2RzeYQIJ
 wZCj1TeI2nSAIf4cjbjvDV04ShQxrNV3EB1nNhlaM6bZvvJiAUcIAZH
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_220829_060933_A6E7C7FF 
X-CRM114-Status: UNSURE (   8.62  )
X-CRM114-Notice: Please train this message.
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
Reply-To: chuan.liu@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Chuan Liu <chuan.liu@amlogic.com>

Add PLL controller node for A5 SoC family.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi
index a6625508893d..70deeab220e0 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/pinctrl/amlogic,pinctrl.h>
 #include <dt-bindings/power/amlogic,a5-pwrc.h>
 #include <dt-bindings/clock/amlogic,a5-scmi-clkc.h>
+#include <dt-bindings/clock/amlogic,a5-pll-clkc.h>
 
 / {
 	cpus {
@@ -187,4 +188,16 @@ gpio_intc: interrupt-controller@4080 {
 		amlogic,channel-interrupts =
 			<10 11 12 13 14 15 16 17 18 19 20 21>;
 	};
+
+	clkc_pll: clock-controller@8000 {
+		compatible = "amlogic,a5-pll-clkc";
+		reg = <0x0 0x8000 0x0 0x1a4>;
+		#clock-cells = <1>;
+		clocks = <&xtal>,
+			 <&scmi_clk CLKID_FIXED_PLL_DCO>,
+			 <&scmi_clk CLKID_FIXED_PLL>;
+		clock-names = "xtal",
+			      "fix_dco",
+			      "fix";
+	};
 };

-- 
2.42.0



