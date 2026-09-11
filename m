Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD5B4C88E4D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 08:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QMr0HbRDzB6ksvZ6n9KrmZzNM350hOHw0sc123CX7JI=; b=iOox05akj0taw4JJIQ04xZfAI7
	5bY1+TtFiM0gyc/yRqi9nkYtE9cFryMJfpEfm6Uebj/tOLbXS9aXFLMfaYI2wd5cLHh1QBuWbULQM
	yLy7dfEF2heZJJC7un9690Wt9DBBrO2XBI2Qlt9mSOgcTOzxfodaLLCzbsz37LcMyJR5bFfF6p1FQ
	GwtnxetZhNtXQhiALSoNKeD1CczL9/S25Q8eAHclgCFFGNmlSH2kK+vPT5pWpwN7MtIyLpMz6v4uH
	PEjmXTTN+BUy2TFN33rIIFvPb+t80p0S2YU3ddpubdV6bBFu7zD3fcomplEtteNn2m3PziR9qDuUX
	otXhPTtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4wcw-0000000G7io-45o7;
	Fri, 11 Sep 2026 08:28:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4wcv-0000000G7go-1KMC;
	Fri, 11 Sep 2026 08:28:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3CF84447AC;
	Fri, 11 Sep 2026 08:28:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1255CC32781;
	Fri, 11 Sep 2026 08:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789115332;
	bh=7yUvmIDMbzfZAF93qAmLa8Oi5bfk4s5SvGz6m0eGErI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=dM7yy024jFrTnifHeVza8hKFK9rkBeMTdFiL6/PCB/QhLjjfb2aMRVT/ZYAAsWHyg
	 PoSG2Bj4dILWrUO+18/tS8M2X3XdzoBe3kKqahXNU7ilP1RoWy6Z7c/M38kkReIEnP
	 8wzk1pXpOx+/m2cuuUxcoAYMLeWupYy+Si9j18UzruuPuFfzZlos1AQgbMCZsTkZB9
	 11ivorcEI1kM6xP7a1IeMHNrJAzGHUeq+P3gc62X1Vz1pM+Vo7oXo08Fh6lTPtgEQr
	 nLLNCdcslTzpjMEQ5Yrhabs5dgaclIUTT+PVXg82w9WyJBYSsIG+3rpzjUwuqHyH3p
	 rHqzUTlSmi+7Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F4185C88E54;
	Fri, 11 Sep 2026 08:28:51 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Fri, 11 Sep 2026 16:28:32 +0800
Subject: [PATCH 05/10] arm64: dts: amlogic: a5: Add clk-measure controller
 node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-more-socs-to-support-clk_measure-v1-5-940e269aa52f@amlogic.com>
References: <20260911-more-socs-to-support-clk_measure-v1-0-940e269aa52f@amlogic.com>
In-Reply-To: <20260911-more-socs-to-support-clk_measure-v1-0-940e269aa52f@amlogic.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789115329; l=735;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=m5R5k55AN/MNKbp84EDgUAXLk3E5z1TMK4ptSdMbBlo=;
 b=0fMq4ekz7cyIsYeXCLx8O+Z7BW28Z+B98QJBNy2y/oT6QK3XNsW5Y2vxm8ql2K+WrW8fICR+K
 wBwNuWwoLhnBAVuDggT1iruQgPBslaGFdHkAsNSj7eirfby9dHsETxy
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

Add the clk-measure controller node for A5 SoC family.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi
index 2b12d8284594..0be176ace337 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi
@@ -157,4 +157,9 @@ gpio_intc: interrupt-controller@4080 {
 		amlogic,channel-interrupts =
 			<10 11 12 13 14 15 16 17 18 19 20 21>;
 	};
+
+	clk_msr: clock-measure@48000 {
+		compatible = "amlogic,a5-clk-measure";
+		reg = <0x0 0x48000 0x0 0x1c>;
+	};
 };

-- 
2.42.0



