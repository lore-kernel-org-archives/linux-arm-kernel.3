Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C49B606A327
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 21:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PBQV2jOs;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wbp+rpb6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7NV11o9zfXhIcPZKIoXcovhiq2SO0KZWmadsYuDbCBE=; b=PBQV2jOsEHGIl6
	OSa0RxCEU0jsa6HYeLi+C8F5s/v7aG6DGKElLfLGXV9UOJ7Gjhp0ukmbyrA3TzGav+8HsB2UqEVaM
	osmGwpJ5rl18EYmIp1wek33tP1If8SFvsXU2UqUW4qiaHEJW+xyZCgby1juDAB74ocYpUgvC4Amuo
	XVhV1F2k0NmCszFIpGl2DQmzppm9zKr6KNe4bUZjIlXdgswa01MGiyNivQGrtATDmSfdTtbxWY0mU
	YAKaOTcR5n7/FZQCF616kgebhVtuZLfIMC8ArItd0KCN9UUvvmapAxsAdsmPT7bttelJGhsc+Fdpa
	N7h5f2Qv9hgGafIRcLSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLokN-00000005n8a-20lG;
	Tue, 27 Oct 2026 21:30:19 +0000
Received: from mail-dl1-x1231.google.com ([2607:f8b0:4864:20::1231])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLokC-00000005n5Q-3Z82
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 21:30:09 +0000
Received: by mail-dl1-x1231.google.com with SMTP id a92af1059eb24-15943c9c005so389159c88.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 14:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793136608; x=1793741408; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7NV11o9zfXhIcPZKIoXcovhiq2SO0KZWmadsYuDbCBE=;
        b=wbp+rpb66T6wPaN2jNe/q6MrivUXyPCLO8o7Fb2SOXKFGWGBToCqJJ6zNyrlVIRoWU
         bCPbsMhtLyRR5v9iHVm/5VeO+AZVzh/6LB4SVMNCuGyYHoxo4/AVHODeYz5CdU4nBl2m
         z30NtWKzLhgju50wHcAN9C1seos8GLb4+ZF7F1scRgJB5C7hUYApVPBWv+tUG4NW7UxW
         BpJ8bNW/cfM5ogYPSc15TUiIe/G2zUMz4rLsUSYqo+Xw7+Rbpm67S6YfkrxSbznspEjm
         0Q6FoOq4qDFIFmq+k47B2uzjlvG6wXtJgD5aK1Zvr4wxBtmtTqoklJwbBazb5Imghrco
         YWDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793136608; x=1793741408;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7NV11o9zfXhIcPZKIoXcovhiq2SO0KZWmadsYuDbCBE=;
        b=w4ZjF05gNbAszKsI1jZKwAkIwlvQQycHM6Oacto5DzKpQV1uVWcAie8CXCtyrnuT9/
         eSkbOV3PRdKIQCzhRe7hlC1bwCZbv2Rvfk+xfJNkzeF0k+wRmDyPLonwsrKBfqvORV/Y
         HcWSOaB6vggufKA9+HUSr8r/0BEP20yPf1BeuFyqaCVIUE+evIQ/z5n4DSH4pU51/m+X
         rqnqfQuba5UIXAOvIKxE5HvVFdBWZeFV8yel/ErQlx1xQFDiFaPGI53kqwuIuMnyhurX
         33qweEGnj3Gp/Pt/RwPN1RNad/2DwJ8X6KRjeuUNFZUcg97Gd6XA/cOLaX+8L0xXoyAT
         cLJA==
X-Forwarded-Encrypted: i=1; AKwUvBzYRiV0Pko9PA9nos0bxL0fJcB1OD1G1Kyim9n6SxpoA8bT29oqL6AM3nUY6/+Q3t8wToETXI0YOpluD/u9+OZu@lists.infradead.org
X-Gm-Message-State: AFq9FYIWjwfxuO6uLLsPqF883ZL9n2dsR1jYdHu8QN/fAJ3BpqAYISvz
	YVUOTEGyboOpOdpVjdHHo+84/d8Ke/BJ+QhBN/4Xw37ftKnSwJ/mE2cg
