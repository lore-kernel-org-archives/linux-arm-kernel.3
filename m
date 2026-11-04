Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA6F606C599
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 21:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=q7QblnA7;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UYaNTbVv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=eL1uywDCXQtNQRikfOmA6m2hIT1vpIU70O/YX2MMK3c=; b=q7QblnA7pgGKwV
	/OXJjoJKkBDxgumUPMbXlmmtjwK42YZ1zoYQvI5H1zcdF5RAXqxG+GzzyFeai0NBVfbTsu7gOzKoa
	Pz3l7swMF2YDdvyS7stsAk5VN3qfxCUvs2gqbv6nHm4Ct0eiljaBUjHSpE7k0WUpHHPaDiD4wEzKB
	PII2BhUz7H4+wf/kPKr2YRqOpnGjetC6L8uo8qli31MHfzwtT/h0OzSmIXzNpxolsf9sVs2W6EYWN
	KXlRr1gCCdYjXCLQc1tNLBe6KJOxIGsXJqIFDMKZPKVc/ErafKz7jQLOWX49HWYcsvWCNIHMdISnW
	nRiH2u0bKpZW3LtRMJ4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOib6-000000072mB-2UFN;
	Wed, 04 Nov 2026 21:32:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOib1-000000072dA-2sfq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 21:32:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 267A760F2A;
	Wed,  4 Nov 2026 21:32:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39C231F00A02;
	Wed,  4 Nov 2026 21:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793827958;
	bh=eL1uywDCXQtNQRikfOmA6m2hIT1vpIU70O/YX2MMK3c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=UYaNTbVvxy2mBxMQQ3LNzYF4kvo3ZaRuNhgOQ1Z4UzTQOdWEdikFjQDphxV8zSJyB
	 KdR6dpy/ja3eMe+rZZ4AbdEwrjAUa7OKse8x9/CsQjLBCkaNcM/+NKdcUid2G6A4r8
	 lIjAbj0dC9hNJLKV0IJZHhd3lm58QHWxtrvL/T8i1LyQqCPOrX2o0j0k0Q8lqmuxKi
	 ncxCJkl3ypVxkR7WYCbS/P4cdOWjr1wBxa3xZPGFwf4HxeF8fbPJtyGhxwXgUyPeEx
	 qoWrvtViEQ3ZOzxoE0ixq1ChModWLXUt28yx+THJ88JwBZiMO5kXN+9plfjXEk4COJ
	 zgK0ar/HoSz0g==
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 04 Nov 2026 22:32:30 +0100
Subject: [PATCH 14/16] ARM: configs: u8500: Enable audio graph card2
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-ux500-defconfig-update-v1-14-451d0537d49b@kernel.org>
References: <20261104-ux500-defconfig-update-v1-0-451d0537d49b@kernel.org>
In-Reply-To: <20261104-ux500-defconfig-update-v1-0-451d0537d49b@kernel.org>
To: Stefan Hansson <newbyte@postmarketos.org>, 
 linux-arm-kernel@lists.infradead.org
Cc: Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.16.0
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

Replace the removed MOP500 machine-driver option with the generic
audio graph card2 used by the new Ux500 device tree descriptions.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/configs/u8500_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/u8500_defconfig b/arch/arm/configs/u8500_defconfig
index 6efd7003b126..94b608104b17 100644
--- a/arch/arm/configs/u8500_defconfig
+++ b/arch/arm/configs/u8500_defconfig
@@ -190,6 +190,7 @@ CONFIG_SND=y
 # CONFIG_SND_SPI is not set
 CONFIG_SND_SOC=y
 CONFIG_SND_SOC_UX500=y
+CONFIG_SND_AUDIO_GRAPH_CARD2=y
 # CONFIG_HID_SUPPORT is not set
 CONFIG_USB_MUSB_HDRC=y
 CONFIG_USB_MUSB_UX500=y

-- 
2.56.0


