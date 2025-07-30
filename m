Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 981CFC87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 08:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4BkPPeP0KfwCDXb2Z25mZkEyGdAFql2QTrdsVId0f1M=; b=lu7Zh6KWRZB/OJ/nvSwhDYS8mg
	D8QgZdXWttzX2DAtcH/hm2GLGD0IjCKbT7ph4GsT+pLhdFV6g5KW22JH1rZYZ2K75oZ40CdEmwaZM
	VeY906UQhWpzBeKNkFZOwDCCIR/VPzNGsZ22wEtaCJA+SBd7UxfRzfgoILh2cs5nz+YdXAXg57iqe
	sGfYbJYE2UExMJmw4KUUYaxap41bv+rGR2cOWdLj3glELVrHvb6WkpjtsjcIguIKWGcYX4jzIAPUn
	UjI4ZefTYRxMyryUyjgXVHdZxpg0GQxfjo8rHm72zr+lR0YE9LpzDwS1DLgNnNL1xjNeEBA4a83VW
	0gNTk6aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh2B8-00000000zG9-0tjn;
	Wed, 30 Jul 2025 08:28:50 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh27q-00000000ysT-3FNZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 08:25:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7DC47A551FD;
	Wed, 30 Jul 2025 08:25:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22451C4CEE7;
	Wed, 30 Jul 2025 08:25:23 +0000 (UTC)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v2] arm: kernel: bios32: use string choices helper
Date: Wed, 30 Jul 2025 10:25:22 +0200
Message-ID: <20250730082522.4153356-1-geert@linux-m68k.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <875xg8u0xf.wl-kuninori.morimoto.gx@renesas.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_012526_879882_E9EF76F5 
X-CRM114-Status: GOOD (  14.95  )
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

> We can use string choices helper, let's use it.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

