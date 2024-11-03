Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C8D5E6F09F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Nov 2024 13:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FXyL3DypPFSd8TW3PTO+e+7t9NOqRV3fsU3dmjBNp60=; b=k8+e+Roh6QhZUMKA/rXVpPNY+0
	aBKuI/VdkdsZmg5+iN2RUhwHnXt0AbnpULCfv+CojxfD/SD9io6EVpxD1oHEMktMQHLeKTQxQH6K7
	kyTfUa07QKjtnI2lqhqNFthBMNFVLXV4BEsZZKUAzKEezbkDrJ5wdW2pQvZsWcSSZAVOjtAwDqANR
	8q6+MNeLVrDVZVnDAFiFRYSpTHNnlSMkSXjvmcLWvF0EDvxVnDJxiAnQHNWQD8GB9NNoAH7SjJCt3
	4l6OUUi3NaJaAkq4+vVHqtW7nrCodQXgPz43WFmcEXtWVUOKp+xPK9J4GfvRGvGe/0kfHrLqe1rNO
	v/We/1mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7b4w-0000000BVDu-1Nce;
	Sun, 03 Nov 2024 13:55:42 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7b1b-0000000BUlN-40Ez
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Nov 2024 13:52:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=FXyL3DypPFSd8TW3PTO+e+7t9NOqRV3fsU3dmjBNp60=; b=wPjR2JACrGzZdBWXHI+2uj6Y/h
	92Bj7fzA+Ikn2UlxUvPsddwMwKWyV++5ags+iFSmQMcc0UnK6A11945fcZziQyAsZuyBGPshwmsuQ
	OOirA+1fO92NfBKEZTY7zp1EmnPA7Ats3KMoSJkaxjI4J4OFC+oTYLm8pwmSQRU1M6Lej3oR5jh9m
	O3C7dD36SPHFwyHrm9Own8/8cSOn6Cb78hCuy6s9w5xMmLsRAoJI8clUTq92dUj+RhxyIVi4e+q00
	CTYI4b/oCHLW6Vu73uwnzw9AM80e4RUl88j3NUkvYlspz0mnKSeAihINYR9IbApXV4kIf196K48xQ
	rmLgjhEA==;
From: Andreas Kemnade <andreas@kemnade.info>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shawn Guo <shawnguo@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Andreas Kemnade <andreas@kemnade.info>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 1/3] dt-bindings: arm: fsl: add compatible strings for Kobo Clara 2E
Date: Sun,  3 Nov 2024 14:51:59 +0100
Message-Id: <20241103135201.25615-2-andreas@kemnade.info>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241103135201.25615-1-andreas@kemnade.info>
References: <20241103135201.25615-1-andreas@kemnade.info>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241103_055216_004426_31B6F5F9 
X-CRM114-Status: UNSURE (   7.31  )
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

Adds compatible strings for the Kobo Clara 2E eBook reader.
There are two variants differing in the EPD PMIC used.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index b39a7e031177e..a78903076269b 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -620,6 +620,14 @@ properties:
               - kobo,librah2o
           - const: fsl,imx6sll
 
+      - description: i.MX6SLL Kobo Clara 2e Rev. A/B
+        items:
+          - enum:
+              - kobo,clara2e-a
+              - kobo,clara2e-b
+          - const: kobo,clara2e
+          - const: fsl,imx6sll
+
       - description: i.MX6SX based Boards
         items:
           - enum:
-- 
2.39.5


