Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8A21109C047
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 10:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FIPVIV78mcPXCWI+snRzRhq2lmfKelz3dfbhHMY/cbw=; b=WiFPR2OUfx/kugxtDdDaATbGRu
	hmppq8HjXqlyHNzqpJ0eGnL4GGGOwaTwklN8hM+8UyHSMhIlkHzKJHtGvNFSUtodr2r10ClzQU0Ao
	gfHD0HKXTbVsKjGQRojhjaDTchlQ9EzV/OCOQaKPubnjwgk7wnS4IJsdnxyZLKbMiEw7DUbk64+v4
	Lk3otcChuJfvIP9ltIL7GmOJKlz2CLBUc7fEYBBUKDtIj4AFSIFfSvqPIe1WOrz8mC7PhGpwT5utu
	30g8BC/FS9O3eDX8srw2nQoVEF84nEU101gqyH6GvWcCeT2fs7BDead3nfcmlKCZAkNUYHovUtZYl
	Ll45Yg/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5hXf-00000005D55-40hO;
	Thu, 26 Mar 2026 10:02:21 +0000
Received: from courrier.aliel.fr ([2a01:4f9:c011:1c83::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5hXV-00000005Ctr-1KKF;
	Thu, 26 Mar 2026 10:02:12 +0000
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1774519321;
	bh=8apLdFhoD4vPkZsF8pFnZT7USC4F7DHlGuLZA7dK+9U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=nNa6BQFrKg68T3j1XqNspb2BbEY654OMwGFIyqnNGLYraJYE6NC3QK07oeLZBOk4p
	 AUCZYNuUrMcLpJ4UXZ/5WKVrfl4W3yUFIrQ30vbdB4TTVjbfamkU/m0oqM5XspkwW1
	 b7NTZGzl5BwV/suPG1H3teV5oBehIuGFvgXfIYb0=
Date: Thu, 26 Mar 2026 10:59:19 +0100
Subject: [PATCH v5 8/9] dt-bindings: net: wireless: brcm: Add compatible
 for bcm43752
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-add-emmc-t7-vim4-v5-8-d3f182b48e9d@aliel.fr>
References: <20260326-add-emmc-t7-vim4-v5-0-d3f182b48e9d@aliel.fr>
In-Reply-To: <20260326-add-emmc-t7-vim4-v5-0-d3f182b48e9d@aliel.fr>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Johannes Berg <johannes@sipsolutions.net>, van Spriel <arend@broadcom.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mmc@vger.kernel.org, linux-wireless@vger.kernel.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openssh-sha256; t=1774519313; l=959;
 i=linux-kernel-dev@aliel.fr; s=id_ed25519; h=from:subject:message-id;
 bh=8apLdFhoD4vPkZsF8pFnZT7USC4F7DHlGuLZA7dK+9U=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgMGec55oxeeisqykQiUedekMYyOnR9
 BG9E/7rDWyqdNoAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QBLFyxO/wxFv5Y/BfHp2yjE9UwyAFHcUDkMzX1CwZXhVTGTFGomVSyER2crjpZbdHOiccgap3ru
 7GwWJINbd+gc=
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openssh;
 fpr=SHA256:kch4osYZ6A1BrPps5AUs6KnfdE2wm4ocMtyTc8TmZMs
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_030209_517281_F93F51BF 
X-CRM114-Status: UNSURE (   6.00  )
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

Add bcm43752 compatible with its bcm4329 compatible fallback.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 Documentation/devicetree/bindings/net/wireless/brcm,bcm4329-fmac.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/brcm,bcm4329-fmac.yaml b/Documentation/devicetree/bindings/net/wireless/brcm,bcm4329-fmac.yaml
index 3be7576787644..81fd3e37452a6 100644
--- a/Documentation/devicetree/bindings/net/wireless/brcm,bcm4329-fmac.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/brcm,bcm4329-fmac.yaml
@@ -42,6 +42,7 @@ properties:
               - brcm,bcm4356-fmac
               - brcm,bcm4359-fmac
               - brcm,bcm4366-fmac
+              - brcm,bcm43752-fmac
               - cypress,cyw4373-fmac
               - cypress,cyw43012-fmac
               - infineon,cyw43439-fmac

-- 
2.49.0


