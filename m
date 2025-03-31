Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D663EC3600B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 15:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UQs6q6PQtFgVe2Al3n7AGyLmvRZf/U28ub434FoB4Us=; b=TmQJSf9cjyIeDy4+eGeivipCUo
	EIyMf/709hUw50yiwR6I8KuCbicM/1GJLstHIPvVHECtbSNcBnmDZWiAkXUVvZ6r//jROHWFAIDdc
	myxj0hi33vQTes8s1rSQgn9ZY4CyyZEZifw5mxVhf+FO+kbTDTwWesmegF0zC56KkvoTrAKxBF3Xw
	MZEyFaSu7gpfM1GXDuff779C01NYObFh8DFcfR9BUAlSJttFsle2JsdIfxQBRZxjz/nsPGOmHrnrF
	dokvCYGwIglW63NRU+Oh7zNoU5r7qSJR3aMWxbxvEfyl/ppUX37P/8D3JuK9dHd+hj0jkeEi99EZf
	Q7C4pUpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzHAL-00000000pKb-1zAN;
	Mon, 31 Mar 2025 15:35:09 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzGon-00000000iyK-1KF2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 15:12:54 +0000
Received: by mail-pl1-x642.google.com with SMTP id d9443c01a7336-22409077c06so125762495ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Mar 2025 08:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743433972; x=1744038772; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UQs6q6PQtFgVe2Al3n7AGyLmvRZf/U28ub434FoB4Us=;
        b=jwUlN+BlWUtPSWpcTru8HcDUPvVC9V29JxoXphkorLnNNJ7DWtegqToc2D9tpKzLmT
         OCsMUbJ+CiUHtermyBMmdxjcjx2HFbV+et6oTn4rKxF0KWtNN35wevHSKwlDuBgzMLau
         F89L2g+l0lDlmiTYusEkTUKBP3Lzr3PbCvi8Np8K35kJlNCsV3W8RaBmViXxGKkcSWya
         0aBOS5tkDF6UOhQTo0yqvsTpF75WDsjMZGBt15Wggh03IlBd5PZf6E+ADjCItxtw9qsG
         KFHBq+Q7LzPkZdm08Bhf2wAChDbs3PMs95oWUcGZFUSq/yp+arX5mOV1x4h5M0RfqZjF
         P0Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743433972; x=1744038772;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UQs6q6PQtFgVe2Al3n7AGyLmvRZf/U28ub434FoB4Us=;
        b=H3cMDwD+wxHfhc7nwJDgRpMxbtjeeu0zBvVHBMm/0SmjP7QWzTJE/CRwhAaqdSnqMK
         b6/mZKGejGDJPCoupJLVXKkFHOPAsLTehw8YwqG2YxV3ObeKMnETDgVu2miHTNWR7DHv
         gPsREurgY6G0MrZwi9ZW4cvDX3zBasH/rH/wfx5QGjTT1WyIGA+XOG+bCypXm96bG7tT
         bcUgQuSYdtJ4CVn/4xwSr+eN25tnmtiJg0sJYbav1Kcd4CJiw7zjCZyqjy5H7enzNq/0
         zQEjuulrg47Posc5ar/55SzY0mXd2VdAoDxosf+wevaz71IN3H4ot4IW5mrafEOJ+9MF
         39vQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXu6hWgbSNT9qYPHKK9oAgEym3KcQtZx/sv2PphDuN9gdPOpN/8WK2J6MLH//LL79iQwmE6LYOkr6NiDjiI1tC@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7nZtHKBWO09YSiUXw1MYtwW2RlJtM3qsinioFOw2Glbj1G87c
	2wLjWnw2LgbZBVY5d7SowEYq6LSOGrLQrR6s3703PAS/wZLU6SYb
X-Gm-Gg: ASbGncsZ1LUNuwEt6GjC7K68JQnnlLj7Xl5o7mK/rl1DxppzdltON7CH8xru4giJ7Uq
	+o/njWd7zrrzwf7maLGd766TuW69gus8+piojPL8NavB+ocGcIsQUyLyyVBzg+GnrYDE78tIBD+
	OLELMQD3jTCa6xQFOr2Rw9xH4DYHdSq6FHVY0H+AOi3zhAYLqqGxTXjyZUgwMDRB55EDVUOmDeE
	gWifomB6Rhyyy0WHb+Ju9plyaoGdxpZfOuH4O/xHaSFU7amVg+13nMpIv3PbOkHu/PlykqU7457
	W3ZkZsUNzwL6EhpqOXfPNmeULIC/VvLFupJ0YfCwt6V+h1ol/QUAtpVCuu6p+JiVYTLWaXdJY/d
	iY74MXQ==
X-Google-Smtp-Source: AGHT+IFu36yXNBcYaTdIut4XpIU2h0wu30Oj49ASXXvk6ejJjANWdSL5zYgJyYHCGhMg5H3r4F/Duw==
X-Received: by 2002:a05:6a00:b8c:b0:732:a24:7354 with SMTP id d2e1a72fcca58-7398033f3ecmr14860283b3a.4.1743433972309;
        Mon, 31 Mar 2025 08:12:52 -0700 (PDT)
Received: from henry.localdomain ([111.202.148.167])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739710684bcsm7033689b3a.113.2025.03.31.08.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 08:12:51 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: bsdhenrymartin@gmail.com,
	u.kleine-koenig@baylibre.com,
	arnd@arndb.de,
	herve.codina@bootlin.com,
	gsomlo@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] drivers/misc: Add NULL check in aspeed_lpc_enable_snoop
Date: Mon, 31 Mar 2025 23:12:38 +0800
Message-Id: <20250331151238.13703-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_081253_358913_F33764C5 
X-CRM114-Status: GOOD (  10.23  )
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

devm_kasprintf() returns NULL if memory allocation fails. Currently,
aspeed_lpc_enable_snoop() does not check for this case, leading to a NULL
pointer dereference.

Add NULL check after devm_kasprintf() to prevent this issue.

Fixes: 3772e5da4454 ("drivers/misc: Aspeed LPC snoop output using misc chardev")
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
V1 -> V2: Removed blank line between tags.

Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
 drivers/soc/aspeed/aspeed-lpc-snoop.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c b/drivers/soc/aspeed/aspeed-lpc-snoop.c
index 9ab5ba9cf1d6..376b3a910797 100644
--- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
+++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
@@ -200,6 +200,8 @@ static int aspeed_lpc_enable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
 	lpc_snoop->chan[channel].miscdev.minor = MISC_DYNAMIC_MINOR;
 	lpc_snoop->chan[channel].miscdev.name =
 		devm_kasprintf(dev, GFP_KERNEL, "%s%d", DEVICE_NAME, channel);
+	if (!lpc_snoop->chan[channel].miscdev.name)
+		return -ENOMEM;
 	lpc_snoop->chan[channel].miscdev.fops = &snoop_fops;
 	lpc_snoop->chan[channel].miscdev.parent = dev;
 	rc = misc_register(&lpc_snoop->chan[channel].miscdev);
-- 
2.34.1


