Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD3C6CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 10:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mrmu7Ax8Tjv7DXY7cz3wQn6QU0gYid8cSWvbdHALi/M=; b=Y5wAfb2ielGhhE8F81c7wHw1K9
	QH7BOL4RMFEAu5QzNUWjYhWLf/0UiN/W6oFyO+zWuGKWz//ei/AxfKO45l1QVKVncx5qvEShyt+Q5
	XnCeVIP354RctA1wcYRsd5QQ19W9EsGlALLglukdusEf90yj+j956CtjyP311FZcJ1zpTJAFIyoUF
	fc2eh432IwZ0F4EE2IwBWtUsPeVaY2npklzjmmfNU5s4u3V9NVlz4FhW+pDUgVU/rV33PCSO45dJ7
	vJ2oY7cAHngWVPJrXYB1vu/ctIqRAH9aj6/jru3VeHHktcSYHZW3KvBqiINXNEZ4muWJ6OK616LKh
	ga4QWm+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMO6K-0000000D8bF-3qwg;
	Mon, 11 May 2026 10:43:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMO6K-0000000D8at-1eKq
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 11 May 2026 10:43:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=mrmu7Ax8Tjv7DXY7cz3wQn6QU0gYid8cSWvbdHALi/M=; b=j4691EhBjss8rVHSl7QwFJVAJz
	JmvImB5FD3MiE3XLEfozZ3yFsr1uwSgllH9RtuOHbBsdxQZ7HAih8L1WLS+1ZpLp0emk8vLwSDHrA
	u+qMqOEoWRU811BSdayGwP5osl1sYF9Nb96f000HBcY2hTf6w2R94sXi5Wu67KHQ0IqhLwCxFdDqE
	VIQ/xyaGv0q228j6PdLY4AwlIKN+RMfurejJ8gPREwqiwO4N+AUzZWKnAPdUI0OHD4TWZFHxTGBKk
	CptHKJdXV3+INJGwXmnGyh5U/b3By41sCe/EyGChlDj01naCPmddVvUa0F5Nxpglue/iB3tPUA8vJ
	OpiIWPTQ==;
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMO6D-0000000BMSo-2HfP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 10:43:00 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-367cbac9c37so1179427a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 03:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778496174; x=1779100974; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mrmu7Ax8Tjv7DXY7cz3wQn6QU0gYid8cSWvbdHALi/M=;
        b=HsqmKcITvLEFv31eo7bxojlT+oOczriSnbmFb+G4VgNJum5UVFRZgYCzbl/+UgnpGu
         NJQU7ZWPyrXQzHsVYZowOvCTIyUlEtKa1qUy6azf2NmWhgp9Etv9romdGsQG9rbkD/2A
         lekMnNtH6L0lzVAMH9lsfL+M9Uyg2sWnueZ4Oy/CshhUwkkxF+9Y+DvYHTvcgIxPkyK+
         zfvl8Hu0eGUIy4zge/0a/AQ/NMYaKtKq7IRJ6YuDsWz9mJVYOR2ZsGUulO7XOzu1zH6F
         6CnHv0c0EywYJqaQtdPNpm1nFfnoXPPrFzSbcdHqOaHu18Kg+ZMK7MvdC8mWmDaV0JCr
         3yNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778496174; x=1779100974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mrmu7Ax8Tjv7DXY7cz3wQn6QU0gYid8cSWvbdHALi/M=;
        b=UVSlVBcabA7iXJ+KmICYN/1L/tEC4fZiK/Qm0uUEZzs/P2fEf79FwRc1hY08Wh91+G
         fFqkPgdxSp7ciJV8+CFZ2pzIHM+DEq9uNjys6AInWH2jCXVkcWngy1oIQJTxrNWBmKjm
         R7uTOLFNdeGiqqJbxPkvZuoYEmuc6dt+FiwQvafeQmgpWtf5nAALfMNWoYr5zH93AU7w
         77K87i/S5Gk3AzWGtcUQs3XHd2o8Ca9B2X+MtFrIPRZY8gaS1S2MFkaqHtUgQVbqUO1f
         mRXaMSR8ZscvQeqMlMyLiSX0wxvS0XfmVF4ydRT6VYjJ2wujUa/CzMvwmv48S4F0a/9o
         VaCQ==
