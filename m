Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B94D4C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Jun 2025 09:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+Toi2tQAZrviqm160TJzNi/82azbGkUfQEBaQsphdcI=; b=AzigopUchTgjbQuu+blifhYiEB
	cs5oZmK+dKwKDlZc24V6kOiODrVQ4vNObwGvz/ComfrG8A/i2jY2g7F4WPQlqnUvuY/RIoJFQ7jgM
	iCGqavmtNq2/is3Y8U5nWUmh63uLv7c9i3rEInWiVG0f492tBmALqAZwKDL9BMu3BxEAd/tRaTclF
	YUCaacosoi9wPJxUYpUk7xTY3x2QHQdeeK99SvlJ13GF6GxgwlLkbIjbj10R6n1mDT9qMxV8wunFg
	fUofBx4aQgwmCXkrL4gsyf+e4ddRSmUyE9W7vc2ZJqM5yDtstvqRruv/oD/eSuZFmHbKGG01i5bLU
	hztnzJdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNSyS-0000000HTWW-2des;
	Fri, 06 Jun 2025 09:02:52 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNSwK-0000000HTB4-3TAW;
	Fri, 06 Jun 2025 09:00:41 +0000
Received: by mail-pl1-x641.google.com with SMTP id d9443c01a7336-235ef62066eso25135915ad.3;
        Fri, 06 Jun 2025 02:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749200440; x=1749805240; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+Toi2tQAZrviqm160TJzNi/82azbGkUfQEBaQsphdcI=;
        b=GgfqiPYbOzigKS/yQUAxeb6gJp2vtrrmDW5pGWOAcuqytEZrwTM4lLp1gmLVYMgCCY
         GgrKADHT/E/aFYyWSXfw6rXUP6yIcNZkpVoEaNg49WlxstznPwW4Lkx29xba8LvIFkj2
         MWwxe451gGkJBd+dgNRzB4q9xAXEGMEj+odjGbhy/gmXg7Numc9AVDDC+dgWkaQPpcSm
         Q4+POsIpIOR3wO0FFGJDyUkH57YNhOQ12W7Vdf1HpRQTJjRgd/d2kr+6AeBeuTFD/7YW
         UUFqvdXA6bs7ZsNmeQYAJMn0lka+WRCy4L/oqedkcdNYhJK0q1vnWpa/IKXSwJ7r9m12
         4g0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749200440; x=1749805240;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Toi2tQAZrviqm160TJzNi/82azbGkUfQEBaQsphdcI=;
        b=NSNqffnz43ODtcM6T3VfkjnlDkVyzcBExjbsOcjLlKA0qlilCajRbL/gAi/I3LJyrH
         SZm6/67OeP8ZNtMLmlgOWFo5Jqb4Q/jLGNrzs1ixDIMp0mpQTcrCZHYhq3A2f4TKWohc
         36E5Oz7r39apKBvb3ZA/6wreGZhH//E75saLaRNFQJ33AVFPyV3plj5sQae5IM7OAHci
         aZidRlmL8wSKafUDd3ToX7nsVLW5T4U/Fgu74Et/5Cu9/7wZoRxNd17H6DpvMEcbrQ0i
         ahh04VJHT2SU4Md/tOY3NhWGS5tOZ7uN/pJ6M921D1Ao1sre1wk9LB8WEEEoimkLVBiq
         R/sA==
X-Forwarded-Encrypted: i=1; AJvYcCUnFm1j0qXAtRBhbhbHNVtN+UdpUZdOKhzoERkNI1sEGYVv/aze2hAoLm5aHSaUlFT95kkJ0cm7qUtFc6dX0t4=@lists.infradead.org, AJvYcCWdaa5gtikqkh41JednZX47dt5/zJQU07CTpCZWYbemNfaVEgzSQS2PqtNhzvYx8hk1B3A+HqUypuIo2mSmrP4f@lists.infradead.org
X-Gm-Message-State: AOJu0YwnfHMoCmbmw2naJE3B8DaxK9D25vXfJ8sK3owVl9iAQ6wgjlT0
	hCQqAXFL3KW5S3hAtNy+9BJTKzkTUr4x/MqETkJ73VVpZuTX7koGTMTPbdce7nKoRqM=
