Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5805C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 11:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LkoKVbcxFCdFsy87mxquQYAqVgDQSp2s1Hkwlfg3a08=; b=4/eb4ZwA64Nu8XuD/ChBzrwgm8
	bSfSqHGxOrfAx7YxOJockd59KHbvYHnBhuiBlv1Crpl4FQytdmrr31+Xh3Ap5Ym+fkKcCblnw8oKC
	tUOvw73dFD6D6bhViHa4n/L2/a24HCl4AVT1ty7Udjhwz8mvG+5F7JA0sBcnbcivXAh9Fex44A2MC
	whGyEq620D21+/+SAgdDE02EAiOLizh3uQuyApM0f/d6NkzjMwGc6JUwjoN5QzgJjhDjW77JMfdqP
	rgUeLgU+9Nlcg32IA9Nd090XNVtNLe8G7IXrurf6S1g/VmQACIaw4n5J+O7Y8gYC0imUNuzWT0ghj
	IUzD9QAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wess9-00000001R4a-15KB;
	Wed, 01 Jul 2026 11:12:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wess7-00000001R4B-2HPL
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 01 Jul 2026 11:12:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=LkoKVbcxFCdFsy87mxquQYAqVgDQSp2s1Hkwlfg3a08=; b=ikNWcczCBtg67cedoc2zOrtm8X
	0Sh8P8IxpHi9bS0GDot1w8K/lgXdctkXsP+guX52fI8VoKdEstHku+qx0S10Lafb08viO9VvYbS6m
	UhsxtHRRyAb6MDoL1QYDm+sI0+Kb4BkpfbLEnb5ecMZNfimV7Wx0OUlw5ZyAA+0MStods5ucy/IDP
	vrHlNTszyOjosPAz6+dA7ZfnKT04cFcvfgw/8RnycIy1JNV8cTIO9MlSPXKrAOYTWuExGPVGm6lQN
	YBLbNSHYD0EBGVxDTkkeRDwWxfWawkNe1LwZ4J6aWu021foBprIkneYjUptwN8UEI6faC4DLCDkeQ
	GlpZ1rLQ==;
Received: from mail-dl1-x1233.google.com ([2607:f8b0:4864:20::1233])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wess4-00000002fWE-2cMP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 11:12:50 +0000
Received: by mail-dl1-x1233.google.com with SMTP id a92af1059eb24-13981833e13so579044c88.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 04:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782904366; x=1783509166; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LkoKVbcxFCdFsy87mxquQYAqVgDQSp2s1Hkwlfg3a08=;
        b=iX+PIuqDlXvl3UqIRY096CfIRb5umVPgLi3F6Pr1P2+Qq/ntBq/xtRSlWlkUSHncTu
         YFhYrKShH0lD5T5b7xRlnmqYaoCsC3kDWvnzcKCtXVcmdiqEkJmHyDQLlpZGZmHPde8Y
         O1HizsSZAGMqKaguxcIShkScRbHT7jdr9nkMexkK4zKxanuhPG7X49oOZ3iailnFWswI
         l9PFnGV2itPwrkbVWzinSwIh4w5vV/ITzz2VSbuJvsezupkybuKQQs6VMTH5P2soI2Ts
         D9/RRZ9DkyIlJ5xzxM1ETIz4OcinTuGKSs6vuXfNR8D5kCZ3NBtoOOaR0LXpWPL/wyq3
         YetA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782904366; x=1783509166;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LkoKVbcxFCdFsy87mxquQYAqVgDQSp2s1Hkwlfg3a08=;
        b=MMD4soqySwEM8Vy7zDYbt+CmBvHAc8W40nvsbVoZhf1exxigaN6/ODBcbvcMuq0G30
         UKuIEV+T/FWywCOjMvYe3CRPlzUvRCJnU8IBB+LyJd8J3Q1xR89xI80YWlBxHLz+yVap
         9ycasw8/18nkIzRWg8yIdKV3pLpasaYYyFHYt9VeP/1cdRekw5jZafp4Q5ttoljYxHam
         gdMrmTbKOnBAAn4hNeaN+RpkAPXpl8GtXILup7GUvEfeQnZKUXkiA04XlYGHxE9t90S/
         lHYPki30mNY4uV6xE3vzlGotzytkMFzQgNCCQdsvbS5tESKIzcCJ4/k52x48ywtVkJZK
         jnxA==
