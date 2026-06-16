Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0036FCD98E6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 11:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=on8hqRmuM/Ky2/WGRUWRuZiJutnnNXtBaovb+8l2mm4=; b=Q1UVCe7cDEWBrTRBKOo6HFk/xK
	R9AxtxdyYRqOyKtehUkvJ8r0bSMzOiF/Xil+rSycaVwEhgF/ijct91rGe+/vExMfNQve6mgl6EUDk
	UhixAX03lBb8TSQI8TzvrmFxP/o820yXK3/pE5UuWP2C6TlIzsuE7fPeUxbvCcYNOlbMv1fmiB24J
	UBKdoWFGC7zBWXNzu+XUCeR7xAleWVpoRHtvLazTHKyb5Dw2SvL7UnhI+12R+EyEoEg36dY42iy8o
	EXcg93IanT1DVPiiVHCXbOSTVGklu1EW1Nk2PpEDGRvMeVSmIYTM2FEMtj/2m2WwtwdG24hVdMZ6h
	Nk7AIqNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZRiy-0000000Ff0t-3XsB;
	Tue, 16 Jun 2026 11:12:56 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZRit-0000000FexK-0RtG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 11:12:52 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-84229481d44so2173281b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 04:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781608370; x=1782213170; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=on8hqRmuM/Ky2/WGRUWRuZiJutnnNXtBaovb+8l2mm4=;
        b=Rlaa/1SC7V25CJDohuWbBazfpYbE/s3fdSL08wCDveCcFsUwCz/wjP/q8AjyckiQfW
         Yjbzi0O9WfRF7D1tz1CQrudwfPrfe71MSXKed+cFitgLNa6Y1TbJALt6Va+2nT5uuP4h
         og56xydn+kSna3PYQLTX2O/6voNBLoQtLYozY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781608370; x=1782213170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=on8hqRmuM/Ky2/WGRUWRuZiJutnnNXtBaovb+8l2mm4=;
        b=TvclBP7w/YzKioet5KWlMAXHkP9RnM1daDmLvWWB6vryjfca6ifrODe+xKnVRBCMLd
         GYbn3QiEJ13UZRC6N6Df+r27SIzC8nwqZj7Q8orHJwg9S0JlzQLJcKIa6aRuTUI4FMYO
         pJ+IBhcPZ+OfbTwCnYxT5SgXrCmSvQQ9IrdSbyFc7NH5P0YuLvSplHOddtZTOgIQApw2
         5lxGHEsB/88HsAclDOrP37970AfQrAdQm+MeEUJHx3+BWYhxzAV9FG4mQZSjrC6/SeW2
         gdwp+QVeo1QMfntMG/dZz9Z3M3yATiNk9nXqhT5/jHjhT+3i/3mtO73hm30qKzBNPt6f
         fMyg==
X-Forwarded-Encrypted: i=1; AFNElJ8rSHpEDjv/Jnh/mK/PkEnTK+HuaLDQ92jFZONV5qU6106ptrcpzZU8kDCGCPd9aNdEfO/1B2SDrS47GZxAU/n+@lists.infradead.org
X-Gm-Message-State: AOJu0Yxm5PXCCJFCh0ac2g02FYeAld5527IYMgMoRdGs6beypHRQCP4v
	PApTlVWy6DZhAbbfqm9rZ3Rj7soybkkCOB8/KRE1mQTOO3ML1L6wQ91i3BopTawnwA==
X-Gm-Gg: Acq92OG0m3IPDtEm9DJcpkSKGBj0fUbXS561tyv/jCi9eXOLpUOutjWPQ83e6yZgN+0
	SF0YLEnZsgiHMBdtsK1YYTes8v0Lf4NNav6etYw/cla9ZxhmUPMptOBduujC5+oowSjOF5LZyE5
	ZKBFeDjRDaRHaZ20VL4cUSaGMOGv+GJ2GgHoXGouEnFDXfMd9XuGrPRR3wGCHt/feUDpB+2ueLk
	ccw3RpeT4HQWMPXuYEgx8Bms0Ipkx8q+k27tJbDP1LK9qeZ6v1s+0GZbJMxHBWorSYniT4qgDMA
	yvtlI3UaVn0qu9eL2wRE3QkzgHxivZhzz5Uv5MuZxsNSQYIT9M9qOJww1qVyckWGmdEpUcmmIMq
	C/AXvb5Vip4eEKOvD0oQl3w5K26MveqQg/W2tGPj/fnZ6qVRHsFPUvB+Bdmqbl6w90zdjmdEggt
	ImEv9zctgGk7nd4n9CHfwquptCrnSR7JQQnTBcv+NWkWTZC4ZHK0lDjKZCuzL82q98CSiOuYfot
	h4fVZfy6qJ6
X-Received: by 2002:a05:6a00:9285:b0:82f:abc8:ae0 with SMTP id d2e1a72fcca58-844e19879d5mr16162588b3a.17.1781608370193;
        Tue, 16 Jun 2026 04:12:50 -0700 (PDT)
Received: from tigerii.tok.corp.google.com ([2a00:79e0:2031:6:a0b:fabb:5b62:b85b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b05921bsm12906321b3a.59.2026.06.16.04.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 04:12:49 -0700 (PDT)
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
Subject: [PATCH v2 1/3] Bluetooth: btmtksdio: correct btmtksdio_txrx_work() loop timeout check
Date: Tue, 16 Jun 2026 20:12:06 +0900
Message-ID: <20260616111224.152140-2-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
In-Reply-To: <20260616111224.152140-1-senozhatsky@chromium.org>
References: <20260616111224.152140-1-senozhatsky@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_041251_169240_93AD6E8B 
X-CRM114-Status: GOOD (  13.86  )
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

The btmtksdio_txrx_work() loop is expected to be terminated if running
for longer than 5*HZ.  However the timeout check is reversed:
time_is_before_jiffies(old_jiffies + 5*HZ) evaluates to true when
old_jiffies + 5*HZ is in the past i.e. when a timeout has occurred.
Using OR with time_is_before_jiffies(txrx_timeout) means that:
- before the 5-second timeout: the condition is `int_status || false`,
  so it loops as long as there are pending interrupts.
- after the 5-second timeout: the condition becomes `int_status || true`,
  which is always true.

Fix loop termination condition to actually enforce a 5*HZ timeout.

Fixes: 26270bc189ea4 ("Bluetooth: btmtksdio: move interrupt service to work")
Cc: stable@vger.kernel.org
Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/bluetooth/btmtksdio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index 5b0fab7b89b5..c6f80c419e90 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -620,7 +620,7 @@ static void btmtksdio_txrx_work(struct work_struct *work)
 			if (btmtksdio_rx_packet(bdev, rx_size) < 0)
 				bdev->hdev->stat.err_rx++;
 		}
-	} while (int_status || time_is_before_jiffies(txrx_timeout));
+	} while (int_status && time_is_after_jiffies(txrx_timeout));
 
 	/* Enable interrupt */
 	if (bdev->func->irq_handler)
-- 
2.54.0.1136.gdb2ca164c4-goog


