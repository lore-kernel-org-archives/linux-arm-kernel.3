Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD982CCF9EA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 12:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V7HKby6x/C9fkDMWyfqnZ1+A6LuqyCpy1Ira6XffXwk=; b=J4C29W/Av/w92SWsrDT44OAmTV
	i4ziZkoArnI6VO1ShY3tZMXzH/h3+gW9awjENfmAyYcVVJuapCWTBX5kdryVVdemM9723j1Ln9/2b
	ZhKx5T6aVzjw7W1mgjdj7Kgt76+Ey5POZGDogyOww480y7lmWnWNaTOsBgJOED6EVQXOn1wHZ5hIp
	/bLVaKxeF8wh/pRTVTSPuaGGZAr0uuv3b00F+f+1r5beH2aWJOlo6ZRdcfDAwcGWglmX52ohMFXsM
	YrrW8Zyz1qxNK3f9dtP4ber7tCQrPL+qDmTPcBYof/B8lKPnswIAdt2/BXbRGnmmfNZDernwP1667
	gChBX/Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDMme-0000000Dx1p-31zR;
	Mon, 27 Oct 2025 12:57:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDMmY-0000000Dwxg-0ULi
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 27 Oct 2025 12:57:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=V7HKby6x/C9fkDMWyfqnZ1+A6LuqyCpy1Ira6XffXwk=; b=SJL/gGuuQP3pfeUC5T9YmeOSZ0
	TiXej2gLgJ+0qsKVl6FsibWWMmdJhZAO1IX68o0X/h3andxSpHpvgVvjjMBdwQHzITGkbIVeQp7ar
	LFGZygeyDsCD8G2EVeKK4ndB/PLZ7owi91LP1zvnuMM3GMmrd5dkOQpsnQkjdzMJYoMAnfUj87upE
	qooG8UB9/UJZmuWELMTUco2Jr17wv08BbbPYeJENOIACRTi8pGY4cpQ46zKSaOWnzzXYrkmp/Lmol
	tXgwQDlKz4uiX8YhBlFcMrqtpw7VPYvkAHQLrbX1PbNWTVqeSuKsCnqlFKEZ/+wph89rJOJ3d7Fdx
	m9GB9S4A==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDLul-0000000270S-0mSh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 12:01:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0A340459C4;
	Mon, 27 Oct 2025 12:57:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFBBAC116D0;
	Mon, 27 Oct 2025 12:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761569819;
	bh=C8ZaO/vclhrRJ/sXVWYmHzL2b2GlrrEHt+/9PpUhHqU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SDpZx8JTOCG0wRJg0weXMLzBMOKL3CC40Xm7nOBQYuKbOmthaI+FftWarXiTp+UWn
	 02Kmhs06jxILnPOt44lobvccd9IQfQikm9RdesoQGDQuoYLGutkfPJptcQocV4HPXj
	 NTlCbumL91ih/jBOmL5LHVV8PKoSDkI3EBxPesdU2oRdJeBIkVEDd1ONVbf4Y44uWT
	 M4totbnOLEgSZE8p/1MSXWujDst7x/Xf4ahQL+WX79Z14KRJXYWwZjoBjM4f38z5W4
	 Z+KOZuJSn2xXPoFANLwZBUyrH9EglolNIW7RanbsBNEclZGg5pZ08I/0etAIgDTHfm
	 SrEJx7cPvWsCQ==
Received: by wens.tw (Postfix, from userid 1000)
	id 73D5F5FE34; Mon, 27 Oct 2025 20:56:57 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Mark Brown <broonie@kernel.org>,
	Vinod Koul <vkoul@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-sunxi@lists.linux.dev,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 02/10] ASoC: dt-bindings: allwinner,sun4i-a10-i2s: Add compatible for A523
Date: Mon, 27 Oct 2025 20:56:43 +0800
Message-ID: <20251027125655.793277-3-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251027125655.793277-1-wens@kernel.org>
References: <20251027125655.793277-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_120131_397101_91652153 
X-CRM114-Status: GOOD (  12.13  )
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

As far as the author can tell, based on their respective manuals,
the I2S interface controllers found in the Allwinner A523 SoC is the
same as ones in the R329 SoC.

Add a SoC-specific compatible for it, with a fallback to the R329's
compatible.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
 .../devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml    | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml
index 739114fb6549..ae86cb5f0a74 100644
--- a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml
+++ b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml
@@ -33,7 +33,9 @@ properties:
       - const: allwinner,sun50i-h6-i2s
       - const: allwinner,sun50i-r329-i2s
       - items:
-          - const: allwinner,sun20i-d1-i2s
+          - enum:
+              - allwinner,sun20i-d1-i2s
+              - allwinner,sun55i-a523-i2s
           - const: allwinner,sun50i-r329-i2s
 
   reg:
-- 
2.47.3


