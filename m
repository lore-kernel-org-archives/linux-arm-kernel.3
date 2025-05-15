Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F457C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 02:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=snI69feTUpB7gz4LWiGxCrkPcy7RU2nrxhePSwc0uXE=; b=v9kfg+g0cbx+kAhgY0POSOg39W
	vDXOeGeBX8cBAJr6ZFIx3McurtwIINgKeWIM0HjZMR21OGDgMD7kemGT/VTd5SpAK8mY3WVOTMgCL
	XUNm7To6tVykHPNpWlgv8Whi7imhYwXIvQ2MWD9UCpahFIvVQShDVMB9Lh7Dqg+K+ZIUYftt9IGP4
	aDgGekjgDYB3wvk6prBEiQ//vQ+8THjbj87+NG7H2oztvIOb14ePWIxQBLm5vOhcwDS/QQSymR/no
	WkB7a5fbq5+DeE0OCnb/BBZrdqu+gRkmWy0qvlYs68AbY6FYpZG6P7klXwBH2Sfo91Du0aTc3Lu9l
	2+H+1aSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFOhg-0000000GrOQ-22g6;
	Thu, 15 May 2025 02:52:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFOfW-0000000GrBr-3qSs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 02:50:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C81B15C1090;
	Thu, 15 May 2025 02:47:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFC29C4CEE3;
	Thu, 15 May 2025 02:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747277397;
	bh=BrML8hltOe7eGgu0ZZrHDaD0LJnVERBGsqDips0I6GI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=d/GLZULdwCgMXggIqy7mTusn8PKGdR882i0axM89tbRoH5Ky9+I35UHAjcYm/2ZPi
	 HNpRc/ll/NYHY06vbxCmDYnKT7341qIwLHx+ShZWH328XROuws+KC5qaBjxOpVuYc8
	 hmhdPtB4hAA1XObWrFudevIGJx6ZlKl/IGTXdu8FIItUfY+s0ECDrlPP1j0IO9E0bG
	 FpVEpw1rPl1AVeHduF9DoTU2wkOls+c4IewUx6rQcTAY9Uv0Lg9ULPv8yr9GVz4CF4
	 xUeTeZlWrW0jd08A2EDNX8ESIHkqYYLmrbgLHgn1qvf1vHtcyQXoXd5c7Lct2MLv4Q
	 DjfWkB8KvS3Eg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33CAB380AA66;
	Thu, 15 May 2025 02:50:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2 0/3] misc drivers' sw timestamp changes
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174727743500.2588817.2305951558012609292.git-patchwork-notify@kernel.org>
Date: Thu, 15 May 2025 02:50:35 +0000
References: <20250510134812.48199-1-kerneljasonxing@gmail.com>
In-Reply-To: <20250510134812.48199-1-kerneljasonxing@gmail.com>
To: Jason Xing <kerneljasonxing@gmail.com>
Cc: tariqt@nvidia.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 willemdebruijn.kernel@gmail.com, irusskikh@marvell.com, bharat@chelsio.com,
 ayush.sawal@chelsio.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, kernelxing@tencent.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_194959_011470_9C528953 
X-CRM114-Status: UNSURE (   8.99  )
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

On Sat, 10 May 2025 21:48:09 +0800 you wrote:
> From: Jason Xing <kernelxing@tencent.com>
> 
> This series modified three outstanding drivers among more than 100 drivers
> because the software timestamp generation is too early. The idea of this
> series is derived from the brief talk[1] with Willem. In conclusion, this
> series makes the generation of software timestamp near/before kicking the
> doorbell for drivers.
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/3] net: atlantic: generate software timestamp just before the doorbell
    https://git.kernel.org/netdev/net-next/c/285ad7477559
  - [net-next,v2,2/3] net: cxgb4: generate software timestamp just before the doorbell
    https://git.kernel.org/netdev/net-next/c/aaed2789b307
  - [net-next,v2,3/3] net: stmmac: generate software timestamp just before the doorbell
    https://git.kernel.org/netdev/net-next/c/33d4cc81fcd9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



