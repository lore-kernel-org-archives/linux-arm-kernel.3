Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16086D0BB60
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 05:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=De3P7gfjLN5T5chbulrTosl40nd8jPG0zt2xWBDK+f8=; b=i3I+qdGTPhmIzlTNB9X/qcuA9d
	MKdwxZNB8ak3JWxhJywveWC6MW9aC42NttIe1n8PPwR5ZgqnoJhb/lwpZ7Wh0HjljnfuYmhO1/lrm
	Z/6UME1ez+8ZZtao2An7ESfsnpVCjKO/91iM7CqBuo0c5Tc4+cuPdnkMa/lhQJ13td3if0iGgCk9m
	W8YHP2GNSukqa/hmDpYfcpED/bAV3PwnR22UpdnK0IpQ76bxFnpf0yth76eMIb8aUlrEu24/8RKNQ
	Ya2FL4mp4bn667LRfO5perEZbpIEPpkbrjnT31jB4Oo/9th//odjT2J7ufY+ZHvGbZzWFxGXU7ZSI
	0L2Ro3qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3qMD-0000000GnxL-1D6c;
	Thu, 24 Oct 2024 05:26:01 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3qHh-0000000Gn0T-2Uqf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 05:21:23 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49O5LI2T015332;
	Thu, 24 Oct 2024 00:21:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1729747278;
	bh=De3P7gfjLN5T5chbulrTosl40nd8jPG0zt2xWBDK+f8=;
	h=From:Date:Subject:References:In-Reply-To:To:CC;
	b=vM1LOYxwOyAIqZBHIWy3n3dxXIIdpHBn6Eax4MvPhohTxw3liDB3d8DOjsU3j+q1u
	 c/vNdmSjPBzP81y4KeA3Y3T6ng34PnSvZa5UN/0Cil55rk51U2LStJHBySHlJt1qkD
	 o+bW3PUh+1bMZC115nZxLhUSRSN9a4iBSTc0f1oY=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49O5LImN024996;
	Thu, 24 Oct 2024 00:21:18 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 24
 Oct 2024 00:21:17 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 24 Oct 2024 00:21:17 -0500
Received: from [127.0.1.1] (uda0497581.dhcp.ti.com [10.24.68.185])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49O5L4lA090467;
	Thu, 24 Oct 2024 00:21:13 -0500
From: Manorit Chawdhry <m-chawdhry@ti.com>
Date: Thu, 24 Oct 2024 10:50:59 +0530
Subject: [PATCH v6 02/12] arm64: dts: ti: k3-j784s4-j742s2-mcu-wakeup:
 Remove parent nodes bootph-*
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241024-b4-upstream-bootph-all-v6-2-2af90e3a4fe7@ti.com>
References: <20241024-b4-upstream-bootph-all-v6-0-2af90e3a4fe7@ti.com>
In-Reply-To: <20241024-b4-upstream-bootph-all-v6-0-2af90e3a4fe7@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero
 Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Neha Malcom Francis <n-francis@ti.com>,
        Aniket Limaye <a-limaye@ti.com>, Udit Kumar <u-kumar1@ti.com>,
        Beleswar Padhi
	<b-padhi@ti.com>,
        Siddharth Vadapalli <s-vadapalli@ti.com>, Andrew Davis
	<afd@ti.com>,
        Manorit Chawdhry <m-chawdhry@ti.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729747264; l=1611;
 i=m-chawdhry@ti.com; s=20231127; h=from:subject:message-id;
 bh=R0/Qn0zB/Tf81iMF9clZeZqadZUyQ3qlZvNn3CLr8js=;
 b=AWQ5iqxoc/vy/yGqFpanz1at/4o97xaO0tR/7G5Z9y0xZU5Ag3ERuxv8DAe9s7mr0PetspdhI
 kNWd+t/hGyBC0apW4TR+kuZm8WOJ7yDodSVqqJHouevZv0QOmEMO0Xm
X-Developer-Key: i=m-chawdhry@ti.com; a=ed25519;
 pk=fsr6Tm39TvsTgfyfFQLk+nnqIz2sBA1PthfqqfiiYSs=
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_222121_761648_9FA2700F 
X-CRM114-Status: UNSURE (   9.01  )
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

Adding bootph properties on leaf nodes imply that they are applicable to
the parent nodes as well. Bootloaders can derive the parent nodes when
bootph is available in the leaf nodes.

Remove the bootph-* properties from parent nodes as they are redundant.

Reviewed-by: Aniket Limaye <a-limaye@ti.com>
Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>
---

Notes:
    It wasn't existing previously in U-boot but the following patch fixes it [0]
    
    [0]: https://lore.kernel.org/u-boot/20231217163627.2339802-10-sjg@chromium.org/
    
    R-by picked up in v5 ( Aniket )

 arch/arm64/boot/dts/ti/k3-j784s4-j742s2-mcu-wakeup-common.dtsi | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-mcu-wakeup-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-mcu-wakeup-common.dtsi
index 9899da73a905a517a8561f09515aa8303f8d6b5d..46bc2a3e4aea68415f7bb54f401b81e81d45134f 100644
--- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-mcu-wakeup-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-mcu-wakeup-common.dtsi
@@ -7,7 +7,6 @@
 
 &cbass_mcu_wakeup {
 	sms: system-controller@44083000 {
-		bootph-all;
 		compatible = "ti,k2g-sci";
 		ti,host-id = <12>;
 
@@ -39,7 +38,6 @@ k3_reset: reset-controller {
 	};
 
 	wkup_conf: bus@43000000 {
-		bootph-all;
 		compatible = "simple-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -458,7 +456,6 @@ mcu_spi2: spi@40320000 {
 	};
 
 	mcu_navss: bus@28380000 {
-		bootph-all;
 		compatible = "simple-bus";
 		#address-cells = <2>;
 		#size-cells = <2>;

-- 
2.46.0


