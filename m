Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BE3FD68BD1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 19:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PaEc46oDKc9ufLqGihblMIRIwLEeHgPQDkPBJCQecH4=; b=p+f1IIGoT4tPGrmYS/QCyAq4uy
	lPqpD1LonRoG3vwmmJ43on47zGRwe/8htxOBW6pL7jYOGgkV50fOq82AaiRo3VL0dkORXJGbGy9Hw
	YtrybVe2rBF6QjpXMrKohJA9TN7M40YTNCmW1hGebgsRXeJUNwq8zppC1GvIAewzYIkT1VcDB8YvV
	wezy2NLbyJO+GjvfYzmnnSsSr+vXkHeGEAUJwB908dSNcEEEuTUEcdEWohQA//79bFIGLLs/pwn4R
	StIjm5Cp3NfYHEWdCfN94bVpu3l320uMN/diK2QMAPVbjam2mXTcmQY4PE+VI+S4L0iqOcmTAcKRv
	Rpg33MHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tC27G-00000003sBv-1l6n;
	Fri, 15 Nov 2024 19:36:26 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tC25R-00000003rj9-18Jl;
	Fri, 15 Nov 2024 19:34:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A7AECA42BC5;
	Fri, 15 Nov 2024 19:32:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23D1DC4CECF;
	Fri, 15 Nov 2024 19:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731699272;
	bh=4AWA2nkRIbgRzL+sZh1xMNPfawJdWekHH6+xzkmZw34=;
	h=From:To:Cc:Subject:Date:From;
	b=tpLTEAdSnAAUXZMLog2jay57Avt9+PUVz5FqJiJGGFvQWEeHBgl1nODK5PfN+RoNh
	 H+Y123OdHJZwmbgyXB3mvVv/vB9JrzqD4uQ1pzI7Jt9E9YGY1kskH7QQO2NlDZkeRY
	 +vFBb05iyTWvWeVnnYvBEorLKysFu8QqRETBV6ngvnPG0shyEnJfa2DoKsnHNnN3NE
	 ThaQNTYMS69TeydeJJWxVq/IWcChTb53hYPys1KJYg1jMTCY8escTyyNXFz8T5LeQ4
	 bYPy40eZgv1l6QL5fHzITHDKjLTlbFZTB4k8DwlInc6Gyo/HQSw0jgnXRuvjKGJRJq
	 6DH33Nh1z45bQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: rockchip: Remove unused and undocumented "num-slots" property
Date: Fri, 15 Nov 2024 13:34:23 -0600
Message-ID: <20241115193424.3618568-1-robh@kernel.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_113433_367044_356E0185 
X-CRM114-Status: UNSURE (   8.51  )
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

Remove "num-slots" property which is both unused in the kernel and
undocumented. Most likely they are leftovers from downstream.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s-plus.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s-plus.dts b/arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s-plus.dts
index cb81ba3f23ff..7c5f9be9a470 100644
--- a/arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s-plus.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s-plus.dts
@@ -24,7 +24,6 @@ &emmc {
 	disable-wp;
 	mmc-hs200-1_8v;
 	non-removable;
-	num-slots = <1>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&emmc_clk &emmc_cmd &emmc_bus8>;
 	supports-emmc;
-- 
2.45.2


