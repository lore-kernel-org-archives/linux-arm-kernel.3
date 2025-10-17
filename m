Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3422CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 19:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LlzN5dSavXopAP47hFEu5I5NgwE9saEWYUag5LC5xgQ=; b=pmlc4KSPbsolZc7g7y4wfOKJys
	7s0fL53Qz8eFLxBvJRn/GuQFHzmn4tpmFZdRlTZ7hlvekTvOKvIXZ+k+HgWw9H3yB8VMFYqdX6SQg
	tlabJX5ng2an42Z19kWT5g9S5QouH0NM4+hXIEKEn5XZ9vxeZ13Mssj0BlzH7xsY1NUg5zR/m0j+f
	dGboDZMHA2uY5xyRwyHLwiJioE4DCU0prVp3vei9W5JVKZo1sQLzptiDOCNLFzf0Uwsar4edqe2PP
	a1d2getWrBZPrsPHdiOTSk7XgrKLR0SlUNAeGKhBQegYzk/0EP1qwwyrThNHRBQIFtbWTLguKYFEz
	JxFyatog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9puO-00000008pW4-0DQZ;
	Fri, 17 Oct 2025 19:14:36 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9puK-00000008pV5-0PYI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 19:14:34 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 12C34C035A0;
	Fri, 17 Oct 2025 19:14:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5A631606DB;
	Fri, 17 Oct 2025 19:14:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A2F01102F236E;
	Fri, 17 Oct 2025 21:14:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760728465; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=LlzN5dSavXopAP47hFEu5I5NgwE9saEWYUag5LC5xgQ=;
	b=hlDGUH4bVrizgVbUbOwMYpQe3OEleII36wWQlYIuEaVZRNrDCHol4+kjmoDBDVBuU1Ke1o
	j24bHClhtALgs3m7tK111B/rLmAGLrOAlwm+n3keEkXwhb67xmq64zWI8OVqZW8pzeaMvM
	In+C5FEDSJtRIsKkpIen7/UegjxohX/B4JtV/3LqG+TtBVzyVt7BBSFfDucxTR5KzVAvyd
	ydiLLWcTn8whin3YAGDZGWlyLQWroZL08m+o+nG7aXof7QvQh6ZhXthm0SYH6HDyBVXMYJ
	4/bliCEyi6SCVybzafT08j42AgK7y9kfRzuT2PMrGs9+ql69d+Q+S5Ioy8xe9g==
Date: Fri, 17 Oct 2025 21:14:18 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Drew Fustini <fustini@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: officially expand maintainership team
Message-ID: <20251017191418c128591b@mail.local>
References: <20251017143302.1776953-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251017143302.1776953-1-arnd@kernel.org>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_121432_524199_1A945C12 
X-CRM114-Status: GOOD (  16.04  )
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

On 17/10/2025 16:32:26+0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Since Olof moved on from the soc tree maintenance, Arnd has mainly taken
> care of the day-to-day activities around the SoC tree by himself, which
> is generally not a good setup.
> 
> Krzysztof, Linus and Alexandre have volunteered to become co-maintainers
> of the SoC tree, with the plan of taking turns to do merges and reviews
> to spread the workload. In addition, Drew joins as another reviewer.
> 
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Drew Fustini <fustini@kernel.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
> 
> Co-maintainers, please Ack, or let me know if you want any changes before
> I send this to Linus in the next fixes pull request.
> 
> Sorry for taking my time again after we had decided on this at ELC-E.
> ---
>  MAINTAINERS | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e9b16f619373..74a3002bb44c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1997,6 +1997,10 @@ F:	include/uapi/linux/if_arcnet.h
>  
>  ARM AND ARM64 SoC SUB-ARCHITECTURES (COMMON PARTS)
>  M:	Arnd Bergmann <arnd@arndb.de>
> +M:	Krzysztof Kozlowski <krzk@kernel.org>
> +M:	Alexandre Belloni <alexandre.belloni@bootlin.com>
> +M:	Linus Walleij <linus.walleij@linaro.org>
> +R:	Drew Fustini <fustini@kernel.org>
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  L:	soc@lists.linux.dev
>  S:	Maintained
> -- 
> 2.39.5
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

