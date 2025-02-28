Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45AADC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 02:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r8fpOs0NPQFRx69TiYGYlcoVMzR6MoTvHZ2KvpvBX8g=; b=UjP7+koA0a7u/ZfXEfpKn7pHqM
	CmrAY+3iUSO0SM7k7I/2VgNzas1g5W8x9vw5zH8LI2xWl5igSmucVI5sDeXpadCliYvp3+i/X3m3c
	EHzUB0HzBo0jYOderUm/R8soCw0+Df8q+y27UmeqiOeEWq5lAGHIUKYGXXXAn0mGzvEtqNj224OPP
	qdc0Z4nxUpa7/QEGyTUzW4youxDW5/9bWMnSrhZyGer5st/q3UowQZbnW7vqU+RN94wSmNSbepeDz
	9uFTKjFqQVpz+JRQvsEVgXT/4griAhhlA952K0tkpN7+IOWP4qGRdRWhCgrhx6cnIbkKHm6IjsgDk
	vGCEOlFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnqJj-00000009VrA-03r5;
	Fri, 28 Feb 2025 02:41:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnqIB-00000009Vci-0Qrh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 02:39:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EBF09615E7;
	Fri, 28 Feb 2025 02:39:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26155C4CEDD;
	Fri, 28 Feb 2025 02:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740710398;
	bh=n0lGgWpVMdnQZ8WaaunYSs+CDhI/VkhN2UbParMgr2A=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=lQQHrPpD+qj/hLOXAvWRKd+wUtlnOEvLwA1qNuPa0Xm5IeQ/ApRUE7/M4B38OJUMS
	 UoiDSempoQesgGf/J74EmhD5qO7Mo+DWCWNcFzLU6+mM08kmZr7cJ4l0LsEuIIUJ1P
	 hNgzdZWAlSS3XFGwO9njIS0gbOunwlhPhC7SoMZt5zxZ036v/gTh+81ARspORygJDx
	 ahb415ZWI8n7o4OwrbaZuL0Y0TOOiDLt/2fbx8PXTVO30LyTFaRDwoLaDMbEHC8Jj6
	 rzhwWa/+a4KryvShnTEUYuVPzG+jgN51Y5N2yZCmLirQbxUGdBKRUvneN5YHsqnq7W
	 fjtLvWFYOFNrA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 71F10380AACB;
	Fri, 28 Feb 2025 02:40:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v4 0/4] stmmac: Several PCI-related improvements
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174071043026.1661895.15370002818806136916.git-patchwork-notify@kernel.org>
Date: Fri, 28 Feb 2025 02:40:30 +0000
References: <20250226085208.97891-1-phasta@kernel.org>
In-Reply-To: <20250226085208.97891-1-phasta@kernel.org>
To: Philipp Stanner <phasta@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, chenhuacai@kernel.org, si.yanteng@linux.dev,
 guyinggang@loongson.cn, chenfeiyang@loongson.cn, pstanner@redhat.com,
 jiaxun.yang@flygoat.com, zhangqing@loongson.cn, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
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

This series was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 26 Feb 2025 09:52:04 +0100 you wrote:
> Changes in v4:
>   - Add missing full stop. (Yanteng)
>   - Move forgotten unused-variable-removes to the appropriate places.
>   - Add applicable RB / TB tags
> 
> Changes in v3:
>   - Several formatting nits (Paolo)
>   - Split up patch into a patch series (Yanteng)
> 
> [...]

Here is the summary with links:
  - [net-next,v4,1/4] stmmac: loongson: Pass correct arg to PCI function
    https://git.kernel.org/netdev/net/c/00371a3f4877
  - [net-next,v4,2/4] stmmac: loongson: Remove surplus loop
    (no matching commit)
  - [net-next,v4,3/4] stmmac: Remove pcim_* functions for driver detach
    (no matching commit)
  - [net-next,v4,4/4] stmmac: Replace deprecated PCI functions
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



