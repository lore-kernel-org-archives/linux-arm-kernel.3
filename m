Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C891E606A327
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 19:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=45eRDyEB;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=bC7xQxWo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=xImj77wxU1JiPHrCn+RpkXX1bCUiT+eJFmt0+GqsKlk=; b=45eRDyEB9Fv+4F
	optMIggbzD0mmKYfPUwPeHlvunAOhFBwZfpR/469sHAAiMeCxxyBDy83f7u1edV0TDhR3HblKotPM
	zkv6TLEvIKewrS7VL7aIqPsmpZtwdMuDRoDhTCeN0CLDePNU6kYm+QrKjCe3Aa9wWtcUbHS17VKwI
	VkIzN+ioMkr/1cCo0rAiVkyNBpu1JVbx1cTAjpSrvUp6qfamRLPgF23smn3uR4b0kQdsvFmhafuUM
	nmMMLQGrr1ea+s2YJ9WcuDMf5e5M6GRE18gfssPLx/7jzf6uG7LqMR99nLsQcjbH0wp0uCLaNZ16q
	v5jxCcODx/I3+HRBiqRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNy6D-00000000DOB-2No0;
	Mon, 02 Nov 2026 19:53:45 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNy65-00000000DGz-2Bad
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 19:53:42 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so30740615e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 11:53:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793649215; x=1794254015; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xImj77wxU1JiPHrCn+RpkXX1bCUiT+eJFmt0+GqsKlk=;
        b=bC7xQxWotyv09CvPfXbSNBYq9bD6CcfJljtpFTTCUMKGBDrCmjEtmcKA0WYlZZeLu0
         cxwIbpbNCltOZTUOwZPnatjl54x6foVxSGIzryXxt2qlC6A87qeustMeVGoczyrjTT+V
         4XI6an0OTMfkb6KrpTu3wbK72pNubfD3fWNFHzp7dBNU0W9BFTTOzqTclqe7UMxkO+Xg
         sbI+cGF432wmKmzVuOWSIIq6i+dh65nCZTj/tT9zHsMo3BMjfC5vYrytqYx9oZsjf4Lv
         3+VFDHA2knA0Op4Db+bbO/asVQh1aEtQTsaznab1Sct++5Gb3JoXjqVvtdCJU9bIQnJN
         Ppgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793649215; x=1794254015;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xImj77wxU1JiPHrCn+RpkXX1bCUiT+eJFmt0+GqsKlk=;
        b=uNy/CKtUOzcLfJ/L03fAb/l2cZuOFkC7k3dLX5q/kSx2m0OxFmRWhJQWRKMrwU1QAO
         M8wOHUw1SpST3p+kbMNos94DSkaCLelWXwZCOOFayCfDzhP1hsSRt/um2Nj90yfLGBCq
         MsTEujsIS3MFszDloF5cN/d6THxKaX3JIkn9T1vSgXiwhVf2iA7xqzpxpgLF/NnFaZ4w
         nNulcbcd7WSDhdL/ZnCwU/0pOlPbcW0D5uSL4QuoE7elQ7NwPiFjLNJVGeIc+7B/1/FJ
         p3Gg5dBamCL3ofbkmSLBQw95rF+dArS0LbjG4TUYCinKNt8n4rWQKyfhC9mGIX/LYtKf
         B05w==
X-Forwarded-Encrypted: i=1; AKwUvBzqGAnA5GjAzCJZGXplRVvnJNkQ93Ul0TMH//Z4zNh8cav6tozL4ytosFjabjIx9L34Wa2xL1nLepcIjaD4CeZe@lists.infradead.org
X-Gm-Message-State: AFq9FYLOVM310IJqJfpX0o4jWRlGHTogeOEdhXO1n04oinYtK1aRfXYy
	4f30aTk7tOqrX+1b5H+3sd8rgXnfmnn4sLiCh+EYIpdpBwZSBtHyOgc1taFP6PPek2I=
X-Gm-Gg: AYBFou1wqXQBxp1fhuEPxX2oWOph5egqON6EdIRwlHQwPiwX1tcficwyv8vK9ThB82N
	8VnzfwDCcelg8nNs2bxN5HoVTfSMbTGT1wmvhRwyjar9ahQkzw/TgTTwO1KmasSjIOU7t8hKhPe
	m5mXe45M4CwF/xGWuI74kqlSKTneZ2kAKS37bIsew/mIUGQGyR3TLiWtl9Kf+cIVJXeBrivzxwo
	4+K8K7Mhis9nvC/D5xPW7SODjDzFPWhAeK3WxGjUfmQ/5mxnxjIff/wIUoFw6W62IghDH0me/kY
	9Av8DqoTuiAO6hdK1lm4PAlX3zrV0BdSCkR8xo2luP0RSxGso0OTzmDXBwM0WXwDSUFEr68a5BL
	FoeE+uCFSNvylzs61m3kp9xXKXO+obLQ9J9cfUZYuX8pmSHOkTkLondQQEAWhTXqr7FPHDxmeGy
	p68rLJiJ4I+tQAJSIPvnCCUjCC4ESk4DjNbPwTEPQKulVLWAvxoEMmHW5R9kuqyyaScYt7e8d6c
	cpnaoBnNCcLe3othDTU7mhKewkoJPveS/Nx8cF1bCawk9ewHz0wxkMOXmriggkYe3XuoQTJnH1R
	95AO/XiXjlHQpQrMIIytioly4cr6vAu/RPqqJQpZ6coHdsqVsJs3wkEF3/8Q1Y5+NdV6FMNwd4G
	Hl7IvA1ahdOjKSIGLGpiLkviPfZU=
