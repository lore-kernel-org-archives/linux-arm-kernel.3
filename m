Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13548606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 18:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=P3chZk2d;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=aEvFCMta
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=DCSLRnb0vtBw+c3BivhCF1ac7dx2yv+/JlPhFH01Ir0=; b=P3chZk2dP0Ty3A
	DM2LgKQ7VKvgaJ6dwvt/NH7EiF4XBwvZ63xLIvAm829fTm/ouymsi6PP8ODFQv+yrBvbP6FySF2Sl
	cRR3Ye/kLOIiPgyqPpM7+pHUXqctNeCZjoDkwaqusK6yW8Y5f/LW6IJLveqgN72oka7f5Z2C0wQCL
	VaQzcWKMQSREGRX55BcYqkbijdl8FHrUcJsj+I6i6GE3TLg2bZ8THqHN/mcB5fO2sP7IMdjSD4Awi
	+NGzKqkT9KFA5MiRaZPT4Ir63cxD0FRAFQRTYkf82zcxtKhOpmEodvl5TRYtt8LarYrA8HZH6IVFB
	XGYQa9VoaKUevuGGFKvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMV0s-0000000A7un-2ZNb;
	Thu, 29 Oct 2026 18:38:10 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMV0g-0000000A7kv-0fXJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 18:37:59 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4a2d6cf958bso14408845e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 11:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793299075; x=1793903875; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DCSLRnb0vtBw+c3BivhCF1ac7dx2yv+/JlPhFH01Ir0=;
        b=aEvFCMta5PqB5jwrhEMGouoZ/HUHH1WYGa9zBgKo0Sy+aY9BoNG/8dlSm4VZG3IxHE
         mrfCEehBEh//yQEACaZhluNIOg2ZcW2hqpE7svtqauNzX/vPK9UHouev4Aaca4c0k4ml
         lJZqwxyN9jow/XasjWGm56WGDw9hdGcRxRXCLCg2fmNl1tu6Vt7kUTUFZhyzGBOrWTgv
         yZtZMoAj1ICRq2CfEm+lzaC8rG9uggpCNlspmSFK3ir4pe5+E1OOqpZdc0umES13f819
         F0tVaoMp44onmYL0aeOLioFZwC/F+VJlLdSI12TKiLLeKV6wvN34E8ovk5yg/r0iSXfu
         MZOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793299075; x=1793903875;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DCSLRnb0vtBw+c3BivhCF1ac7dx2yv+/JlPhFH01Ir0=;
        b=bderq/1ep4IR8WqAowz/bda6EGeTR/pKxlqtOBHGz1ZV8n2p0je0ktNOZwB/hssUZ2
         ZV4fndMnMIOUXEsfGrst3LcvI4sIlyKU2PA5WWTQ+YCHLTBNDCs8xAUxnzS/TJTzSbgg
         ljhuSvBYhTH/nFjRn809Zf94x48LSMpnSfHK42PAMBXCwUNqqOnQQJLz5p6HIGpdbA0i
         2ZyTr0ZMolWSYhn06vRdwuwKZgqVLoC2+/PlQi7HLBqefjb9hlM97DjvE5uRgi7aIwhu
         qhiUufdae2c1JhxYfiSSenuhnBZ3OkpPKr9d0l63Fwgp5BaEbncbo1dKOLgeOGZKgxLZ
         Ekyw==
X-Forwarded-Encrypted: i=1; AKwUvByc+EJnhL6cqGBF2KX5yC/g/mnf5VSO3X5mOvHULuA/CJsdl1cQPwhj+SGsQeo3mF47xx3KGR3zD96ML3yW9V+1@lists.infradead.org
X-Gm-Message-State: AFq9FYKTLNEbMVDWEX1AI3r+jl5sUPlpRGlom8CyXdrkGbXbhx46cL3c
	Keowg/pyopbhFIreLZZXsYF8Rn2rWi97jIz63OY1PW+zGN1fw/O0Wg4d1B/gihNfTG8=
