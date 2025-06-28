Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1847AC7EE39
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Jun 2025 22:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PLFZP/c9fNvh8aFmRu8dwrDO4a59iqD2hrb5gF14geE=; b=Zvd81v/m4O+W7tJAnS+j7U8veo
	+ZS327L1RC0Pv+LNrVF7k1Hpe6gnbJ7mYkc6KOO2mwmOSVJaGUFURcn6Q0B/VzEbWXJkwjoODFl7k
	yx6qEVMWBiXi00pQE0aa/FTF9wovvYjpv3Nv5nOHFnv8eclBeW0gWX09mPIMFSN6V3OrtQMDSlRtz
	RuOOEfgovukkOkwk1spMmepXKQ5z440N/JXcT6zIQMjNf5zZhjdgltDbd8F3F5mbAlJp67gVbfK8e
	X3YQkDLAiIo3xkHixtmlhiupf22tFlWeG2Nkn8Ot+YvvyBJ+BroX7K1QdEuxj7eAZESVUPk3RLZuv
	m+FqvYWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVeLF-0000000HN8t-2qu8;
	Sat, 28 Jun 2025 22:48:13 +0000
Received: from mx4.wp.pl ([212.77.101.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVeCH-0000000HMID-2N55
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Jun 2025 22:38:58 +0000
Received: (wp-smtpd smtp.wp.pl 31775 invoked from network); 29 Jun 2025 00:38:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1751150330; bh=PLFZP/c9fNvh8aFmRu8dwrDO4a59iqD2hrb5gF14geE=;
          h=From:To:Subject;
          b=DA4EkO1km60TxTqeraujBDCqDogUVqwBDW2gBzfS1/Ql17TfWYvX3NRrSTg632jPr
           KRonXKDXCv7MhYi0BwjNpjoSs4DumxQV1TglAgLsh5xFARZbFkEiGrOPvxsCjN0cd1
           D3jBp++nicZwmEJdUarKweJAw8vq4MtasIy4WUMA3pqqFdADD3be4nmj7RBW0KEof7
           iQ27EiYbdton953KwsGw2UHMQx0KNueCnN0aNcXxCUJyChlEhSK1B7PiMovmbHVipL
           xKsOb3ULAMmc2szMwdNtvPxZBs2M3VVp1aU+kmDCKJiKQC0HEjND19uE9dh65AfNkB
           hKD3oZItvq5hA==
Received: from 83.24.145.121.ipv4.supernova.orange.pl (HELO laptop-olek.lan) (olek2@wp.pl@[83.24.145.121])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <rafael@kernel.org>; 29 Jun 2025 00:38:50 +0200
From: Aleksander Jan Bajkowski <olek2@wp.pl>
To: rafael@kernel.org,
	daniel.lezcano@linaro.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	jic23@kernel.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	olek2@wp.pl,
	zhiyong.tao@mediatek.com,
	linux-pm@vger.kernel.org,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 3/3] dt-bindings: iio: adc: Add support for MT7981
Date: Sun, 29 Jun 2025 00:38:37 +0200
Message-Id: <20250628223837.848244-4-olek2@wp.pl>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250628223837.848244-1-olek2@wp.pl>
References: <20250628223837.848244-1-olek2@wp.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-WP-MailID: e666d4a039fb80211d7087c5597d3d6c
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000000 [IZMh]                               
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250628_153857_756952_A1B159BB 
X-CRM114-Status: UNSURE (   8.30  )
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

The temperature sensor in the MT7981 is same as in the MT7986.
Add compatible string for mt7981.

Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
---
 .../devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml b/Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml
index b489c984c1bb..ceb914dde15b 100644
--- a/Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml
@@ -26,6 +26,7 @@ properties:
           - mediatek,mt2712-auxadc
           - mediatek,mt6765-auxadc
           - mediatek,mt7622-auxadc
+          - mediatek,mt7981-auxadc
           - mediatek,mt7986-auxadc
           - mediatek,mt8173-auxadc
       - items:
-- 
2.39.5


