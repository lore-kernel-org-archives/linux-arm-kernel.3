Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82306C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 02:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LWGWR65w9o8f3hmhvteuQiaNzGVZjATixCsQYcqJ9Zc=; b=sdwbZS9ujhMf/k9V28YVxi+6tm
	j2LURrNmqo+pqgLPjXlLP5Z2AB1ZU1i6eDnxEvade+8UYrKoWF7mofSd5Lhy1ugHSKU/nBBtXIA+D
	EorAPLU9DVPTydmwIpReFJcUPyESck5GEQnr/93bDXf0OozCM+1NV3acF8jjD0RbI242c9s8p/bXk
	20LKRLJKWZ+JYERBDs9nomAb1NZXDY66ENoLXN1TEuMONZfMSMjipUgEMNFAf6duNYvTNAHcqtnU+
	DQIk9BYN2JXEsLthNtC2dzergHocZ1dJeRL/XE3uno1AfIRLMYIAOG8GMCOle3Bgydpe/tzHxijxY
	mi5dSqJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u341i-0000000CIwY-48Rc;
	Fri, 11 Apr 2025 02:21:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u33zt-0000000CIhD-1IE5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 02:20:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3B1D64A4A3;
	Fri, 11 Apr 2025 02:19:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E53F0C4CEDD;
	Fri, 11 Apr 2025 02:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744338000;
	bh=mfLaG2nxVxcGauw+VJq2eXijJjVtz88YySLM2xjfeZA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Lp3cQLCv/cwNpt+DlYJTnDEjVyvk4bMg5uFILjjk2vsVKT+uwzQ/D/+ebmWEa5eW1
	 gOCvZidtslgc2XOF6WNUWoY7XXmUxUMu3WFXZlbvhDFl2Kffa2Gac5+AZBk6j5E+xp
	 UpR75r0UT5V/JZOyNY+m9ai163z1a7wZy2AEnxeidyFeo82s/qtU0PqnR/8wOfZV6S
	 kiLROQ+CgpB5e87hh6+6ewzA9BpOFpMqXSMvpsZ0GP34GLp+JtcIBYJ96fzCFRk5uo
	 D/r2BCuYFLUHZmXX79yD2XiyP1Skz8Eyyj3UKBUrvfoT4ARuENVjkaDwmSxb7KTbf5
	 J8ApWMWWKjYkw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE2A6380CEF4;
	Fri, 11 Apr 2025 02:20:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2 0/2] net: stmmac: stmmac_pltfr_find_clk()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174433803749.3928161.6701102977698674868.git-patchwork-notify@kernel.org>
Date: Fri, 11 Apr 2025 02:20:37 +0000
References: <Z_Yn3dJjzcOi32uU@shell.armlinux.org.uk>
In-Reply-To: <Z_Yn3dJjzcOi32uU@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, alexandre.torgue@foss.st.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, jonathanh@nvidia.com, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, pabeni@redhat.com, prabhakar.csengg@gmail.com,
 treding@nvidia.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_192001_368172_6B6C52FC 
X-CRM114-Status: GOOD (  10.21  )
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

On Wed, 9 Apr 2025 08:55:09 +0100 you wrote:
> Hi,
> 
> The GBETH glue driver that is being proposed duplicates the clock
> finding from the bulk clock data in the stmmac platform data structure.
> iLet's provide a generic implementation that glue drivers can use, and
> convert dwc-qos-eth to use it.
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/2] net: stmmac: provide stmmac_pltfr_find_clk()
    https://git.kernel.org/netdev/net-next/c/de6487201949
  - [net-next,v2,2/2] net: stmmac: dwc-qos: use stmmac_pltfr_find_clk()
    https://git.kernel.org/netdev/net-next/c/34e816acdb0d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



