Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F060CC79F87
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 13:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:Cc:
	To:In-Reply-To:Message-Id:Content-Transfer-Encoding:MIME-Version:Subject:Date
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ukFyJA2bnZLKQHQ+ERbbiI0cemZyoez6KNrxnVy56rw=; b=c47v4OrCbPAexS7lyVXzKqNKiV
	+ijvQxHLbZx0zknE0Hr55/nesk3WMjZbiW0PhWF75TWqYkymscxIJlMV3JvBWjP/56PSeU1qj17B8
	ReluyYuVXK9jOyaMx55xsmC/c3E+4cjVRFznGv1pAHPLAlfSr8dbL1ZRIWUf4XptVM8IgDmugb8ds
	Tq13lD3I4+CDkV8kcXOQPnyKBkfsccfGIt0hy/WBjTN/tvoHT/eyY9mfVZDC/IxZWGUUVuSa4T/sM
	wivxQQq7KE0MYS4ScnOJuvvkBplsg97Snsay7lXerK1rTN/YGeKhGsU9msPw5bjAqIOgQzMHJ2ePn
	qBERk+lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Tx6-00000002A7G-2CDf;
	Fri, 04 Sep 2026 13:27:32 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Twt-000000029vY-23P1;
	Fri, 04 Sep 2026 13:27:23 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260904132717euoutp012c7b4674805bb19e6746e50fe58079d1~SISM8kdHy0653406534euoutp01M;
	Fri,  4 Sep 2026 13:27:17 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260904132717euoutp012c7b4674805bb19e6746e50fe58079d1~SISM8kdHy0653406534euoutp01M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1788528437;
	bh=ukFyJA2bnZLKQHQ+ERbbiI0cemZyoez6KNrxnVy56rw=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=qMmJKpN6TjAp/juab02jM1KTlGWti6fY+NrGcV+OKBdLQQYR+Q/uwprhpmEcSrXhy
	 WkBGOp/Zask88XJPXaRP1K450L/GSGhZx2H5MSI5i6SXM4Ewae1/DeMyu3rLxPL0wz
	 tm9D7bg6FqiicOHjTxk+4fl4SHhyrXnJ7sEBgwOM=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260904132716eucas1p2d093509db255e62e6bd546e734f04e63~SISMQznPq1881718817eucas1p2J;
	Fri,  4 Sep 2026 13:27:16 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260904132714eusmtip1720dac48c4118971f7561d919114fbcf~SISKMfiTI1303913039eusmtip1Q;
	Fri,  4 Sep 2026 13:27:14 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Fri, 04 Sep 2026 15:27:05 +0200
Subject: [PATCH v3 04/19] dt-bindings: soc: starfive: Add
 starfive,jh7110-vout-syscon
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-jh7110-clean-send-v3-4-484f9ae72715@samsung.com>
In-Reply-To: <20260904-jh7110-clean-send-v3-0-484f9ae72715@samsung.com>
To: Vinod Koul <vkoul@kernel.org>,  Neil Armstrong
	<neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,  Krzysztof
	Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>, Andrzej
	Hajda <andrzej.hajda@intel.com>,  Robert Foss <rfoss@kernel.org>,  Laurent
	Pinchart <Laurent.pinchart@ideasonboard.com>,  Jonas Karlman
	<jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,  Luca Ceresoli
	<luca.ceresoli@bootlin.com>, David Airlie <airlied@gmail.com>,  Simona
	Vetter <simona@ffwll.ch>,  Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,  Lee Jones <lee@kernel.org>, Andy
	Yan <andy.yan@rock-chips.com>,  Philipp Zabel <p.zabel@pengutronix.de>, 
	Emil Renner Berthing <kernel@esmil.dk>,  Hal Feng
	<hal.feng@starfivetech.com>,  Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,  Heiko
	Stuebner <heiko@sntech.de>, Conor Dooley <conor@kernel.org>,  Paul Walmsley
	<pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,  Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,  Dominique
	Belhachemi <db@domibel.de>, Brian Masney <bmasney+clk@redhat.com>,  Jerome
	Brunet <jbrunet+clk@baylibre.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	mfd@lists.linux.dev, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-riscv@lists.infradead.org, Andy Yan <andyshrk@163.com>,  Marek
	Szyprowski <m.szyprowski@samsung.com>,  Maud Spierings
	<maud_spierings@murena.io>,  Graham Markall <hello@big-grey.co.uk>,  Icenowy
	Zheng <zhengxingda@iscas.ac.cn>,  Michal Wilczynski
	<m.wilczynski@samsung.com>
X-Mailer: b4 0.15-dev
X-CMS-MailID: 20260904132716eucas1p2d093509db255e62e6bd546e734f04e63
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260904132716eucas1p2d093509db255e62e6bd546e734f04e63
X-EPHeader: CA
X-CMS-RootMailID: 20260904132716eucas1p2d093509db255e62e6bd546e734f04e63
References: <20260904-jh7110-clean-send-v3-0-484f9ae72715@samsung.com>
	<CGME20260904132716eucas1p2d093509db255e62e6bd546e734f04e63@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_062719_792390_52E7BB7B 
X-CRM114-Status: GOOD (  10.47  )
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

The video output subsystem has its own system controller, documented as
dom_vout_syscon. Among other things it holds the mux that selects which
DC8200 output drives the HDMI transmitter, so the HDMI controller needs
to reach it.

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 .../devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml    | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml b/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
index 0039319e91fe6e6aadc4300114626348e4dfb7ce..47334f6c1243c9950e6fba44daacd41f42b55781 100644
--- a/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
+++ b/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
@@ -24,6 +24,7 @@ properties:
           - enum:
               - starfive,jh7110-aon-syscon
               - starfive,jh7110-stg-syscon
+              - starfive,jh7110-vout-syscon
           - const: syscon
 
   reg:
@@ -90,4 +91,9 @@ examples:
         #power-domain-cells = <1>;
     };
 
+    syscon@295b0000 {
+        compatible = "starfive,jh7110-vout-syscon", "syscon";
+        reg = <0x295b0000 0x10000>;
+    };
+
 ...

-- 
2.34.1


