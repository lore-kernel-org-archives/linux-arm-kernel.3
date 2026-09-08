Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76439C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 17:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zs21gAo4QkiJe7skjL4wk3AEQvdIKI9ChNhU3Egus/E=; b=P/5uouZ/+tQVg28P2sFHOV5wp5
	x7F3bOuAI4lBZ2ypzzXw0GDnsd6MARlpAAL/12scYQ5CSwvk9gkTDX6o17nKGG/jGyQDeorYeOwI4
	mddrm27F9GtRL+BP6aGJ1ps9vQkLeUhF2yV+0jeHvuksTZX0Trx/kSeXWeLITbPIDUaVtnX+M0krX
	7VTOjxLmsqAsvqX0vvP+HI1t0OH/ocitxO46zaDIttyTiSnQdE9ed6RqYL68MookPnclktzBLUJ4I
	WUtqEeIXc6f4xFrEYLLVu2pezHFkuBrok+YOBm342vgEzo4kQsezFpTywaN/ZfrHDad/k/cfPK4qx
	SiWueDxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zZg-00000009oQp-1mih;
	Tue, 08 Sep 2026 17:25:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zZa-00000009oP7-3lug
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Sep 2026 17:25:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Zs21gAo4QkiJe7skjL4wk3AEQvdIKI9ChNhU3Egus/E=; b=akMIPUdX76jzhiVvicnRwJ6qgi
	/MaCVJvWfzfY/SBJysia1wP2fchJ5F+AlVGeYV98x5BBBD9NtKIx61LaOYYC9JB8qXNOJ0kmcKR2L
	/W8DuzvxnlY1qQtJIZai/ER/pKDMX+DTro5Fkvo9fmnY5gJ6I269ofioto1ICGLLz68KtG3wcDPT1
	xbMvGgtCgxGP3xH91+Y/i+cFcjNci/nK44BV8Bf9+c0VIKPkbaoDgsOcirJtqgVrTJ8r7/q6cnO4S
	6hzTha7sLN1CtEtPzU27adgiRRJG3W/3RSCeZ1T46Ld9aQUhVA5kSqZdzMoY4KzqikZkqsYssaSP/
	QE4d8XYQ==;
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3zZY-000000009fg-1MWz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 17:25:29 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-8525efa7274so3419824b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 10:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788888326; x=1789493126; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zs21gAo4QkiJe7skjL4wk3AEQvdIKI9ChNhU3Egus/E=;
        b=gKIB0WITfMNT70VJZY4aCRb0qltdQVK1clcTjoD44wkgOohQh1ulbPcEZ1v6zD0luP
         j4CvBw/bfaXP4hZFBJEXj1Pb2njCR3bH/dQWeT4VexDt4+2szyRMMo0wwwFxKAhKdpcH
         k8e6/+Ge1j6N7HKQAHkuBU7slC8jAysLm8ISPGVPhZLIEiEFaQ0hZA9XESepcALu7xri
         Pt2LTa4qsO2+HrZmkLkdwhXzVhYF2x8Vv8/a/+GuvqK0U98mlfIcch/SjwQWT9nKWXNF
         70a2cz0h8JKdtPQsAB/X3nwIu1R3Gr9iqUVpqVvrETxIMyG3cvvKIcE/BI6AB0iSMFhZ
         dL3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788888326; x=1789493126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zs21gAo4QkiJe7skjL4wk3AEQvdIKI9ChNhU3Egus/E=;
        b=rvJIDUf9CJ0SbfIFqTCTJgWSxIJgesBuxrLP1BnRRqJ4lsDObP6oif5J3pZZhI+FZj
         3cNMNp+yz/Kz0LDkxrZlXyhCBh450LjqOVX0iRtz4dg6lPQk8iLklBeBy5QFY50q6U8k
         u4m3/2IYVbf+bE64QOEpuTyhYUAmmfZp9GiZ08b66+BQrSUDOU+jCk+Up41wdZ0HI4ex
         sTU2nlCCaPoHMX29q+2DYgE5Oe16UJoHRj+1+rn1Aw6cXKcv83coYm2I+xcZJwWoWF6C
         +3M3EZkM+gagnK85qBkstvJdDZdzwrPe0Tu4ppKtTh8La8DbGgWW6QaZhMIqoWlA3/00
         X/4Q==
X-Forwarded-Encrypted: i=1; AKwUvBytBct6SRxqzDD9niqktfHOxCpy7Q2BGF34g5tv5UvI72GdkPiPvATVs4qmmTCLRxYswktu8Wexy2LFUBUVYbEz@lists.infradead.org
X-Gm-Message-State: AFuF++nz22SI8e5P07twxyiPtWvZgurUj0UPQtaBkwYjEsvGAVP6gFOf
	Zi62oJegwRhVzD+mAcmVTqyuugb8WtvDZNfmFmbW5tjx4WtURcKEVBPR
