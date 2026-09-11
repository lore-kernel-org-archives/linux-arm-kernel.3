Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F019C88E53
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 08:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C8kIfjDOH+vb1HRu61bKehD9zkSsQQ3ILjlVHNmQwl0=; b=cED4akNj7ZdHLrh/JaBGKorloY
	AvtN6BYNKt89ciHwZPmjimkho3o+pInRthQofrYFCG230z+TYjQ/6x5TxvwHCCzRCM8/0ZflM2W9y
	4vcxW3RGX94uP81vZft7UQ+cu38hKwbUQEMzPHzjNmDBw6rRfJbnYNsePODSy7et/1R0ls3Mix3He
	6cAvzNQLxm256I4MErZfqLibNsNHTh5NNsOiRSxhw4UllvCFzTjzrqbd2gnhycIDq0y5YTsdGwaZw
	zhXhRzLLuGC/rrX7Ei+/K3nH5un2Wq6rybXP84Ye9eCSSKS31kcKZCoCH6NyUDlFUqnE/CACBBK78
	6h2X1Mlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4wcy-0000000G7lF-1pyk;
	Fri, 11 Sep 2026 08:28:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4wcv-0000000G7h7-2q7q;
	Fri, 11 Sep 2026 08:28:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 47CC8447B4;
	Fri, 11 Sep 2026 08:28:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 21584C32782;
	Fri, 11 Sep 2026 08:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789115332;
	bh=mLj7YUC9Fm6rKKu4LSYfjTh/ywFy6caKOyKBr+t9m/g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=BQCf8WHCLPPG2RGkrT1lBlKbJOpvqAYedFdAgc1xKUH2ztTvCKCmZZCOqPVNVTSW3
	 2LejBiw7vel4xHLJOpKPoP5aNb479HNjhkRRg5ShArEftFCntVOc03QDsztDEQavO4
	 51m+efxdju84tX2mRaleEKUrf5wCk2hboFH1k5526AUMqz/ScoC1b+1Z5f8r/l7fO7
	 lNft58WH/fpqlUlBzZJX/ivHelCynsPKAUkf5j0c1+1RucOhXdJviGvXxTjj+8Niui
	 ZYNbTeyN/C3Ph23ABHS76yb9SJrmfb/fZ0TG4FxxtO5UY1WD495xVan8KJJ9ciosqZ
	 m1/S5IcLx+Lcw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F1BDC88E4D;
	Fri, 11 Sep 2026 08:28:52 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Fri, 11 Sep 2026 16:28:33 +0800
Subject: [PATCH 06/10] arm64: dts: amlogic: a4: Add clk-measure controller
 node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-more-socs-to-support-clk_measure-v1-6-940e269aa52f@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789115329; l=797;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=wRifO0cIF3hQCIdhhi4prrj9RKNwhA6uX1mJAaHO3Ik=;
 b=dxkN7FUuyreM7FYjTV0v/C+Gvt+Bo4jl3ToXJg5NNEAaHVCFaZ1oG9La/uhAq8aCP8Jr5SfbG
 G1xgkY7azqEByX3TbJY5Kbmxe8BTAjKk1LMj+073q1HmHAIZ6EvLK/v
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

Add the clk-measure controller node for A4 SoC family.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
index fce45933fa28..762754b33f23 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
@@ -207,6 +207,11 @@ gpio_intc: interrupt-controller@4080 {
 			<10 11 12 13 14 15 16 17 18 19 20 21>;
 	};
 
+	clk_msr: clock-measure@48000 {
+		compatible = "amlogic,a4-clk-measure";
+		reg = <0x0 0x48000 0x0 0x1c>;
+	};
+
 	ao_pinctrl: pinctrl@8e700 {
 		compatible = "amlogic,pinctrl-a4";
 		#address-cells = <2>;

-- 
2.42.0



