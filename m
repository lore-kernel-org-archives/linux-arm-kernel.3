Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F9A606D817
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 18:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IjT7PIBn;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O71dte4p
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3GsiDmClXUsZuQhYM79SYeH9oaXJBKEF/AnaKpHO+KY=; b=IjT7PIBn9rAMvb
	M2j9mUDy9CFrrFGrD1HDXqL+NQY2KH/CcT5r55qjuTNKzERgqznQh59nS+NQlwFa6XFGukSwDN3CP
	Nhmpn9U3/juPXr/lZaQb8ptdi8FcWa9MGm2/X5WBpjDIWo9/77YJDYeqYfd43q0Xm+BySRUayDGP6
	BcUc8fYkLRrOkZIIOwH0ZxdnAlI3CpcFZPe9WrbxrOqCIgrLB1c9lLeth8wv9fhJomV6tW0rvUIXI
	TApV3IuKWG/1JCtTO8Hx9KqNxnX2j3p/QYK62MZiLnSc8dwDk5QKYao4js0C4qXa7f5ZusS96QL7E
	a8TbQXKa1jvqPWpiLwVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOJHb-00000003Que-3gM1;
	Tue, 03 Nov 2026 18:30:55 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOJHZ-00000003QtP-3kgM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 18:30:55 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4a215e64962so42237645e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 10:30:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793730652; x=1794335452; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3GsiDmClXUsZuQhYM79SYeH9oaXJBKEF/AnaKpHO+KY=;
        b=O71dte4paaY6zkmRs3KYWIr1CUxTn+Koa8GjPnZMMuCVioSc+51NsuEfMBDheBmoav
         aoK5sG6OhQ7yV7zcxmUrgis6qq8APGzagyumBM0C/SRkOgnu05CT4bwQvZtjm0WzUfok
         alEtVa64QRd4bH6VX8oLTeylAjOR3rIVND5uGC6OGIhZ7VwPuvdRIx4O/x7LiL5wjRnE
         5Mp6wWbtwXAMz7N0qxs3h8Q7LlyXlA7QT/tRrgJ2F+26ninT32JScz5yR2dxDHjYOOTN
         kOEYxNPYRVelFeSabu1wyZCTA4SDWi31+0y01A07oYzGT8JCdcTCMkGkxAn6mI/4mlPC
         Ka4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793730652; x=1794335452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3GsiDmClXUsZuQhYM79SYeH9oaXJBKEF/AnaKpHO+KY=;
        b=CXgW0c4kOIXtlFGIyjBCrkg3abCKqpZY+K5mUUins0O3TnvrKDW4F+LMTjksI1J7w3
         vU9Mo04d0hGBi6DZ1ix6A+gPv6miGtMAECUMSK5XVDOjNoHr5zJVcHVhZmPfLd4jQ2ed
         BuAo6TMHSbsrhDzCnDQk+ZQFB0e/BeMxj/RknmY/pp4J3q+l/Z5Tzl6Lgd9iO6vj0OXF
         rmjzjrEyMD81vRC+0hk7TxDTzjsTvelR2uJffc/PGI5zNaPo/4WdoqQUzcsvSwEOoEMb
         oZhhFPO+6iFj22yRR/uYBBfcb3Eb5rru5B2TYgZT5C/Wbfh93rEq3f7nF+Q7UWSkvsou
         tQyQ==
X-Forwarded-Encrypted: i=1; AKwUvBxqVRg+5gycqkV6n41x9FIQ3JAE0Tcy7HiA+8++P3onpj/5kWwgN9BqwN1yCyvNpZ0LkjQDYgxCJXNFG3d9Iz5V@lists.infradead.org
X-Gm-Message-State: APuU4Z/F1NdIsHBLrVaZOd/Gjp7zO76TgQK4CcsACxglH4y2D3o5c0lZ
	vNah9ASMjD68WLajyEfsUtvzsd/bQxjQTR3M0bV7p/U4nzrwe2AMnJYH
