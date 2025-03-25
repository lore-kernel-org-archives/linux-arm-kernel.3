Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4046C3600D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 17:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mDADDN+N6DRHbehMY/G9Wg6rpmpphCOHzU8i0aWjvHs=; b=lNsEbcm2gq0SllvEVuKitfFsys
	NGde6jW63zQjNCiIqPR/hIgD6811ASX//DLOpu2aTGPmESmmUFrxPY2QzGmcU9d76s4nyyJNT2jHr
	B0bRbIQx0pfE8hY5EfWM0umsRxqA7+NcDk4l+74b42Gj284r26aVIcNz/Pz9fH/8DP+4/D/GmZbPY
	ztYCA9aajwgt3FGKs4YEAaHefbdLc9uPe1ZVxGVmErpAORzMbqzPR5kSl8zKN7sVi1Ax29W6sQiOh
	h1o49wHpzV8Dlm4zTr5VLnYdF5wMbU3jJTw0rnLJx7wLaXHlgpQHF0LraIBz5PTkY0pgnpCgl1Iu2
	PBMrM/Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx8T6-00000006fSt-3Zbk;
	Tue, 25 Mar 2025 17:53:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx8Pe-00000006ejj-2lH2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 17:50:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 198865C5482;
	Tue, 25 Mar 2025 17:47:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70770C4CEEA;
	Tue, 25 Mar 2025 17:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742925001;
	bh=/xbN3SNGco9nfK5R9dddb1UbuYDo9yRpHGHHAEqgBn0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=IoPEUwymEujnt8i+mKcczKvDjfZawp9uTNJ9k9Kx+Qv+UpEWD9M1EYq43TUxSn00P
	 y/zz50dAGVM/Tt9zC7Wlzx28ATFVFvpy6fGg2b3tVORBCuoQR6IdKPZ/vTJeb8zvwH
	 4jYaHgtim4q9s9oPD5l7B03k9wyosvImI/dvryu9FY3QoXnnrPgtAmaHXosyVaibl6
	 PF3ba/klijgsvREj87Gcc2+JhZ6HAAE5qMkYcvRQohg3KDtkdpcvb5QN70hggnMt6W
	 kWGE/a7qdrU1cExJdQo7EuwDFmO1RTJhBnJMEyjIjDZR+Uge2VuNoyfv/upsRMXpkC
	 GUaIb6UglNPSg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB614380CFE7;
	Tue, 25 Mar 2025 17:50:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v4 0/3] stmmac: Several PCI-related improvements
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174292503778.665771.17608780007246481323.git-patchwork-notify@kernel.org>
Date: Tue, 25 Mar 2025 17:50:37 +0000
References: <20250324092928.9482-2-phasta@kernel.org>
In-Reply-To: <20250324092928.9482-2-phasta@kernel.org>
To: Philipp Stanner <phasta@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, chenhuacai@kernel.org, si.yanteng@linux.dev,
 fancer.lancer@gmail.com, guyinggang@loongson.cn, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_105006_751578_50B47DFB 
X-CRM114-Status: UNSURE (   8.38  )
X-CRM114-Notice: Please train this message.
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
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 24 Mar 2025 10:29:26 +0100 you wrote:
> Resend of v4, rebased onto net-next due to a merge conflict.
> 
> Changes in v4:
>   - Add missing full stop. (Yanteng)
>   - Move forgotten unused-variable-removes to the appropriate places.
>   - Add applicable RB / TB tags
> 
> [...]

Here is the summary with links:
  - [net-next,v4,1/3] stmmac: loongson: Remove surplus loop
    https://git.kernel.org/netdev/net-next/c/9db2426a324e
  - [net-next,v4,2/3] stmmac: Remove pcim_* functions for driver detach
    https://git.kernel.org/netdev/net-next/c/d327a12e636e
  - [net-next,v4,3/3] stmmac: Replace deprecated PCI functions
    https://git.kernel.org/netdev/net-next/c/45b761689a28

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



