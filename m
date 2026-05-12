Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A387CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 13:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sbIbgh8j6uqLsMS86SPclcDZYZknQ4Sx+eXsmdaeqRQ=; b=iMwKzKiscqWghvJXxQmzp7YNkC
	M0J8u4rQoYR1C4ijAYKsxhHqV33gvp6aOTUXvmQxc/cjYtwhWTzDGWoXUs4QgnTg8Kj+S/9mPRjG+
	4+2OPOj2nMWyhLIlDJY7Q4FjqeqqkMNYuAqUkaobz3U6gtpk3U/6+SKUB9h77YJaKUNth5c2U1Sve
	BeDEl0hO3ZM4WHgURnNG3OdwaidVvsWo6cCsgm9DKIXt8bhT5cu2sCL2RbxIFTsVcGuFWPLKHyswh
	Hp3NQkN1ko8eNIRa8rblsAKgUIw0rbHcPvibafFhdP5F0j+BwI7/DNuUC4f7F/XqtYilN3P7n7mNX
	BijeCFmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMnM6-0000000Gt3H-10Nx;
	Tue, 12 May 2026 13:41:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMnM4-0000000Gt2n-2ps2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 13:41:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EEF7061338;
	Tue, 12 May 2026 13:40:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3C34C2BCB0;
	Tue, 12 May 2026 13:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778593259;
	bh=987bjNRCrI3/Zujt7W+zUe5CBFskLwI/W/PALNXXSqw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=hyeOW3z7uGUygE6nQcN80o59NMPBXWRoSgeYa/rjIA6rp/ls22MdtWVxo3QyP0j4+
	 HwTsJUHCO58j6elVE4tAKeVOtfYQMBQkc3tOXFCSuGoWjL4jNKlMjT4WoWnj0iPsVG
	 3b511Km4HzqLUGABYPOaJB6R4ZEjIoFSNgzF/URqpS91nMdzcMf2BzKxSMndRK+hY1
	 bYbs9GshuTHIy64ZING6s95TSF6r8C700OmseF+4AiGyfHfTsnWv5odQX22r+7FdPl
	 Svd2Nl8U1dTKuakWqgTkIUTGVIzoMKFNGZmgefN3d/LQeepRy4yBJ71qLWXk4Bzfh+
	 9H02qASO5gxBA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02E9B3811A57;
	Tue, 12 May 2026 13:40:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: ethernet: cs89x0: remove stale CONFIG_MACH_MX31ADS
 reference
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177859320580.2872735.6530995193637920675.git-patchwork-notify@kernel.org>
Date: Tue, 12 May 2026 13:40:05 +0000
References: <20260509023732.42256-1-enelsonmoore@gmail.com>
In-Reply-To: <20260509023732.42256-1-enelsonmoore@gmail.com>
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux@armlinux.org.uk, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com
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

This patch was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Fri,  8 May 2026 19:37:28 -0700 you wrote:
> The legacy ARM board file for MACH_MX31ADS was removed in commit
> c93197b0041d ("ARM: imx: Remove i.MX31 board files"), but a reference
> to it remained in the cs89x0 driver. Drop this unused code.
> 
> Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
> ---
> I found this issue while working on updating arch/arm/tools/mach-types
> to remove entries for board files that are not in the kernel - this
> reference caused my script to consider MACH_MX31ADS to be present in
> the kernel.
> 
> [...]

Here is the summary with links:
  - net: ethernet: cs89x0: remove stale CONFIG_MACH_MX31ADS reference
    https://git.kernel.org/netdev/net/c/36a8d04a8293

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