X-Gm-Gg: AYBFou1ERDFAH2V/08A54vGgEdjXdrCg2uI2dJDizuLAVTAD3/FxNNdR2KIBlVPYPvs
	fxHcEDhuQdcDzNeCQJB53c/hQjbyEmMqaNhNm1faEx2Iuqgdt0nmhIB3zwKwZnLkPzWmPgojD4C
	Y0bsesZScnjG62uupTAyGLnC/JcmNkL2iq03bh/PXr+yW4+1y0WqDTVBz/7XH2Xc/gAuGShI7zL
	v7Pf8rbB3BOfyzWrU3Dt/md/OpFYSDxQjPTA3/qUy/LNoWi3/H2wH7dQEM80t+Xf7/6Y48aN38m
	WAUK6dCPXMWwoM5qam4Eo/oTxut6KOY5xvC6NDIbJ2QLfSPZdMNWa0jgI4TzTxmZV8FreMsD/NJ
	9c6fqcO1ZbB0gIBSxLWGRQEgZ3iEge1WHqK9Rtcqp21YbF6N9AwiM/AAkNqdj6LsaUna4Itvk0A
	YcgDr0xgrNE8+Cz+Pg2SPZAu+2QJutMpALogW8U6p6Uv1gdR2BzgfGXX7dFXEjoELAS539Kjvmu
	TW/wE5E2Z7jkUOEs4efoSkX7F0/QGPofdTSo6L/kBOuFFg2nyLV6lWQfyH81tC3TwYYQkltYSRd
	0XROjPfc+HsZ1Ogk6YiT8opk2SsvFIPPx7t8TANCgvx4I499OOn2PIDh6YvE4p5rqNDAr2wRFav
	av5Ytkt2hU6S29pcNqt/OCXn6LreAaLF8Mt6pKZN/abHrpg4YPEOXBRpPZXbwj7kX60rTB86BnC
	aLJ2EQ+WXBnr/c2QO5rvDfj4D0l0DExMdmyFQQQ6mKPP8MxOIPndEokrpIWlN0MsjgkVZZniSjt
	IZnlnzACJOUbIHA/ov5kOKpPl7k4m1HZTi4D2/IC94TFGCdhA==
X-Received: by 2002:a05:600c:1d29:b0:4a5:5fb9:5d35 with SMTP id 5b1f17b1804b1-4ac187a7678mr340616585e9.21.1793730651873;
        Tue, 03 Nov 2026 10:30:51 -0800 (PST)
Received: from jernej-laptop (194-152-27-116.dynamic.telemach.net. [194.152.27.116])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2ab00ff3dsm146339785e9.14.2026.11.03.10.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 10:30:51 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Anfernee Cao <anferneemelokc5@gmail.com>,
	linux-mmc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 1/4] mmc: sunxi: Report manual stop errors correctly
Date: Tue,  3 Nov 2026 19:30:27 +0100
Message-ID: <20261103183030.81078-2-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103183030.81078-1-jernej.skrabec@gmail.com>
References: <20261103183030.81078-1-jernej.skrabec@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_103053_980098_50757FC6 
X-CRM114-Status: GOOD (  16.70  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When a data transfer fails, sunxi_mmc_finalize_request() sets the stop
command error to -ETIMEDOUT and the threaded interrupt handler sends a
manual stop command. This has two problems:

- If the manual stop command succeeds, its response is stored, but the
  provisional -ETIMEDOUT error is left in place. The request thus
  completes with a stop command error that didn't happen, and as the
  block layer only checks the card status in the stop response when
  the stop command didn't fail, errors reported there are ignored.
- If the manual stop command fails, -ETIMEDOUT is stored in the
  response instead of in the error field. The block layer then decodes
  it as an R1 card status with random error bits set.

Store the error of a failed stop command in the error field, and clear
the provisional error when the manual stop command succeeds.

Fixes: 3cbcb16095f9 ("mmc: sunxi: Add driver for SD/MMC hosts found on Allwinner sunxi SoCs")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/mmc/host/sunxi-mmc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/sunxi-mmc.c b/drivers/mmc/host/sunxi-mmc.c
index fe4c0f6d73f3..9744b6b860ac 100644
--- a/drivers/mmc/host/sunxi-mmc.c
+++ b/drivers/mmc/host/sunxi-mmc.c
@@ -470,10 +470,12 @@ static void sunxi_mmc_send_manual_stop(struct sunxi_mmc_host *host,
 	if (!(ri & SDXC_COMMAND_DONE) || (ri & SDXC_INTERRUPT_ERROR_BIT)) {
 		dev_err(mmc_dev(host->mmc), "send stop command failed\n");
 		if (req->stop)
-			req->stop->resp[0] = -ETIMEDOUT;
+			req->stop->error = -ETIMEDOUT;
 	} else {
-		if (req->stop)
+		if (req->stop) {
 			req->stop->resp[0] = mmc_readl(host, REG_RESP0);
+			req->stop->error = 0;
+		}
 	}
 
 	mmc_writel(host, REG_RINTR, 0xffff);
-- 
2.43.0


