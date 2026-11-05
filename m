Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C209606A329
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 19:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=m95SJdOg;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=J36I7YTo;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nLlHgMQI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=F8PJ7Wj/MurY/COKSMskXdHgUwbyiv0TEDO/uX+R0bU=; b=m95SJdOgNyy9lw
	itHpvkJ5NRiFNpWpsRzaPrfkFBog3iaudk/j6kZncyOwgB1E3ihgo4zC0XG1kBXWbowndExw/xXvk
	4Bn+/rOwB0Xn6zrgTq/04Cj0QaBJ0tqoXpN7lZAyjPBA9ol3qPUbh6fJHfN5BID4YkJnsndVk2G+m
	029w0sNTf0xEWGpF5q0FnhiTuq1q+W7+X2x2D6m8x3wxU40SfpdoQIUWbjfuPMztksRYoJsj7xqBG
	QR1WqdFByLIBfM0PyBSDcDmqFSwuWn56QOgtbTbH4k9R1sNyQoHqojKaU1qcEaVBw27lFqn8pKx6p
	OfO3igEitCHOa8DzX+lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2hE-0000000AGGF-3z3B;
	Thu, 05 Nov 2026 19:00:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2d8-0000000ADco-1Nuw
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 05 Nov 2026 18:56:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=F8PJ7Wj/MurY/COKSMskXdHgUwbyiv0TEDO/uX+R0bU=; b=J36I7YTo6IilosTho420al4qUP
	U7NNRSGu9qCY13WVnkqvN45okwPvZcCX49kcOfO+vSFYUYsa3LDsNV0YnOL5rZX6Gvy+kUQz4UGyA
	y8tzkoNBBdUpWQiRSs7rZd0yG2KwmXa6gbmFsxb3BZu3uJepaLLJ2LhdC3XwqNjtZYsho5e1cy+No
	bWG0wSZV+oqDwNLmgHABsLHuP5SbDLx9bfakrxy/jT8U3QbTBC8gcVikBK+3ODkpEklXPYxyIOSYG
	stWx3iPKnTnuXkc0Hg9GMqz/wwyLjGBiqx3Wsf7rcDkiX9jblP+XmeCPS59nDumwpHAtxnqLF81Jw
	3OHlTlLw==;
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2d5-00000003R6n-3J1y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 18:56:09 +0000
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-6df0b02fe91so632122eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 10:56:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793904966; x=1794509766; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F8PJ7Wj/MurY/COKSMskXdHgUwbyiv0TEDO/uX+R0bU=;
        b=nLlHgMQIgRDylwYaRS0DuxRUrL/BI/pqPWpCRe1jzy4yPfKv+AnRhofS/2mxRCQYCv
         P9eD5D5w064Vb7BkxhWKm6/YkOui8UaX7XgdhvBiaa8EvKMBfll38C0w0fhUUl5YxkF4
         dk46Z48PRazf70SOJLW+R2zteiTtetSKAbKujalvpvpBLpb5Gp2VLBIF7166qG5rwtky
         1bocsioBJ3cQGlTWUKBLIUxiTgXcgezDcbnlz9/w/U5mOB3/cUEsadH9SIrlo5hJYjLi
         cSyQPw0/yaxbg78kG3U8ibHEHEjqY9uwL2YNlGRcfsF2W851LwwKXguWc9dErB7R5LZT
         BBug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793904966; x=1794509766;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F8PJ7Wj/MurY/COKSMskXdHgUwbyiv0TEDO/uX+R0bU=;
        b=Pl8co7G18pB9T1/zJNwBTAYuzD3yqeTC3bFpRb69mKPxKnoDkqBhwoSc0tCdVwS/sd
         HD5FyQBp6FxpJl7SxRrMuOPQRMeG9ejr6YHs8pYkydfL1mj9RSHMHS91OCstn/XZKFMd
         AnOchvAHBdth2J1QAdOymq53HIH43XiALOmKQjfbpw7ZzU8PH10rHjAq1VzlEdGr2hYf
         OVkEX33SIYrawAykh9eet2W6fGCdW7ErUSYBC695GykYOMgzE8oTzpawskMUaByspPed
         4pztR87XqRs8Cz8YyunoYxWh3l3S1YgNAgigkSdQF5YQxDXPaowqXUDACxUBPnTvgPfu
         hmpg==
