Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44B72C71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 22:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mOUZrTyij2BpcruM25GguVr0jx3ICxyLejv1mvUkrmg=; b=L4Yo059ROyRTd5JfiVjj4yI/pB
	6QKBKroBxHcyc0UUPqKO/56CzkdUBLvjvuQX7shRoA6dd2nKrJFXiNItkJMY6/Pfm2Xo0frCQgH8u
	Sl2gHUYlgz0UVroV/hb85BrGO58aXdn4Sk06isqgpJZeVh4cAk8Qok+gMbrJ07sosU3lmARnDB5PD
	MiVC5nV+PREix5e7TJgEo/XqVmeW+DQ4sVs6vRuhp88cmyC3iUR96dPGVwzBzcw8df1LBMifc0xsn
	s3UY0eACGGpa1hOVOqPNYWXjO5RxU2zwEceaeQmzEJpL6N9bCEgDMc1VZp6BLOxEyMql6HuoT8k3y
	ObB5e3WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRIKK-00000005hCP-48CZ;
	Mon, 16 Jun 2025 22:29:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRI1t-00000005fFI-2TPO;
	Mon, 16 Jun 2025 22:10:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3D02C629DE;
	Mon, 16 Jun 2025 22:10:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0086C4CEEA;
	Mon, 16 Jun 2025 22:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750111811;
	bh=/UFQy/gwF7auX1dmeeWX0y5HeA22qawDpoPuhTXqVnw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=otR/ScfkmiBWXEbpcWOJlqYb1rAnFUVEnRn8+FYqoIAWGOYwV0AxHstBzFzUVzZCy
	 jhAZgP1NU1I9cQnHfUZuUV1aYoRcmNgnsoHQqJx/vFibgYUjkK9PRncbe9uvr8Dd2j
	 XHWDotczCBbx4cvoPJEHUbctkYP3wmpiUtCtWGg5jkYWXHRyiNX49/k5p3q0ElPqFl
	 fPXYs8VWO/fnPF69/a+JY0NpRd8nK4WvWurTb8a3aCGOMdE9pQfARWcdb/jQHtFAOf
	 qKAQvFPOfF45GNa+t9a1mcn4geHSpMh3Rrfm3vzM7CQDk7uYrJZyJy9dtQ+K6lWDG2
	 32jR9EAMHroDQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EACFF38111D8;
	Mon, 16 Jun 2025 22:10:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/3] net: phy: make phy_package a separate module
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175011184073.2530350.6087096152984005228.git-patchwork-notify@kernel.org>
Date: Mon, 16 Jun 2025 22:10:40 +0000
References: <eec346a4-e903-48af-8150-0191932a7a0b@gmail.com>
In-Reply-To: <eec346a4-e903-48af-8150-0191932a7a0b@gmail.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: andrew+netdev@lunn.ch, pabeni@redhat.com, kuba@kernel.org,
 davem@davemloft.net, edumazet@google.com, andrew@lunn.ch,
 linux@armlinux.org.uk, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, netdev@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
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

On Thu, 12 Jun 2025 23:25:00 +0200 you wrote:
> Only a handful of PHY drivers needs the PHY package functionality,
> therefore make it a separate module which is built only if needed.
> 
> Heiner Kallweit (3):
>   net: phy: move __phy_package_[read|write]_mmd to phy_package.c
>   net: phy: make phy_package a separate module
>   net: phy: add Kconfig symbol PHY_PACKAGE
> 
> [...]

Here is the summary with links:
  - [net-next,1/3] net: phy: move __phy_package_[read|write]_mmd to phy_package.c
    https://git.kernel.org/netdev/net-next/c/cbd1ab0ce8f6
  - [net-next,2/3] net: phy: make phy_package a separate module
    https://git.kernel.org/netdev/net-next/c/a1acde1e1bcf
  - [net-next,3/3] net: phy: add Kconfig symbol PHY_PACKAGE
    https://git.kernel.org/netdev/net-next/c/7d57386905d4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



