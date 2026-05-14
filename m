Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 286B8CD4F39
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 12:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1mOb+TPDTl0fQa5/hkU2v6gAp5LJjCUHg1aRjdDAAoU=; b=WCc4sPYHOIwuTzIPx440OeMhBa
	MsQg0IxMCrRnjLdwKm7k1bdc7HofQAIbcqDuMMQM5oKm+T94BmnH/mTNX0d8PVVgdYH94GYLf6c0H
	bjQ0NSmdsKDZGqjZ96GQKw09j5TzCSzLIvWB9o7iOuE8EGtglfrH1qCbajNcVqdvW3msfaxUuKgXG
	Bg3ppaKo2CyHhovEoEbvuuMo6JLwJIVncXIDTpqLUhNBxSnJrgJoF+332WA9AKj8CG740Ff94pHAq
	HCpnPj3DuTfD06ewyne0x6N41uPtNPU3DMnMUpaePnTOKtI4EUNkvNxmWxCxl+ZjKSi/u8YB6FvIX
	Demq2vKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNVav-00000005Weg-42gP;
	Thu, 14 May 2026 12:55:17 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNVat-00000005Wcs-3Ru4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 12:55:16 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-362e50b4641so5119674a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 05:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778763314; x=1779368114; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1mOb+TPDTl0fQa5/hkU2v6gAp5LJjCUHg1aRjdDAAoU=;
        b=Y4JL8HcnwbqJG+f1qNDu1dQ8/Nf3wejedsE6FR+5/3nWEWdB68O7J1HPOSSAGn3Q0a
         7/apWV1L9CnpzuWfRZMTw8H6Z7K9A3JQeayRD+3TgxHFR5Fz3GlC3QdNJxGaYBQPIqX3
         ZpEthZIpXocyK+qRLXQiLv99aS8FBoaEwuppcFC9o/EkjoFO2QDSmtUCsNuUa5/u91uQ
         yD6gTDuqhbBJunUjJ+ukXTgYpZ2/E5lKSHm8x5lLYCKrzlafBu2LokvEYlP/vMAHaBFv
         2Ss+3hXq8iZC7bPRreE/NwV7KTYhFFVxP9pDrPFnFGqjdmXuSiVqrshZbL4rgiA/H9VX
         q4mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778763314; x=1779368114;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1mOb+TPDTl0fQa5/hkU2v6gAp5LJjCUHg1aRjdDAAoU=;
        b=VyTmH49yu1mVux/C0qFdYJO/mWA+CjFIT4N/aAtSmtUJFvkiqiRc3tYVTYGWv2Kao6
         RlpErIar/KJK/qxhPq8Ak+FhQkuAVtnrQ9MF3c/8Tj7ohDcTBEcFjSUgfkT7RbPHxSND
         eCqTTBvkJvbPMZGwPs6Eb0jTZ2vLbC6t+ZUUZiwFIsr/egHb8gEi7Gs4ijZOT7koYMvL
         Caft5ePn4ZDZigA3jW/4Q2yjJFfxZWqdKG+6zsQ+hWoXu4ZcDug2K5Q0s1qXL2ZPf7Oy
         IIzohlie/q9ii1uOCLY+vlqC15mVoqfmzlK0F5B6SZBWlPjT1Rwbj/8zy8tmZsr2s1aS
         oTmg==
X-Forwarded-Encrypted: i=1; AFNElJ8XuMCZgd7rX9Ob4I3aNJ7ppgbysZjtAZELop5d7aF20OfwSDw3PGpe8EEpxBK0+e7unWB6wzEoefeLs+24BCzE@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0/diZVmZzKWjN+0v3XE8yj/lwy4CTYKmZewepJcy03mbtASE0
	Qu5pOkfs2OFa+j7mdb3sngAUAwrT1Mde805DLOWuSoFYuCJSvXdYjzcL
X-Gm-Gg: Acq92OEni7gsXX+7xUOLXWN//e79cjHb1U0EH9oE7+d4XfyqfcBiq5AXhL/nLhFiwIx
	sC0wYxKimaPKrjGe/w5OdSSLe34e5AGIgiDNgubds3ArXYUbu/gdkpuB65lQYdyCA4FY9TXUMVi
	zaFaCwTlTlymJ1H927lBXD/rl+uKryAE5ZHi9/vpszY4S+680j3ijLXMJ2NYYlqglCtH/7zs2kO
	afbAnAd2P6kzuo1UkkQiscjHEI6YXWIabJkeP2qCZzEH3WD5W2y+2v7yFJ5ynZQaRpwmaVi+MpO
	f6NBYABz72+wFMWAw51SqECf41ySsOb1rVayCwvZtGdmftuowA1bEW+sPQi/Yh/Py4ccCwQf4jJ
	c8zWHHLdQjyjn2J5XwBNYfvd6B/7l92D+7kP5J+fb6vhVNzpLX1M5vfoT4yDvUmcF9IkyQawR6x
	xPo82Jjn3a/UvSqJrv3ItqQ+tEPGCki+MRX8o=