X-Forwarded-Encrypted: i=1; AFNElJ/DDif0I80xDhdUT4s8hO9JawZoFwfb5JnuxRJWfpJSwMV/FPY2TeCG9XzN+ocMFDCLUZyxzpCsJ5n4+DVILP+B@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1d1dsxH7JcTn6wGJUJmBhUMfn9rQ5WaVjUsOU0s6nhmfJClq7
	k71cDnsBtR6iFEYL4BgJXQHx4W7FODvL0zHrRppOfbsQ93yhmTvqIEx0
X-Gm-Gg: Acq92OFi1lv8f52T0w64CX/o2P41UzVZmhrbtnhtTEwcE2YgGxzKSkC4bLQwF9un+C0
	DBLEPotzLi7v7SULp7WI1PL+pe3mAz/FFqrBAYlZJu9Pn3dRJbJ5coRi6AT0VXIztGRq/m5x3Hw
	Ny5jzBJrI7wQxVER3vma5raXw656xPphS5/QpPH6OqlrR3hbuiShN6cj+mK6Zek7SiKw6NemmRn
	CLDmU5DNwWBGL4XG5uO75ElZHBoXU0tui2Ekm8MyQoPI8K6S1TVt/tnfNPgctxUsDW3nZvi6ZfT
	MVCY+tNEKQnu9bEqRinRqpoYXCiI8IktSy1e640QH+WahGhNulAGhQ29B6QOZAbWyv5gKY15SNA
	z6Kt2kQyd0Js6JADbC+NBxYyn9URPOY0KQufJPcZKYS/ZWLRsp+pfqWVxF8unV2jyHW7tdD74OQ
	9ayKBJTlG7giRby2CKTJyJZB/eHj4u
X-Received: by 2002:a17:90a:110f:b0:366:1c9e:99b7 with SMTP id 98e67ed59e1d1-3661c9e9b87mr11161538a91.25.1778496174159;
        Mon, 11 May 2026 03:42:54 -0700 (PDT)
Received: from nuvole ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d684009esm7533423a91.11.2026.05.11.03.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 03:42:53 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH v4 1/5] media: hi846: fix hi846_write_reg_16 handling
Date: Mon, 11 May 2026 18:39:23 +0800
Message-ID: <20260511103927.279550-2-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260511103927.279550-1-mitltlatltl@gmail.com>
References: <20260511103927.279550-1-mitltlatltl@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_114258_780182_4EC1C15C 
X-CRM114-Status: GOOD (  13.32  )
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

hi846_write_reg_16() does not clear a positive *err value on success.
pm_runtime_get_if_in_use() returns a positive value when the device
is already in use. When hi846_set_ctrl() passes &ret holding this
positive value) to hi846_write_reg_16(), the function returns with ret
as is, the positive value propagates back as a return code, which
callers interpret as an error.

Fix this by resetting *err to 0 only when it is positive.

Fixes: 04fc06f6dc15 ("media: hi846: fix usage of pm_runtime_get_if_in_use()")
Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 drivers/media/i2c/hi846.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/i2c/hi846.c b/drivers/media/i2c/hi846.c
index a3f77b8434ca..7f069aca0fce 100644
--- a/drivers/media/i2c/hi846.c
+++ b/drivers/media/i2c/hi846.c
@@ -1271,6 +1271,8 @@ static void hi846_write_reg_16(struct hi846 *hi846, u16 reg, u16 val, int *err)
 	if (*err < 0)
 		return;
 
+	*err = 0;
+
 	put_unaligned_be16(reg, buf);
 	put_unaligned_be16(val, buf + 2);
 	ret = i2c_master_send(client, buf, sizeof(buf));
-- 
2.54.0


