Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FBF5F47CA9
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 18:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IHW6n2hUHxLvs0sr4FpK9XY9GiMrXVjYo3Lx7EQPaKU=; b=HuE76VN7uhgSNVsOb3tO45iLzw
	yFC4gjWC2ZzHeyAqaaOY/0h1asJxD8LLqORkmy61gRlXlIJU5rUp1TKdVTe8GCQzZps2FXXB6crV1
	va3x+kftUyaWBxUXIW1stuPEJzmiTLFQwjNKB2cJn3saSAhw7FOTnbUOM7kpNK1rIPtArz79tyg4i
	eoqWBHWbbJT0JDeixeLQ7F71Ff5hMKeQU4f7+iJv6bo5VM0F928BM2QENvCKK0uSc2Qhqfv9ujW3l
	07LwNa0kp6vAJdAW57j3hcRIAqyJPcnikx5nb2kkQvE3puXEMVxxvqvmIxsuoT4tj7IK91UFWAxVu
	2grb845g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyD7q-00000002LPT-14rG;
	Thu, 05 Mar 2026 18:08:42 +0000
Received: from mail.hugovil.com ([162.243.120.170])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyD7n-00000002LNb-2GAF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 18:08:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Cc:To
	:From:subject:date:message-id:reply-to;
	bh=IHW6n2hUHxLvs0sr4FpK9XY9GiMrXVjYo3Lx7EQPaKU=; b=uy0z1oIzRapkLtTHutr81LzUzS
	7GkEVkblCvTnPUGjWM82B0GkkvVkexOSvg661mVU9FuoP/HRJobgL2o/Zj305wb/zbXy42ODiewCo
	73HRxt0zevM5Rpz1lZ61uAAVwM2UhFEKeZlF4NujLECv134SbX8VWYyXpW9g5sHIYTB8=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:37706 helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1vyD7a-0002aR-N6; Thu, 05 Mar 2026 13:08:27 -0500
From: Hugo Villeneuve <hugo@hugovil.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	shawnguo@kernel.org,
	laurent.pinchart+renesas@ideasonboard.com,
	antonin.godard@bootlin.com
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	hugo@hugovil.com,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Date: Thu,  5 Mar 2026 13:06:19 -0500
Message-ID: <20260305180651.1827087-5-hugo@hugovil.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260305180651.1827087-1-hugo@hugovil.com>
References: <20260305180651.1827087-1-hugo@hugovil.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 70.80.174.168
X-SA-Exim-Mail-From: hugo@hugovil.com
Subject: [PATCH v2 04/15] dt-bindings: arm: fsl: change incorrect VAR-SOM-MX6UL references
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_100839_670356_160786B5 
X-CRM114-Status: GOOD (  13.19  )
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

From: Hugo Villeneuve <hvilleneuve@dimonoff.com>

There is no Variscite module named VAR-SOM-MX6UL, but there is VAR-SOM-MX6
and also VAR-SOM-6UL, so it is confusing at first to know to which one it
refers to. The imx6ul-var-som* dts/dtsi supports only the VAR-SOM-6UL [1],
not VAR-SOM-MX6 [2], so modify comments and model descriptions accordingly.

Link  https://dev.variscite.com/var-som-6ul [1]
Link: https://dev.variscite.com/var-som-mx6 [2]

Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 5716d701292cf..99dc1b3f1ba92 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -688,7 +688,7 @@ properties:
           - const: phytec,imx6ul-pcl063   # PHYTEC phyCORE-i.MX 6UL
           - const: fsl,imx6ul
 
-      - description: i.MX6UL Variscite VAR-SOM-MX6 Boards
+      - description: i.MX6UL Variscite VAR-SOM-6UL Boards
         items:
           - const: variscite,mx6ulconcerto
           - const: variscite,var-som-imx6ul
-- 
2.47.3


