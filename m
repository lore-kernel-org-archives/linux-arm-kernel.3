Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E093DC83F04
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 21:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iYgWJ8J7BoGFxKck1RjrUitwIQvjD7tq0nYE84HRdJ4=; b=PpujvVuUgnOKrsj5bgufqIuOjg
	FoZSrQs+AgkP3Y3Tlk0wqLWQHRRZ7NDokf6n0qogfELbi9szmvcvT5icGDhnzdSdt2WwqRYKeUg9k
	F1GZ17TuI+zJ7t3srsUqkeio3EN87gO45A1RJ9sbiSVlQQ3j2lB3Cv09VVvlzL5U4lVMyqhuzDFfv
	G+TDdzpdWRwccFbZ/gJ8Gf+620I+1PzEPGU2LfWomacke/E5OzSihd+JFH0r2g1QFzA0aQsqm6DCP
	mjTHMVKuvW5gKDLlSmn/6LAndmsjJDeU0mtVkRlP3bKuxU3JWmY6vfcp0BoazN1zR69HhVqbGefZW
	9y8599+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX5UV-00000009eDa-2Qo8;
	Wed, 02 Jul 2025 21:59:43 +0000
Received: from mx4.wp.pl ([212.77.101.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX5QC-00000009dqE-1Ek9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 21:55:17 +0000
Received: (wp-smtpd smtp.wp.pl 32885 invoked from network); 2 Jul 2025 23:48:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1751492914; bh=iYgWJ8J7BoGFxKck1RjrUitwIQvjD7tq0nYE84HRdJ4=;
          h=From:To:Subject;
          b=kXJookvAoghUWQJckr2S92QLrUOqw6bSmwcRElr8a9q+J5sv11Q+Fnsrg+CLavybB
           jr6rLaP3YmenP/R9z2VDjiLDV2fogADZSTegegBIHEGhvp7p9Poog1qe5EaMUWmFa4
           h9CZDu3ScZCaA/srJCA2dG92hiaIBKO47mFFx0MHvaXoCXKsQXoP07ypCBHD/4QEx2
           JbskowpLQDLbmmP7vKB31A0F3T1/ZmxgIJgIKiguARHWbD+XFfUH4jah2NgPK32Own
           a4QAlSRj9yAjFNIKssonYCo/1RcP9RzMS5dUQF4yjqfWm4a8qKpx7ddQTTlGUj8JxE
           kBRDD5rTg4EYA==
Received: from 83.5.239.54.ipv4.supernova.orange.pl (HELO laptop-olek.lan) (olek2@wp.pl@[83.5.239.54])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <jic23@kernel.org>; 2 Jul 2025 23:48:34 +0200
From: Aleksander Jan Bajkowski <olek2@wp.pl>
To: jic23@kernel.org,
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
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 1/2] dt-bindings: iio: adc: Add support for MT7981
Date: Wed,  2 Jul 2025 23:48:29 +0200
Message-Id: <20250702214830.255898-2-olek2@wp.pl>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250702214830.255898-1-olek2@wp.pl>
References: <20250702214830.255898-1-olek2@wp.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-WP-MailID: 4531e8972fbbdfc366c72f9ccf260a9d
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000000 [4UOh]                               
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_145516_492084_B2CC7C8D 
X-CRM114-Status: UNSURE (   8.95  )
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
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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


