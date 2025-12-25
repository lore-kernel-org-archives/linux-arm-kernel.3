Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1684BE7AD47
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Dec 2025 10:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A8Z/67cUp+HOQ5+cYGaioUvoUYsRSAtj3y8y/pAWjsU=; b=dWFeqF9Dt8pwXfiN3/DZH/vjgA
	8T1l8D0RWMmjyI/7towSUoEwdRikR+/HuMZrNBSYCNlZPntAor1H4Hb9ihRlXIiCxY5w3wdJqdVk4
	vIt2oik/zK2IyjL+LdoBbg55ChbFoaxxTXqdrq2iyTot5dXs2zEjUQdEbmuL8AvJCyEZ9FsNW++Zt
	uTItCpYCnq4v4+5wz3AUpunlES9So0TnzHOrYXtG+OLovTHHqYj85RhQFdKCFOhI/Ofxp0p3oO9hf
	ypqsTVXxZzzAo20rzrV0wNG/AM8p3mGdmaHDlAbK1Gidb436eXyPVi4O7kBpvro4rDhuKDClm0ri6
	nq21AIPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYihp-00000000KN0-3Xut;
	Thu, 25 Dec 2025 10:36:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYihm-00000000KLY-0BR2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Dec 2025 10:36:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A05C4444DB;
	Thu, 25 Dec 2025 10:36:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B19EC116C6;
	Thu, 25 Dec 2025 10:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766658985;
	bh=nlLCiQO+Jd5EFzOAjqev47gE2C5HBxNmZ+Q+P9RB/aA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NTRHxfdV9D7oDpdWum5fKtI8CIv4U09+qQzHbnMmi0BWxFQmRkJS3q4PSZq1b7eiZ
	 Ds3r0jCPlaD37B4twJClhWvo3IIb9QNPOmdP3yRcrTOTU15pCFAdCFh9IU0SfWKA6B
	 XgXgy4Seq4S4K8GplGSV+4iI+WCHsyKcClQ/vt8ubBgSi3iuyDsAL8WoCO+btwu+6P
	 VPsg5Hy4DmkQ+UMQA+ia/KXsDVzZCSKiB56KyevwFM+I1Lab4n7A60zefN0dN0Rl2c
	 j73ikEoaraBrDfERitRAlJrM/WeisG7F9fiikx6CN2T2fL1qCVy6jy7RgPH8PpnuLL
	 CDLvIcd1X6lXw==
Received: by wens.tw (Postfix, from userid 1000)
	id 764255FF6D; Thu, 25 Dec 2025 18:36:22 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Linus Walleij <linusw@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] ARM: dts: allwinner: Replace status "failed" with "fail"
Date: Thu, 25 Dec 2025 18:36:15 +0800
Message-ID: <20251225103616.3203473-5-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251225103616.3203473-1-wens@kernel.org>
References: <20251225103616.3203473-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251225_023627_023991_758F49F6 
X-CRM114-Status: GOOD (  11.53  )
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

The device tree bindings specify using "fail", not "failed".

Fix up all the ones that are wrong.

Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
 arch/arm/boot/dts/allwinner/sun4i-a10-dserve-dsrv9703c.dts | 2 +-
 arch/arm/boot/dts/allwinner/sun4i-a10-pov-protab2-ips9.dts | 2 +-
 arch/arm/boot/dts/allwinner/sun6i-a31-hummingbird.dts      | 2 +-
 arch/arm/boot/dts/allwinner/sun6i-a31s-primo81.dts         | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/allwinner/sun4i-a10-dserve-dsrv9703c.dts b/arch/arm/boot/dts/allwinner/sun4i-a10-dserve-dsrv9703c.dts
index 63e77c05bfda..f2413ba6a858 100644
--- a/arch/arm/boot/dts/allwinner/sun4i-a10-dserve-dsrv9703c.dts
+++ b/arch/arm/boot/dts/allwinner/sun4i-a10-dserve-dsrv9703c.dts
@@ -112,7 +112,7 @@ axp209: pmic@34 {
 
 &i2c1 {
 	/* pull-ups and devices require AXP209 LDO3 */
-	status = "failed";
+	status = "fail";
 };
 
 &i2c2 {
diff --git a/arch/arm/boot/dts/allwinner/sun4i-a10-pov-protab2-ips9.dts b/arch/arm/boot/dts/allwinner/sun4i-a10-pov-protab2-ips9.dts
index c32596947647..e0c7099015da 100644
--- a/arch/arm/boot/dts/allwinner/sun4i-a10-pov-protab2-ips9.dts
+++ b/arch/arm/boot/dts/allwinner/sun4i-a10-pov-protab2-ips9.dts
@@ -96,7 +96,7 @@ axp209: pmic@34 {
 
 &i2c1 {
 	/* pull-ups and devices require AXP209 LDO3 */
-	status = "failed";
+	status = "fail";
 };
 
 &i2c2 {
diff --git a/arch/arm/boot/dts/allwinner/sun6i-a31-hummingbird.dts b/arch/arm/boot/dts/allwinner/sun6i-a31-hummingbird.dts
index 5bce7a32651e..5dfd36e3a49d 100644
--- a/arch/arm/boot/dts/allwinner/sun6i-a31-hummingbird.dts
+++ b/arch/arm/boot/dts/allwinner/sun6i-a31-hummingbird.dts
@@ -170,7 +170,7 @@ hdmi_out_con: endpoint {
 
 &i2c0 {
 	/* pull-ups and devices require AXP221 DLDO3 */
-	status = "failed";
+	status = "fail";
 };
 
 &i2c1 {
diff --git a/arch/arm/boot/dts/allwinner/sun6i-a31s-primo81.dts b/arch/arm/boot/dts/allwinner/sun6i-a31s-primo81.dts
index b32b70ada7fd..fefd887fbc39 100644
--- a/arch/arm/boot/dts/allwinner/sun6i-a31s-primo81.dts
+++ b/arch/arm/boot/dts/allwinner/sun6i-a31s-primo81.dts
@@ -90,7 +90,7 @@ hdmi_out_con: endpoint {
 
 &i2c0 {
 	/* pull-ups and device VDDIO use AXP221 DLDO3 */
-	status = "failed";
+	status = "fail";
 };
 
 &i2c1 {
-- 
2.47.3


