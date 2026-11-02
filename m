Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2E5606A326
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 09:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Y+8K1h9a;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZxAKjSKD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=xFCr7dXRwZlmmMVL8y3jBXLGA8axSy+kDHY18LbXjXQ=; b=Y+8K1h9a5g1Zho2jU8LU3iRhqT
	HptBcxhdi4PoC5Sa4ic0W9zntHWqFPcC6n4coOPHRLBIBraLD/23VHCN+Tqa5GZhUWH8ImW8lAu9D
	K90YwWgb5cQ6Swcm2VAYL94pLmbUppWJa7brvTY36S3uYhUtytgcKFWG0ttaiXWbMcH+B0/stqIkG
	tDkImUBMFS89Lzzmi93BF4RPe6ysdMBWDO7JEBT23HnOUPFSNv78Fn4fLUs7Sue30pOz0HEyWu4OK
	s3FnJpIiS79nBey6G8pGcWWejNR0e5yZR+FHfcmabdOVfyYjk2z8xRAZYZXsXnbDihyBUqL8IwKq2
	+6i4m+ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNoPI-0000000G1gM-05Ry;
	Mon, 02 Nov 2026 09:32:48 +0000
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNoPF-0000000G1ff-2bwV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 09:32:46 +0000
Received: by mail-ed1-x542.google.com with SMTP id 4fb4d7f45d1cf-6b1f31c63ebso6113901a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 01:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793611964; x=1794216764; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xFCr7dXRwZlmmMVL8y3jBXLGA8axSy+kDHY18LbXjXQ=;
        b=ZxAKjSKDOUtXCWOPjSyviZxJacooerBZ3w8AIdJEmHxNFjXWnxQBKuN75uKEGuKi4O
         HnxJZgvdifNYv6G+DjnoC7aWX4mpDCRBiRy5GBcCHjwdylmk0MQre2AlHs5q4jKk5TZt
         jIzLsR9MfuVckXVx/BqK0EVC6YPxXV0caCFkBhy8bHeszWgOlsu8mnJlOq2tOcKW0nng
         efxPUcYGkBDcMcAIPPmfiKEXWIw8Wm2d2N1nvuwoKn2eBFQu9KxazMI6OneRlx4wxiqB
         uLiU/b9N6kEpj0ZOYAftBirY/Nf+e4fJ3qUTW64YvjHt/91fj029BnXy7Q3vGiBmilDs
         Ef+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793611964; x=1794216764;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xFCr7dXRwZlmmMVL8y3jBXLGA8axSy+kDHY18LbXjXQ=;
        b=kDCxP5wDBBItBSsisTL2fh54PUsizayJ8VEjd70lSnXvv+NiRmLkL0Ingqh3ntdzx7
         mQ/g62Sm5I58RIegFZcPGQt0gCbwsUjYPsNgzSPZRhgHqXiA3XxZgb2ITkcdclJyFpQY
         OEL6geGZuOzaa3kQonP1f1gOf3Ovkr38nvIq7j2WRgg8BGYxla+r0TMv55fZOAvG5Nzh
         TJk0mlO68hn90ST4SVQlAH8DK/J3af5PCC9HHRoqSymhLa500YMX1T00GLD+7DanrJ1p
         dInXyB5RBKRO5nj7V/0WhrywlovL/+3Y+EO+sNJylSXWb/u+ffVUNcVUb4wr/krnHPDP
         1tcg==
X-Gm-Message-State: APuU4Z/SCUFL4mEXt6kWeibdT+4BIKE7NaGHOFh41PpqIglK9Vf7SCvS
	DsLutZ83fw+sSFlPmzkVlwO+ipSL6A0Oa/he1Pwbx+DdfYVhpT/e63qT