X-Forwarded-Encrypted: i=1; AHgh+RpBRr7BHa+ZOSFGz4SDfOCzlSwG1QJhnUpp3IOEx7p0ayjioOYFU6HXL0i6s4TcODxB4/3i9ri4slpOp6zBPfeT@lists.infradead.org
X-Gm-Message-State: AOJu0YzG7AIzYyQt4RFd+T5a+0UfvfngLfDxRcGzFYb9REGFz80EooyO
	EpmtDTM4I8fhAjA0hSl+nrsnaOySmjveoAQHNTCu40fmAGSVVD2e6H2Q
X-Gm-Gg: AfdE7ckIg6exEXuh4GqXKhcmcwmcDhv8Q+W49FunBZyBQGn7msWvpcoWMO1O0v/xjSG
	CVdyFUIaENai1LIFSBQCsy57zlQmsVpRNmPNyNQgV3LoFXIUhC3lDlV2Yp7k21cPy3UHC1eNpJX
	ChHwVqDMPUWORYa6yj0mJ3xaFPCPUllNBYdT3FsW7YR8uEjfzCAHchRtNqliDZNxjIAcpku0ae5
	gbA+PMvG3FHGqAVGbuZ9g/PiEXQXAnuGcJUe82pdxmS2ATyzhiOLqyB61Z4PdlDsbP++hSACSOU
	AdNwdF8kXahPGaCJOZ+ilIqmxhQzbw1FIie8i7ovyxRtwjg1Sn0wCi+tcRWGLc4m+b1+zCMjXvl
	rlcAm84dG0Vw7Lk24uHXTdK01MSmYTFjhxX55TwRYbmSs5eFWCtt2mxBOdvT1uW9Uc09pqFu/hh
	qbgWaifBkG7de/cTax0P8=
X-Received: by 2002:a05:7300:3213:b0:30e:cb0a:fe7c with SMTP id 5a478bee46e88-30eff0a9e50mr1173027eec.17.1782904365910;
        Wed, 01 Jul 2026 04:12:45 -0700 (PDT)
Received: from ahmi-PC.lan ([2401:4900:88f4:d9c5:fca7:1ff8:6590:ebe])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee2fb6514sm16687832eec.7.2026.07.01.04.12.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 04:12:45 -0700 (PDT)
From: Narasimharao Vadlamudi <ahmisaranrao@gmail.com>
To: Detlev Casanova <detlev.casanova@collabora.com>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Hans Verkuil <hverkuil@kernel.org>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Narasimharao Vadlamudi <ahmisaranrao@gmail.com>
Subject: [PATCH] media: rkvdec: Propagate platform_get_irq() errors
Date: Wed,  1 Jul 2026 16:42:03 +0530
Message-ID: <20260701111203.62092-1-ahmisaranrao@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_121248_780453_4F4BC415 
X-CRM114-Status: GOOD (  14.27  )
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

platform_get_irq() returns a positive IRQ number on success and a
negative error code on failure. It no longer returns zero. The driver
currently returns -ENXIO for all failures, which loses useful errors
such as -EPROBE_DEFER.

Return the error from platform_get_irq() directly.

Fixes: cd33c830448b ("media: rkvdec: Add the rkvdec driver")
Signed-off-by: Narasimharao Vadlamudi <ahmisaranrao@gmail.com>
---
 drivers/media/platform/rockchip/rkvdec/rkvdec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index 1d1e9bfef8e9..37683a6bb40f 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -1818,8 +1818,8 @@ static int rkvdec_probe(struct platform_device *pdev)
 	vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq <= 0)
-		return -ENXIO;
+	if (irq < 0)
+		return irq;
 
 	ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
 					rkvdec_irq_handler, IRQF_ONESHOT,
-- 
2.43.0


