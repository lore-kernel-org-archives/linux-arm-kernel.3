Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4637DC982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 13:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WN+joA1OiUPoVxAphJE66URrNgSPkKdWnU0AiHGppso=; b=WlDzWz4EMuJs0uz30BJugPA40B
	nGtEj2f86xRKazuyVWGGRIuUHcUUfJN5ti0fHQ0vNEGDwZfpWjrnKQGqL07rDrOq9DEAFeA7jcPH7
	aqrW8NpPsOSdDrqRZWBqFeliRmZ78A2USD09tPeTPUcalIYDvOWvU3eAFIbWcnUFSnvGKnJl+IfxW
	C7uUE9CJkS3O/JCkctZQ0O2wNY+vjCdQiHBw2D/hFQLiEIsCxe2Wp+N2jHU4jjAtl4rNhtbjiV+0i
	31XZekpPtF68US1RcMMVv1JyIXhoZdSlj1XQOCw5qtMocBJHq8KiKQlM1PUlcz7fYWAK0DHnKVhBS
	2Ndvpy+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x90g9-00000005Y1w-2aDR;
	Tue, 22 Sep 2026 13:37:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x90g7-00000005Y1T-3ZAB
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Sep 2026 13:37:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=WN+joA1OiUPoVxAphJE66URrNgSPkKdWnU0AiHGppso=; b=EG60r6ar3r7HocSDfXIs+Dlprg
	7O5ngpKOmTy7QfteA/fhemPAjaAsFw+K5JaYHZ2vN38FVWdJRRDqhv2kgqOfgpA08cGGUkKNGdy+V
	NrkCm6yS1xxuktP9ZM97ZxMwpS91LeUnpXhoIqgeXcrCBJgxzN6MHBCtSq7wiYg9hdCd5mgbl+1pT
	6+A4INFHAQ6vzB/fgkcwdk5Jxb4q0oP+2O8Unq+VFmUF8Ngi+BhvvPOIaVosFnPv8znNasPCYsUpq
	W4tS43ibThlmekZXCtXa5u47INoG/poQ84WGui7p5fHsp+2YVORtyzFWywvt6+qdISmHda3Xf2jAQ
	4FMCXPVg==;
Received: from out-215.mta1.migadu.com ([2001:41d0:203:375::d7] helo=mta1.migadu.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x90g4-0000000DdUv-1UfE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 13:36:58 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=KPcw/ZopzzaYRfLPPDrflpmk4QBwx4LnGR3aDrupdxo=;
 c=simple/simple; d=cknow-tech.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790084212; v=1; x=1790689012;
 b=mytQzUPChl6RI9SOMaciZMYxfL7vGNIqfMcK8xQc58dqszJENvDv0x7/OPaQJ7pL7SOP5eHF
 5/MZLfGt/4weXmHx91dLkS9hF0jbh49Zr1qVCS9zP+Dnm7PrfxkJodFf9gq0WgGgh6TBHRbuduq
 ViD338zM3jRxwngvRJ21Jxf3rH8S0HoqUXNweGygvoJh4RgjUzTHF1oRcYN92uko7wFv3AEhl+C
 6LwvLJ0OMPgsX0nhEAK0FLXm3NCcNHB9L0EDpaFHMNkk2CQaqQU11NZlCqjBwE7afd9oijbCr6q
 FXX7SXAe5M28NPEhXcmNlH0Ex+vDvPmwRwZTKOCF/x7zg==
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id f43a4edae3204aa3;
	Tue, 22 Sep 2026 13:36:52 +0000
X-Mizu-Trace-ID: f43a4edae3204aa3
X-Migadu-Flow: FLOW_OUT
From: Diederik de Haas <diederik@cknow-tech.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: =?UTF-8?q?Rapha=C3=ABl=20Jakse?= <raphael.kernel@jakse.fr>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Diederik de Haas <diederik@cknow-tech.com>
Subject: [PATCH] arm64: dts: rockchip: Add supplies for es8316 on RockPro64
Date: Tue, 22 Sep 2026 15:36:22 +0200
Message-ID: <20260922133643.2730265-1-diederik@cknow-tech.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_143656_656694_C5D233ED 
X-CRM114-Status: UNSURE (   9.28  )
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

The DT binding for the es8316 got 4 power supplies added in commit
e9966d450b46 ("ASoC: dt-bindings: es8316: Add regulator supplies")

Page 28 of the schematic for both RockPro64 V2.0 as V2.1 describe those
various supplies, so add them to the DTS's.

Signed-off-by: Diederik de Haas <diederik@cknow-tech.com>
---
 arch/arm64/boot/dts/rockchip/rk3399-rockpro64-v2.dts | 4 ++++
 arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dts    | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-rockpro64-v2.dts b/arch/arm64/boot/dts/rockchip/rk3399-rockpro64-v2.dts
index 883d9bcfe792..37124ad548cf 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-rockpro64-v2.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-rockpro64-v2.dts
@@ -19,6 +19,10 @@ es8316: codec@10 {
 		reg = <0x10>;
 		clocks = <&cru SCLK_I2S_8CH_OUT>;
 		clock-names = "mclk";
+		avdd-supply = <&vcca3v0_codec>;
+		cpvdd-supply = <&vcca1v8_codec>;
+		dvdd-supply = <&vcca1v8_codec>;
+		pvdd-supply = <&vcc_3v0>;
 		#sound-dai-cells = <0>;
 
 		port {
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dts b/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dts
index ae3ee91dba2f..144988515c62 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dts
@@ -19,6 +19,10 @@ es8316: codec@11 {
 		reg = <0x11>;
 		clocks = <&cru SCLK_I2S_8CH_OUT>;
 		clock-names = "mclk";
+		avdd-supply = <&vcca3v0_codec>;
+		cpvdd-supply = <&vcca1v8_codec>;
+		dvdd-supply = <&vcca1v8_codec>;
+		pvdd-supply = <&vcc_3v0>;
 		#sound-dai-cells = <0>;
 
 		port {
-- 
2.55.0


