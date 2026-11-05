Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A4D606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 11:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LRbuVa2J;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fSBKd+Qv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=tbsBhorpX5/hg11/oBkLoGN5x3wli6X3ebAisCWgK2c=; b=LRbuVa2JucLwXC6w/hZMq1dkZc
	tYZkzTOip9Fa6cFOnbaPWiHHK7HHYaVCp4y70zomvyZ3qKrcQsa6JivOs20ZAhZ/llDj5qcyVUsjQ
	opOF9RasOOsHtIkaITjXCFsDro5H1E/Rnd7qgclbJR3Dynoo3j7YvKCab96jKjUPafTX9ogCt2G/b
	lz8hdr3IUwMW7YbGQBLHTSZPAqkl0lfmkCfH0qX1SnupvYfLK2edhCERN/wO5PHKDVcD/Q2WEhUWg
	ImQLA2tgbj+xpNzB7zaDfB/pwY62pDzuI7pohmuPZA+W1ZxprPA0sURvtnS40ElsX6WbkkkSq4ikZ
	TbCrHoww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvnQ-00000008ggR-25HO;
	Thu, 05 Nov 2026 11:38:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvnM-00000008gfi-12DL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 11:38:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 547E760F39;
	Thu,  5 Nov 2026 11:38:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B38B1F00919;
	Thu,  5 Nov 2026 11:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793878695;
	bh=tbsBhorpX5/hg11/oBkLoGN5x3wli6X3ebAisCWgK2c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fSBKd+Qv9jpEqzpBaAREyG8s2z42IgL1Glo07+CfdW3vbfmgOhKIrXtU0j2mg0Glc
	 MnL+E0KHDIEYrIu8hBNFlpV/zeObvBuh/GlYNWLRfhm/KdhzZvOsJie96zNO3YRQNa
	 ekNk6j7jQuKLlL5CSZ+sZ2nS9TiNLib3g7VW3YID+9RmGGCLmvxwyXs6cuxzCsB61V
	 SbMW+MD36sss6mQJ+6XhVaQcPsTxx0MZmbtlqcD+3xVPkLhL9wE19M2kNRTZK69VPI
	 Y7f3vfXlRUpZeDpXy6mH3NQZkp/CFUthmzY1xPyPTzFLRZWH81fDJxBnl7XzUwTkXR
	 o0XCqSBloEJQQ==
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.ams.internal (Postfix) with ESMTP id 6D272198003A;
	Thu,  5 Nov 2026 06:38:10 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Thu, 05 Nov 2026 06:38:12 -0500
X-ME-Sender: <xms:oWrsakkGlgKpR4wSm4ye8vv5csIAo86ksnI3CRCrKjaIAGWH7p4RZQ>
    <xme:oWrsajYtjeGUs_u_kIuefPOf_AzTPUtWXK-DrRSGYCrQpC4L5EcIZyN7-INXKLOrj
    UGT8w0Zod-RsEbrQCenUDhV7iSUy-tD9bftu208ILE03j7t44SYUg>
X-ME-Received: <xmr:oWrsasBHzt1eXTYkDr6ygg5y9ro_Ytj9FkIMPtFlnndtttzqxgzJyhCDHMo>
X-ME-Proxy-Cause: dmFkZTFgCBY0H5ERCpEWHMWeRovHwsuqR+Zb+dTNF6i0Wx6f7bDy0HWpqxM/ilEd3SmjwZ
    vjJAUFeZ/zBNEC3KI2YM+ad6PmkKx4ukR8n5J8nEiKNFWVXyvayr0881g5/mna2LEZcqam
    I8+YZ6HPM1KFewLEYnolCm4NMYZG7n/P92+sSLWoLbVmG9/cM8ddAdCMCI/zzzsvgYhWH/
    U0/un/WLwaEnnvjrs8TM7ghH3lFOprirTdMYV8lQR2O11uKvbkktYbVoKk6QpJLoKDlpMF
    htE8GiRINFSaJ74JopyvAxB/OOc/3hMfEeCHd9+w/qJ7P2Stp8TOD//K8G5YrP+v/+gaSn
    rqCy4qK4skVM4GvMeNcty2X+jEl/W9vNjpmQZj7NSp3HcqiH2ME/3kKmcO4vdSZxh38I7J
    hm8EEkedoYry5QczVgTb4gK5JbJXByKI9E/D12mIdar2rGXlzoLvqb04B6flvcbpWOUqwa
    xWodXioGRteUh8SVPRSz+jSe33SB4Q/D/xWYp5buKmkf/K7DPwLQz3JakHyyAf5XP2v2k0
    ypce1ZV2IEOqx+byeARzy6zXkHBuMXRBPo8mflhhICtYm4kEfDGfscjBvW7nHL41WdHa5c
    0QTbN74SZIEmIktDxDq1ZWXtR6RQcPexInTsmSlhYzkCOES6HqFBvU3HrZ1g
X-ME-Proxy: <xmx:oWrsapZ0sJZPaTLJohiTbQH0GBzNwIUuyVsQjhPFgXtwhGjHo0Ovuw>
    <xmx:oWrsaghIMK7D5dEeDwAHlTtyLk2v7kb6ZDy0SBbzNCAnWqhCAjKzVQ>
    <xmx:oWrsapw5fN2OQzBsVBeThBvK9xYPabwzuGCdda-JmTfst2VqD70-FQ>
    <xmx:oWrsar7ua-Gcqusx-0RQROs1qZszuYf6_HFQ7zjrPjym7UOkp0fL0Q>
    <xmx:omrsai0JtSjuBIAGCYf8dN5F2ipy5pl5kQbKYWQ6nBG8-gYebIvfqvyX>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 Nov 2026 06:38:09 -0500 (EST)
Date: Thu, 5 Nov 2026 11:38:08 +0000
From: Kiryl Shutsemau <kas@kernel.org>
To: Usama Arif <usama.arif@linux.dev>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	James Morse <james.morse@arm.com>, Marc Zyngier <maz@kernel.org>, 
	Doug Anderson <dianders@chromium.org>, Breno Leitao <leitao@debian.org>, Dawei Li <dawei.li@linux.dev>, 
	mrigendrachaubey <mrigendra.chaubey@gmail.com>, kernel-team@meta.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: sdei: Run the event handler on the kernel
 vectors
Message-ID: <auxqaslfm5t3FAPL@thinkstation>
References: <20261104180936.2981070-2-kas@kernel.org>
 <20261104182842.3436759-1-usama.arif@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104182842.3436759-1-usama.arif@linux.dev>
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 04, 2026 at 10:28:41AM -0800, Usama Arif wrote:
> Would doing the swap in __sdei_handler(), around the whole NMI
> entry and exit pair, close that window?

Yes. The WARNs you point at only fire when context tracking is already
broken, but the same window has tracepoints: trace_hardirqs_off_finish()
fires irq_disable exactly when the event lands in user space, and a BPF
program attached there can fault.

It applies to 2/2 too: anything that traps in irqentry_nmi_enter()
overwrites ELR, ESR and FAR before do_sdei_event() saves them.

I'll move both into __sdei_handler(), around irqentry_nmi_enter() and
irqentry_nmi_exit(), in v2. do_sdei_event() still needs the interrupted
VBAR for the IRQ-like resume, so it will get it as an argument.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