X-Gm-Gg: AYBFou1yVBOYwJvp43sbzYh1FZyPR/gtN/jODmJGoUGHeBt2+kPQeWxjokz2i/YDJcX
	K2VnkeojpkHDObd2x/FRLrzIufNpnIpfRqF9TjRmR9dFLyo/V2JW0gtDc21MVU8NR/xYcfcgvBi
	TnarDAMJwW8/uCwcYIjP7yY4M1SCQsb/v9fqCeCB0aTpp0W7Br5VM2CiPQ2TliognT+IHe+0d93
	TkiLZj2X1Yoba9dj1BZIkXOanVeWQ0a+mVFbCIQx1OEbaSUUQgH80e0sNlQ+5k41LDh987SKGYa
	AyxDkGhYUFzxLQudqhXRo1l3BOlcA6pB/9o5Y+6W44dw/9owvJATyKHi69dzAYXpYyNQt6FWh/f
	3p706bQcXsLAFPc+bYXqyNpphBnM1xrfBwNOrXJ8GZVQ/ixkQ9QvpM5mZ9y9hSx4I3vMjGvGRcx
	DzW0iS2OG268fNebrQgOIoWZ3P1CfUXngc9SB+am3eqwp2BS9LOBl6iuo8IVCbAl8Uc8Ad2X8oX
	yFqttLUvvODum9xzlDdUajs4Jc0viUwThetdITpffSsecZ/UN8iWCaKBo7umIzh+u+zXhhMmYNh
	mqF8YGF3RkG0qMS6gBmM5RUqjgtdsTxVoEskMTVvrD7L8XNrGqB4aOt80/A4aw/Kfs/2SaJWGZd
	mTqCNmEA5+i+F8S6W1LDHB009kIWiZ43E5FGi1uK+ENXewgRO4uY4wOIc
X-Received: by 2002:a05:6402:15d2:b0:6a9:8863:ada4 with SMTP id 4fb4d7f45d1cf-6b4b0b8288dmr6687683a12.3.1793611963451;
        Mon, 02 Nov 2026 01:32:43 -0800 (PST)
Received: from thi-server.fritz.box (dslb-092-076-089-226.092.076.pools.vodafone-ip.de. [92.76.89.226])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4eca0f2a0sm3214273a12.25.2026.11.02.01.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:32:40 -0800 (PST)
From: Thilo Zirnstein <thi.zirnstein@gmail.com>
To: michal.simek@amd.com,
	andi.shyti@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thilo Zirnstein <thi.zirnstein@gmail.com>
Subject: [PATCH v4 0/2] i2c: i2c-xiic: fix clearing of bnb irq and waiting/ clearing while atomic
Date: Mon,  2 Nov 2026 10:32:26 +0100
Message-ID: <20261102093228.2751576-1-thi.zirnstein@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_013245_681838_F692EB10 
X-CRM114-Status: GOOD (  10.28  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Dear all,

This patch-series fixes the clearing routine for the bus not busy (bnb) irq
plus the waiting and clearing routines while in atomic context.

The bnb is used to indicate that the current transfer is done.
A high level view of the software flow for tx:

* init i2c controller
* prepare all registers ( fill fifo, enable irqs, ... )
* start i2c txfer
* clear and enable bnb
* wait for completion
* ( serve interrupts )
* ( bnb interrupt ): complete completion

The datasheet ( pg090-axi-iic, Interrupt-Status-Register ISR)
states that the bnb bit can only be cleared if
the bus busy bit in the status register is set.
So the iic controller must have recognized that their is some activity
on the bus. ( Start condition )

Currently the bnb bit is cleared without checking or waiting for this
condition. This can lead to spurious bnb interrupts.

Andi suggested to use an atomic-save function to wait for bnb.
This was applied for other waiting/ clearing functions, too.

Kind regards,

Thilo Zirnstein
---
Changes in v4
- Fix timeout argument of polling in atomic context

Changes in v3
- Use atomic-save functions for waiting and clearing.
- Fix intendation
- Unintentional changes removed

Changes in v2:
- Unintentional changes removed.
---

Thilo Zirnstein (2):
  i2c: i2c-xiic: fix clearing of bnb irq
  i2c: i2c-xiic: fix waiting/clearing while atomic

 drivers/i2c/busses/i2c-xiic.c | 70 ++++++++++++++++++++++++++++-------
 1 file changed, 57 insertions(+), 13 deletions(-)

--
2.43.0


