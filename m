Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8470FC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 08:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OSfc84xBOEvzCXJrLSuCPFK509D1OkhJn6cR3EB/bZc=; b=zB6kuYqneQo5SkztnvT2mEuKLl
	xujVZtbDNWShwod16CHJFB7HS90Gc82Sm9KbqD4hZyfOzSp5U1/pwx738U57FI8cM7Q9zyIL7cSa5
	zaRjabEvxlk3FdayGeax/9BCcCWf/Ds1dqbzL4z+k0n+3fQTO1iI3EoReMYFuFzsIp+7g7JoHl4H6
	KMAXsfu02SvSsjABpekM6lltdF4MnWf/db8dUFa9UvskST+vIj03HfmDgVD85FO/pCFkzLks9iYYf
	vmqdxq3XLk/vfBNkDh+4IN85nh1K/seK9FGiHaLGtH+cLvFgFhzbLud0Ixjyglpp3HZkHZNB0BSei
	+hgfZi+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl1y1-0000000HNLI-1LfK;
	Thu, 20 Feb 2025 08:31:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl1wV-0000000HN0S-2DzE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 08:30:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BF3A65C491B;
	Thu, 20 Feb 2025 08:29:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94E2BC4CED1;
	Thu, 20 Feb 2025 08:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740040198;
	bh=649fmmAckJtxvn8+vL75y25cRWSc5bs5KxYHmJ1yOpg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=oA3toarVAuJk2LHZAZKldIRQWCA4CuBaOfPcoagwTAYwYtkP8Ej+10fTiP8YCrSy3
	 l76beFxXcmlzJs3dybFrxTFaMKASlGAp7UiiKnfOFzuITkPjaPEi+uOxbgw2SKED0A
	 bHdxFxfJeY3smckD8e86knrPv3dwb1CJ0qxsu4+YeI3b+Cz3Ht9N9QBWcaY3aHppJi
	 iDEq8caRmQYJ3zUXSqlBUfW4qRb3XEd//Z3pwzCdc6hJsLkzty9lIbADCgEy8LVEZM
	 XdljJ+0IxEbDlOmtdPKDPv8j7PqAuwDQrHYpRMxMl36SdhClyegKUzDElaHZHagmuR
	 F1nx0aslHM6bA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 717F4380CEE2;
	Thu, 20 Feb 2025 08:30:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: axienet: Set mac_managed_pm
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174004022926.1208713.2604562776709725855.git-patchwork-notify@kernel.org>
Date: Thu, 20 Feb 2025 08:30:29 +0000
References: <20250217055843.19799-1-nick.hu@sifive.com>
In-Reply-To: <20250217055843.19799-1-nick.hu@sifive.com>
To: Nick Hu <nick.hu@sifive.com>
Cc: radhey.shyam.pandey@amd.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 michal.simek@amd.com, linux@armlinux.org.uk, francesco.dolcini@toradex.com,
 praneeth@ti.com, andrew@lunn.ch, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_002959_639590_0E66E264 
X-CRM114-Status: GOOD (  10.71  )
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

On Mon, 17 Feb 2025 13:58:42 +0800 you wrote:
> The external PHY will undergo a soft reset twice during the resume process
> when it wake up from suspend. The first reset occurs when the axienet
> driver calls phylink_of_phy_connect(), and the second occurs when
> mdio_bus_phy_resume() invokes phy_init_hw(). The second soft reset of the
> external PHY does not reinitialize the internal PHY, which causes issues
> with the internal PHY, resulting in the PHY link being down. To prevent
> this, setting the mac_managed_pm flag skips the mdio_bus_phy_resume()
> function.
> 
> [...]

Here is the summary with links:
  - net: axienet: Set mac_managed_pm
    https://git.kernel.org/netdev/net/c/a370295367b5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



