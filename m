Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E231CC3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 22:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oO/QzIIMcjFyk5LwoSEjQbufVLaRzyJFjXFWeTu30gY=; b=Bodv0oeAvcR0JujD5eJdaBpP21
	PR6v3Wx8FvegA+W3NNLKZgOYjyIyXZJLS/KNQAT/FGoAAKaeGD235JEUlqz2VXCKE96ZQgSIz8iqX
	EW6nQxGJ8pTbFSheyXKFFnPuYQhy/nPG0iCThXvIDmTBLM2KaDm9m3o7eFQlv0zk74iFXv5u4IhPW
	cCqVHPDFt2HfGmzXcdNYVcUlPZinu+2QQpEfmn++toUUa7/gQnIfdnmRr9v06tm6OgRsMVRpus0D2
	UQlDYdXTHdjY0nw0pe1+fcbUnZUCr3SlJPcVZOjclH/UdzxLqt3fLN11+7nsGsKyo3rqndJUzLqS/
	t3k1V7xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txvJe-0000000C74e-3vj4;
	Thu, 27 Mar 2025 22:03:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txvEY-0000000C6TO-3VQR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 21:57:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 71DBA5C692B;
	Thu, 27 Mar 2025 21:55:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DE61C4CEE4;
	Thu, 27 Mar 2025 21:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743112672;
	bh=ZsADyA8KuiZgxQVVEb+zpMu58RecCjloMAnX+/v+buo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=bIwuxwijA27zYL/rKK5iPIKDyPcIVvdquEhX4uJ/0O7kDQfBlQSwDEduEq7lBgSUP
	 CarnIwjQQXg0LMhX247Z0yfZPAOVXs7ox6Yl/6ng4ld4ZhQwFVO6+OhtpmtLqg1lIr
	 iDGMaIq3M2g+x+DmwQyJ12DqWV+J6JbeUBhYNUPdvWYTWaBIIt5G7iXhiqcWwUeKfG
	 P2Y7tLT318zO2AKeuygoe8PKsHUjMAL0rFr2YeLw15OUpvxyxy6sb/6z+2jWBhe0Mb
	 ItMPzIq+nMKnGeobPtSLjSKUrJjsGUms2R5sXtzR1yJaJJrkYEwrRv0anEeepMmFm+
	 aAae3Ciufjrwg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADC26380AAFD;
	Thu, 27 Mar 2025 21:58:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [f2fs-dev] [PATCH 00/27] Improve ABI documentation generation
From: patchwork-bot+f2fs@kernel.org
Message-Id: <174311270850.2230226.4852455108648362564.git-patchwork-notify@kernel.org>
Date: Thu, 27 Mar 2025 21:58:28 +0000
References: <cover.1739182025.git.mchehab+huawei@kernel.org>
In-Reply-To: <cover.1739182025.git.mchehab+huawei@kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: linux-doc@vger.kernel.org, tony.luck@intel.com, corbet@lwn.net,
 james.clark@linaro.org, suzuki.poulose@arm.com,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, gpiccoli@igalia.com,
 linux-hardening@vger.kernel.org, coresight@lists.linaro.org,
 johannes@sipsolutions.net, bpf@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, mike.leach@linaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_145754_909006_E57679C4 
X-CRM114-Status: GOOD (  10.66  )
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

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jonathan Corbet <corbet@lwn.net>:

On Mon, 10 Feb 2025 11:17:49 +0100 you wrote:
> Hi Jon/Greg,
> 
> This series replace get_abi.pl with a Python version.
> 
> I originally started it due to some issues I noticed when searching for
> ABI symbols. While I could just go ahead and fix the already existing
> script, I noticed that the script maintainance didn't have much care over
> all those years, probably because it is easier to find Python programmers
> those days.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,07/27] ABI: sysfs-fs-f2fs: fix date tags
    https://git.kernel.org/jaegeuk/f2fs/c/90800df0da78

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



