Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E5A606A324
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 19:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=duU7CB8S;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=n85CPde6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=majDZyUsfWyRx1U53vBoYbbsfxp7bUhn4KTUkz67Qug=; b=duU7CB8SPhXjdO
	8dc/o2Xx14l+s3PJsnVZ1D4Dc0m2IdNa041V2ULg/cxf/m+45Pi40mKDgPNZQTl5uZL8bPH9MgL0z
	Y0U11VPoXtWl6Gx2EFfXH7E7VCl4Oxcxhx24MwOmZZ2wNH6L32N7BVlwdwaxy9UD8wwVSBsup+pub
	AIhNQ4f8hYsJRXlpMODa5oyM8SUJk8ReeHZAjSoQ1YuIxbPobjz8Ll9cuS03JIamuYc7o2/6ByTqu
	KfIlFSLjaykopLEEoq6JtGl3LxxeIG7Z/WrY++AQYPL8wzVKWVplM+L3Ve5LkLrxQsoo3wVGEB0ct
	JQdZ3hummKmfoXrQYKQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNy6E-00000000DPN-0h4y;
	Mon, 02 Nov 2026 19:53:46 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNy67-00000000DII-15Z8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 19:53:43 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4a218c463d1so22974165e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 11:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793649218; x=1794254018; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=majDZyUsfWyRx1U53vBoYbbsfxp7bUhn4KTUkz67Qug=;
        b=n85CPde6UQz/JqfNeajtnz+B6Cgj2hSkyq26Re5b0MFMkLf321C7JANV3qpOC1TTHN
         sPaU1DN7anqI2vrj2b/f+O0ryiSAlWzJGjTkLv6A5wQY220YQdCzMZ9niUC4dK6TlZ4a
         nzHzjlkMzSS+dGJ5rsQGZ2PWeJUNsae4IP24xF3Rf31xJOHIHqd+8LGHdiqmagZ48taO
         WFGEAXw92xloyQ8WPK86QNJkXQ55voTtXWaHQECUgMvSvPoKu2CAekA/UIeBEXoUipHc
         Kh05rmYAwx4qFQmHxzG5Ff9Zb+i0EvbQIHfdgMV1ErXTeEqCZKCDMVOEyBKrSZssx9ea
         y57Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793649218; x=1794254018;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=majDZyUsfWyRx1U53vBoYbbsfxp7bUhn4KTUkz67Qug=;
        b=q+L0mWs5xpuB6pe73b5w+WVgrz0jNDd9Y5m9M24U/H50mdX+Ory/kEHWHIMwUikaRL
         IjpJ5+HZ0d+3xcIinJnmnnV8z6ClWREGE2OvcMIlN0BMY0XOH2YDKSXoByRHdT9qJgrx
         HIyvT28XbMncQ6OOvJQf/cuNHTUA0PbB3DCTir3eUfc4cvJ6K8cUp3/GnYjkRR2J4fXE
         fRLhF9xVX+CywcWyMFYw5MQOnl9SprqCRfMgcWMlIna44G9+zPD9mr692XLpTqHCq9m6
         k58ll5vXY/KTijYcu4R7tgbE1/1Gy+Qh7lasrpuZNIEsMX9QuH5nbc8IMXRSUkqoUAmg
         YkUA==
X-Forwarded-Encrypted: i=1; AKwUvBxzxsLJC0uHpcvDO4KwXJiGkhz3JNdeUSPQcccAUMqNjlHeuAHBeN0rXyTPkr5LHidMoLdVOXvLun32+ymqyqBn@lists.infradead.org
X-Gm-Message-State: AFq9FYLJm9jREMA+DwthGHDC7WnNQC+vF35meVL7aPwlageEnqPoFE47
	Vl+P7zPBzYiq5Wq3s9WloO31nUylodx/yx74Wzs3JLIgLIGrLa/AEuEmo1IFfpfDUyM=
