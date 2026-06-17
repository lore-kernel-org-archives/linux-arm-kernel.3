Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76826CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 06:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OjucF5goefZfuxikv7tCuZJMVpoPtgqO36vnpR26lfo=; b=FTb9D/yDh7+2+Y9+mdPUYMf4C3
	YnioVgTMq2ldFiODjvqNqcNXf6fDvZAFL7u0eriPTG2vAJJ9zxwG5z0WuBTiyZj5vMwaTeALmsKHv
	xut/StXHLHq1FqN/eE5A8zzUEBRCRFXBG6/PaAW/fokFDMfuXSjNyGCeRiQ4GmjZcWAW/FC5z3/Ae
	9YEgzD0/m1O2JmSOWmgmqTYpfdD482Vjz+IezNQ6hROa+4hnb8X3FnJQFjnYb1ex6Z3fmBN5JUxvi
	2BUtAndNl4zYIml4XhCLKshb/rCkRUwLGe11xBfCCxuIt3UkHbSbZgKhcVz8NHwcB2vIGfeH0KauF
	csCtUDIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZk2G-0000000Gjdj-0U2o;
	Wed, 17 Jun 2026 06:46:04 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZk2B-0000000GjYG-1Og7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 06:46:01 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2c0b9328c4aso40221915ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 23:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781678758; x=1782283558; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OjucF5goefZfuxikv7tCuZJMVpoPtgqO36vnpR26lfo=;
        b=GFrwR0CCeA7jfl1KqWtM3wbMAHY97KOuPCkGKkuaTSGkld5jUCe6DShEGeXcWu/UbR
         2p0QJsc15Bwjm4vwruqWmCcOHVNFO7gPDJrkDaLyGa+6eFIyOVn35fVraC1frOw2867y
         NTw/kNtLqUNh4L1X9eO146Fb0JBmRcHKIN8Ac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781678758; x=1782283558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OjucF5goefZfuxikv7tCuZJMVpoPtgqO36vnpR26lfo=;
        b=fGCyG64xmvTWpN7oPZuCtlO0spaQrS68AzDY8dMixp9ZSzrNgVWcHi99i6tpDECTYp
         MMHbjgSuygGMFi8MOvNbGfajfmjRVP+oAd/6ZZKrFCbvegWa4uDH6ZLI99GYQCPb1oQe
         vBHS6MBLU2kqjWWnDET/7qW1hVhAyprSRhKRwC6/Qgx+O5GZz8d+9GOYUa70YEfcAnD1
         zpzIxt3kHAESarjE87K6rieIjxJ+UbZOQzhS0X4wCuabgJkACytLu0WCZZqmt4rv6+5Q
         2SG00N+AKb6WerHKB8JO/CyUkHwue6Y7ZN3Qsi0RS7/QF3SurIDL+O4DCO1nUHHKT5OT
         cBfQ==
X-Forwarded-Encrypted: i=1; AFNElJ/J3GsfHqgo5IqH+5Wb/SAJrrK0c0mGP8eLwP8OyZgv5AHmaIEl7cIEeOSiZQ/MaljLrtr35GF3hQF2INlcVRXS@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8DSc+ecaownwgRnxHT2ZIqEY2ha3TJjDOty1aw6sTk1PMNkbr
	7TIA+r8Z1iQN/nf7Rg7NlTAL+StwdbA7aieg73J7CMqwgzc9H1g+9t5k5BaFbUFcTw==
X-Gm-Gg: AfdE7cm2rdj8NuZHPg7nqf/nA/TAkNFeQPuOqDRmgb0GeqOaU+FrlBj+jtdaN0zpIPW
	x1y89WmFcGTz7irFzkQRauVRigvkDBdgOu8NrvTwNuBOTMqE2gSNgWVXYF934NOvTlVc/ZWJfmP
	0rg+4/yzcXmkr6uvOfB2U3yIy6M5Q+kN8ksTg1/raMXMoV4K8CdaesyeiHpv7MWfTg3h7WOcowr
	0ho4jCKyFV2rGqteiYXYMRCacjfJBlPAbUM0aYYJuqyYszU9HTQwaM9WDSRWzYF7qurviFSm3WT
	ISIoiKVK0+EkPQEnCuV1GP2huJosa7AqGnBYurYIY8b0yoSyDxBsmtJ5LcnFGYlJ2nxg1GEMNF6
	6qfpwXGQrgjW+XuIs/tNkoc1amwUiutwHRsAnG9wGtnoKSrR81467392asl4CrnlfnGLuPwePfU
	gc2g1LJOE9ai0eJzMU+F8daq5Vfj5WUAR+OQYl7LSb4EmuYO82q2e/ecvmWcWEsXvGwRKNpZ8GA
	f4bPA8aqUk1oA==
