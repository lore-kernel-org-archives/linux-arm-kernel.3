Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38E11CD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 10:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qDRxQkDh59yrFta7WYo63tMmQrTE8dc3M19ZI2IlDYU=; b=eyoJP3uBF8LHrLlX8kBNx1XyIk
	m75kVlcdR6NvrTp+TvEumOmXWBdED/rSP+sxiuSx9FG0i7Xz8fFmzvw7EhDRWd+3nbQFVBX8M124E
	pCa0+GFZKpkzqRGZUMxkOAWH6OPu7r+2CnbGawxexqC9lEaqAf6coN99S/l35ixm12jJNlU1d0Wel
	lNIXriJtCOKQKcnlChuocWme5NkqKXD1vXHhd2OnsMnoM+N0U7RuWZXkh1CZuH8JpbQTD3HXI0bqC
	IOAFg7UaWSDKpeWxRS98kCr0bDrKWRDAG9GZrT3AhLDsIOU6S1DxiAAoE+78NLVbVbo8ZrN6H/wle
	AUElqeSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXG3B-00000007Mmv-3qo8;
	Wed, 10 Jun 2026 10:20:45 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXG39-00000007Mla-2lRs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 10:20:44 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-36b7b7b7a80so4043186a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 03:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781086843; x=1781691643; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qDRxQkDh59yrFta7WYo63tMmQrTE8dc3M19ZI2IlDYU=;
        b=FyqTF3zF6FuQLcVx8k4ZEh7MtoAu7vM8sQeIqhCKJyxyeC0uu/odY5JCOMwI7VfPyk
         1pppjL8WPCybv6FUq92Q8YE4WzE8ALjYPJi460M4WVWJo0kUahr/Qn9yvs/5yn7XsyfT
         HuM7eT7cMqO4dWTwI0GhfSGr6BPBdo6oAeRssfFRL+k0TCeGmu9Y0ggP7b8UHAyvqPtM
         Z2sNKg/MUSKnXolFYmbida2//yevvoFdzfkBIrfUBB14IQXN0tCpfW+Udw4bTaJ1anM6
         uZv8+q8sD10zAScftlp+cW3AWn6T3YMnCkEWGieIAJtYhr9c19T03flsfXQHCfb0Gt6h
         I3xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781086843; x=1781691643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qDRxQkDh59yrFta7WYo63tMmQrTE8dc3M19ZI2IlDYU=;
        b=Gt4cWpB0fu4zcAEjn6LfY/sHMgUZXGbFAUwo591A7laYhDUgG0QP5VbBG4MOy0VCiT
         kGd5FJHtbz4BrWw6GW8FxzWX66/zsJbnjqgRa4hJiigvrCn56TKtGiiY58LjCXHMNfc7
         fKk+eG4BdN5CCB6ap1/dfCtvquHQH1gZ1WEoqn/n2d3IFa+u3nnHJ7lPlElBg4zLTaH9
         gUkaBsle+7bkHQlFu3fKA2y+qciYbPvB+zPtMoYLwBNNs9uscBtAy8Y8PxxmTT8b8rt5
         NZGNlW7KplYnQfhvdo7Y+3+TBiY9ACTQOIIAR9O6eOciUndeqH5Ob2cKEoYhwr4LepPK
         SkyA==
X-Forwarded-Encrypted: i=1; AFNElJ/JBoFcLm05cpP+cMALlQJjEpk1+BTdmlDty+ArxFldFpMi97iNHCY/N28znTvqDsjYMU1NWpMiYvGbKGzxVtPW@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3FoF74xVo56nCfQvKo1PCPz8u0dP28zOVtgKxOTilpP5FT+bp
	IoUIZWj0Df1IEIPNZxhvZSU7ZAUyTVMUawsdaLaqGpVSVANAvRZogwoC
X-Gm-Gg: Acq92OF9ic2K867xnGd1+QauwTPPHB1T1js5FYoK2oagtOkkmYclkPYEznNhqzbVj0q
	n2OK9hU6G6xiBe01vo6HeOh4VAreGwvDT/by1ZbzFkiZOLLJfkAOrDxZfOJfBvPknepcsFxjLUM
	RAgPdt56kxnZAZD9vI0YraafZtrk0DP5Xg/9DBYkyliWAky9h3SLW17R+dyUr1cIpli91DDCYA8
	KTXqydK+fN9yPb6N+jjodpOv0oEINjAd6HG54Bmnh1ljPS7zKwrH44pwiw20t4smxau00PQfbWL
	I3GcwSum/+3RRLd4d4tzMKYYIM4qPRmaOEiADETKyims2mKaiqRosslHEqTL2wLuu/9MQBsIdZ6
	mZo5YVTGhv3tZOh0KSLvAbmL86b25C/lUF3tDOerNyub27HBtT5ud9io/Mmin/EoFlMNYBxEL+a
	MQA/2FfoATK1/v6GVoTC81SPW6j29Ish909q4C2xMazUhOLJunrNGFD0VmglOM72vtCbyE
X-Received: by 2002:a17:903:94d:b0:2c0:d94f:50c7 with SMTP id d9443c01a7336-2c1ec508177mr220303605ad.7.1781086842787;
        Wed, 10 Jun 2026 03:20:42 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f96b3fsm250133875ad.29.2026.06.10.03.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 03:20:42 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 01/10] ASoC: mediatek: common: mtk-afe-fe-dai: Use guard() for mutex locks
Date: Wed, 10 Jun 2026 17:20:12 +0700
Message-ID: <20260610102021.83273-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260610102021.83273-1-phucduc.bui@gmail.com>
References: <20260610102021.83273-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_032043_702462_813C566D 
X-CRM114-Status: GOOD (  12.88  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/common/mtk-afe-fe-dai.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/common/mtk-afe-fe-dai.c b/sound/soc/mediatek/common/mtk-afe-fe-dai.c
index 3809068f5620..2a20fa5dba49 100644
--- a/sound/soc/mediatek/common/mtk-afe-fe-dai.c
+++ b/sound/soc/mediatek/common/mtk-afe-fe-dai.c
@@ -292,28 +292,24 @@ int mtk_dynamic_irq_acquire(struct mtk_base_afe *afe)
 {
 	int i;
 
-	mutex_lock(&afe->irq_alloc_lock);
+	guard(mutex)(&afe->irq_alloc_lock);
 	for (i = 0; i < afe->irqs_size; ++i) {
 		if (afe->irqs[i].irq_occupyed == 0) {
 			afe->irqs[i].irq_occupyed = 1;
-			mutex_unlock(&afe->irq_alloc_lock);
 			return i;
 		}
 	}
-	mutex_unlock(&afe->irq_alloc_lock);
 	return afe->irqs_size;
 }
 EXPORT_SYMBOL_GPL(mtk_dynamic_irq_acquire);
 
 int mtk_dynamic_irq_release(struct mtk_base_afe *afe, int irq_id)
 {
-	mutex_lock(&afe->irq_alloc_lock);
+	guard(mutex)(&afe->irq_alloc_lock);
 	if (irq_id >= 0 && irq_id < afe->irqs_size) {
 		afe->irqs[irq_id].irq_occupyed = 0;
-		mutex_unlock(&afe->irq_alloc_lock);
 		return 0;
 	}
-	mutex_unlock(&afe->irq_alloc_lock);
 	return -EINVAL;
 }
 EXPORT_SYMBOL_GPL(mtk_dynamic_irq_release);
-- 
2.43.0