X-Gm-Gg: AYBFou1CtYGCpr4qqf0QNJMH/ahvNLog7XHr00IPJTKveK9n10uAYiKZIdNbf1oyKpD
	OR56mgnvjjyFKJCgXvB015lXqUMdzHCvotIs3GSZZEKvR+m7qz+FnrH2BmaXb8FE25IAH/M2iFh
	BB9FcrWtlGu0diX919nCKUQx8UOcvfeXIm0ydWyHpk4dsqaL9mcd2gUXZYgHcQpG63ZHxhiMCkH
	c44ExTelmJDxKHyiXpVNKo13O3Py0ItWr7EMm5gsJIVRRldf+Jd+MMqmDpPW8NXD7lBdF+wNM7D
	6s4Eio1NaqlmgucvIbvsBCqSJETqtRYU8pbw0tPK7bb1z31YtILIKfViw1YYwumKRnFg21gQs/5
	xVw2VWU9Wr1pQMpqkbH9IP8i70bijFXrADUoC3jcZDEhmHUsVy0PsbKdKjx8r1KeEKUut29rh7u
	+AsGZVsy2Wi0u81pxobNHVuCcqlT8RYHvkPyItw/Minfi9QVM8DWHxANE307s=
X-Received: by 2002:a05:6a21:2291:b0:3d0:88f5:f812 with SMTP id adf61e73a8af0-3da39d147e0mr44672625637.10.1788888325834;
        Tue, 08 Sep 2026 10:25:25 -0700 (PDT)
Received: from ubuntu.. ([2405:201:8026:213e:43ae:bf76:d99a:e5ff])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33688cfc714sm19297176eec.20.2026.09.08.10.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 10:25:25 -0700 (PDT)
From: mdshahid03@gmail.com
To: Jonathan Cameron <jic23@kernel.org>
Cc: Marcelo Schmitt <marcelo.schmitt1@gmail.com>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mohammad Shahid <mdshahid03@gmail.com>
Subject: [PATCH v4 4/6] iio: adc: bcm_iproc_adc: use devm-managed ADC cleanup
Date: Tue,  8 Sep 2026 22:53:57 +0530
Message-ID: <20260908172359.30003-5-mdshahid03@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260908172359.30003-1-mdshahid03@gmail.com>
References: <20260908172359.30003-1-mdshahid03@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_182528_413304_A078F4B8 
X-CRM114-Status: GOOD (  14.85  )
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

From: Mohammad Shahid <mdshahid03@gmail.com>

Use devm_add_action_or_reset() to disable the ADC automatically when
the device is detached or probe fails.

This removes the manual ADC cleanup from the remove and error paths
and ties the ADC cleanup to the device lifetime.

Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
---
 drivers/iio/adc/bcm_iproc_adc.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/iio/adc/bcm_iproc_adc.c b/drivers/iio/adc/bcm_iproc_adc.c
index d6f82f8ddee1..ff271c7fb2de 100644
--- a/drivers/iio/adc/bcm_iproc_adc.c
+++ b/drivers/iio/adc/bcm_iproc_adc.c
@@ -451,6 +451,11 @@ static void iproc_adc_disable(struct iio_dev *indio_dev)
 	}
 }
 
+static void iproc_adc_disable_action(void *indio_dev)
+{
+	iproc_adc_disable(indio_dev);
+}
+
 static int iproc_adc_read_raw(struct iio_dev *indio_dev,
 			  struct iio_chan_spec const *chan,
 			  int *val,
@@ -554,6 +559,10 @@ static int iproc_adc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ret = devm_add_action_or_reset(dev, iproc_adc_disable_action, indio_dev);
+	if (ret)
+		return ret;
+
 	indio_dev->name = "iproc-static-adc";
 	indio_dev->info = &iproc_adc_iio_info;
 	indio_dev->modes = INDIO_DIRECT_MODE;
@@ -561,17 +570,10 @@ static int iproc_adc_probe(struct platform_device *pdev)
 	indio_dev->num_channels = ARRAY_SIZE(iproc_adc_iio_channels);
 
 	ret = iio_device_register(indio_dev);
-	if (ret) {
-		dev_err(&pdev->dev, "iio_device_register failed:err %d\n", ret);
-		goto err_clk;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "iio_device_register failed\n");
 
 	return 0;
-
-err_clk:
-	iproc_adc_disable(indio_dev);
-
-	return ret;
 }
 
 static void iproc_adc_remove(struct platform_device *pdev)
@@ -579,7 +581,6 @@ static void iproc_adc_remove(struct platform_device *pdev)
 	struct iio_dev *indio_dev = platform_get_drvdata(pdev);
 
 	iio_device_unregister(indio_dev);
-	iproc_adc_disable(indio_dev);
 }
 
 static const struct of_device_id iproc_adc_of_match[] = {
-- 
2.43.0


