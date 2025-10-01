Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2A10CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 09:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dgcREvbEt0KWeoQq0AGroXy6LbK5iYSeg5dyX5WrKSY=; b=Zuqa7vgUYKi7yQ3ClabkUfmxAv
	I6k35vdyyWomJBVvpKvG2LkGLLg62YEUH9ucb/UYrXSgghn+pCjbIPbBB10Z7EmM0pilYL/xdSCS9
	vKfbkDCPwjRvBH3UN+j6v+RFKEk5CGrPvLpmZgljbKkSPuhet4dLiJ15gCeWK+ADQ0b8fxuvPJpFk
	W/FZV9jSCJb5WH0DY6Kvw50TRG013S01h27w4Pe3XZ8TU8JgSanzlDdHKtBIoV/UPFHWLh2iwHjk4
	xel8Kdnz9ldMLSDfRbuWvzjI2EWrohCrqBV07JOCXm9Y+JI97eP73wSo1R3voUIyAhlWi2r4azg7S
	itymEN+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3tYH-00000007CW7-2hOC;
	Wed, 01 Oct 2025 09:55:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3tYF-00000007CVs-488f
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 09:55:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E58B06049F;
	Wed,  1 Oct 2025 09:55:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 173FBC4CEF4;
	Wed,  1 Oct 2025 09:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759312509;
	bh=PAz5KZCakaH6blQgPTUwrjY5KswO8oPPVquLLzUwrWg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X4umlesJDbhp1coun+usR8fLKjFFq2kxBHQaR/MI5k7t+gOqLTzCr93XMqg7i0LYp
	 +elgc1BqQGJRb6RUFSl843hIY5riP7KH6yjqODJCkmKVOyn964UQ9FS2fwjXXKDqf3
	 0teQsVcyIAsBeVuY6neQWYaoyQa9b+0y7ki/Lg5GgfAJAUR7rFx58yHWVvybA6zQJ5
	 Xj6fsBCgkqG2WzRFJnJ+xlp4EKLHCwmRGRwHlFgwvSbV8amZKDDhI7HzHBvVlqnTPQ
	 DxEYPV745cMzrtjdlx8QpRaVRkLapiKW5DSaXcH8XpzG10KbcbQ6LiKRFrtZZBGeGQ
	 fnmxQetbwMuAg==
Date: Wed, 1 Oct 2025 10:55:05 +0100
From: Lee Jones <lee@kernel.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Janne Grunau <j@jannau.net>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	LKML <linux-kernel@vger.kernel.org>, Neal Gompa <neal@gompa.dev>,
	Sven Peter <sven@kernel.org>
Subject: Re: [PATCH] mfd: macsmc: Initialize mutex
Message-ID: <20251001095505.GP8757@google.com>
References: <20250925-macsmc-mutex_init-v1-1-416e9e644735@jannau.net>
 <1bc9a4b3-7a8d-4bcf-9481-36fdc76e066c@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1bc9a4b3-7a8d-4bcf-9481-36fdc76e066c@web.de>
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

On Sat, 27 Sep 2025, Markus Elfring wrote:

> > Struct apple_smc's mutex was not initialized before use. Surprisingly
> > this only resulted in occasional NULL pointer dereferences in
> > apple_smc_read() calls from the probe() functions of sub devices.
> 
> See also:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.17-rc7#n94

Provide some context in your own words.

Don't expect others to click random links.

-- 
Lee Jones [李琼斯]