X-Received: by 2002:a05:600c:6989:b0:4a7:6425:c274 with SMTP id 5b1f17b1804b1-4ac150b38d0mr253158745e9.2.1793649215549;
        Mon, 02 Nov 2026 11:53:35 -0800 (PST)
Received: from z13-ek5.local ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3cesm24039784f8f.7.2026.11.02.11.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:53:35 -0800 (PST)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Mon, 02 Nov 2026 20:52:51 +0100
Subject: [PATCH v3 5/9] ARM: OMAP2+: ti816x: Remove mmc1 hwmod
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-patch-ektor5-dm8168-dts-v3-5-9bd6d1d128f2@linaro.org>
References: <20261102-patch-ektor5-dm8168-dts-v3-0-9bd6d1d128f2@linaro.org>
In-Reply-To: <20261102-patch-ektor5-dm8168-dts-v3-0-9bd6d1d128f2@linaro.org>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Christopher Obbard <chris.obbard@oss.qualcomm.com>, 
 Andrew Goodbody <andrew.goodbody@linaro.org>, 
 Paul Walmsley <paul@pwsan.com>, Russell King <linux@armlinux.org.uk>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Ettore Chimenti <ettore.chimenti@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793649208; l=1739;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=G9T2NjG2BfNSixK5sZS2CvW8OhbMENFuouCNl2SV0jo=;
 b=ZZLDjvHR6I7hIyGPauR2LYro//dURZ3tYARcVpY+gDOy8N4xYf/mLi6AHVlxgrzjl5I3lL6xr
 RBe+pYKXStnD6Fv6kqtmFRpBrzXmGw/RgUYx9gVc6FQ7jEsPfEUs7ud
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_115337_588699_A25665A1 
X-CRM114-Status: GOOD (  11.76  )
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

Removing TI Sitara DM816x deprecated hwmod for mmc1 in favour of
ti-sysc implementation. Tested on DM8168-EVM.

Tested-by: Andrew Goodbody <andrew.goodbody@linaro.org>
Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 arch/arm/mach-omap2/omap_hwmod_81xx_data.c | 25 -------------------------
 1 file changed, 25 deletions(-)

diff --git a/arch/arm/mach-omap2/omap_hwmod_81xx_data.c b/arch/arm/mach-omap2/omap_hwmod_81xx_data.c
index 9b5c728fb7da..bdd04fed8034 100644
--- a/arch/arm/mach-omap2/omap_hwmod_81xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_81xx_data.c
@@ -989,30 +989,6 @@ static struct omap_hwmod_ocp_if dm814x_alwon_l3_med__mmc3 = {
 	.user		= OCP_USER_MPU,
 };
 
-static struct omap_hwmod dm816x_mmc1_hwmod = {
-	.name		= "mmc1",
-	.clkdm_name	= "alwon_l3s_clkdm",
-	.opt_clks	= dm81xx_mmc_opt_clks,
-	.opt_clks_cnt	= ARRAY_SIZE(dm81xx_mmc_opt_clks),
-	.main_clk	= "sysclk10_ck",
-	.prcm		= {
-		.omap4 = {
-			.clkctrl_offs = DM816X_CM_ALWON_SDIO_CLKCTRL,
-			.modulemode = MODULEMODE_SWCTRL,
-		},
-	},
-	.dev_attr	= &mmc_dev_attr,
-	.class		= &dm81xx_mmc_class,
-};
-
-static struct omap_hwmod_ocp_if dm816x_l4_ls__mmc1 = {
-	.master		= &dm81xx_l4_ls_hwmod,
-	.slave		= &dm816x_mmc1_hwmod,
-	.clk		= "sysclk6_ck",
-	.user		= OCP_USER_MPU,
-	.flags		= OMAP_FIREWALL_L4
-};
-
 static struct omap_hwmod_class_sysconfig dm816x_mcspi_sysc = {
 	.rev_offs	= 0x0,
 	.sysc_offs	= 0x110,
@@ -1236,7 +1212,6 @@ static struct omap_hwmod_ocp_if *dm816x_hwmod_ocp_ifs[] __initdata = {
 	&dm81xx_l4_ls__gpio2,
 	&dm81xx_l4_ls__elm,
 	&ti81xx_l4_ls__rtc,
-	&dm816x_l4_ls__mmc1,
 	&dm816x_l4_ls__timer3,
 	&dm816x_l4_ls__timer4,
 	&dm816x_l4_ls__timer5,

-- 
2.56.0