X-Gm-Gg: AYBFou1p03TgNm3klYu4oRJYFEtt/mRYAG5OMgmD2QGSyamKh4fsojv2P5jXD9/aHdC
	Ji42drh/c8zW4FfcOEELBLZvTliVnf8NKiBtZQxGcwxEJyqm4PDkt7b+DWuPskinRd/zbcWIrQm
	cFts+CdFjlAxZm+ZMOXP6qijlPiRUaqnshYmhs/99mW+nYsU4PtuCisSdgdyT+X60Iff8BhDCrG
	U3PehT1dIhdPy01iFBCyq/owsgCNnTdNOnEL837759caIxcqG+XU1Xlo7YkAPFwnI1U5BCUBpVO
	p496aRdEHB4qj1c7eWCEXhpysV9+49REdJ8Imemm5ZblUVx+jQUbxzFspxA/6XovMh1D2sdD8To
	iHVQGnWTLsodAinnf/mJlhjnkn22NhX6OuF7QPg2AgEmR9kSYPKLn1rHcTTQDtgyYeSzGCqOuiE
	ix3+ybIXzeO64Tan08NBGR26SxI8NqI4cONlnfUn9AulmO5ssi56/BvGTG5ujvmqaTYWIr4GcD8
	NwdE0kykm3ctuQEjusgJ/w+snSOHF0rb/s9YNF6zXODMptWll2bI9oUSzX7IBdp5TPGhUV0asPa
	/ySKtQfVq71fhnl+5woWh/2FzH2WOlEsV80/cUlV8PKnbbBif/kIbpceq3ueBzhOsO4QfSAxpen
	K6lY78ZJ7sfwuObn0ew9NQUjQPiA=
X-Received: by 2002:a05:600c:e41a:b0:4b2:406b:f3bd with SMTP id 5b1f17b1804b1-4b2406bf3d2mr33884285e9.23.1793649217703;
        Mon, 02 Nov 2026 11:53:37 -0800 (PST)
Received: from z13-ek5.local ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3cesm24039784f8f.7.2026.11.02.11.53.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:53:37 -0800 (PST)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Mon, 02 Nov 2026 20:52:53 +0100
Subject: [PATCH v3 7/9] ARM: OMAP2+: ti816x: Remove hwmod code for USB
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-patch-ektor5-dm8168-dts-v3-7-9bd6d1d128f2@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793649208; l=1624;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=k71BaTXmePgSJ8uhTSNGLd6YddqmO25ujKt3OAYRrbI=;
 b=P8AE5PbmCCLuy/Ppxw3PTz0WUPfmfz1xHkFqfzmjk7Pc+my/DThex7cRdc8Cv30Fio8oEhxUz
 1kdtOJibLGlA1JLTSPIVWpwfXfCOB886FOvJubPpva5dvZEc7OZGYtR
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_115341_157273_E72D79A7 
X-CRM114-Status: GOOD (  13.04  )
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

From: Andrew Goodbody <andrew.goodbody@linaro.org>

Remove the TI Sitara DM816x deprecated hwmod code from the hwmod data
file in favour of the ti-sysc implementation. Tested on DM8168-EVM.

Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 arch/arm/mach-omap2/omap_hwmod_81xx_data.c | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/arch/arm/mach-omap2/omap_hwmod_81xx_data.c b/arch/arm/mach-omap2/omap_hwmod_81xx_data.c
index bdd04fed8034..8ca492ada179 100644
--- a/arch/arm/mach-omap2/omap_hwmod_81xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_81xx_data.c
@@ -646,26 +646,6 @@ static struct omap_hwmod_ocp_if dm814x_default_l3_slow__usbss = {
 	.user		= OCP_USER_MPU,
 };
 
-static struct omap_hwmod dm816x_usbss_hwmod = {
-	.name		= "usb_otg_hs",
-	.clkdm_name	= "default_l3_slow_clkdm",
-	.main_clk	= "sysclk6_ck",
-	.prcm		= {
-		.omap4 = {
-			.clkctrl_offs = DM81XX_CM_DEFAULT_USB_CLKCTRL,
-			.modulemode = MODULEMODE_SWCTRL,
-		},
-	},
-	.class		= &dm81xx_usbotg_class,
-};
-
-static struct omap_hwmod_ocp_if dm816x_default_l3_slow__usbss = {
-	.master		= &dm81xx_default_l3_slow_hwmod,
-	.slave		= &dm816x_usbss_hwmod,
-	.clk		= "sysclk6_ck",
-	.user		= OCP_USER_MPU,
-};
-
 static struct omap_hwmod_class_sysconfig dm816x_timer_sysc = {
 	.rev_offs	= 0x0000,
 	.sysc_offs	= 0x0010,
@@ -1225,7 +1205,6 @@ static struct omap_hwmod_ocp_if *dm816x_hwmod_ocp_ifs[] __initdata = {
 	&dm816x_l4_hs__emac1,
 	&dm81xx_l4_hs__sata,
 	&dm81xx_alwon_l3_slow__gpmc,
-	&dm816x_default_l3_slow__usbss,
 	NULL,
 };
 

-- 
2.56.0


