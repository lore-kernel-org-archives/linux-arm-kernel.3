Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1787ED16804
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 10:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kCeTL5DyL4OpVceWW2dtJZK2fvnfNct2KD6UucHZ0lo=; b=kcO7HAHrowVDOcoHUI7L0VI/HC
	rt2Qip5k7G44yBNJkyLdPXWP/ahrw2FXnH5PlWHfsJNbABsFr1lyog/GEOuKnIUnM7RgiaW0BUVMO
	7WxGkTKgQh3twMU9y5wxSWs5OloQEvPhW8cAfxRjxmx91Xt3HOWmuUKyUenbujlSWO603lAYyvnfM
	htZW5CT/LoJgchO5+luyqXWGnkKZd3eX3z+QBuUThn88Byeijs4FuYaLE24QklfNb+yF5QqqEsyHC
	mrLSNh70WpcGbO58sh/9oilFGZ1TX8T3WSOxcRyNPpZascWA+9zlFWZ//blD4+uRKT2RGCUXmEEHm
	6Oam8+vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve9oo-000000028nD-163z;
	Fri, 09 Jan 2026 10:34:10 +0000
Received: from mail-dy1-x1362.google.com ([2607:f8b0:4864:20::1362])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve9om-000000028mQ-083D
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 10:34:09 +0000
Received: by mail-dy1-x1362.google.com with SMTP id 5a478bee46e88-2b05fe2bf14so5389077eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 02:34:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767954846; x=1768559646;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kCeTL5DyL4OpVceWW2dtJZK2fvnfNct2KD6UucHZ0lo=;
        b=pRcDSWLAKHvb8bZDoaDd6OAdca3vrLYvNovMaN4pSGmLX9QJ8iL0taXqruMfwCfgLQ
         tTSRkojdqPS7n2fBwUYh0pyU6xZHrrk2umoWyWrTUDdSrRYxzmVaNAXJ4FaKnHKoCJrZ
         3OSaCSPNHWY61Xos7PZ4C41hKgP+u4Ul77ohM0WZQOR6QbsTzsH/7S+1JAtAr7ez8gqe
         LyDLtm+KE5+DJYZxJNGSPIN7Ua72ZEl4NGUQZA5wlyWw4kWxSVd50d29ug2kgI9dZIvu
         iJNKSWLEuTfOU75D6Xtyr/VCp6pOBKokAT5x0+prFoUe94HebNeCe4yDQyXmgKt/Ucg1
         YbPA==
X-Forwarded-Encrypted: i=1; AJvYcCVhPk2mZ4C8AKAqul8U5997jq7G26+zIoq0xGqM0i6w1mfmMypkMo84VnyLUgCVI2jWxTLofTsdp058GjZasd7A@lists.infradead.org
X-Gm-Message-State: AOJu0Yys7TsvIBqnPZr76JAVG1vIR++dDr1FDL9p+/C/pt9pRCQEwZAN
	XV/zLkUZ4KUt0DPJf+iGHWzpWKqWJSig9p+j+LkD5crV5JPLCyIW/0qPft78KM5zgxyONfdivne
	QPrRmVdZyzeUzFTdGm254kwp1NX6w4A1Zvyrk4H5N/beNjNfMHa0DaODdKCqo70A15t48Utt3nH
	PZS/HcbKy3LnwnkXzV4JMReU4OcHaXxYLST0it3Tw61+lEuFW2w31GQtiB+x2xExB7bPa46DgAd
	RGxc3ZKEcKpdbzlDaXrUCqUlPK0IUY0EsW5
X-Gm-Gg: AY/fxX6uqvcH0hUYGZsoqpaW2go0G9HP/tEMlQiARnjtWzQ/vkmVIeYpVtH8EjWCRWG
	HqghsWi/YbNSW0RTuXjxK0euuHWPz/tvchP+4Cb945suxk12N4cB3sr+z/fxlqnbAXGIWQ4EEG9
	kXvO8ApnPe+C3TpbeNSl8UzTslomrJJo+lRAi0E+PfD0gZB34Vx/D8jNi5RXA/DjM023YYbxM/7
	Lx2ASmEMnI+3ftM00v5TxWs4SGsh7RLdACTGs1ZNfnEona0VuPbdLjRNAVcqaQ5ipmdgCLbv4KA
	6H7+QaB1W8NvtDS9osLpiCvtn/Cs4iIQ0uSB4tZy80D/W6MTyw2VE1PIUwsxBBqK8a8UHLcTFXs
	zqg1snvvrWDjKW//HYOOm6P3HLecregh34QfrEWmBRcu99LyTWuKKAnjI8VX+i2X/A8ZjbKZm7U
	SI4Yv9AwsofCEvCzKOi9ryZLlLvT45J2YEbN+rA/KlpIVJLg==
X-Google-Smtp-Source: AGHT+IEmy3XeYZ2hmJLNuZ6SkbhP44UZCa9kfYCiWWKdccncwe2k89QB9jV0EfaCucqNu84ub5vPEwQLONDK
X-Received: by 2002:a05:7300:748d:b0:2ae:5552:b5ae with SMTP id 5a478bee46e88-2b17d2e35d7mr10514232eec.36.1767954846431;
        Fri, 09 Jan 2026 02:34:06 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-2.dlp.protect.broadcom.com. [144.49.247.2])
        by smtp-relay.gmail.com with ESMTPS id 5a478bee46e88-2b17067dbdcsm1222319eec.1.2026.01.09.02.34.06
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 09 Jan 2026 02:34:06 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b2de6600c0so1047994785a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 02:34:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1767954845; x=1768559645; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kCeTL5DyL4OpVceWW2dtJZK2fvnfNct2KD6UucHZ0lo=;
        b=YtO8jBOv1bA34u1WS+9DVeEngZp36uKwFRG2tF1iz1kPXFWV1/jag0qhli1KnexEln
         4F6afXtA5amBQTjFOySVfmD/wED6oNFmUmKYWvxr3cyVY13qcQsIFc8/62+uY4FEDki8
         KeIZjeN/4XidPKsTF60fsN7UY9MoRtH9Dtd9M=
