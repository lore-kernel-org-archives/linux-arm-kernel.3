Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 095E810F3DCB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Mar 2026 04:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mj46CiT4tZDsT/uZkJQ5IIitb3h8K24X9Ef01Ip1VKo=; b=wesJl2imEFVXLIIwPP/jiR12br
	Yu1VGQqYqSOstvoH+2xDaU7Ep2dd/0TyIxeznvEinHOEjgHZkdW2XtY+xRjbYHWtOP16lrZ8Oxw4p
	4ltSVq4xsUcQk4rr4t3QR6FyFfjDvqBwaBfabABLvwKnjfOrTnlvD6Rji25OdPYtK6r9OK2vG1m05
	pNzyQItUHU7+m1tgEPmiD457xXjg4TMc4xrNvWZc9SD1wd3jhVKZr3krOIHv6CegbcWbukKl2grRV
	5ZXJBXy85rGgXyFs2m2xBE4F6+sMYMh/WklIg0TSdi6JOvQXWnDZqCr884gAcQ4OHot3S8CPSP7Ap
	0kAe7Qaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6L0N-00000008Vs7-0A7Z;
	Sat, 28 Mar 2026 04:10:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6L0L-00000008Vru-2BhA
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Mar 2026 04:10:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3D40460128;
	Sat, 28 Mar 2026 04:10:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E367AC4CEF7;
	Sat, 28 Mar 2026 04:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774671031;
	bh=yKf2T1AUe+h23GNwJLNhDG4gyygGwCV0bDosgAI3kAg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=nlha+pW44VxN3w5alT5oKzNDcJpZvSUo3FBkFduMlSuoiYv30In23k+cfMT6Y1Pz0
	 +opdGfyhMYo6vs9Cz971Rocu5ooFV6nh+qzWVr8nTYh124HY5b3LtK7IWLys4VXf4q
	 yjCf0/SGt7ti0i/SQRI5VG7WGlczVNSMlUeatAFGjArGORaqgqcsOvrIRmOZl15qB8
	 p0/4WO61492GYqzAIjq6uk2DR5Q7Y2huc6734RpvaRiMgldOfqmzK/Td2hHDbuEV6p
	 Av7t7Qa9pHMXbg20uXpDpanv3bMljOeBPYsEm6HQ6UmIW0y1qCC3ANyUAw/Dk/OUi7
	 jd84+3+6uOs5w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9F2B3930181;
	Sat, 28 Mar 2026 04:10:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v4 0/2] net: stmmac: Disable EEE on i.MX
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177467101728.4182342.3438344923033995715.git-patchwork-notify@kernel.org>
Date: Sat, 28 Mar 2026 04:10:17 +0000
References: <20260325210003.2752013-1-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20260325210003.2752013-1-laurent.pinchart@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: netdev@vger.kernel.org, imx@lists.linux.dev, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, festevam@gmail.com,
 francesco.dolcini@toradex.com, Frank.Li@nxp.com, kuba@kernel.org,
 joy.zou@nxp.com, kieran.bingham@ideasonboard.com, m.felsch@pengutronix.de,
 pabeni@redhat.com, kernel@pengutronix.de, rmk+kernel@armlinux.org.uk,
 stefan.klug@ideasonboard.com, linux-arm-kernel@lists.infradead.org
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

On Wed, 25 Mar 2026 23:00:01 +0200 you wrote:
> Hello,
> 
> This small patch series fixes a long-standing interrupt storm issue with
> stmmac on NXP i.MX platforms.
> 
> The initial attempt to fix^Wwork around the problem in DT ([1]) was
> painfully but rightfully rejected by Russell, who helped me investigate
> the issue in depth. It turned out that the root cause is a mistake in
> how interrupts are wired in the SoC, a hardware bug that has been
> replicated in all i.MX SoCs that integrate an stmmac. The only viable
> solution is to disable EEE on those devices.
> 
> [...]

Here is the summary with links:
  - [net-next,v4,1/2] net: stmmac: provide flag to disable EEE
    https://git.kernel.org/netdev/net-next/c/187b00a26679
  - [net-next,v4,2/2] net: stmmac: imx: Disable EEE
    https://git.kernel.org/netdev/net-next/c/394863097e36

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



