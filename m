Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30509CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 16:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kS/140q1KYIt9nS75TO3Zn/k6H05m95K0Z3RWECza+U=; b=urkG46P+pf2n2aW4XI9u2sEAcb
	01zbR/9NKLiARJrj1fkGox3mA3m7gD/lpR4WzKY/kxC1JvpRS6jRtc3q2q3o5x8ORI84U40sliqDY
	QuF5SxKo9AQSTwdtBCzsZi1GU1BvuVcd5dIYTfupFt/MYfq0tkJIvOaRjeg4sbvG2U489r+cMBKY5
	qLHgra2fthi/CfA+9xhyDX0kf255LKJO3OTDIbGz4yw86GKbrwgvnKQFUvbR6sj7QRBay19/pnteG
	RF4JX7eJgvBmu+Mg3dOARixTHIqNOU2HN1YuV551soCDJnraMrVGObwPA08/xH5iYddM856+nxmrd
	FV6sNlkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU59f-0000000BQl5-2Jja;
	Mon, 01 Jun 2026 16:06:19 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU59b-0000000BQkV-2SKM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 16:06:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=kS/1
	40q1KYIt9nS75TO3Zn/k6H05m95K0Z3RWECza+U=; b=EHYuhi30bul1KP9zXjp4
	GDnp5GGNa1psLSTEmTfucGVCKjbBv3durzxCKcSG1suyZm4q5BSOQopiW0nOOonS
	4kmQjce0jdUS8dMxly0Uc+c0geap/4IrCvul/r5DuSEahdofmXoh4XaKb3/bpJ1n
	R+3nQC94OB/LZLa8r9qfxzPtMzcuaiY6NjPeXgliPko5Lwoqf9B8c9wSNBNC57kC
	CsORTnYVMT3tSe3KCEiq/xhUVQhC94YeqSRA+clyr28ewbaxIIb/97yDP6wlPnMV
	q2Xxy6KDt/1XhMBlkhxOoE7LdvhFpeBGn7DUjL1IMOzIApEok0v1IxXBIESi77wT
	1w==
Received: (qmail 2553433 invoked from network); 1 Jun 2026 18:06:09 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 1 Jun 2026 18:06:09 +0200
X-UD-Smtp-Session: l3s3148p1@ZhpjXzNTSoYujnub
Date: Mon, 1 Jun 2026 18:06:08 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: soc@lists.linux.dev, soc <soc@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [GIT PULL 0/2] Renesas SoC updates for v7.2 (take two)
Message-ID: <ah2t8FPZpJCF6CL7@shikoro>
References: <cover.178031911driver8.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.178031911driver8.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_090616_495320_A197032C 
X-CRM114-Status: GOOD (  15.23  )
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

Hi Geert,

On Mon, Jun 01, 2026 at 03:18:17PM +0200, Geert Uytterhoeven wrote:
> 	Hi SoC folks,
> 
> This is my second pull request for the inclusion of Renesas SoC updates
> for v7.2.
> 
> It consists of 2 parts:
> 
>   [GIT PULL 1/2] Renesas driver updates for v7.2 (take two)
> 
>     - Identify the R-Car M3Le SoC,
>     - Add Multifunctional Interface (MFIS) support for R-Car V4H and V4M.

The bindings patch for this V4H update...

> 
>   [GIT PULL 2/2] Renesas DTS updates for v7.2 (take two)
> 
>     - Add timer (MTU3) and xSPI FLASH support for the RZ/T2H and RZ/N2H
>       SoCs and their EVK boards,
>     - Add PCIe support for the RZ/V2N SoC and the RZ/V2N EVK board,
>     - Add support for the R-Car M3Le SoC and the Geist development board,
>     - Specify ethernet PHY reset timings on various R-Car boards,
>     - Add (more) serial, I2C, DMA, and sound support for the RZ/G3L SoC,
>     - Add PSCI, Multifunctional Interface (MFIS), and SCMI support for the
>       R-Car X5H SoC and Ironhide development board,

... depends on the initial X5H binding addition in this pull request.

>     - Add serial DMA support for the RZ/G2L SoC,
>     - Add keyboard, I2C, Versa clock, and audio support for the RZ/G3L
>       SMARC SoM and EVK boards,
>     - Miscellaneous fixes and improvements.

I am confused, does this really work?

Thanks for your work,

   Wolfram


