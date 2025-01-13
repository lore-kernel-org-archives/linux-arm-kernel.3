Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87228E7719E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 09:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=P/Vpk+fuONkvTQ0KzQxSovHrQHyHGceSyePSaTNOG1w=; b=sFHKC/+dfV8NWHv6whk2geKc4W
	Vrfrsz5kyy/m0iKuw95T/sb6hgVNWz70jT6NUBer/qwl7Cx7C8F7PHvcaLMji64NFh+gjC1JzocYd
	7uqgJSK/EcIfPLMEZ3374X9htpU0XsFYiKansFdBA9lIjwD8Gth6h8zQecS1Olvfig+5HFHcz+/BO
	wc/umjShRf5ImuAs6AKXDStwpbQ51fdbeO7BQueLjGmltE6i4tw94Q3PD6HLXri4TrOZjKoYVitVz
	8dzZ1/A7KRdcaLleF3u9Jp6UmM892Cxfk/Wk/8246PSKrWcbYV0BWIqFfPn2YCpBbTkLt6MYzwbUG
	vSuhsjdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXH3a-00000004gqt-1ESP;
	Mon, 13 Jan 2025 09:48:26 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXH2K-00000004gcY-36Jx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 09:47:09 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4361c705434so28547055e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jan 2025 01:47:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736761626; x=1737366426; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P/Vpk+fuONkvTQ0KzQxSovHrQHyHGceSyePSaTNOG1w=;
        b=R9800ez42EbjVyhazVojqRU43to6ipnliAZoTcI0gzAwLXrK/vuYD12OAuYta8VWnm
         4GOa5dYlfV9lLepc68PSY6PRO1sOHJ8OK0krjj9aik8wirDswp/9TKDq5/sYUeBRNyso
         xdqxXSg7UBuvIl1HxqkdShOWP+cOqA58MEM0hre23dzj5dle7LjgiNS7GrnPX+QvpzcI
         AiyHhfN8w0GzP5miGwfR0cBp1Ngm+pkHT+V5kg8WlZh9QVpyUweYbH4H2xs9IsREmAJ0
         0Bx60tl0L9hxWS4oAnTdedlKd1X25WbD3MHe2PBo2ZNJVZxNGCVyFI+IlFHojnk9n3cE
         eprw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736761626; x=1737366426;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P/Vpk+fuONkvTQ0KzQxSovHrQHyHGceSyePSaTNOG1w=;
        b=DWvKZfi6bASfx84eljLnYbCrEO1nY8wrru4NjJOoWoYpf2fqfa+FUIxTVcVad9pg4K
         gC/XSz7h2pMWvX4oBxwQCISPTs0V2xaUiVXScMna2L+phV8ludjwXx6RU+NO/kCtXoQV
         RLe1Kv8UFCiyO44lO8MQvisNzOTExOCsjlRkiVAIUaJoMknsGpLrV6WBjX69yR62wmRd
         XLVl6UabSgJElfMLpy2lxWehYFlU7hBS76AN9ZJmapnnIf7erXw4zyMvedESTY2C8o36
         amGBcbMbtFf0sTsQ/Ua1KYWW9yma4qca174ePpxoiDlZh1Szm34ScIph6zdfar2pHg4N
         unVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZtDX7X1P+xaTxgnzXSXUSO59ju41145GRKHZKahiuSskWhesFGMqKyKtV2lagGpi2hld/f3y4KLkZt6ALBkG0@lists.infradead.org
X-Gm-Message-State: AOJu0YyHFV0dxZvLe43ddJOpphCXWCGdafullgKygD7sJnuwSUDAv3Eo
	+AvgX1aneko/isfrrTbvUdeOSXBF9+YulWbRcZQkazC3QcMhstJ3
X-Gm-Gg: ASbGncsfbPAaj4Gk7lXg8SBF1QyjW2cCb4BX/wZSItjmVQAyjjwR0DIH7NOxlasOiKe
	Irj4iN2SIgK+YE29uIlvcTxeHVSiDE8wIM1DmQuDYCChUO+NtKVykGz6/+8ce2M3lfc0Ne6Ns6J
	z5NHojSLCYenR9UAHTrGh6qgGXOt0IZWI+RRWjlVl+bCfi/HoC3CDxZi446xnjUEsp5djzczeja
	WPIsEU59vBkvABXqQoo5EVM3tjw48iGNp7VyZKKhj3lqoOLGIdurbdmPdFf6xI051iAd8GS
X-Google-Smtp-Source: AGHT+IHP5Bm+4RrlbE63eSMQZv1afGLq2XBlbRHRzKAffDpxJbpr/cFucD7iCpIjpeVScKlPbLduCA==
X-Received: by 2002:a05:6000:18ab:b0:385:f349:ffe7 with SMTP id ffacd0b85a97d-38a872f6d5fmr17550961f8f.2.1736761625584;
        Mon, 13 Jan 2025 01:47:05 -0800 (PST)
Received: from eichest-laptop.toradex.int ([2a02:168:af72:0:a5a1:302a:fcf7:c337])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e4b80besm11472257f8f.83.2025.01.13.01.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 01:47:05 -0800 (PST)
From: Stefan Eichenberger <eichest@gmail.com>
To: abelvesa@kernel.org,
	peng.fan@nxp.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	shengjiu.wang@nxp.com,
	francesco.dolcini@toradex.com
Cc: linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	stable@vger.kernel.org
Subject: [PATCH v1] clk: imx: imx8-acm: fix flags for acm clocks
Date: Mon, 13 Jan 2025 10:46:08 +0100
Message-ID: <20250113094654.12998-1-eichest@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_014708_775482_728D7E2D 
X-CRM114-Status: GOOD (  16.54  )
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

From: Stefan Eichenberger <stefan.eichenberger@toradex.com>

Currently, the flags for the ACM clocks are set to 0. This configuration
causes the fsl-sai audio driver to fail when attempting to set the
sysclk, returning an EINVAL error. The following error messages
highlight the issue:
fsl-sai 59090000.sai: ASoC: error at snd_soc_dai_set_sysclk on 59090000.sai: -22
imx-hdmi sound-hdmi: failed to set cpu sysclk: -22

By setting the flag CLK_SET_RATE_NO_REPARENT, we signal that the ACM
driver does not support reparenting and instead relies on the clock tree
as defined in the device tree. This change resolves the issue with the
fsl-sai audio driver.

CC: stable@vger.kernel.org
Fixes: d3a0946d7ac9 ("clk: imx: imx8: add audio clock mux driver")
Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
---
 drivers/clk/imx/clk-imx8-acm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-imx8-acm.c b/drivers/clk/imx/clk-imx8-acm.c
index c169fe53a35f..f20832a17ea3 100644
--- a/drivers/clk/imx/clk-imx8-acm.c
+++ b/drivers/clk/imx/clk-imx8-acm.c
@@ -371,7 +371,8 @@ static int imx8_acm_clk_probe(struct platform_device *pdev)
 	for (i = 0; i < priv->soc_data->num_sels; i++) {
 		hws[sels[i].clkid] = devm_clk_hw_register_mux_parent_data_table(dev,
 										sels[i].name, sels[i].parents,
-										sels[i].num_parents, 0,
+										sels[i].num_parents,
+										CLK_SET_RATE_NO_REPARENT,
 										base + sels[i].reg,
 										sels[i].shift, sels[i].width,
 										0, NULL, NULL);
-- 
2.45.2


