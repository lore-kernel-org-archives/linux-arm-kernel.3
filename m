Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF0FACD8CAA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 10:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2qegDi/hsOr+MbKGrGj0VLa5k6U4wNh2QseMOKrEEok=; b=PcoARUg3vBYlZtn8JV3QALg10Q
	cuMBiM5zut9CHfcabSEsl7hN00STw0lfLOstZiYjbkAIom2hE2b/5X2nXi9r26bPdOl88bcgbe0jO
	oEYSg1id3T3V3f0wksbNssxmk1jK5xIP9Rcdy8nnylC3JHCCzUAP1DzsVQ5JZdG5c/WMoEBLiEyPL
	RvvHPWxRcFRduPoD/B1O41HOa6VMkue9sBryIcWYJNOQB/G7BtsFgs2pX2bqewMQJJ++khGLIoDY1
	h7tcjvdUEiP/+/tt9FViBMtUY9dRMNt6kJDzVK6V4WZZo+8ff7yz1/C3snEM/t3kpLB7zJHUCAoHi
	pkdnSgqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWu42-00000005OZu-3GDJ;
	Tue, 09 Jun 2026 10:52:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWu41-00000005OZn-1Z09
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 10:52:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7B458601D6;
	Tue,  9 Jun 2026 10:52:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 056CB1F00893;
	Tue,  9 Jun 2026 10:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781002328;
	bh=2qegDi/hsOr+MbKGrGj0VLa5k6U4wNh2QseMOKrEEok=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kBZPwZKCPIQogZ5CJ+78xF+mpvgrUvQvRLXt046dsbHfnimm637Gz1tOrBhmRAm1j
	 eekLPSwfZEajD9Q/yGRxVUs8anN6cbJdRoCJ/78/WKFW7WxpiN5gyYHijzwEG+D67y
	 dwGrmUaT+aEjvRZiJdZPIByzahinDo/K8aLLhQ/AVRwBnhHlZIjMWD+mS1sckDDeVU
	 q4tK9X70Q21vp/p2JIN+E8Wse8z0ULTsThPF+cWCu5lt431cGzDy9M1kDs4uFo0tTH
	 o6ZTHzfbhGpr+2iHY5XDRBbRpRpmr2nigWjAJTqmpSoRhQkU4CPortHIpfFTkkZizS
	 4cqCrV75/RF1w==
Date: Tue, 9 Jun 2026 12:52:04 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: soc@lists.linux.dev, soc <soc@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org
Subject: Re: [GIT PULL 1/2] Renesas driver updates for v7.2 (take two)
Message-ID: <20260609-cordial-eagle-of-prestige-ca6c99@quoll>
References: <cover.178031911driver8.git.geert+renesas@glider.be>
 <cover.1780319120.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1780319120.git.geert+renesas@glider.be>
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

On Mon, Jun 01, 2026 at 03:18:18PM +0200, Geert Uytterhoeven wrote:
> The following changes since commit 17e48e7e5f18b45fd4a9411090148aae3b74f7f3:
> 
>   soc: renesas: Convert to of_machine_get_match() (2026-05-11 09:56:17 +0200)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v7.2-tag2
> 
> for you to fetch changes up to b4d41ffa750fc3403a4076d17090589d000f13ff:
> 
>   soc: renesas: rcar-mfis: Add R-Car V4H/V4M support (2026-05-29 14:42:29 +0200)
> 

Thanks, applied

Best regards,
Krzysztof


