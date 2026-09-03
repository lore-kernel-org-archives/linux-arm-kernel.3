Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFD9EC624D7
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 10:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aMMw1LC24b1qvjWMcBvXy/FqGCBY4vzDOfj4WXxgDWw=; b=gZA/XVhVZRSqrAfi3/u9kSelSs
	/4K/vN9pjoKel4ULSnkDvAaMjhaVCQh7Sys7AkffjBG30A5c+be/er8Ma6mYiuwjjUsegh3sKPcey
	HbPnupOUHvPiJUaoeSEuTabLyGkc9iPeiAdudCiMDx6UU8d1hCZPrBkyrlQL/J05FUQTLGgMNF0gn
	KxRisI3maL+IGJfVVgdyMRdB7WbTHO/GZZmEAUpRrCeRm8ogiN1Q5/OC0E7mbzeS3q/fna4kxmqYp
	L0E1weTA9GisH2TVSvhwWwYlg2AaliIVTJWCLnUNAad/cBOA5PcyakviHnlUL+7/BvZlYYtuTMuQe
	P6hauabQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x24X7-0000000H42n-2gjh;
	Thu, 03 Sep 2026 10:19:01 +0000
Received: from hqu.edu.cn ([210.34.240.11])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x24X2-0000000H41T-46Aa;
	Thu, 03 Sep 2026 10:18:59 +0000
Received: from [127.0.1.1] (unknown [27.42.228.181])
	by cmweb (Coremail) with SMTP id C_Ai0gAXe9qFSZlqyEUHAA--.14896S3;
	Thu, 03 Sep 2026 18:18:49 +0800 (CST)
From: YuChia-Kan <raspberrykan@stu.hqu.edu.cn>
Date: Thu, 03 Sep 2026 18:18:45 +0800
Subject: [PATCH v3 1/2] dt-bindings: arm: amlogic: add Xiaomi Mi Box 4
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-mibox4-dt-v3-1-1a8e395d923c@stu.hqu.edu.cn>
References: <20260903-mibox4-dt-v3-0-1a8e395d923c@stu.hqu.edu.cn>
In-Reply-To: <20260903-mibox4-dt-v3-0-1a8e395d923c@stu.hqu.edu.cn>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 YuChia-Kan <raspberrykan@stu.hqu.edu.cn>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=771;
 i=raspberrykan@stu.hqu.edu.cn; h=from:subject:message-id;
 bh=kzaphFFUobmSgrEhjROTSnnHhHp0e4xJhaI3eW9w61s=;
 b=owEBbQKS/ZANAwAKAZoNcluxItUHAcsmYgBqmUmGQi5mjdVw0EoV3lW436yaywJ3pbNegCGbO
 aJvxgtgVJyJAjMEAAEKAB0WIQTDd02egjFwFlgfDD2aDXJbsSLVBwUCaplJhgAKCRCaDXJbsSLV
 B+VHEACXBlDb5j2aNJZr8ZD+JRzlevf3LCTzBEJ/hzPjZBZA/CO7r3Dl/6QY8ONLKBiKhlnFyRb
 pPeYY/gcWTG2+F2PR3FZHYs+jUVfCH1UvIsjm/14YHbgm8BNdRztBm4PXSFT+knXoLjZb1BsGkN
 z3DAsVqC/Pvdqq8QvIQkcy61+gbW3N4MEcLj0MRgsALjDxw3FH3wE1fIChukwtDcF/g07F6ZaMI
 QZyMWuUrkEBQeMSuxJZSJZS0MXKpjHIn74RFR2/Chttj+YlViuLwaVuvTB/BBb9MAL88yCYzVas
 H8Z6EdnZSiMTkoAnsoxKYDJ/iCKAo2ugA3IIRYn9vkjKXUcHTfrv0f05alj7+8hR/2ByLuxp2jt
 2GL5Mz8ysU1gqnJS7aAfhs4mcXQp83tXBjyOyV6dFXNdYFHFo0mG5VjPsi1rGNgBHmLZhZZeLTd
 ssUIOx7UiQlmrw0iXggh2MqUIKR3Na/Ho+Z+rnRbTGgUnngPxVOZZXRbOlrvYNewi/FRSKjCbqu
 ys0JH01haCWhXcNsgWLhpOQli5mSusCBvsCHzY40bChPnpWYB9GaVUYCv01249yXAjU4K3soZac
 ATTzG5nCQG21akBwHgsYhhkJsebzg8DafNH5KKm0VSPLCUmzL2D2HTIWC1P0yn190EqUJhMkzaG
 dnAqisJPXD37tfg==
X-Developer-Key: i=raspberrykan@stu.hqu.edu.cn; a=openpgp;
 fpr=C3774D9E82317016581F0C3D9A0D725BB122D507
X-CM-TRANSID: C_Ai0gAXe9qFSZlqyEUHAA--.14896S3
X-Coremail-Antispam: 1UD129KBjvdXoW7GryUurykCr1rXry5Jw1fZwb_yoW3JFc_Ga
	yxAa1DuF95tF9YgrZ8ZrZ3KFy5Ja13Crn7Zwn8tFn5A342vrZ8WFZ7K3y3A34xua17u3W8
	uF4xGryqg3Z7GjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbyxYjsxI4VWxJwAYFVCjjxCrM7AC8VAFwI0_Xr0_Wr1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l82xGYIkIc2x26280x7
	IE14v26r18M28IrcIa0xkI8VCY1x0267AKxVWUCVW8JwA2ocxC64kIII0Yj41l84x0c7CE
	w4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6x
	kF7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY
	1x0267AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c
	02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJwAm72CE
	4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7
	CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l
	x2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14
	v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IY
	x2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87
	Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIF
	yTuYvjxU4ksqDUUUU
X-CM-SenderInfo: ysvskiyqsqlko6vw3hxktxhvlgxou0/1tbiAQASBGqYO2MCOAAKsN
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_031857_504814_EF7069C6 
X-CRM114-Status: UNSURE (   6.56  )
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

Add the Xiaomi Mi Box 4 (MDZ-21-AA), based on the Amlogic S905L
SoC, to the list of supported Amlogic boards.

Signed-off-by: YuChia-Kan <raspberrykan@stu.hqu.edu.cn>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 9f73a0054fb2..96e207572d98 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -120,6 +120,7 @@ properties:
         items:
           - enum:
               - amlogic,p271
+              - xiaomi,mibox4
           - const: amlogic,s905l
           - const: amlogic,meson-gxlx
 

-- 
2.53.0


