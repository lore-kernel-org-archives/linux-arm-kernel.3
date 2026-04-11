Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99C9CF45A19
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Apr 2026 08:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZhlA0NITFHXZklRF/BSk3bgLtT+9TjmIpOhGB8jhk6w=; b=mhb97sdHFe2s/Q1RH94tBCexIM
	8NzDyGBe4bwAPc3y2WZICspDdAyyRp6q8fMSep7XCbfmIUweEE7DIAPs5HTY1Cyur7q0gtK14fq9l
	PLiToKvLD34BaPg9dae79Q/56xcNJrYU6qN96qggkaMv83QmO1SA0rAP2w6ci5ENP1D+YQdWRpzsp
	/nTrBpVekMYHLQ3aUDAWNgtr49ruB7lm+75YZ9TQKyYaK4I4TWlowal6j1k+ljCBkWMgYjeXgzNTD
	rt1h4A7UAR6aBuKneh0KV5t+sAQRo341b2/MhhnCVhISsjuaWhg6a3v6A2Dzk7wDBg3IccdFlA3fQ
	OxXNhsdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBU2N-0000000DHnr-2674;
	Sat, 11 Apr 2026 08:49:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBU2L-0000000DHnj-3I9F
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Apr 2026 08:49:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0F60C60141
	for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Apr 2026 08:49:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6430DC4CEF7;
	Sat, 11 Apr 2026 08:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775897392;
	bh=KVDPs0/AR7SfA/haz9MFeLHwZP/iNdbl1ulmOeYe3F8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gtRXhwTPBNQjpr9wuxzV0WvknJFHtD1f6ORK9Vo7ALKRuBiJwFfpTiaGn+DG1jkdh
	 z5t1zFhjNKyjBMhAnhA61RdsQGuvPjUheh+IpZ/TjcBNu5207odJzYENGIzoUrcPSJ
	 3ORsIWYygOJOYl95O3onNNHY0Nq1fDPylnEJzAO8yMQ6IsmuAmVbprvI0QG1YBYWjp
	 jBohcpBJpBQj7nG30LvZwlCAcbn79NZ5V50w3ZqNruKSxa5YS9unT2Ag445QmdCgIJ
	 9OaZf7K+n3PcDAg+gVnfYBBEwrIyE+FVacJNaWrOwluMTlWZWpxX69+azreFV72tOL
	 0q/zWw36hpQiw==
Date: Sat, 11 Apr 2026 10:49:50 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: ARM SoC Team <arm@kernel.org>, SoC Team <soc@kernel.org>, 
	ALKML <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@kernel.org>
Subject: Re: [GIT PULL] firmware: arm_ffa: Fix for v7.1
Message-ID: <20260411-tireless-agama-of-advance-5bdabf@quoll>
References: <20260407100841.3150090-1-sudeep.holla@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260407100841.3150090-1-sudeep.holla@kernel.org>
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

On Tue, Apr 07, 2026 at 11:08:39AM +0100, Sudeep Holla wrote:
> Hi ARM SoC Team,
> 
> Please pull ! This is the only fix/update I have at the moment for v7.1
> So, I am sending it early as fix but late as an update for v7.1.
> 
> Regards,
> Sudeep
> 
> -->8
> 
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/ffa-fix-7.1
> 
> for you to fetch changes up to 83210251fd70d5f96bcdc8911e15f7411a6b2463:
> 
>   firmware: arm_ffa: Use the correct buffer size during RXTX_MAP (2026-04-07 10:47:42 +0100)
> 
> ----------------------------------------------------------------
> Arm FF-A fix for v7.1
> 
> Use the page aligned backing allocation size when computing the RXTX_MAP
> page count. This fixes FF-A RX/TX buffer registration on kernels built
> with 16K/64K PAGE_SIZE, where alloc_pages_exact() backs the buffer with a
> larger aligned span than the discovered minimum buffer size.

Can we avoid per-driver trees or pulls? You do maintain also ARM SCMI
firmware driver, so this could be sent together? I think you also use
the same Git tree, right?


Thanks, applied

Best regards,
Krzysztof


