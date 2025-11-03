Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B0AACCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 10:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wSLTKZDYBJczR/hcNOPPArvh7dxErG0MtraQAm1J2lo=; b=ut7EqL2e0Y8pRV
	5lsbm273ylNjbxkOK3DZdG72wKQvcgzzvbFKe8f/IP9/eS2LPVYOxG0VD4HQ+D7diE7FPvCDdhlB9
	bbdNV6gcblwpRBuh+DY1CCVjQ1Dzoge7C9zQzCVwxTgSF90FODvpdW23eqrctaAMJYbvqZB/lgJJy
	L19rkuE02hGrSe8FWsORJ+eUpJsuw9EukRibltUMVOevlom1QH1XnWCfjhTaJxfndZc/OdkrxRJ7+
	Ybs6mnr7frplMG+pr+v8MXRJbYRjFnWMV2M4/D0iQutFXHmb1tnO6+SGbeL04lvUQTkv9IrHnYxlN
	RE83kVbj+QjQKv9qBx9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFsAk-00000009fsW-15iI;
	Mon, 03 Nov 2025 10:52:26 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFsAh-00000009fre-3ey9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 10:52:25 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 3 Nov
 2025 18:52:17 +0800
Received: from twmbx02.aspeed.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Mon, 3 Nov 2025 18:52:17 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: <jic23@kernel.org>, <dlechner@baylibre.com>, <nuno.sa@analog.com>,
	<andy@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <joel@jms.id.au>, <andrew@codeconstruct.com.au>,
	<billy_tsai@aspeedtech.com>, <linux-iio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 1/2] dt-bindings: iio: adc: Add AST2700 ADC compatible strings
Date: Mon, 3 Nov 2025 18:52:16 +0800
Message-ID: <20251103105217.1764355-1-billy_tsai@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_025223_911226_FC499EFF 
X-CRM114-Status: UNSURE (   8.08  )
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

Add the compatible strings "aspeed,ast2700-adc0" and "aspeed,ast2700-adc1"
to the binding for the Aspeed ADC. These new compatibles represent the
ADC instances found on the AST2700 SoC, which are similar to the AST2600
but have their trimming data located at different SCU offset.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 .../devicetree/bindings/iio/adc/aspeed,ast2600-adc.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/aspeed,ast2600-adc.yaml b/Documentation/devicetree/bindings/iio/adc/aspeed,ast2600-adc.yaml
index 5c08d8b6e995..509bfb1007c4 100644
--- a/Documentation/devicetree/bindings/iio/adc/aspeed,ast2600-adc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/aspeed,ast2600-adc.yaml
@@ -29,6 +29,8 @@ properties:
     enum:
       - aspeed,ast2600-adc0
       - aspeed,ast2600-adc1
+      - aspeed,ast2700-adc0
+      - aspeed,ast2700-adc1
     description:
       Their trimming data, which is used to calibrate internal reference volage,
       locates in different address of OTP.
-- 
2.25.1


