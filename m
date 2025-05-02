Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D004C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 01:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u6FL0MUFSII8f7QfOybYP03dFAg0GpcAIBEUAaehsTQ=; b=xDCuTZCFYv8ZeYI5MY4OphPVUH
	rwq072E4uexkVLXWCQtN2ZC4qADUwJUTAMK7kVD5xKljQhbAAB3TTsGvMSKtEHLR1Osr3757FjECG
	Vx8pQYRxH85An6A7Iv7ndTwV6Ka340II6Nf2+wpDrJzQ0b3ZPTZqpUtEhbkYbkZIE+ZBECVlMiiAh
	tjOhGTPyNZelWgLgwnBeCqSmoqOvJc52pekQsXS9X08s5BhFd7a/G3fz5Z1CTnuVns2WIh+ZsFAsv
	Ix6tPzCcqSMFwSaR5lO1ElBth5COgtDTRd9RJa4+QEK3/qK1SzQgXCC0egppIc/8/J0gJ4mmfmJ91
	UsYy21kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAewV-00000000TSg-3nrz;
	Fri, 02 May 2025 01:11:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAeua-00000000T2V-2QyG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 01:09:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D9B5644C53;
	Fri,  2 May 2025 01:09:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12E3AC4CEE3;
	Fri,  2 May 2025 01:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746148196;
	bh=lleui9YZj1ZPGW2rU3DcmlJmd8ORLV6xd0I6f7lEiZY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=jwszXV43n5sTI/lJNUFvmM8lAunWNcPqcuMNwG4asIyPKU7Vura+g1O1N+p+Wup80
	 F1501QBwu/9u9VRttT20Jns5ySZNAAnRF0oAlfuj1aBfL81VzNPJ4HurgjkrfBGNlT
	 26wifFgaIubylluwyDNddzZ30ovmRyTUWOeh2312gqbPeQ+W/e28VqUSeeTo1oIChm
	 CGasaMCTIhy+JSCf2hp6WbN7VN/VQEM01PbK8cU9RU13hwCrzFKTpMsRZwvH2oRpXX
	 x3Ij7rwtjX/zIoWJb6lNEXXK0KiYnjv3MKgUxC6pjxIsrS2openH1zZWLlJqOCGzJE
	 /Ogds3RM0Dltw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 635023822D59;
	Fri,  2 May 2025 01:10:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] dt-bindings: net: via-rhine: Convert to YAML
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174614823526.3123530.12844866461637872055.git-patchwork-notify@kernel.org>
Date: Fri, 02 May 2025 01:10:35 +0000
References: <20250430-rhine-binding-v2-1-4290156c0f57@gmail.com>
In-Reply-To: <20250430-rhine-binding-v2-1-4290156c0f57@gmail.com>
To: Alexey Charkov <alchark@gmail.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_180956_641160_D80258D6 
X-CRM114-Status: GOOD (  10.53  )
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

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 30 Apr 2025 14:42:45 +0400 you wrote:
> Rewrite the textual description for the VIA Rhine platform Ethernet
> controller as YAML schema, and switch the filename to follow the
> compatible string. These are used in several VIA/WonderMedia SoCs
> 
> Signed-off-by: Alexey Charkov <alchark@gmail.com>
> ---
> Changes in v2:
> - Dropped the update to MAINTAINERS for now to reduce merge conflicts
>   across different trees
> - Split out the Rhine binding separately from the big series affecting
>   multiple subsystems unnecessarily (thanks Rob)
> - Link to v1: https://lore.kernel.org/all/20250416-wmt-updates-v1-4-f9af689cdfc2@gmail.com/
> 
> [...]

Here is the summary with links:
  - [v2] dt-bindings: net: via-rhine: Convert to YAML
    https://git.kernel.org/netdev/net-next/c/630cb33ccfcd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