X-Forwarded-Encrypted: i=1; AKwUvBw1DFNbMkv/GfbcMd9ktcwsfCLyKZk8RPX4UC2/OoaTfjbgn6NoOjU0y//AfXYWKElOw+HzIvp1SYlS6hHbG+cY@lists.infradead.org
X-Gm-Message-State: APuU4Z/pvOoUMsnbs5qW3cD1y69zVn/f3wQ7J65qyb9Fsa7zDx8tfKmc
	fgG15bcDzhMDPpxmdxJBeypUEKF8AENHB9wUEeVYGFcv+R/dtrPzc5Fv
X-Gm-Gg: AYBFou2Eeb2ViMl3JFI3XLMdcwg34AiNeoRrORXvDyKwljezeUHV/AoeWvzJj6/WqMF
	KcS/HeHsSfed08F/99AGEylj9WvA7Iz2dfxYBVb5wtwo3uoafdD6GDdYGlLi0FIDhd9tpvfrQkU
	kBSDgXabeSVRKA6LzYiNa/O0tZ7VqhAvTiC9ImGWRzPJln0lGxByu1/8TwaLFZhYzM9MtpcxOij
	SBvLA9q7yN7xv6gGWM6CXkZFEDbZDQM+SEAInL/pjonG+1WR9aIcsQ6wQ4jHd+mQwcuNmZ1CQTG
	taE37uRDDL2/ZekPKHjGIY6oq6clA5x92EiLBRLDSjmS8l7iFpFSCMGFg9GEmUabkJhu/b5e9MF
	zhiX+P4U6FYeqZ6MIPE+n94InzhDjAMAYNdOWMnY/FhBUspVTLIb0rc7G/t+OqNnQ0OQBdb8ptu
	Rhluep7MFtbZrhP3JkHG9dslaFerPSljIIudaS2P5Fe1r037h2nY/4BXanI70eBoZVuBdrK5fVM
	8U2uHpZqfoTNkeZA6wGeRGVZkpINM2e/zdBz+FC2QvNbiRrqKQYaB2RZLutk32ZHP3i1anZnKY9
	DXQFMSVopdGWIkgpRZWGgGOr6jfkk4A55XqC+mg2JOjcpNcoVWlflo4filEHAftLNzQDcf8M/S2
	XlMSsJcNShGgv18GeKgBrNB45HnfOSul2Jh6lQnhZtVUJRoXfXZMY7R7F9YLvgCOVY2xyZfQN3c
	wfh7SUR1ZyBx/R2EE3ACy9P27ozhi+hY0VlsuAQ9xzKAEb2jiqXKZEB23Ffi1Ck/KUrB6S8fLPp
	g==
X-Received: by 2002:a05:6820:151b:b0:716:e9e0:543f with SMTP id 006d021491bc7-716e9e05899mr67251eaf.11.1793904965992;
        Thu, 05 Nov 2026 10:56:05 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716e99465dbsm115897eaf.0.2026.11.05.10.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:56:05 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 11:55:39 -0700
Subject: [PATCH v10 23/26] mtd: rawnand: sunxi: avoid redundant column
 changes for extra OOB
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-23-dca1f6ed29a8@gmail.com>
References: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-0-dca1f6ed29a8@gmail.com>
In-Reply-To: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-0-dca1f6ed29a8@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_185607_764450_3293BE9B 
X-CRM114-Status: GOOD (  16.78  )
X-Spam-Score: 0.1 (/)
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

Extra OOB is the spare-area tail after the last ECC step's protected
user data and parity. The PIO write loop tracks cur_off as an absolute
NAND column, starting at zero in the main-data area. The extra-OOB
helper instead compares it with an offset relative to the OOB start. It
therefore requests a column change even when the last step has already
reached the tail.

Add mtd->writesize to the comparison, as the read helper already does.
The comparison and the column-change command then refer to the same
byte. Keep the command when the cursor differs or is unknown, including
the DMA path, which passes no cursor. No transferred data or OOB layout
changes.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 11fdc10c7f14..c9135c8abf54 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1718,7 +1718,7 @@ static int sunxi_nfc_hw_ecc_write_extra_oob(struct nand_chip *nand,
 	if (len <= 0)
 		return 0;
 
-	if (!cur_off || *cur_off != offset) {
+	if (!cur_off || *cur_off != (offset + mtd->writesize)) {
 		ret = nand_change_write_column_op(nand, offset + mtd->writesize,
 						  NULL, 0, false);
 		if (ret)

-- 
2.53.0