X-Gm-Gg: AYBFou1T4QbItSU3AOAmfcGm5WuD92oQloZxrGSScNC5Mg314LA6F5zGHK3hVQ1mvg/
	8MB124GelKQdPjD+avKGy/1wmvsHqgVGTLnV207GIImAOghlE4HNoFAPvEuj3opO/qxro/5inn1
	aizoK67+UY56abd13PUs/FVfHhODiFCxSpIYKex3wwrmlS9pawP5Re5IV8/YTot5GIMcUrrT0JT
	x0P3YrTIkuNVmRNnat9E+UNSM47vn0TdxiEsPxMQR9Gdkt79wk1iUJMo1jtvEFsRbiGmQAwIdaL
	fCpaTJ/6Ai0a34xWQpVu1CxwFiNOm7qkSzyC+f/EoyA9gQJFhttzizPBwxpQfGa96W2dm7Zz3xB
	ETun1p0+QynIglssYAuIqI/nz07LVtxZaDZHiTxowFifSoBzyes2JC2e5yzJ1w9IWCDDaTG+UAM
	rQifonNcl/BFD3+K3zj8uju46Ob7pI26Rv6X9VvkJgXa9YUH8WX9lSA+wedx21v6QG12ymGd+Az
	Y0zC5wx2d2Vga9LYiRX6KfGTaGKABaxyhvI+UF8RYprJbtwuqP3M1IvcEyKVoXBsbEKPCiHyMQq
	o9C+TRbpVhGuSXRpVt6RbnmwNvjsgf7FNoYD6ADk0jyR
X-Received: by 2002:a05:701b:280e:b0:1a5:52f6:db9a with SMTP id a92af1059eb24-1a6cced4b3dmr557529c88.22.1793136607833;
        Tue, 27 Oct 2026 14:30:07 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:9958:9525:7799:82b5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a6d7ed488fsm723725c88.7.2026.10.27.14.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 14:30:06 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Tue, 27 Oct 2026 14:29:57 -0700
Subject: [PATCH 3/4] ARM: s3c: crag6410-module: drop empty wm0010 platform
 data
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261027-crag6410-module-swnode-v1-3-2f885799b6ad@gmail.com>
References: <20261027-crag6410-module-swnode-v1-0-2f885799b6ad@gmail.com>
In-Reply-To: <20261027-crag6410-module-swnode-v1-0-2f885799b6ad@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
 Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Mark Brown <broonie@kernel.org>, Lee Jones <lee@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 patches@opensource.cirrus.com, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-e56a4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_143008_895462_A5E79C5A 
X-CRM114-Status: GOOD (  13.37  )
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
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The wm0010_pdata instance in the board file has had no fields
initialized since commit b53d47775651 ("ASoC: wm0010: Convert to GPIO
descriptors"). Because the wm0010 driver already handles NULL platform
data identically, drop the unused platform data and header include.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/arm/mach-s3c/mach-crag6410-module.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/arm/mach-s3c/mach-crag6410-module.c b/arch/arm/mach-s3c/mach-crag6410-module.c
index 6443c816d111..55f55e9b9a46 100644
--- a/arch/arm/mach-s3c/mach-crag6410-module.c
+++ b/arch/arm/mach-s3c/mach-crag6410-module.c
@@ -20,7 +20,6 @@
 
 #include <linux/regulator/machine.h>
 
-#include <sound/wm0010.h>
 #include <sound/wm2200.h>
 #include <sound/wm5100.h>
 #include <sound/wm8996.h>
@@ -45,10 +44,6 @@ static const struct software_node wm0010_swnode = {
 	.properties = wm0010_properties,
 };
 
-static struct wm0010_pdata wm0010_pdata = {
-	/* Intentionally left blank */
-};
-
 static struct spi_board_info wm1253_devs[] = {
 	[0] = {
 		.modalias	= "wm0010",
@@ -57,7 +52,6 @@ static struct spi_board_info wm1253_devs[] = {
 		.chip_select	= 0,
 		.mode		= SPI_MODE_0,
 		.irq		= S3C_EINT(4),
-		.platform_data	= &wm0010_pdata,
 		.swnode		= &wm0010_swnode,
 	},
 };
@@ -70,7 +64,6 @@ static struct spi_board_info balblair_devs[] = {
 		.chip_select	= 0,
 		.mode		= SPI_MODE_0,
 		.irq		= S3C_EINT(4),
-		.platform_data	= &wm0010_pdata,
 		.swnode		= &wm0010_swnode,
 	},
 };

-- 
2.56.0.307.g5fe7bd680c-goog


