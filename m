Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9B27CF6BE4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 02:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x2DHeMQkHYMFJhq9X+Pz1ctIzS9G9OE6WfPGhm75v/8=; b=SBk8/TRUTxX2UtR0CERRYl2c0m
	Ne+hfmK1iyteMoC6XLT+REBfhWcBb4kZdMETzd3p/yjWdDzffqupIoHsVwhdqkDyQm4M2pFdIzkrF
	U1I/dHlv7Ao6xZXEWZSKGDIPnULgNk2KnJH5QRAkIMj+mB1fiIRT9NQreeHir14M3Mqfll+7hekKl
	TaL7Jj3yRVf1rIrQ0MUQDXP6NF/USur6Sxt6Olt998aqpbo6zfk3ZuDgGgGNDf/E2MopRh3oCPDPf
	IAAhP2Ryd4ZvVH5nO9byyi2FGrnnXJEqtPJoyB3a+UbuBXhcxUkCbwDWKhscUg9uuAeXvGzjC7mKD
	KSh3DNGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdIzy-0000000E29c-0Veb;
	Wed, 07 Jan 2026 02:10:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdIzw-0000000E28F-2DsU;
	Wed, 07 Jan 2026 02:10:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CAB5E439AD;
	Wed,  7 Jan 2026 02:10:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8883CC116C6;
	Wed,  7 Jan 2026 02:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767751807;
	bh=drRQe3NWFXClnpfXO5Sw+DqmbJPg9S9PQx1y8wKVjHY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=l+M5VrCTEDKLEZ7wvlQIqCFRRUSETN+4aEp6xKWQrymDO3CDHQ9ANQeSnIfqbXAbt
	 HLnMwBvgYy6JmP8mhhpH0MP0Yfyeh3UiIs2a/6qrMLjAsN5rvFlYbcLlLOSlU5FH1S
	 1ojqukJ6hwg5hpIkMbbfr6N68ezkBPMfzVwntrrmjSmKVI7WFSOg+eWgKLdMPoo6BU
	 vTOmIjAWm1aYVt1xwQUsLXcGAjq/rTTn8wwU0HKQwZZm2qrhj6bAaj0NvE8WQAfHx3
	 aXWU2ss+3K7HupmvSS2yq/+66Wter123fjh2wOGnYj+UIN1ai7QOiim+6QN76Qmb2N
	 8tWU+AS8CBfeA==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Tue, 06 Jan 2026 20:09:40 -0600
Subject: [PATCH 01/13] ARM: dts: broadcom: bcm2711: Fix 'simple-bus' node
 names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-dt-dtbs-broadcom-fixes-v1-1-ba45874e4553@kernel.org>
References: <20260106-dt-dtbs-broadcom-fixes-v1-0-ba45874e4553@kernel.org>
In-Reply-To: <20260106-dt-dtbs-broadcom-fixes-v1-0-ba45874e4553@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>
Cc: devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_181008_597555_DCABBD54 
X-CRM114-Status: GOOD (  10.53  )
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

Fix 'simple-bus' node names to follow the defined pattern. Nodes with 'reg'
or 'ranges' addresses should also have a unit-address.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm/boot/dts/broadcom/bcm2711.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm2711.dtsi b/arch/arm/boot/dts/broadcom/bcm2711.dtsi
index c06d9f5e53c8..5e3b4bb39396 100644
--- a/arch/arm/boot/dts/broadcom/bcm2711.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2711.dtsi
@@ -415,7 +415,7 @@ ddc1: i2c@7ef09500 {
 	 * The firmware will find whether the emmc2bus alias is defined, and if
 	 * so, it'll edit the dma-ranges property below accordingly.
 	 */
-	emmc2bus: emmc2bus {
+	emmc2bus: emmc2-bus@fe000000 {
 		compatible = "simple-bus";
 		#address-cells = <2>;
 		#size-cells = <1>;
@@ -542,7 +542,7 @@ l2: l2-cache0 {
 		};
 	};
 
-	scb {
+	scb-bus@fc000000 {
 		compatible = "simple-bus";
 		#address-cells = <2>;
 		#size-cells = <1>;

-- 
2.51.0


