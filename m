Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B009EC8302F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 23:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/kcwhdLYH9QDCoM+AkPn/ixYQdxBo2mfkENfGHWF2vw=; b=B0+KafXKCc7tGW+F+VMtIurwTf
	hRxPgH8r4ooiBP0fsD4dZI8IUBWHSxEGdeCAZRSxgI9sArAG1oPbjDFWHV1oQ4/AhcrXWXCLzla7Z
	RQRXrCH/53/k5+52ly1ZSAs1dqzhYc5OhSO0vXev8bIdEHqePheAcnGsw6UTXe2/mxS1AHxnQQlfO
	UfpBBB3v9LsOpHcipPdhXwoetzrdHt6ZHwAjacxanQLBw0Lc49HC/oEIdMBrP8kaU3iPmXyucV4TS
	UQJJw9OLRFPKw+/BKSFZKDDP40EoJ/0UTGayM7LgmMFCmwFUOl029u0UbvnZQmv98QgtVlBuJ+trU
	7UCr4gcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWNXD-00000003ezL-0z7N;
	Mon, 30 Jun 2025 23:03:35 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWNUs-00000003erz-1zxN;
	Mon, 30 Jun 2025 23:01:11 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-b31c6c9959cso3358149a12.1;
        Mon, 30 Jun 2025 16:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751324469; x=1751929269; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/kcwhdLYH9QDCoM+AkPn/ixYQdxBo2mfkENfGHWF2vw=;
        b=KqhY5WW4LMcdjRdJ25NvkQx+RRnR5Bl3+AR7X2Sljt8wvKYANrq69tiguDmTzkPXDn
         4s0s9E4Hf6SPImv54uaPIyLIby5XK0mZx5gpPYfwcQLPeVON7T+pLJpGJ+/vWazyZRVR
         wdG17N3samLqr2RnHjDfxwYOHybKjCmNiuOGx1W36GdCxOz8lOWFSihLJetIjtryN/BK
         dL3tVivHLNqzvVSJM/TmkM5kJkxci/Y/IQEN0c5vwXItGjpaEmg/IZ0gZIASoQDb7eeU
         iaUsNAnJv4tSi43qIMYKVA7xJ5YcsBPw3JmD2x6qn5cnrtY3eN+gtioaLM1ak23aRINw
         ufeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751324469; x=1751929269;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/kcwhdLYH9QDCoM+AkPn/ixYQdxBo2mfkENfGHWF2vw=;
        b=gxENP1sso8Engb2Oek18rzvwZexxkh9wW3Fe6gC0aG/9Estu8yJOkOhDSPAfP5whtY
         b8aGTC5rsWQoFAF/xitlhsRr07DqaR1d4axWqgxYIYHFdplQfFpD4WTzEWTR1dkUjFhz
         vT38h3vNOZGmYbfUIoJFuyoSEiEql4tzB2rajDaWrPHqqM8TEChFVdNx2z5+PF0Gclaw
         V70BnaiIu9qGN+ljo48QwnWoY6BI/43h6Mk9uoADcnMyiw3GCWzokkZs0P8BGwfHh/+m
         CwIa8fNR9IgWDadfwqIRymmtpW2AFwE6TSdUKXTZRyrKM8JXu6h4g0n31BTG1ncLdJkJ
         e1qw==
X-Forwarded-Encrypted: i=1; AJvYcCUUKjY3b0gEOqMCO85nqX3qUAFLHEC0TwxW/VpGzyxZj9/m6J2vdiXTHw+v8KL2BKuK3Qyh16fPeOAPjkCPMWEq@lists.infradead.org, AJvYcCUqUDsharqqnqsGECd7myoxEQ12DJSXoOw8MFmRCds/5cLBblqt4u03qt/mqP7MylnAclqr6KrKmWRVB9T3OFo=@lists.infradead.org
X-Gm-Message-State: AOJu0YywFYAlTXGFXpHx1MJxOA4G5Z0alRY5zCWtGtWVB2MoLvBxjHvK
	C8lGGfAbwUjfVVK8mBPzym9uyYcoR/XvBSps3uzmUH2z+ITqpkKrCS6n
X-Gm-Gg: ASbGncvdeGovs92XEwnSXxR2R7JNPNxbU56tFZ/04DrOV1Hqrrxh8vIbovZzg0Nqx34
	v1vtRNAUdrCKjFu4LYjHb2ugeGY2uJo8OT+mRhoU+hwE5+6rF9h/VpGF8AJcGkcZD5id6e9JQjS
	VTxlKBJf1tKJCxlZzkMPAgtupohzmIQVQNprAAD0PnweiXgHAvO5oBkc6MFj/Hb8Rn71qWJn/X0
	YX6XO7OUf55MgZH0kYPMFvcrGUYzR8UGVzgIyQ8y7YjJmeov7UbAG1L7lDO56lFK38DvY+HKOCM
	l0JwE6gXS6yzqYo2B9z+r7wp3NZ5UG7pJ43Et4nxl9zMyhcuimjpRUbU+06xZA==
