Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7D2AC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 09:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DVW5J4glcstwL8pO5zARxAOWRima9waQoO3il9sQJ8k=; b=3d4X3O0wau5C3SQfeHn6r282Dq
	vi5+93c+ScWznzeGByMz0NEUzLCKmNPjsDmP1jIzfSKZIe+WLa1d0iU0idEGcfBuHJmdJjtvlGMZU
	LSZHgWzIs7Ds6CD1bbJgcyWHIgwf1Rj6Bvj3KkV65mgiJdqjPqs/jCITTGEjonuv+FuD3LAonY5gt
	0vXQBr9f5t7aFLqurtZiW6pHqGdPQ7Bzq2RjuniYxocZdLLzO5hRvyaDdrSCV1T7uMvLPXqKNkDLw
	KcRol4ex8PiybjXs5A/epROdj3TSBDvasrxGCG6lrSgUZATw6I+tGZKgyrvWVhlTCwF08qcifYDH0
	+Yr+SX7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl2sO-000000001dm-2DG4;
	Thu, 20 Feb 2025 09:29:48 +0000
Received: from out-176.mta1.migadu.com ([95.215.58.176])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl2oH-000000000VL-2vze;
	Thu, 20 Feb 2025 09:25:35 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
	t=1740043527;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DVW5J4glcstwL8pO5zARxAOWRima9waQoO3il9sQJ8k=;
	b=QjHWmZwR7bQMYAU4Chhs4VFlZcVdo4os87BaSwNf+wmx56BU1r47OELc83vGIAuQ4kMWZh
	0ulZjI0wgGqYfISlW+ISnTqFTsT4RNR6ICEDZFJP0qyXgC4Ea42GQak93qUZtI55fmD3Jn
	TiZ+hGNLtNFfekaQTeSOJdwHiaAHu1GkCVmllU4yJ85NqCeZ3AupW9f7DGcn+JQPR/lJsH
	JtcM8IQhlmDr/b9ulpkR17L74rEZPJo+Qu4tsuWSSmrG/9/vE4mQqNvy0ofXnbFWkibtsk
	ekYP0A2orN0SjuVPDiRZ6M+UvcpoyMOXNVOgqexukJJ37fVJTAPuCC67qrwNEQ==
From: John Watts <contact@jookia.org>
Date: Thu, 20 Feb 2025 20:25:10 +1100
Subject: [PATCH] riscv: dts: allwinner: d1: Add thermal sensor
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-thermal-v1-1-5168ddfc86e8@jookia.org>
X-B4-Tracking: v=1; b=H4sIAPX0tmcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDIyMD3ZKM1KLcxBxdCwPjlFTLlESD5FQzJaDqgqLUtMwKsEnRsbW1AKz
 VjWxZAAAA
X-Change-ID: 20250220-thermal-803de9da0ce6
To: Maxim Kiselev <bigunclemax@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>, 
 John Watts <contact@jookia.org>
X-Developer-Signature: v=1; a=openssh-sha256; t=1740043512; l=2043;
 i=contact@jookia.org; h=from:subject:message-id;
 bh=kcBR7kSu99tIXz9DSLnGY6m94ZbCPKA4Lxb+LGfH64U=;
 b=U1NIU0lHAAAAAQAAAEoAAAAac2stc3NoLWVkMjU1MTlAb3BlbnNzaC5jb20AAAAgPs7MDd2XR
 g2uRE9caV1lPPPeu0VzIG9fPrrVmYyAhLcAAAAEc3NoOgAAAAZwYXRhdHQAAAAAAAAABnNoYTUx
 MgAAAGcAAAAac2stc3NoLWVkMjU1MTlAb3BlbnNzaC5jb20AAABAc8TVZ0UIlxel4wmURqW5qmq
 81E7hOouwLxFGMuHDMJGNdKfClHAoXoeh58TiOyTwhFF1SevY3l+ME1EWr8kQBgUAAUcA
X-Developer-Key: i=contact@jookia.org; a=openssh;
 fpr=SHA256:/gEvgms/9HpbgpcH+K7O4GYXmqkP7siJx9zHeEWRZTg
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_012534_461337_8C24E17F 
X-CRM114-Status: UNSURE (   9.82  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Maxim Kiselev <bigunclemax@gmail.com>

This patch adds a thermal sensor controller node for the D1/T113s.
Also it adds a THS calibration data cell to efuse node.

Signed-off-by: Maxim Kiselev <bigunclemax@gmail.com>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Signed-off-by: John Watts <contact@jookia.org>
[John Watts: Remove disabled status]
---
This is a quick fixed version of Maxim Kiselev's patch from here:

https://lore.kernel.org/all/20231217210629.131486-4-bigunclemax@gmail.com/

It removes the disabled status as requested. I've tested it by adding thermal
zones to my board and it works from what I can see.
---
 arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
index e4175adb028da2be539e7aa316206fec4810adfc..cc3f9cc9b8ed20121924cc932412a6b6342a2f86 100644
--- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
@@ -166,6 +166,18 @@ gpadc: adc@2009000 {
 			#io-channel-cells = <1>;
 		};
 
+		ths: thermal-sensor@2009400 {
+			compatible = "allwinner,sun20i-d1-ths";
+			reg = <0x02009400 0x400>;
+			interrupts = <SOC_PERIPHERAL_IRQ(58) IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_THS>;
+			clock-names = "bus";
+			resets = <&ccu RST_BUS_THS>;
+			nvmem-cells = <&ths_calibration>;
+			nvmem-cell-names = "calibration";
+			#thermal-sensor-cells = <0>;
+		};
+
 		dmic: dmic@2031000 {
 			compatible = "allwinner,sun20i-d1-dmic",
 				     "allwinner,sun50i-h6-dmic";
@@ -426,6 +438,10 @@ sid: efuse@3006000 {
 			reg = <0x3006000 0x1000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
+
+			ths_calibration: thermal-sensor-calibration@14 {
+				reg = <0x14 0x4>;
+			};
 		};
 
 		crypto: crypto@3040000 {

---
base-commit: eca631b8fe808748d7585059c4307005ca5c5820
change-id: 20250220-thermal-803de9da0ce6

Best regards,
-- 
John Watts <contact@jookia.org>


