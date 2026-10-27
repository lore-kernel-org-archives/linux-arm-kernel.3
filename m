Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF83606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 21:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=p5CUFx/S;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Awqj4d8o
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=52eH8NRxpy/xtwCvQ5Etkj+uy8ipBxuMgaO35J8aHsg=; b=p5CUFx/S07f+Uf
	/SfKg+pM0yqSj6k/LIucRF/4CYEDPVOHMhdefB2li85KHrL3iE96+euGZXTymIx33cTHYp6rulPvU
	P31heOEm6I4hNCtYxOhvkUx0Igbf+liPXElsrNrt/r2twGCfbGiQ5d6QfgkBkIsrT2Dg1xsNWnldc
	EHXa44GhZ23fuItSQMGIGyud0fp+457HtKULmHH3+HmKdwoCAxca0GFLgniJdvq3eq9cR39CnrfY3
	emFuVTHEuvhhuEBeUxOAuKSPlMDrCYMoofvcuk+gOaXxBJUXv89Z/mTW68HX2zYxZL2ltwDxVaVPQ
	wayW6loHAoUBNbpCKywA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLokN-00000005n92-2gNq;
	Tue, 27 Oct 2026 21:30:19 +0000
Received: from mail-dl1-x122a.google.com ([2607:f8b0:4864:20::122a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLokF-00000005n6K-1uSq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 21:30:13 +0000
Received: by mail-dl1-x122a.google.com with SMTP id a92af1059eb24-188406bb948so252507c88.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 14:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793136610; x=1793741410; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=52eH8NRxpy/xtwCvQ5Etkj+uy8ipBxuMgaO35J8aHsg=;
        b=Awqj4d8o4q0P1towP7fBE0MPELVSEhceuSahU1SDR/rqMAuuRCRyE11oNXXJZ0Eqwa
         YhrWMALCZcaUPjT1fWj9yl7I437psuCOGN1H2Spue4A/pNtSkv276gaZoy4I4aVkh24B
         UF2EkSdD63os1iZNYekgloHJuAit1IZ9eM9Sa8r5N+nRQ7BvAi9nHVYBqyxeostlUzMr
         onx2Dg6/SfzMPkR5v2yP+vCdvJUBaFnB1ZiRhM4MZoAfW9Hijp/FRb+eeGLNsAowuDoU
         xNnFoBNb8TYyr6oYLQqCGerMSvnwtAcxBTPS4+0aKX25ss4Dc7LP29effNLz8fnR93zK
         qhPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793136610; x=1793741410;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=52eH8NRxpy/xtwCvQ5Etkj+uy8ipBxuMgaO35J8aHsg=;
        b=B9TkFQfpR5w6QVaiCKNGPZ7uhNz+EEDOjShjfjp8VNEBr4vZlFAg/M/YiYuFoW8xwm
         oLAcwxKbvvVu+EvrxMsY1gKgrcmK9+3wae3UYS161VXG7HaIprz0XFwiFDdo/Zov6ilh
         WPaeBBzMPg3sCCx032BsaTBZ6VUiepGMxBG3SgmsQKvBgr3ocZfTV1oJKk/6e6Zh705h
         Wo8TxbbUcMqHAmBersGNI9MyVRwA8KTXJ6Rr+vDZ/WkmJtSiA6GI79NcsfdAzjQoNpIu
         RxAfAc/aAUjp4jiCUTB96Owz/A6noHekKtfN+o9b4OToUR5eAlZssszjSw4V8Verxhqs
         4fOA==
X-Forwarded-Encrypted: i=1; AKwUvBzOrw4NI2yM5gnnrHdPeadeNB8i32eHrKMwWBRY1LAueOeClgqyzt5r5Clof4rPKOup3US/sYTgbHn6AEPOgXp8@lists.infradead.org
X-Gm-Message-State: AFq9FYJoIez724tDIjhiAm5K60Spsfls2zt0vtMVEmHYAYaOBNtpeIbU
	v5mXRR/gOnhxYmdjfG3oc3MJG8jJj0OUBZcxvsBUi4dZfJWVr2j/hHOw
X-Gm-Gg: AYBFou084lx100aZKIjv//G0VdPLSTPcK4ACZU7/YlJiJklhqL6MYs2LO431kikFZuK
	BSMZ3u08qoagLtT6/CD+L1nFu0b1f+phE6ACi3ajPNk5rM9ZgC5ru7BN1OH8WtmXenYPZoYa/Tt
	aPCd1EOyzSNkub/+paahtiTa2v/GClkL9SXE/2pSc4En1DfyIueZEbsQpSot5Qxpd+cKKcJsFFU
	1KIxJIf0xpA4MyT+qFrkhSml211JdMcoVxHshSAClKU4ZgCjRaaXSeOTETOxh5PNw4aHTKYBMVx
	UP+zQ9irYPLv5lnRZbsJU0dgh5FfT/K28uxlF8uhK8hQNShmqeDUc909llZCFLyVZAxpNnOAz53
	KKSC+i0qzRVckI65AumkBkW3Gdhoeic9ToHc/jROS1Hv1jcuRiuGCnl9wbO488/C/Qrp7iKXiIv
	gHQaL7cakiTHOV4DFMdebE09Kt5w89XBLevTdGotALwz9f131sbDwf3aEWqphNcYSJ9mJoji2eo
	7Flc5jtQeeDmQgm2f4lpzb0R627v1VhGVgqkgMPYOW8iTIBDvbS5RjW3+BGRmHYHXhIrhlfVjVJ
	o5TVcN6GLyBXciD4DU8/xGanzqP39JHjN1IufWWBfSigq+r4JskARIss6bmT7CQldScSG4zRKvR
	hGJcgTKS2rOocEHuAEA==
X-Received: by 2002:a05:7022:3b8d:b0:144:c128:4c4b with SMTP id a92af1059eb24-1a6cfde6ed5mr616780c88.36.1793136610258;
        Tue, 27 Oct 2026 14:30:10 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:9958:9525:7799:82b5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a6d7ed488fsm723725c88.7.2026.10.27.14.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 14:30:09 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Tue, 27 Oct 2026 14:29:58 -0700
Subject: [PATCH 4/4] ARM: s3c: crag6410-module: configure wm0010 interrupt
 trigger type
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261027-crag6410-module-swnode-v1-4-2f885799b6ad@gmail.com>
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
X-CRM114-CacheID: sfid-20261027_143011_503215_F6B7AEB4 
X-CRM114-Status: GOOD (  13.96  )
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

The wm0010 driver currently defaults to IRQF_TRIGGER_FALLING when
pdata.irq_flags is unset. Unconditionally set the default trigger type
on S3C_EINT(4)'s irq_data to IRQ_TYPE_EDGE_FALLING in
wlf_gf_module_register() using irqd_set_trigger_type().

This configures the default trigger in board code in preparation for
updating wm0010 to rely on the pre-configured interrupt trigger and
dropping struct wm0010_pdata altogether.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/arm/mach-s3c/mach-crag6410-module.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/mach-s3c/mach-crag6410-module.c b/arch/arm/mach-s3c/mach-crag6410-module.c
index 55f55e9b9a46..440f19d5c64f 100644
--- a/arch/arm/mach-s3c/mach-crag6410-module.c
+++ b/arch/arm/mach-s3c/mach-crag6410-module.c
@@ -8,6 +8,7 @@
 #include <linux/export.h>
 #include <linux/interrupt.h>
 #include <linux/i2c.h>
+#include <linux/irq.h>
 #include <linux/spi/spi.h>
 #include <linux/gpio/machine.h>
 #include <linux/gpio/property.h>
@@ -463,6 +464,9 @@ static int __init wlf_gf_module_register(void)
 	if (!soc_is_s3c64xx())
 		return 0;
 
+	irqd_set_trigger_type(irq_get_irq_data(S3C_EINT(4)),
+			      IRQ_TYPE_EDGE_FALLING);
+
 	return i2c_add_driver(&wlf_gf_module_driver);
 }
 device_initcall(wlf_gf_module_register);

-- 
2.56.0.307.g5fe7bd680c-goog


