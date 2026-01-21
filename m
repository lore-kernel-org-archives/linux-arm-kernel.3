Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA855C44503
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 08:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bUVTHSFyhpP3KoH2TYsrDt5SMZIodTsOSXs60GNNZeI=; b=INZN4/q0dahwfkFTDqSseLgktW
	vawo3xxKrMqRLWD9t9gakNf7YzrZyPhij1lhR3fsttUiaxDYNdEl0hqnXS+164y9W0ypr0XooNjUm
	0dWr7NCtv2JTNzxmAoSSxz5Qv0/Z+uUSG+5fsn77QLbWjnwh9V4bXj2inqdkyKuG9rkYfTXdsAhpa
	0CKwcDYWzH13BPn4BnI1R/peiXUTqIId/oF53ivWfGOzy4vuje94hJ/sMomcHDU2Tm7h3ktjXGfHL
	QBMnw4fHZDKIKKFgL4bV1APgOB3EfqRWZatEt2wvj/fNJBZiJ7oIqpmiAnC03lpLc5zqfPxgF1IcX
	+Jg26qQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viTyc-000000058FY-2lst;
	Wed, 21 Jan 2026 08:54:10 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viTya-000000058Dx-1Ghi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 08:54:09 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4AEA010ED29;
	Wed, 21 Jan 2026 09:54:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1768985642; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=bUVTHSFyhpP3KoH2TYsrDt5SMZIodTsOSXs60GNNZeI=;
	b=OO/uCmha/RdjT+PvfzcKCVNGzrlnS3l/vmqC3xZ3ro7B/zGqyk7qn03skq2YOHj/KDl5xT
	fNBpQv4GeuSa7NsTttmlr86GqDGzwhYwyug0dJ1BWuJMsneEPLOB0pEtooXQSN2zj6/KT8
	xeTPYqp6Yd2VdjHPyA+VPJSGS1MjspAC87QMs5MOZ08vEqzawVAAivtF5CvHxAuGq+jgln
	c0kMKH2rdt2MtgGMlH8+77ZWzd3WyREwT0I5kBcXsbOM0gVTbyHzT3oa17qz3gDwUPoYPt
	Z+hTkxBnTig/qWwP0zm/f00ReBRPDly8L8kshGZsh1rTwyM5PUqAa00ywApAsQ==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Amelie Delaunay <amelie.delaunay@foss.st.com>,
	Christoph Niedermaier <cniedermaier@dh-electronics.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Raphael Gallais-Pou <rgallaispou@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	kernel@dh-electronics.com,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 2/3] dt-bindings: display/lvds-codec: Document OnSemi FIN3385
Date: Wed, 21 Jan 2026 09:53:20 +0100
Message-ID: <20260121085347.10368-2-marex@nabladev.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260121085347.10368-1-marex@nabladev.com>
References: <20260121085347.10368-1-marex@nabladev.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_005408_540846_A24ED620 
X-CRM114-Status: UNSURE (   9.64  )
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

Add compatible string for OnSemi FIN3385, a FlatLink LVDS transmitter.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Amelie Delaunay <amelie.delaunay@foss.st.com>
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Raphael Gallais-Pou <rgallaispou@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
---
 Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
index 4f7d3e9cf0c22..4f52e35d02537 100644
--- a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
@@ -33,6 +33,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - onnn,fin3385  # OnSemi FIN3385
               - ti,ds90c185   # For the TI DS90C185 FPD-Link Serializer
               - ti,ds90c187   # For the TI DS90C187 FPD-Link Serializer
               - ti,sn75lvds83 # For the TI SN75LVDS83 FlatLink transmitter
-- 
2.51.0


