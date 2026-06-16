Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4337CD98DA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 11:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yx01qzHYL7zapV7JT7OmgAtxcHhwEqISMkYtU1aw3M4=; b=m77H1sDEi0rya/vq5u31Ouyxj+
	NNj2eQMd53q9UiX16r4G26fa4yobu0VZhqbCaWkaM8UmIcx+A/gwU4qk4H9TxHJh4639yld8KIxd4
	aoB8dcpaTFmBtNejrhdmn+bjKBWnMU4GkpKo4Hr9/K4s+Kjp6VE0+Ye9wL+OptmYYKGZAZ9ZLskH8
	vTkEUfbNCSGWbTKijkFWQERHN1/amw1cAaGzkmBF1PVYSvcwzpu6zVnPkhLwBwZR1EhdoF2bCVMGY
	eww4l/iX6mwc6KZlTwAJEtAV5CEG0nmgiPx/+tfvb79n8e7gn/hadgXkPx73SWf21FDI7SvrKsg9x
	iC/dEyDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZRj3-0000000Ff4h-2ycv;
	Tue, 16 Jun 2026 11:13:01 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZRiv-0000000Fey9-1u8B
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 11:12:55 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-8422a92b6d6so2187488b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 04:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781608372; x=1782213172; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yx01qzHYL7zapV7JT7OmgAtxcHhwEqISMkYtU1aw3M4=;
        b=AMGRRILt5Mo1rOcSpnf35SAzSATzfD9Q7TNg0piiAySVdjzdOFQjrVyPFruQJQfiC0
         bZ+b3JL9QlvEbjKJn04SYdXGqd74A3En51ts68WHjN+CiB60LlvLym/QwLwRTI5C+Ddu
         KDdB9BJI1ux3Y3AHN4f2xlS9knWIToubLSWAs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781608372; x=1782213172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yx01qzHYL7zapV7JT7OmgAtxcHhwEqISMkYtU1aw3M4=;
        b=qB2fr7cNdgEHQT+RhUmAAB43mMfNEoSV6Fl7BNrpgySLziyz6R5o0xFLQXGRqGSfsO
         pDDeNKME+cudA27csj9lagEzzzwXRA2lTCP+rS0N36CiGm3Ofr6PYGZq7gzxO7TWEvMl
         XMzVkkgFJr26h4enEzqwuVUksDw2vpHfrv+wwS7e/9Wdkv0iBTnzFOGb+40TQGU9pb7D
         1jh57oVcHWaPK+RquoM/DFI9+OWHwGjLQUEzHTY+Pp2npbNxS5vbFWHvA3zGVjXzoZwG
         Yf1Vf32sa9eM7j8fq/sHNH0xDE8cAQQSQn8LlqM9V3+S36utcvRHp8IZupsWI6Sx6eBv
         u4AQ==
X-Forwarded-Encrypted: i=1; AFNElJ+r4BGwMNipxR07lFid11V3pBGEn13eP2nECOXwq0IUeVHoKdw9Xv9A+JlUZf2xz84HNXAHCqeJ4uGnWsa8Ur7S@lists.infradead.org
X-Gm-Message-State: AOJu0YznBa0l7SGhNaFfWmhl3numKyS2+Cc7ksg03OywzBaHpaa7Vh4/
	wLff3XmB0VU4hFfi7V9Y56Dc0B9DVSNboDPi56lvFIfsoxVfDGJ9nT+LPZZts92AbA==
X-Gm-Gg: Acq92OHcd8oiagAilG8puo3ociuQbUPWMPX8Zwk8v1sAe71nVSC7G5VyXPCIangvlPG
	YO21SsKpTyX4k5nCCI4r81NXuMfh29qa/eFbizWReoWRS1Y3Dk5yL9d48a5hlvVSTpw3O/DJ9JV
	D9iAeYgEUX84JxpGNIwLW10yE+fN+X8ragMoaNFyrJaLQWS4gEmdxfezc4Rsr63tVJYaMpH6447
	a97URLRSD5T8G/tPF7cWpphDWkngXNqCYF+j9mE912Oj4eNc5Z6nQ1XZg6EZDycCF4yk+/OCCxd
	OrJ3DT2dYUvFkaku1Y6Q4NPHDh966B4Fs21ZJ8rqy+oiWXAPgbxBUm1+ch09OZm7hUmxVzW4OLu
	DXCastp0F0fkSAvwMAxCSnaioCepohGHEsS5wLVKkhSH+vbgAgoQAAihufd/ISGC1XRNKj5P4br
	0YEHpjiIQlQmH2ubxBFoOOymAfzwSPF+ttZw+CH6GfAqB6ZivnKPGeCfXTlB421UbjFazRn5Ks4
	ErocBm3wX9H
X-Received: by 2002:a05:6a00:6f55:b0:842:6344:f33a with SMTP id d2e1a72fcca58-84513e1747fmr2470656b3a.3.1781608372537;
        Tue, 16 Jun 2026 04:12:52 -0700 (PDT)
Received: from tigerii.tok.corp.google.com ([2a00:79e0:2031:6:a0b:fabb:5b62:b85b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b05921bsm12906321b3a.59.2026.06.16.04.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 04:12:52 -0700 (PDT)
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
Subject: [PATCH v2 2/3] Bluetooth: btmtksdio: test for bug IO errors in btmtksdio_txrx_work()
Date: Tue, 16 Jun 2026 20:12:07 +0900
Message-ID: <20260616111224.152140-3-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
In-Reply-To: <20260616111224.152140-1-senozhatsky@chromium.org>
References: <20260616111224.152140-1-senozhatsky@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_041253_668696_F368BE5A 
X-CRM114-Status: GOOD (  11.73  )
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

btmtksdio_txrx_work() loop termination condition checks for
int_status being non-zero, however, this evaluates to true
even when sdio_readl() encounters BUS I/O error (in which
case int_status is 0xffffffff).  Break out of the loop if
sdio_readl() errors out.

Fixes: 26270bc189ea4 ("Bluetooth: btmtksdio: move interrupt service to work")
Cc: stable@vger.kernel.org
Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/bluetooth/btmtksdio.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index c6f80c419e90..d8c8d2857527 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -574,7 +574,9 @@ static void btmtksdio_txrx_work(struct work_struct *work)
 	txrx_timeout = jiffies + 5 * HZ;
 
 	do {
-		int_status = sdio_readl(bdev->func, MTK_REG_CHISR, NULL);
+		int_status = sdio_readl(bdev->func, MTK_REG_CHISR, &err);
+		if (err < 0 || int_status == 0xffffffff)
+			break;
 
 		/* Ack an interrupt as soon as possible before any operation on
 		 * hardware.
-- 
2.54.0.1136.gdb2ca164c4-goog


