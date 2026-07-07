Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35333C44501
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 08:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PED1sAAvc+eHIpy2VeGnVjN/Bq6VZc3mcXzSO1CICEs=; b=RXuEebQZSPNVi2dux1D87VuJ4X
	Wc2dzxl1pirX9wa63lVs4FA4huvcfivvH2AMf/N0PDXbOiMrEOWKH4qsYc/AqcWpfsEBoHvg9NR91
	+QjzI/INu4pwE4mufrFIJNiyXFVgFLbCryrkDt+yPiYYWLpOjp4IyKObKZyiyTVNP5mqgn184OOud
	yJoa4JvVvjW31K24teQ9vfT3F/MPGozlblp5n30gAsGE05w260WT5vpiDXSL0uOR+8++QMouiT+gy
	NHp6fofWxPkeTOvIcV8b/0SOmW/S50vPbWtSDT9ePJwsi2yt+VKMu4MAqY83iAZ64ekwdMlu2NUzw
	mfQwl/Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh1az-0000000EY8Y-2J2z;
	Tue, 07 Jul 2026 08:56:01 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh1av-0000000EY6T-1vEv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 08:55:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=PED1sAAvc+eHIpy2VeGnVjN/Bq6VZc3mcXzSO1CICEs=; b=WR34kl40cowjq6IiGcUD86tPPa
	ZVOoisFC9e2IIL35Cv8ZzZW31b26uaFeVaeCXPzLcwxKByDkAUYnNkDUlwoCRcIEXPq4XKvviq6Aw
	TNsDl+fA9Ln2lVIBUhpnwemGBbHS8sLuVEYfEnAh/ystnCF/gJ2VO1aCHV8LjP3E5nr8E7n95JtpU
	SDiquimTne/M9Hp4C6oisB4TA2pZSGeLuoK84ZGdtCVU1UJBsnt7GYUSrRTahr/dCxlH0iGee3vWF
	BPtvt0nVwEE40GXFecWMhBQ7hjPHGOZ/56IV3nRRM8046GcZGubhiU3Eo5nYTB8VnvCKkbh4QN31W
	mB/BB6Yg==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wh1at-000Gjv-15;
	Tue, 07 Jul 2026 10:55:55 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy03.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wh1as-0007hK-1e;
	Tue, 07 Jul 2026 10:55:55 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Feilke <Alexander.Feilke@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH 2/2] arm64: dts: imx91-tqma9131: move ele-reserved memory into 512MB range
Date: Tue,  7 Jul 2026 10:55:43 +0200
Message-ID: <20260707085551.1683462-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260707085551.1683462-1-alexander.stein@ew.tq-group.com>
References: <20260707085551.1683462-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28053/Tue Jul  7 08:24:37 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_015557_495279_8FE687D1 
X-CRM114-Status: GOOD (  10.59  )
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

From: Alexander Feilke <Alexander.Feilke@ew.tq-group.com>

TQMa91 has a 512MiB RAM variant for which the edgelock memory location
exceeds the valid memory area.

Signed-off-by: Alexander Feilke <Alexander.Feilke@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx91-tqma9131.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx91-tqma9131.dtsi b/arch/arm64/boot/dts/freescale/imx91-tqma9131.dtsi
index c99d7bc168483..a8c79731eace5 100644
--- a/arch/arm64/boot/dts/freescale/imx91-tqma9131.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx91-tqma9131.dtsi
@@ -33,9 +33,9 @@ linux,cma {
 		};
 
 		/* EdgeLock secure enclave  */
-		ele_reserved: ele-reserved@a4120000 {
+		ele_reserved: ele-reserved@94120000 {
 			compatible = "shared-dma-pool";
-			reg = <0 0xa4120000 0 0x100000>;
+			reg = <0 0x94120000 0 0x100000>;
 			no-map;
 		};
 	};
-- 
2.54.0


