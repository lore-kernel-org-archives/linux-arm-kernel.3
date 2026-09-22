Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28B7BC982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 22:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8GRxp3EYFeG4RHE5TRXwDLoJws/VabvUKmMB/dI5TDY=; b=VMml0TrK5+zycnJOCeu1pOC8ND
	GYhEQDdNEg8NLPyon9cbXf7Q2Ep5h7X3CC0AnogjKpQR6+F20Fut1mv/510p9oZmE6EsFyZTmseac
	3u5npkUnrujNHScktPJT2mRA9rGt61b8fKHYyQGJ0Hnrd80LGc9z/gqsuJcEqKuPle4PnJP45OCb6
	0DoE4DBjiE48EzJdmC3dTcrsm1+Q+L2QHFF4WhspLPorWIEjxbLG2gBI/qvOj8+X7a770sJm51K0M
	zMPnnlvNXXjWXyka8wcsPt5/S21z7vQppxj3t7yMJnyuSNBeEdH3GWXONmew0KccQE1XpUNNbHg+z
	Fedr869Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x995W-00000006glP-2odB;
	Tue, 22 Sep 2026 22:35:46 +0000
Received: from mail-pl1-x647.google.com ([2607:f8b0:4864:20::647])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x995T-00000006gl5-3SbK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 22:35:44 +0000
Received: by mail-pl1-x647.google.com with SMTP id d9443c01a7336-2dd667770efso15292895ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 15:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790116542; x=1790721342; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8GRxp3EYFeG4RHE5TRXwDLoJws/VabvUKmMB/dI5TDY=;
        b=WVpqIdHi6z71y5P66ALhJu+3fsfa4Icm6t80yOsLbyMTq89WJ5agxrNAb1tZJj4DPS
         UZZvB+8CH9t4DWI/cu6pgW8J7dn6ymjhGiEXaXq3BF+vEbOe9ZW9UM2tnhpGkfkiaEVS
         5gLNsSvzMBDedUEJHsvgKqoWRMpUudyprOJJfVD51J/Bw69gbAw5EKJ/wHX32/USA34T
         5WyAFVXfWHXmVqeWZ7kqqgzY22LMVhBWhvPVV5gl0emVt5wzKrt4e/l+HM7p9PKN1DCV
         wklMTEJd+iryYrboy/rNitI1qFwSpAcgqWRC0UntAGZ255NERRZvaBdXX2uOtZWIu0kl
         +Rrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790116542; x=1790721342;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8GRxp3EYFeG4RHE5TRXwDLoJws/VabvUKmMB/dI5TDY=;
        b=TDku9B+44Clt0uxOIwVV2yO5P6C8/qtHkWWJuKG4oCngnzLB0C4AJC2LxziQ1XYmp7
         BLH1e3+lKQbnBC/tnmhzcvno7ldy29gfdTlhYcsbJeocYKAn7lzhZG6eQ/suEHwEXqze
         2qt61Njq6E/x7qsybOM4itljr3A3FdMdIT7hVEbRrSdOF2TuRp6G9yEiwlBaZQ0A56oE
         Jlrow13b1yCYzdSZl/Y1EBkea0KgHP73tUTTJC0ErYvls4fKQnqIZdPzpWtk3vPNi6XO
         vhrL07XqFo/mDOR8MzZ6DR207uv9fwB64JHVSwbMlg62ZuvIds+zOd2hEvW5jlPCz0d3
         wz4A==
X-Forwarded-Encrypted: i=1; AKwUvBz+faglGUN6NSQlZO3vuVbYbGMrZkrV41vhnKzNoD6hwZyVFZKgwV5ThFtGS5dEFvDztOTL4GGAINNCd+OnzKDf@lists.infradead.org
X-Gm-Message-State: AFuF++kuYkmiuwES52zxpQY6FMJ9Nucufc3S0cOdvCLXe6YgOpOkeMYA
	vIMQLiNVoH/09z673WuF9eeu+cf7a/NHgnRrCsyBiJOvzp1BTwnHMhFG7IdbhytsNj+SbqhDGP8
	6
X-Received: from ploc2.prod.google.com ([2002:a17:902:8482:b0:2dd:53b8:ff02])
 (user=morbo job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2ec3:b0:2df:69d4:86bf
 with SMTP id d9443c01a7336-2df69d4884cmr5081645ad.11.1790116541866; Tue, 22
 Sep 2026 15:35:41 -0700 (PDT)
Date: Tue, 22 Sep 2026 22:35:38 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260922223538.2287676-1-morbo@google.com>
Subject: [PATCH] bus: fsl-mc: Annotate fsl_mc_io.portal_virt_addr with __counted_by_ptr
From: Bill Wendling <morbo@google.com>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Justin Stitt <justinstitt@google.com>, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, llvm@lists.linux.dev, 
	Bill Wendling <morbo@google.com>, codemender-patching+linux@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_153543_884623_F4A26128 
X-CRM114-Status: GOOD (  13.01  )
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

The GCC and Clang compilers provide the __counted_by_ptr attribute,
which is used by KASAN and compiler bounds-checking to detect
out-of-bounds accesses to pointer fields.

In "struct fsl_mc_io", the "portal_virt_addr" pointer points to the MC
command portal virtual address. The size of this allocated portal in
bytes is tracked by the "portal_size" field within the same structure.

Annotate the "portal_virt_addr" pointer field with
"__counted_by_ptr(portal_size)" to enable compiler bounds-checking and
harden against potential out-of-bounds accesses.

Cc: codemender-patching+linux@google.com
Assisted-by: LLM
Signed-off-by: Bill Wendling <morbo@google.com>
---
 include/linux/fsl/mc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/fsl/mc.h b/include/linux/fsl/mc.h
index c25f0f7e6dd4..0b2c0eb9b605 100644
--- a/include/linux/fsl/mc.h
+++ b/include/linux/fsl/mc.h
@@ -336,7 +336,7 @@ struct fsl_mc_io {
 	u16 flags;
 	u32 portal_size;
 	phys_addr_t portal_phys_addr;
-	void __iomem *portal_virt_addr;
+	void __iomem *portal_virt_addr __counted_by_ptr(portal_size);
 	struct fsl_mc_device *dpmcp_dev;
 	union {
 		/*
-- 
2.55.0.1082.g2b9226bbc0-goog


