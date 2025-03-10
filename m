Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91A97C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 11:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=P4FBTBE+KNOkM+Qcs2aGG4D+zzTC9l6YOpjrjTql9Ko=; b=NeyV7CKUwhK63khGhuBaqtEZew
	UN0nypdE/1KwZrzY6ZvIQigtzrDeWYS0VOx614vGmzN7P+2EihOUA8fxKccb0zN1JbGopKNNsElna
	I4ScBSYbk3SEy+W8JafU/NJXLvJwgT5WbR+jQqVuyRL9Q/cj6JgNcH5un1DRdfDuIZPIHe99jRSCQ
	JMePCAIdKimbD/RdiF7c21rosyj+Yeishwi3xrUeC5zQwiWQMkKTyKi6eyT82b8oTDsCWGdiCLspu
	f1oVMyPvecF1YfTSzWTinV9iuLfefELD9lapqqpYqCgMDLfGorLXJNBkfGpc/ql930uJcGfW4AyPx
	juyuwKYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trb85-00000002Oun-1224;
	Mon, 10 Mar 2025 11:17:05 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tragd-00000002J2u-3VOv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 10:48:45 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43cf257158fso5939845e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Mar 2025 03:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741603722; x=1742208522; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P4FBTBE+KNOkM+Qcs2aGG4D+zzTC9l6YOpjrjTql9Ko=;
        b=mZvN1NI76ZhKr1sLNYQbmaHtkqcVBfnLxxrp6Y2CT8xPMxvdJiEctAxe3sxFxpkEgf
         cwIw9LtuFZRMINIJ46JZ8lomZQf2cHnK43NhHxH9mwJMGMTX/rYgvKGiZYL1owVxS2IU
         7mmxwHfcVMPDOz0nq6llujY7/v21e6qDtursiKb0dv5AXG+Jg1JupXMM+fB8vXQQDbi1
         nFyJT5cGKJ8Mg0I5l4uoWP7bgPn0GKYoof21l4h60Q1rh4rOqPHQJVz53yd4FkF+iinR
         6ceZfQCHozlGLaGJuDYRsNrHsweNJ1ILAiVijfvzR+W8PKh+guOupIXXeOd0pduNGW0I
         b2bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741603722; x=1742208522;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P4FBTBE+KNOkM+Qcs2aGG4D+zzTC9l6YOpjrjTql9Ko=;
        b=pyj/oxNnNzGu6yciSYSFUFyl1B8O2TevR3dvUszIPYx95IlM7i7X1jDd5QOlQh3o/a
         yFvLPdfBpRZlW1eHz5zjCFxIXaEVgn/vJt4yG365vjWQgBXMFpPiEAqEQktH/gS0Jjz3
         SfctEvB7u+jy45QuOPAzQkV/Bwp1lnBQN61xeQKf5KCKdxNgBF81rz4FE7BozXBN6xIS
         r+mVIMmKKoyKB/oZE5caGN1N+jYmWMDtoXj29Fv+Hn7rYKXgK3CkE2QVL1woDJv9YiHb
         PmFwvNZ9P/VCPaUw538e8jUXGyuOxKzcOfP1i/lLocVwlE9x2oy2WWjpbDe+8G51pISP
         679w==
X-Forwarded-Encrypted: i=1; AJvYcCUPuJYE0u2aU0SRpPHCn4F9wyDJ6N39+J8JkMaQ4P1+tNtiY1qDhpUEWKGj3QYidVsFs+uEqPCrysFvYdAFk5/E@lists.infradead.org
X-Gm-Message-State: AOJu0YxGHey851uK/OSE/RhogsICLEKkvlnzxK6LFaHRmiB1Oa/tVRMC
	08cOrbhABwuKcQZ4JZT5ZQOXcW1cs7jtIHo2aSWXjHZvvfg18v0szWznDAIifLI=
X-Gm-Gg: ASbGncsDcHXmI2umdXpE2fqUYBKszqsh1pOZhaw0G0pCEJjugmrZ8UTljQzXRjPJa7F
	M5zOHWLccux+d7ElkCW31+t2UqT8tp+UO26TrUzJrZhxhGAbLeCLLkdmDtNzefGGBsM9m+8iKF8
	RotAf0SxTSncr/KvTyIo66XNnsmYsXZfVF6yG+Y5Qo3b6cO5XbtLbviMUNgHcK2AahyN4XL20+f
	rp3RtdsaZlxTVelDoHhH/P/DzQZyaZttJeIGxbzK0ZFYL4c+6VlxSGeFSWdWjWBSWuBCz5Iuubu
	FFxsdqWZuFNeY+dKh63fEBKBEoqUJoCn/Hf2TR/qyibpZB1psA==
X-Google-Smtp-Source: AGHT+IETFwDZNdnH20Q7Y3z4UlrnseZbh1WDkk70tSsdvhJaGXXT+NyRi65tIbPyOgQrBEERRB/G5Q==
X-Received: by 2002:a05:600c:510d:b0:43b:c0fa:f9bc with SMTP id 5b1f17b1804b1-43c601d93e7mr74449995e9.12.1741603722155;
        Mon, 10 Mar 2025 03:48:42 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43ce3f573f6sm57354855e9.0.2025.03.10.03.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 03:48:41 -0700 (PDT)
Date: Mon, 10 Mar 2025 13:48:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Artur Weber <aweber.kernel@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-gpio@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] pinctrl: bcm281xx: Add missing assignment in
 bcm21664_pinctrl_lock_all()
Message-ID: <dfc15d59-7fa9-4f96-aacb-37c3df6d420d@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_034843_885608_622C4248 
X-CRM114-Status: GOOD (  13.52  )
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

The next line checks if this regmap_write() failed, but it doesn't
work because the assignment was accidentally left out.  Add the
assignment.

Fixes: 60d69769c851 ("pinctrl: bcm281xx: Add support for BCM21664 pinmux")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/pinctrl/bcm/pinctrl-bcm281xx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcm281xx.c b/drivers/pinctrl/bcm/pinctrl-bcm281xx.c
index 7c8f8bd7da12..9ea20fde3a24 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm281xx.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm281xx.c
@@ -1498,8 +1498,8 @@ static int bcm21664_pinctrl_lock_all(struct bcm281xx_pinctrl_data *pdata)
 				rc);
 			return rc;
 		}
-		regmap_write(pdata->regmap, BCM21664_ACCESS_LOCK_OFFSET(i),
-			     0xffffffff);
+		rc = regmap_write(pdata->regmap, BCM21664_ACCESS_LOCK_OFFSET(i),
+				  0xffffffff);
 		if (rc) {
 			dev_err(pdata->dev, "Failed to write access lock: %d\n",
 				rc);
-- 
2.47.2