X-Forwarded-Encrypted: i=1; AJvYcCWr1vuEe5zVZBrt0pR26Fvwks3O6/J8N3ShNjLMr15jxH3prDbGOINW1fea0hNsnqDxg1osOnzZtjd2R1L1dtF9@lists.infradead.org
X-Received: by 2002:a05:620a:7088:b0:8c3:87eb:f with SMTP id af79cd13be357-8c3893ef6d0mr1155258585a.53.1767954845225;
        Fri, 09 Jan 2026 02:34:05 -0800 (PST)
X-Received: by 2002:a05:620a:7088:b0:8c3:87eb:f with SMTP id af79cd13be357-8c3893ef6d0mr1155254585a.53.1767954844715;
        Fri, 09 Jan 2026 02:34:04 -0800 (PST)
Received: from shivania.lvn.broadcom.net ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890770cc73dsm73691156d6.7.2026.01.09.02.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 02:34:04 -0800 (PST)
From: Shivani Agarwal <shivani.agarwal@broadcom.com>
To: stable@vger.kernel.org,
	gregkh@linuxfoundation.org
Cc: James.Bottomley@HansenPartnership.com,
	martin.petersen@oracle.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	sthumma@codeaurora.org,
	JBottomley@Parallels.com,
	santoshsy@gmail.com,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	ajay.kaher@broadcom.com,
	alexey.makhalov@broadcom.com,
	vamsi-krishna.brahmajosyula@broadcom.com,
	yin.ding@broadcom.com,
	tapas.kundu@broadcom.com,
	Sanjeev Yadav <sanjeev.y@mediatek.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Peter Wang <peter.wang@mediatek.com>,
	Sasha Levin <sashal@kernel.org>,
	Shivani Agarwal <shivani.agarwal@broadcom.com>
Subject: [PATCH v5.10] scsi: core: ufs: Fix a hang in the error handler
Date: Fri,  9 Jan 2026 02:13:02 -0800
Message-Id: <20260109101302.676694-1-shivani.agarwal@broadcom.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_023408_132994_638014E2 
X-CRM114-Status: GOOD (  11.39  )
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

From: Sanjeev Yadav <sanjeev.y@mediatek.com>

[ Upstream commit 8a3514d348de87a9d5e2ac00fbac4faae0b97996 ]

ufshcd_err_handling_prepare() calls ufshcd_rpm_get_sync(). The latter
function can only succeed if UFSHCD_EH_IN_PROGRESS is not set because
resuming involves submitting a SCSI command and ufshcd_queuecommand()
returns SCSI_MLQUEUE_HOST_BUSY if UFSHCD_EH_IN_PROGRESS is set. Fix this
hang by setting UFSHCD_EH_IN_PROGRESS after ufshcd_rpm_get_sync() has
been called instead of before.

Backtrace:
__switch_to+0x174/0x338
__schedule+0x600/0x9e4
schedule+0x7c/0xe8
schedule_timeout+0xa4/0x1c8
io_schedule_timeout+0x48/0x70
wait_for_common_io+0xa8/0x160 //waiting on START_STOP
wait_for_completion_io_timeout+0x10/0x20
blk_execute_rq+0xe4/0x1e4
scsi_execute_cmd+0x108/0x244
ufshcd_set_dev_pwr_mode+0xe8/0x250
__ufshcd_wl_resume+0x94/0x354
ufshcd_wl_runtime_resume+0x3c/0x174
scsi_runtime_resume+0x64/0xa4
rpm_resume+0x15c/0xa1c
__pm_runtime_resume+0x4c/0x90 // Runtime resume ongoing
ufshcd_err_handler+0x1a0/0xd08
process_one_work+0x174/0x808
worker_thread+0x15c/0x490
kthread+0xf4/0x1ec
ret_from_fork+0x10/0x20

Signed-off-by: Sanjeev Yadav <sanjeev.y@mediatek.com>
[ bvanassche: rewrote patch description ]
Fixes: 62694735ca95 ("[SCSI] ufs: Add runtime PM support for UFS host controller driver")
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
Link: https://lore.kernel.org/r/20250523201409.1676055-1-bvanassche@acm.org
Reviewed-by: Peter Wang <peter.wang@mediatek.com>
Signed-off-by: Martin K. Petersen <martin.petersen@oracle.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
[Shivani: Modified to apply on 5.10.y]
Signed-off-by: Shivani Agarwal <shivani.agarwal@broadcom.com>
---
 drivers/scsi/ufs/ufshcd.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index 54e7d96bf..c1f232472 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -5766,10 +5766,12 @@ static void ufshcd_err_handler(struct work_struct *work)
 		spin_unlock_irqrestore(hba->host->host_lock, flags);
 		return;
 	}
-	ufshcd_set_eh_in_progress(hba);
 	spin_unlock_irqrestore(hba->host->host_lock, flags);
+
 	ufshcd_err_handling_prepare(hba);
+
 	spin_lock_irqsave(hba->host->host_lock, flags);
+	ufshcd_set_eh_in_progress(hba);
 	ufshcd_scsi_block_requests(hba);
 	/*
 	 * A full reset and restore might have happened after preparation
-- 
2.40.4


