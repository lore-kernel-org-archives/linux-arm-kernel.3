Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D8ECC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 00:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DJktGawaJYhlbnSWWOOAVHS+glOjPvUG5E+8dfaIwvw=; b=ALQ89bhAHt9JK30Wlbhlth1dwr
	B/ZYtt73nkrNYZMH4ZTzFfYm3nCoVtRmYBz3Tr1MjrZKcZ3xgnzCpoMfkEOafCPLX9wPGVYL67k51
	n9WtgTMJTsiVgCz5LxemkkzeeFm7hbpGxH8b0McXBVxi3iCBk/FfILrKI8NMDVY9NcwL89aDm9H6G
	l8Q8UGxvynu4jm9ZvI/N38ylU2WhGCP34IPsBC1tSsMwZeAYnYTYs2IBo/qTN4vIrnyKg4D99wiMO
	FpERO7WaOzYg7WPYJObQ6nqbeVXF/E3Besw/xrbNIl9iL3VTshpW9szzDjZy0e0w6oLQO+LHe8dZV
	Ggy9gB3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOQ9M-00000003Avx-1hyU;
	Mon, 09 Jun 2025 00:14:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOPur-00000003ABx-0ulc
	for linux-arm-kernel@bombadil.infradead.org;
	Sun, 08 Jun 2025 23:59:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=DJktGawaJYhlbnSWWOOAVHS+glOjPvUG5E+8dfaIwvw=; b=k+Wv4YRQh8FBZQ9aiI+dAJQf/K
	d0u2qF3tb1IZoryzWRgxZK3L7qReP79ScHSDq7EOHlkXwX2bW9ppOIqYQ+774MZlsfPYMO0GWo74L
	byNjMRxAr6gTL4eBgNo8z11ti72SUIvAvpiJA5lcHQ1nBUhIAl6/BHJkU3LlrlxueICgdLYU5npEj
	UAp4eHGNZg15mfO27HH/RNVoXW8CCj1ragmGg9iU8I4Zbu+IL6tEeZnIk+k1OiXOHFOhfp7UNQqvx
	jGcFXxSmTwFuM5x35h8X4aw+Klo2XEHb4NDwOZhGT+pt6qZG7c3UxSlpwVI4eX9untCLQfC6DYEiV
	FMtbPdww==;
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOPuo-00000001YlB-47A8
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Jun 2025 23:59:04 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 29B9519C9;
	Mon,  9 Jun 2025 01:58:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1749427135;
	bh=X19aP6Ck2PmPUz94aODYkmGiygQMNyXIY87Co/9lTu8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=azrZvATSRLCF+H2f5jzrgVaQ0uBpMdU1qKQusuYTUn49juzrTI0AgS1Hc8UQwVof/
	 XTAvIr3ts4IAcjE3fjKpaRjubmWRaLjnCOqX4MP/xRoDh6CdI6/cK03RD0Pem5ELKn
	 XilqGGEkK+0jnn1JrnDFk4ptsF0XOf3cVJx7t7qo=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Isaac Scott <isaac.scott@ideasonboard.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 6/8] dt-bindings: media: nxp,imx-mipi-csi2: Add fsl,num-channels property
Date: Mon,  9 Jun 2025 02:58:38 +0300
Message-ID: <20250608235840.23871-7-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250608235840.23871-1-laurent.pinchart@ideasonboard.com>
References: <20250608235840.23871-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_005903_201974_A8A52BF7 
X-CRM114-Status: UNSURE (   7.72  )
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

The CSI-2 receiver can be instantiated with up to four output channels.
This is an integration-specific property, specify the number of
instantiated channels through a new fsl,num-channels property. The
property is optional, and defaults to 1 as only one channel is currently
supported by drivers.

The only known SoC to have more than one channel is the i.MX8MP. As the
binding examples do not cover that SoC, don't update them.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../devicetree/bindings/media/nxp,imx-mipi-csi2.yaml       | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
index db4889bf881e..41ad5b84eaeb 100644
--- a/Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
+++ b/Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
@@ -68,6 +68,13 @@ properties:
     default: 166000000
     deprecated: true
 
+  fsl,num-channels:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Number of output channels
+    minimum: 1
+    maximum: 4
+    default: 1
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
-- 
Regards,

Laurent Pinchart