X-Received: by 2002:a17:90b:540b:b0:366:4a47:f267 with SMTP id 98e67ed59e1d1-368f3d25591mr8265697a91.16.1778763314268;
        Thu, 14 May 2026 05:55:14 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-368ede204a4sm6464784a91.4.2026.05.14.05.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 05:55:13 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 14 May 2026 20:54:59 +0800
Subject: [PATCH] nvme-apple: Reset q->sq_tail during queue init
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-nvme-apple-sq-reset-v1-1-8931e455281e@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDU0MT3byy3FTdxIKCnFTd4kLdotTi1BJdU+NUI6NUC4tk8yQDJaDOgqL
 UtMwKsKnRsbW1ABy3rQtlAAAA
X-Change-ID: 20260514-nvme-apple-sq-reset-53e22e88c7b0
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Keith Busch <kbusch@kernel.org>, 
 Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>, 
 Sagi Grimberg <sagi@grimberg.me>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Yuriy Havrylyuk <yhavry@gmail.com>, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=910; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=nn573OmNpZxrFI75wUW33iuDsPMZUxrP0CYhUYOBpec=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBqBcYnd58loG/sMZgnDZXeeue5linXTCbmSdFv7
 Usj8arhSQKJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCagXGJwAKCRABygi3psUI
 JE8sEACSOkv0EB3TanSxWricudH11RnYjW39i89ufhg2B/KmfgK6LwCcWQlCS88vsW2iMGH7C76
 jViheEwfPWQoZqBtU3rTlXpOVbxckR2wovC71lItN8M3LCZ8pbWlh4W7MH4bzV7L7cSxBzBxGfK
 vNRFhGCI5hRheRFMOcTNQ7wVUqQXMYfEoss6qaxUZJcUwtq4lA6zsVGov9uGyMhxACrDZn/OtkG
 p3E+Ew1PYIikq40kUgX/2D6+wlmv32nho4ZX/SchpQJOpesTa5IY3mfW998qY6TuW6lDfSFPvXG
 AGPnBsEh6EChTa7vlkwjRhOegY0rKM0WcVy3RUYd8nGoeyrD61W5GAjSH/iuNG3PUWIPOoZCZwS
 bnjMn4Z0N3ivYg9Ce87FNy2Huiq+13T7geSfxZhbRktPjsvNtku3X9H5w+l6Lr487cG7m8hVDN7
 ISYLTNhdKCWWrT11/J212YFd+F2902x1QhhSbZoGa75UACZ3iYtD6IHMIR9chRj/FFcKKkKAVwb
 vZVb1urcw94MuuJlZGZy/RE7CMpADRgx2zQU69YRcp/zPOufafs2ffge4zm98IEwClXrVwP8a0S
 Hb89KP//znnoY53t0c6L6RTTxOUrE9uNRkSy4EeVYr113m7OV/tqdC8zMlY+LMOnqnPbB2WMOPB
 KD7ZiDqGTRNh0BQ==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_055515_886470_00B4D185 
X-CRM114-Status: GOOD (  11.44  )
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

Fixes controller reset on Apple A11 / T8015.

Fixes: 04d8ecf37b5e ("nvme: apple: Add Apple A11 support")
Suggested-by: Yuriy Havrylyuk <yhavry@gmail.com>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/nvme/host/apple.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/nvme/host/apple.c b/drivers/nvme/host/apple.c
index 423c9c628e7b..c692fc73babf 100644
--- a/drivers/nvme/host/apple.c
+++ b/drivers/nvme/host/apple.c
@@ -1009,6 +1009,7 @@ static void apple_nvme_init_queue(struct apple_nvme_queue *q)
 	unsigned int depth = apple_nvme_queue_depth(q);
 	struct apple_nvme *anv = queue_to_apple_nvme(q);
 
+	q->sq_tail = 0;
 	q->cq_head = 0;
 	q->cq_phase = 1;
 	if (anv->hw->has_lsq_nvmmu)

---
base-commit: 5d6919055dec134de3c40167a490f33c74c12581
change-id: 20260514-nvme-apple-sq-reset-53e22e88c7b0

Best regards,
-- 
Nick Chan <towinchenmi@gmail.com>


