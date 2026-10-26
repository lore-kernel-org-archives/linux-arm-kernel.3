Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D27606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 00:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bUCp9Gih;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SEe9Lh3h
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mdvyCnUTqtKZWJP8Qz2Rtn+aEZNUKTGAttllLV0iXqI=; b=bUCp9GiheyPUab
	gVFysCTt5Tq/ppSkm247NDQ09fHhuf12vU/RYa4Lep2mXkKq+F3xcg9fV+jVlOX8vZywp7YxSgVtU
	fiJvuS5fODRQMQeknD2rDijDVKG/xAzVVwgJ7nyEQV5LSDLjX8yoTQsAi+0i6SRRsxrU3KcvysvAG
	L7btSZSOiSZBT4py915ttYYAnsOyJGpcDkMsgA+ZnM/KYQHHhBc9tosiaaf35NRZJwxOlbDyj6+7t
	yRoQSqdVuicgrVumohdnw1xHYFYdD3mF3P/yzSGZus1xZBjBCGC9cWDFKxnCIJq4yWpBvF8aSgM/D
	wkBDedpQ8bRV/85QXAjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL8o7-00000001Xsv-2CRI;
	Mon, 26 Oct 2026 00:43:23 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL8o5-00000001Xsa-0rg1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 00:43:22 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so14326635e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 25 Oct 2026 17:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792975399; x=1793580199; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mdvyCnUTqtKZWJP8Qz2Rtn+aEZNUKTGAttllLV0iXqI=;
        b=SEe9Lh3hNG/sWgFX4igOTmZDb2Qfg/C2F4Q81/Zz2UstbnwX8dmcDeB2oH5RPwrFCt
         LPFoJ7qFYRUbOgR4Q+eIGWZ7ONtldGb1ggqq1bbxmGsge0fn50ZjJrp65rFKgPbwpI7M
         bgdpwDADA0fdPGKdWhXHTMII8RdPp1y3G/LD7DlL/dkwlSE5tMHKalrOFcAjpuYxdn82
         GZ7XGZFYB8m2k4orVvCvKqy6njUiQfeD1P/RWTJs4u7rD6FON/66UsSpQ3DW+W3K+Jva
         5qBD/8uq7R7iKAZCchJcMqpMbKIgn5SVkkwyPt4YIZOHsQnXVA+a8MrHJdYQ+hLkQO+G
         ODBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792975399; x=1793580199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mdvyCnUTqtKZWJP8Qz2Rtn+aEZNUKTGAttllLV0iXqI=;
        b=nprRskUjvw4SKnRc4dk8ZUxXfINVPfLI1d+kjV/lzKrIVH7oOV5O1+lR0BuRztVyny
         4vQT5zvjcn2vB4cWDPI+N/twBsjT5zjFoFejtJyFri83KJ099v3/1EinAQwW19pVHRGN
         h9JAVEuV4p1FJy+QBLybcjLOpNJLivTKqzBrvSaguMTSK+W87fbRIV1E2P/SBV4HVk+a
         tpqv5nzsU+LxJJEFn44mGg0WtvXNFjZMkRfgPVqrMWox+00G3pemTdmoizEgIeGFLIXb
         1F/zgXBLAbBU5Uj/j72PEOCK/TrW2Zzhmu96NHoRJciUN50gdwvn85pnbgSppCHs9dys
         zaBw==
X-Forwarded-Encrypted: i=1; AKwUvBxGdZsIcVZDcwkv/1Pnl8j+smc9ehgzxcYlNWRACvRjmGAww/dYLdmd9iBz4BNysWESdUmWQZVlWyTNBBxH8iLu@lists.infradead.org
X-Gm-Message-State: AFq9FYLehcizb9a+eZFCpSwKQzM4cl3pwkUIc0b0U4goRLuOuRNfdbrG
	AuPmL5QKT8MhtARBVi4O1+0yvA5pf1D0D0/lDU29KmvklW7GK+4tuhq/
X-Gm-Gg: AYBFou2lQWnOvFetsfLsstvZhIiyB+IgxVsUuvelSoyPsGK35RNRMo0qYlsqdsA2kez
	Pw3TVxO0MYz8G7U2vkvoKkvBrtGAa6SRZ0ZabZp9FT73mZaqnYwBy8QA5T3HgUvKmBjo7ZtbKHR
	QmTwRkbigpDrIsrRYTnSg/6JOKxfmJXp7Z+6uXTHCC+1UflcBu+QtyOWA5FrVLDKHsntXM3veIi
	P8h9MZommLPsmyxVwYb/Qo5e+LY2WE5eKf0zr8EY0cq8hF2dufkZig6taFEN05xCkVVFb05zcnG
	tgopZaVqS858jWaMmLitKNapTsLFuKa2YqAqod7bknbL917JUQzEsknsWNWk3w1rAkaz2lrH4Fr
	7h9FRm+48wP+t77BwRC9lURRQWS9VGel6ThmdktOHZYn9rELUP+Z+a7KT88gONpxLa+d4cCac65
	fi+7TOpy9m7lHi74KwELyKoRNB1rr6y72AW4pEgX6AkcBXR93WC6FnbOhLmDy5ZPmHFsBy2Wuar
	JOOfRPzFYvIoo4gs8Nb/wq4DhOUJoa5DcQNA2vr/Mk0faZiBtzJNAx9dAyQjJelcDUVsELX+Y3X
	oWsH1ubEn5j4Pg==
X-Received: by 2002:a05:600c:3b2a:b0:4a1:71e5:9420 with SMTP id 5b1f17b1804b1-4a35aca4e4emr92594645e9.13.1792975399138;
        Sun, 25 Oct 2026 17:43:19 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a07ebc0sm74574555e9.3.2026.10.25.17.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 17:43:18 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Andreas Kemnade <andreas@kemnade.info>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 7/7] ARM: imx_v6_v7_defconfig: drop the SY7636A MFD and hwmon options
Date: Mon, 26 Oct 2026 00:39:18 +0000
Message-ID: <20261026003918.155321-8-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026003918.155321-1-pmazzini@gmail.com>
References: <20261026003918.155321-1-pmazzini@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_174321_272579_6FFD4AB8 
X-CRM114-Status: UNSURE (   9.39  )
X-CRM114-Notice: Please train this message.
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

The SY7636A regulator driver now covers the whole chip.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 arch/arm/configs/imx_v6_v7_defconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6_v7_defconfig
index 6ac42c06c1e9..bd1f692dd7b2 100644
--- a/arch/arm/configs/imx_v6_v7_defconfig
+++ b/arch/arm/configs/imx_v6_v7_defconfig
@@ -223,7 +223,6 @@ CONFIG_SENSORS_IIO_HWMON=y
 CONFIG_SENSORS_JC42=m
 CONFIG_SENSORS_LM75=m
 CONFIG_SENSORS_PWM_FAN=y
-CONFIG_SENSORS_SY7636A=y
 CONFIG_THERMAL_STATISTICS=y
 CONFIG_CPU_THERMAL=y
 CONFIG_IMX_THERMAL=y
@@ -238,7 +237,6 @@ CONFIG_MFD_DA9062=y
 CONFIG_MFD_DA9063=y
 CONFIG_MFD_MC13XXX_SPI=y
 CONFIG_MFD_MC13XXX_I2C=y
-CONFIG_MFD_SY7636A=y
 CONFIG_MFD_RN5T618=y
 CONFIG_MFD_STMPE=y
 CONFIG_MFD_ROHM_BD71828=y
-- 
2.52.0


