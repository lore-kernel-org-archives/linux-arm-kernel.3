Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 288C6C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 07:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aMMw1LC24b1qvjWMcBvXy/FqGCBY4vzDOfj4WXxgDWw=; b=VoOvKeqG11mfatwYnVLhOm8EL7
	qTfPsVa1W3WCbu3BXlPG83l3pym7jWFT+zOUUC5989eZYGLj8y2CJanf7SVXXYiHeQtzAUbcyb+wU
	FstBn9vXEi5zaApT0bcPWyi49MfOs4o8h6qMH4QvVIm8iYKwdHV3aEUTWLGn55NhSfcoEvIi8GQn9
	Gv5RZOIoAQ8CMMo2T1R3n1CUrP+7Mei9xVkvEccF37H7zIctxO97xjuheFsEfE8nqmldAYY7tShsr
	V+w0MDDtrCGgE4ADo+O1S3pKnbvKItbcnO8dMJD5iaAHFcpfeqz761bnfQrpMH2ricFHr/FD9wuli
	d/l4Um6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x21ac-0000000GX2i-38Z5;
	Thu, 03 Sep 2026 07:10:30 +0000
Received: from hqu.edu.cn ([210.34.240.11])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x21aY-0000000GWyz-2RTk;
	Thu, 03 Sep 2026 07:10:25 +0000
Received: from [127.0.1.1] (unknown [27.42.228.181])
	by cmweb (Coremail) with SMTP id C_Ai0gD3WtpGHZlqUQYHAA--.14782S3;
	Thu, 03 Sep 2026 15:10:01 +0800 (CST)
From: YuChia-Kan <raspberrykan@stu.hqu.edu.cn>
Date: Thu, 03 Sep 2026 15:09:54 +0800
Subject: [PATCH 1/2] dt-bindings: arm: amlogic: add Xiaomi Mi Box 4
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-mibox4-dt-v1-1-f29f1e828ca3@stu.hqu.edu.cn>
References: <20260903-mibox4-dt-v1-0-f29f1e828ca3@stu.hqu.edu.cn>
In-Reply-To: <20260903-mibox4-dt-v1-0-f29f1e828ca3@stu.hqu.edu.cn>
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
 b=owEBbQKS/ZANAwAKAZoNcluxItUHAcsmYgBqmR1Hkh01cUEP+VKy7kBwlGhOZClOR748koflm
 m6ENovs0O6JAjMEAAEKAB0WIQTDd02egjFwFlgfDD2aDXJbsSLVBwUCapkdRwAKCRCaDXJbsSLV
 BwiqEACW8EBPaN6mO3vJNaEz0CeCsOiit5fDRy4EnauaYenGrEY5WdZG/HE+yzAGmgDIZHFFkNz
 qfgGNrGbIHqILOZN2EVy7KsVUX7KdGFsJjofkcc7X2C2CJqZU+d5RU2YPWCM3H8Fm4eQsmwXGRK
 PC1i6qK+mSZ4JoTZMmoxi1HUjHQfm085m948/u8ae3AgFxMXoF4fZM+WvlwuVqs8MELwnlceFt5
 H4U0htTTcd2aKdhXu3LUwbnacgsm7MuNCWDIOsBqVpSTvIJXN1iXWGCUBNEsFMtHlglDos4EICg
 s92Ary7roibJBroUXtQ5yqny6xxZ1oTs6x7SF//5BHxMtU8kHqRvGFUmE8WWotHGjbOUn66Ngma
 awxnMCDbYR/p88cE85CMJIl13Ts334ymN/pmg11FLe8kv+t5lyEw6UhKgKtCCIltMv77VpxH0FM
 dA6N0mMpp5xENf29oZRQ9xfsg2uLEF4vkRJblHyLGxp39anhw5m2ZY9N8UZ12gAeo6lnDCH+OxO
 CNHw9NOqINZW/NUvKFHgsBBfOUdkX+3etCq7PXcjcoc1Qc8nCoNyVnDHk0ty5V0ixSM11I890kt
 TNUgWbW3pGommqwytAfEAdOUx1EWNHNpRZOXBNtwAp/sBdJQ6LSj7LHjJ37EpxPxOJ7SuQKI1i9
 qJNkOhx7eJBEoOw==
X-Developer-Key: i=raspberrykan@stu.hqu.edu.cn; a=openpgp;
 fpr=C3774D9E82317016581F0C3D9A0D725BB122D507
X-CM-TRANSID: C_Ai0gD3WtpGHZlqUQYHAA--.14782S3
X-Coremail-Antispam: 1UD129KBjvdXoW7GryUurykCr1rXry5Jw1fZwb_yoW3JFc_Ga
	yxAa1DuF95tF9YgrZ8ZrZ3KFy5Ja13Crn7Zwn8tFn5A342vrZ8WFZ7K3y3A34xua17u3W8
	uF4xGryqg3Z7GjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbk8FF20E14v26ryj6rWUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUGwA2048vs2IY02
	0Ec7CjxVAFwI0_JFI_Gr1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
	x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x0267AKxVW8JVW8Jr1le2I2
	62IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcV
	AFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG
	0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI
	1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_
	Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17
	CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0
	I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I
	8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73
	UjIFyTuYvjfU0ksgUUUUU
X-CM-SenderInfo: ysvskiyqsqlko6vw3hxktxhvlgxou0/1tbiAQASBGqYO2MCFAABsq
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_001023_103707_34BB8AEA 
X-CRM114-Status: UNSURE (   6.64  )
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