X-Gm-Gg: AYBFou0iiquhwUCtR99hTDUYNQePst22NTLsohrFb8/96QZXxKfLeU6n0aW9v2b/yx4
	bcBncwM/QVBASxlERP2Xd296jg5wVm4tziI64F2366vPQLIoQ4AJwWONBv+3vFEY4NRJ0ngMwqo
	gLe5tfN5hqyU6FSytve7/aPFclpCc6kS4nujwH9EVMHetlrCS8YzbHqyp/yKFdFEndouLX/f8JG
	lZ32lDB72p8vjfHBdOfGJJIX/34PzMNP4JYIJnm/QZeV3z6/pjriUZFQconjEwcQEp0JHWQq5rb
	5R59OVGSBfLuU6Uc4k/antOHKD2BdKo/+j/nonUuqZdHI/vNU9NZLLaTMxR/3h1kO20Akkn4FCp
	r/19nrkEJLLsnwjbtFUMMB/e49XdfbuiNMvYFmIJR1OU4W+bPoEsRaHANiIrJdBqdR7HTTBmrtN
	mKDVoqQ3+Qr111aAjQB+FQTOB2bXpCRCRn8YUPSnyE+mXBF4HNxtzt1ZuDWPUxAVoB1gghVymaI
	XOYYlYlNZXPvtMCr+3R6vHwGPUNLuv6ToXwNEGcfgMRWlcqTWrgU6Q3xKjaTiDq3+AtRLi5eVVf
	2PBKbs8cjcN5PXCsthJtruTAu+Vaa7NWnxvI00BaFmUVa5jwVIokHMjJk21LFMaJY9105TnJ2Cv
	i2/1fRWKLR9hMaNq19vo=
X-Received: by 2002:a05:600c:c8f:b0:4a6:42cc:bf6c with SMTP id 5b1f17b1804b1-4a9661ab555mr157927155e9.7.1793299074975;
        Thu, 29 Oct 2026 11:37:54 -0700 (PDT)
Received: from [127.0.0.1] (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa820492cesm90118305e9.13.2026.10.29.11.37.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:37:54 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Date: Thu, 29 Oct 2026 19:37:36 +0100
Subject: [PATCH v2 3/3] clk: meson: s4: fix ENCP clock selection
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-upstream-clk-encp-sel-shift-v2-3-31ffbb6b82af@baylibre.com>
References: <20261029-upstream-clk-encp-sel-shift-v2-0-31ffbb6b82af@baylibre.com>
In-Reply-To: <20261029-upstream-clk-encp-sel-shift-v2-0-31ffbb6b82af@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jian Hu <jian.hu@amlogic.com>, Yu Tu <yu.tu@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Carlo Caione <ccaione@baylibre.com>, Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_113758_249407_36F41172 
X-CRM114-Status: GOOD (  12.46  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The ENCP clock uses the wrong selector bits. Change them from [23:20]
to [27:24].

See the S905Y4 datasheet v0.7, Table 7-58.

Fixes: 57b55c76aaf1 ("clk: meson: S4: add support for Amlogic S4 SoC peripheral clock controller")
Reviewed-by: Chuan Liu <chuan.liu@amlogic.com>
Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 drivers/clk/meson/s4-peripherals.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/s4-peripherals.c b/drivers/clk/meson/s4-peripherals.c
index ba41fcd90588..33573eb85927 100644
--- a/drivers/clk/meson/s4-peripherals.c
+++ b/drivers/clk/meson/s4-peripherals.c
@@ -1114,7 +1114,7 @@ static struct clk_regmap s4_cts_encp_sel = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = CLKCTRL_VID_CLK_DIV,
 		.mask = 0xf,
-		.shift = 20,
+		.shift = 24,
 		.table = s4_cts_parents_val_table,
 	},
 	.hw.init = &(struct clk_init_data){

-- 
2.56.0


