Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84BBFCA5FAC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 11:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N/yuoXxXvt+LufZR9aqFXftO2ShH9MMEilsX2qH7X0g=; b=IoPFsWhwRLCM+7qkOAZZGq3sj3
	vzzQo1yr9pEvtYYXQJ/JaO6wrwT+oAon6SAlvHeJkTdPa/V2aEWnXzkIEjsGLz+R87Vu8f6UoYYZ/
	cdj9u9Kx6jjGrxnchgUG4YPKgdie2lzkIn4sRziNeQ1Gcm6J435yJ9I0zAFhTRSwSThJgDRbuvl9d
	o5iKflK/BkLF0fo5QXUoJNrYrUYaOXlAmmx/o+AM7ko2grJMepIQAYxbqm4NGtUlm6lQT/yeCxRPb
	nt9zfBt0nhsjGom3rHPZKxKU3bXG3MJIEH49h0ldHLHJU+vYDjitlCbVK65kb76PviMq7S9CfsKaD
	aff9+LOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBsVv-00000005sJk-38nh;
	Wed, 30 Sep 2026 11:30:19 +0000
Received: from cp2.siel.si ([46.19.12.180])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBsVm-00000005sG1-1vvJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 11:30:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Unsubscribe-Post:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=N/yuoXxXvt+LufZR9aqFXftO2ShH9MMEilsX2qH7X0g=; b=HjMduRgB/psosPZsG6ptDvUaTv
	P/NHPuWxdECfEVKfaTKtFOQPLKiFzgmTDPnMCPEaWMGpqmCVO/uptfHajPM4Af6KZf4XUvI8ruf1U
	4XwtTWf/zGlaZBtdtASbgv8Q3L1klnEEDwkzu5UrZhkhDA0zBHZh6/Udvgn3CNb7VMSEu6+46aRy0
	qAPDqdET6Dx8asotQ+XISeRsrfZ6YiIqQAxC4tsu3coU3zv6GqkiPpQc4+U8fZZjfe/yDRhqm95YK
	FJJ25vN4aRUFRzb5yQyt9PGP5D3ckJiU6v5CKfCHZx1C15EQV/qUjpl8BomrKAFiEKlpTtgA6Z4GM
	6vQ5uF6w==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:46122 helo=localhost.localdomain)
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <primoz.fiser@norik.com>)
	id 1xBrdt-00000000Z3d-05jf;
	Wed, 30 Sep 2026 12:34:26 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: [PATCH 2/2] ARM: dts: imx6qdl-phytec-mira: Add touchscreen-inverted properties
Date: Wed, 30 Sep 2026 12:34:25 +0200
Message-Id: <20260930103425.2315286-3-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260930103425.2315286-1-primoz.fiser@norik.com>
References: <20260930103425.2315286-1-primoz.fiser@norik.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cp2.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cp2.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cp2.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_043010_679470_1BD4C0E3 
X-CRM114-Status: UNSURE (   6.79  )
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

Since commit 888e5fad9b78 ("Input: stmpe - add axis inversion and
swapping capability") we can handle touchscreen x- and y-axis inversion
directly in the kernel instead of user-space on phyBOARD-Mira-i.MX6.

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
 arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-mira.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-mira.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-mira.dtsi
index a3c2811e9c6f..a7d6af162731 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-mira.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-mira.dtsi
@@ -164,6 +164,8 @@ stmpe: touchctrl@44 {
 
 		touchscreen {
 			compatible = "st,stmpe-ts";
+			touchscreen-inverted-x;
+			touchscreen-inverted-y;
 			st,sample-time = <4>;
 			st,mod-12b = <1>;
 			st,ref-sel = <0>;
-- 
2.34.1


