Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF504C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 22:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yTsosmWFDJrYKDTB6WugqLLuQdtSDG4EgVM0MUY2hyQ=; b=gt4zthp27qOdqpcnBzM7ioCfb7
	oNK4M9EterdDDYFnzZFkpW5vf4oY9fpZZsWxosRb/8+3I+9UtoFWNLWoIBqnZDZaDZRakahSdsI1z
	25tEvuGRX5g7mITR6yJ+evS+D5W5SRKkrL0gM/Cdj7WEInlXXHBaZeemxhv7tj2gDvH7IreU+Ev5R
	ElQFt9ThDkmbOhcQBTyvSaDX+YXZJspobYkJQPY6ZZUqAKnBBo2S2yIt3ALu7rhaf1dsgovssDcZX
	+HFO8sDh779uh6ZCpT6MvpaXf+pRm25dpyLeRX4J5KMm8hZqbyjGVTvK9pom2EZK7DA0AR/MlXF2D
	wIhwVL9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txvHx-0000000C6uw-12vM;
	Thu, 27 Mar 2025 22:01:25 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txvEV-0000000C6Rn-3mcw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 21:57:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5E4E5A42F23;
	Thu, 27 Mar 2025 21:52:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0BF0C4CEDD;
	Thu, 27 Mar 2025 21:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743112670;
	bh=2JaAn98f3WVVTUV4zPmAkU4cOoVTOpFjAd0eloNL26s=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=B6COfFjlmv44H/k8P+/lDonPywmqiVsjydXWYBGmwJNHXItK56LsIYYCHHQsNCi4m
	 c8rDyU3SMmrjRXWXb4ZOTIUkAjf05A0hKeJKoHpRLXReBDGuzUUW/eZaSoDTyRK3BK
	 Khjkc7cJSoPNhaOvjjnbXbD02ffpLYPlRS6fC9xq8J88o17qUC+1K/ophEYU+IZCQJ
	 iv1KIjQaCTnZm+pVc/Q5fL2DhtGYEeQcDDS7ejfsxW3Ab5DPvDhRvhFhRTA17cABWY
	 KgAGz2fwz++ipPkeXUlTM6Vzuk/lcC0EZZ4SLuQabCgAHXkMoLioP57G+iE7wt0m0Z
	 +AB0AExum5kcA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7109C380AAFD;
	Thu, 27 Mar 2025 21:58:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [f2fs-dev] [RFC v2 00/38] Improve ABI documentation generation
From: patchwork-bot+f2fs@kernel.org
Message-Id: <174311270700.2230226.6627341491675246186.git-patchwork-notify@kernel.org>
Date: Thu, 27 Mar 2025 21:58:27 +0000
References: <cover.1738020236.git.mchehab+huawei@kernel.org>
In-Reply-To: <cover.1738020236.git.mchehab+huawei@kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: linux-doc@vger.kernel.org, corbet@lwn.net, gregkh@linuxfoundation.org,
 linux-pm@vger.kernel.org, netdev@vger.kernel.org, coresight@lists.linaro.org,
 linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-block@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-hardening@vger.kernel.org, workflows@vger.kernel.org,
 bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_145752_001130_C48BC808 
X-CRM114-Status: GOOD (  11.38  )
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

On Tue, 28 Jan 2025 01:05:49 +0100 you wrote:
> Hi Jon/Greg,
> 
> That's the second version of my RFC patches meant to modenize the ABI
> parser that I wrote in Perl.
> 
> I originally started it due to some issues I noticed when searching for
> ABI symbols. While I could just go ahead and fix the already existing
> script, I noticed that the script maintainance didn't have much care over
> all those years, probably because it is easier to find Python programmers
> those days.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,RFC,v2,10/38] ABI: sysfs-fs-f2fs: fix date tags
    https://git.kernel.org/jaegeuk/f2fs/c/90800df0da78

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