X-Received: by 2002:a17:903:1b4d:b0:2c6:9358:3ad5 with SMTP id d9443c01a7336-2c6bc20f6d4mr26872555ad.17.1781678758360;
        Tue, 16 Jun 2026 23:45:58 -0700 (PDT)
Received: from tigerii.tok.corp.google.com ([2a00:79e0:2031:6:20ef:efdb:f2c9:836f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c6af931f19sm24365675ad.74.2026.06.16.23.45.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 23:45:57 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Mark-yw Chen <mark-yw.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>
Cc: Tomasz Figa <tfiga@chromium.org>,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	stable@vger.kernel.org
Subject: [PATCH v3 2/2] Bluetooth: btmtksdio: call cancel_work_sync() outside of host lock scope
Date: Wed, 17 Jun 2026 15:45:32 +0900
Message-ID: <20260617064543.574704-3-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
In-Reply-To: <20260617064543.574704-1-senozhatsky@chromium.org>
References: <20260617064543.574704-1-senozhatsky@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_234559_371467_0420D3E7 
X-CRM114-Status: GOOD (  11.77  )
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

cancel_work_sync() should be called outside of host lock scope
in order to avoid circular locking scenario:

CPU0					CPU1
					close()/reset()
					sdio_claim_host()
txrx_work
  sdio_claim_host() // sleeps
					cancel_work_sync() // sleeps

In addition, when txrx_work() runs concurrently with close()/reset()
it better not to re-enable interrupts by testing for BTMTKSDIO_FUNC_ENABLED
and not BTMTKSDIO_HW_RESET_ACTIVE before C_INT_EN_SET write.  However,
btmtksdio_close() clears the BTMTKSDIO_FUNC_ENABLED too late (after
cancel_work_sync() call).  Move BTMTKSDIO_FUNC_ENABLED bit-clear earlier
so that txrx_work can see concurrent close().

Fixes: 26270bc189ea4 ("Bluetooth: btmtksdio: move interrupt service to work")
Cc: stable@vger.kernel.org
Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/bluetooth/btmtksdio.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index d8c8d2857527..207d04cc2282 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -625,7 +625,9 @@ static void btmtksdio_txrx_work(struct work_struct *work)
 	} while (int_status && time_is_after_jiffies(txrx_timeout));
 
 	/* Enable interrupt */
-	if (bdev->func->irq_handler)
+	if (bdev->func->irq_handler &&
+	    test_bit(BTMTKSDIO_FUNC_ENABLED, &bdev->tx_state) &&
+	    !test_bit(BTMTKSDIO_HW_RESET_ACTIVE, &bdev->tx_state))
 		sdio_writel(bdev->func, C_INT_EN_SET, MTK_REG_CHLPCR, NULL);
 
 	sdio_release_host(bdev->func);
@@ -741,6 +743,8 @@ static int btmtksdio_close(struct hci_dev *hdev)
 	if (!test_bit(BTMTKSDIO_FUNC_ENABLED, &bdev->tx_state))
 		return 0;
 
+	clear_bit(BTMTKSDIO_FUNC_ENABLED, &bdev->tx_state);
+
 	sdio_claim_host(bdev->func);
 
 	/* Disable interrupt */
@@ -748,11 +752,12 @@ static int btmtksdio_close(struct hci_dev *hdev)
 
 	sdio_release_irq(bdev->func);
 
+	sdio_release_host(bdev->func);
 	cancel_work_sync(&bdev->txrx_work);
+	sdio_claim_host(bdev->func);
 
 	btmtksdio_fw_pmctrl(bdev);
 
-	clear_bit(BTMTKSDIO_FUNC_ENABLED, &bdev->tx_state);
 	sdio_disable_func(bdev->func);
 
 	sdio_release_host(bdev->func);
@@ -1295,7 +1300,10 @@ static void btmtksdio_reset(struct hci_dev *hdev)
 
 	sdio_writel(bdev->func, C_INT_EN_CLR, MTK_REG_CHLPCR, NULL);
 	skb_queue_purge(&bdev->txq);
+
+	sdio_release_host(bdev->func);
 	cancel_work_sync(&bdev->txrx_work);
+	sdio_claim_host(bdev->func);
 
 	gpiod_set_value_cansleep(bdev->reset, 1);
 	msleep(100);
-- 
2.54.0.1136.gdb2ca164c4-goog