X-Gm-Gg: ASbGncuxFCLbWlPNa+uidIixnPJXEoxQxhQuN7F8DlSjyIhzeIYvMMXGiz4e3TmY6Rp
	tMQ7MY+5pAvJ+qZaMppy3mcYvWFsk6M/DXYULjXNx7mKPlL0IHEYxNi23A9XUKFXD5cqJ93JCDJ
	DEsQ6+EIY2zMWGGGlYx0Wad4N7+/yuAwz3YP12hdLrkn6iAsIBKThUzsZ0+JJtoYhCrhxaLtmWI
	25j3WeG3oKeRlBfOSBM65xNEHinaw4L1kCTpt8/dvBxfWDaQWAQZRhOpZSLTkKQBZCw4NqjfZ83
	LvyhIsaXAL+FGB8w5pIqcTkFPixS8i1V531vhRN7Eqxdd68yCzrtDGQyW02GuJDDh5LFCg==
X-Google-Smtp-Source: AGHT+IH15PyfKv8D2hZo4jz4TX/8Ll4a83KhJNiOMLH4+nrqpTtsFeVLOHL/LLeT5zU+0mYoyt7KqQ==
X-Received: by 2002:a17:902:b18a:b0:234:f1ac:c036 with SMTP id d9443c01a7336-23601dab2ebmr23801085ad.50.1749200439705;
        Fri, 06 Jun 2025 02:00:39 -0700 (PDT)
Received: from tom-QiTianM540-A739.. ([124.127.236.130])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2360340d87csm8140735ad.189.2025.06.06.02.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 02:00:39 -0700 (PDT)
From: Qiu-ji Chen <chenqiuji666@gmail.com>
To: sean.wang@mediatek.com,
	vkoul@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	eugen.hristev@linaro.org
Cc: dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	Qiu-ji Chen <chenqiuji666@gmail.com>,
	stable@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v2] dmaengine: mediatek: Fix a flag reuse error in mtk_cqdma_tx_status()
Date: Fri,  6 Jun 2025 17:00:17 +0800
Message-Id: <20250606090017.5436-1-chenqiuji666@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_020040_864171_9733F131 
X-CRM114-Status: GOOD (  10.39  )
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

Fixed a flag reuse bug in the mtk_cqdma_tx_status() function.

Fixes: 157ae5ffd76a ("dmaengine: mediatek: Fix a possible deadlock error in mtk_cqdma_tx_status()")
Cc: stable@vger.kernel.org
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202505270641.MStzJUfU-lkp@intel.com/
Signed-off-by: Qiu-ji Chen <chenqiuji666@gmail.com>
---
V2:
Change the inner vc lock from spin_lock_irqsave() to spin_lock()
Thanks Eugen Hristev for helpful suggestion.
---
 drivers/dma/mediatek/mtk-cqdma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/mediatek/mtk-cqdma.c b/drivers/dma/mediatek/mtk-cqdma.c
index 47c8adfdc155..9f0c41ca7770 100644
--- a/drivers/dma/mediatek/mtk-cqdma.c
+++ b/drivers/dma/mediatek/mtk-cqdma.c
@@ -449,9 +449,9 @@ static enum dma_status mtk_cqdma_tx_status(struct dma_chan *c,
 		return ret;
 
 	spin_lock_irqsave(&cvc->pc->lock, flags);
-	spin_lock_irqsave(&cvc->vc.lock, flags);
+	spin_lock(&cvc->vc.lock);
 	vd = mtk_cqdma_find_active_desc(c, cookie);
-	spin_unlock_irqrestore(&cvc->vc.lock, flags);
+	spin_unlock(&cvc->vc.lock);
 	spin_unlock_irqrestore(&cvc->pc->lock, flags);
 
 	if (vd) {
-- 
2.34.1


