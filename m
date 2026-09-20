Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01BDBC982DA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 10:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R9roBo12wLbC06/Q2g/CCyXLKsAtX4tScHJO+dSKxsk=; b=xZhkbdP+m2USs0MrIc1/SRDJEA
	0NOZ0DPbo+/XWFrlK0+BY4jQsXStp0xQ+8CVWkJ22SMxduHgXDINLQp2ES2tX/uCI1wcT7pkOeUaa
	jNQTK6f//wOPR/CaVfZtefnlN1HvH+F+gRrI+Fg6KFegwscaJg+DMrhUek1gz+jheuX0ZVxdpSc6u
	xh/ZkBoOR8RpYVH9YPTn3C5DRNwpHlZ7pcunHyauB1fb5vgNLqpCFEhB+PeaTY13w4VEgTy6iVXjB
	W7D+d7TIOnGKGHpzOHvr463b2NZVN/RrYJl1dYts+4MGxjni8KzBIfZ2w9UsFCQQXNJ7NPcxYSo//
	fXy074CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Ejh-0000000HFlX-1zJN;
	Sun, 20 Sep 2026 10:25:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8EjM-0000000HFPV-2ziX;
	Sun, 20 Sep 2026 10:25:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0552460D79;
	Sun, 20 Sep 2026 10:25:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BD206C4AF09;
	Sun, 20 Sep 2026 10:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789899907;
	bh=CVrPnrs8qwQFVuAK2JblKtBbOLQAR+miyXJpO2WE03c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=R6WcSrnK1bR1+ArQF7QdCJVEZ4KE2hGgym5ADS0fwT2XK+RUR6X1xBam8+cdflhEq
	 ZgbCGB9LANCw1aymz5R2VObSUKVO6dsgAdsN+vrc6QNtPkNCiJsSTum+YNYDNW66i5
	 PSL8S+ATJ8LxDs5jtaTd19ZZDKbEmviVmz+dWGdH8lksWgGyc8D4LsHyo7FgPnhy1K
	 99cZxomXkXrkOdecFgzsq0XDEydWSOyEKuHf68zbB6MBBaON5gL0gPPzn1ZIuD2AIl
	 updHd6/1aRD5jCcDUcyct/E7IGZpbPUvwvoM8/vN98RgKh8xOJMsYw6uiZxVWP4ogS
	 lQWHnu2KN88ag==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA1DEC982DA;
	Sun, 20 Sep 2026 10:25:07 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Sun, 20 Sep 2026 18:25:14 +0800
Subject: [PATCH v2 12/12] arm64: dts: amlogic: a9: Add clk-measure
 controller node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-more-socs-to-support-clk_measure-v2-12-224382a429e8@amlogic.com>
References: <20260920-more-socs-to-support-clk_measure-v2-0-224382a429e8@amlogic.com>
In-Reply-To: <20260920-more-socs-to-support-clk_measure-v2-0-224382a429e8@amlogic.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789899904; l=796;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=4DgrEoOMoCExjYXex82UD7PxEvK6o2H5kIyRyw8MyZw=;
 b=LH5sb4t5IBJ5szFqCCnGHBi6Bi9K23ols2Lss7BhhYVthrPh4WCUqLF+KqihHHF+XFO3j5Q72
 lzZKwoZzJiHB4rAs+2DPnS7Bu/PNMX34qrQWqwwmZ4qO6uaPcepLXTM
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
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

Add the clk-measure controller node for A9 SoC family.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi
index b0e0fadeed82..91f4cf319b0d 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi
@@ -185,6 +185,11 @@ gpio_intc: interrupt-controller@4080 {
 				amlogic,channel-interrupts =
 					<10 11 12 13 14 15 16 17 18 19 20 21>;
 			};
+
+			clk_msr: clock-measure@48000 {
+				compatible = "amlogic,a9-clk-measure";
+				reg = <0x0 0x48000 0x0 0x1c>;
+			};
 		};
 
 		gic: interrupt-controller@ff800000 {

-- 
2.42.0



