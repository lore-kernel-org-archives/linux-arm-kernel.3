Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46E17CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 14:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vqNJkX+oLmSDqn/Deo0E8XhguIEMPvKuet/LF7u3Eos=; b=3J6PU4QEFY/3z5bpzXE+nuSUSt
	fY7UZMbntkT3+SUzhSz7sBSyKHU2wqFyQVxAKfAbrSehHFBspDJXmvbHNUOg7WMhBppZjAQRbjZlm
	RkGMi6XZujxHo23IRwDJMhCKs/mOc0LwfgPH35GungbfGhasI1S8idNz2zIK6CNNedI4Ljv+0EPdD
	1ng6Y2C1unqLKSjt/T/lDiaBpcy9zF3QpyDBuXTvgTNfzp/hE04y9rgkaulWZKqvHZeKJin0vJj70
	hcR7JdhU8YoiIylE4opRsyUOgKlTLjmDE0dHEY7Pi1svICxL/x2jX1sd1Kl/CLQfu8+2xRO0uw4D0
	tCe57Blg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDl1v-0000000G7Ka-2vvm;
	Tue, 28 Oct 2025 14:50:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDl1u-0000000G7KI-1M1e
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 14:50:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5997B61412;
	Tue, 28 Oct 2025 14:50:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2944C4CEE7;
	Tue, 28 Oct 2025 14:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761663033;
	bh=6K/S8d0IVvVTkkQFbLMvHUlIli4SloaGEMV2HIrhuwM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=eM3+yCt18RfkfiycnlMD+IvDLDucmNxUByaJkwdlM7uZYjsJ8fBZwFjTAzV0RB5lL
	 sFPDBmjn86sWiCRf+aR1aShxtEs70ohGhHYM0uMFfNlX2oR8FE/OwHVPS3YBnJiuUa
	 UJuD2VaKLrJjcttYbLX9gAqgYAx9KvOAsHAeZmxGY9PXzYGrrFQJf6kZMLF03R764c
	 xPthxPygltd4liezV6i2XVnOkOwImZNv7ws4EOyWJnJbOpUFe7/RmHElLefFyY4a5e
	 evRh8bFWhCOLbQFsclRhijStG53G74u9aTqhOgA4dpVlbd4a3ehw7FztfGk/TrwtAW
	 YnZmkl9H7GdRQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB21C39EFA55;
	Tue, 28 Oct 2025 14:50:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2 0/2] net: stmmac: Add support for coarse
 timestamping
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176166301074.2258992.15898542633680780702.git-patchwork-notify@kernel.org>
Date: Tue, 28 Oct 2025 14:50:10 +0000
References: <20251024070720.71174-1-maxime.chevallier@bootlin.com>
In-Reply-To: <20251024070720.71174-1-maxime.chevallier@bootlin.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: alexandre.torgue@foss.st.com, joabreu@synopsys.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, richardcochran@gmail.com, linux@armlinux.org.uk,
 kory.maincent@bootlin.com, vadim.fedorenko@linux.dev,
 alexis.lothore@bootlin.com, thomas.petazzoni@bootlin.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

This series was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Fri, 24 Oct 2025 09:07:16 +0200 you wrote:
> Hello everyone,
> 
> This is V2 for coarse timetamping support in stmmac. This version uses a
> dedicated devlink param "ts_coarse" to control this mode.
> 
> This doesn't conflict with Russell's cleanup of hwif.
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/2] net: stmmac: Move subsecond increment configuration in dedicated helper
    https://git.kernel.org/netdev/net-next/c/792000fbcd0c
  - [net-next,v2,2/2] net: stmmac: Add a devlink attribute to control timestamping mode
    https://git.kernel.org/netdev/net-next/c/6920fa0c764d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