X-Google-Smtp-Source: AGHT+IH/YP+qsLsAUJeoIl5Ftc1VJsIoDYRrAzxIfVfqHDzSeIu+OzhjwmD/bR84c4zzsWnFKLgMSw==
X-Received: by 2002:a17:90b:5348:b0:311:f684:d3cd with SMTP id 98e67ed59e1d1-318c910a649mr27346171a91.12.1751324469281;
        Mon, 30 Jun 2025 16:01:09 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:c92b:c666:1f8:990e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f5441770sm14974126a91.48.2025.06.30.16.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 16:01:08 -0700 (PDT)
Date: Mon, 30 Jun 2025 16:01:06 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Yassine Oudjana <y.oudjana@protonmail.com>, 
	=?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>, Fabien Parent <fparent@baylibre.com>, Reported-by: 
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH] MFD: mt6397: do not use generic name for keypad sub-devices
Message-ID: <r4k3pgd3ew3ypne7ernxuzwgniiyvzosbce4cfajbcu7equblt@yato35tjb3lw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_160110_517862_F375540C 
X-CRM114-Status: GOOD (  15.00  )
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

Do not use "mtk-pmic-keys" when creating sub-device for the keypad to
make sure the keypad driver will only bind to the sub-device if it has
support for the variant/has matching compatible.

Reported-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Fixes: 6e31bb8d3a63 ("mfd: mt6397: Add initial support for MT6328")
Fixes: de58cee8c6b8 ("mfd: mt6397-core: Add MT6357 PMIC support")
Fixes: 4a901e305011 ("mfd: mt6397-core: Add resources for PMIC keys for MT6359")
Cc: stable@vger.kernel.org
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

This is not tested so if someone with hardware could try it out that
would be great. I *think* it should work...

 drivers/mfd/mt6397-core.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
index 5f8ed8988907..3e58d0764c7e 100644
--- a/drivers/mfd/mt6397-core.c
+++ b/drivers/mfd/mt6397-core.c
@@ -136,7 +136,7 @@ static const struct mfd_cell mt6323_devs[] = {
 		.name = "mt6323-led",
 		.of_compatible = "mediatek,mt6323-led"
 	}, {
-		.name = "mtk-pmic-keys",
+		.name = "mt6323-keys",
 		.num_resources = ARRAY_SIZE(mt6323_keys_resources),
 		.resources = mt6323_keys_resources,
 		.of_compatible = "mediatek,mt6323-keys"
@@ -153,7 +153,7 @@ static const struct mfd_cell mt6328_devs[] = {
 		.name = "mt6328-regulator",
 		.of_compatible = "mediatek,mt6328-regulator"
 	}, {
-		.name = "mtk-pmic-keys",
+		.name = "mt6328-keys",
 		.num_resources = ARRAY_SIZE(mt6328_keys_resources),
 		.resources = mt6328_keys_resources,
 		.of_compatible = "mediatek,mt6328-keys"
@@ -175,7 +175,7 @@ static const struct mfd_cell mt6357_devs[] = {
 		.name = "mt6357-sound",
 		.of_compatible = "mediatek,mt6357-sound"
 	}, {
-		.name = "mtk-pmic-keys",
+		.name = "mt6357-keys",
 		.num_resources = ARRAY_SIZE(mt6357_keys_resources),
 		.resources = mt6357_keys_resources,
 		.of_compatible = "mediatek,mt6357-keys"
@@ -196,7 +196,7 @@ static const struct mfd_cell mt6331_mt6332_devs[] = {
 		.name = "mt6332-regulator",
 		.of_compatible = "mediatek,mt6332-regulator"
 	}, {
-		.name = "mtk-pmic-keys",
+		.name = "mt6331-keys",
 		.num_resources = ARRAY_SIZE(mt6331_keys_resources),
 		.resources = mt6331_keys_resources,
 		.of_compatible = "mediatek,mt6331-keys"
@@ -240,7 +240,7 @@ static const struct mfd_cell mt6359_devs[] = {
 	},
 	{ .name = "mt6359-sound", },
 	{
-		.name = "mtk-pmic-keys",
+		.name = "mt6359-keys",
 		.num_resources = ARRAY_SIZE(mt6359_keys_resources),
 		.resources = mt6359_keys_resources,
 		.of_compatible = "mediatek,mt6359-keys"
@@ -272,7 +272,7 @@ static const struct mfd_cell mt6397_devs[] = {
 		.name = "mt6397-pinctrl",
 		.of_compatible = "mediatek,mt6397-pinctrl",
 	}, {
-		.name = "mtk-pmic-keys",
+		.name = "mt6397-keys",
 		.num_resources = ARRAY_SIZE(mt6397_keys_resources),
 		.resources = mt6397_keys_resources,
 		.of_compatible = "mediatek,mt6397-keys"
-- 
2.50.0.727.gbf7dc18ff4-goog


-- 
Dmitry

