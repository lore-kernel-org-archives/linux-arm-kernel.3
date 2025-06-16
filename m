Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D18EC71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 22:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZKXmabMmpr1zjOY8CNBS9AO/7uudR7AP/IpkkD7lcGI=; b=FzZLMS6pCT3gvQuG/94CLbOZgZ
	hwcymEL9hjmqvZv25gj33vV4xxBmFuUIsoH6ALMLHhmsc15w7qF0zMCEcpBWq+2qnFbxJOT1g8qCR
	rj7ShHkqzATPTlXlR15M1KU7xwEjwziAMUQgYYTt4nq+bAYg40QNY6V/yQiX9CbH11hph9Njrt0/v
	ZQDFmYPj+rnL9ssByVOU6Y0XV5sDF7R/Nz/pk385PGFDAVk4YS8zpOYlLd9h3b1fuUU+an+LOKxFU
	PiSXC8D7aMZ7VRaHVHK0NPRhP+fpI9c9Gb7eDdJ6iO9ZrXVp/s4QxvZ+5HGUWK5p3TAazWXyOzGMR
	RfBwKQHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRII9-00000005h4j-0i5p;
	Mon, 16 Jun 2025 22:27:01 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRI1r-00000005fEr-07kO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 22:10:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C71C0A51F54;
	Mon, 16 Jun 2025 22:10:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67BD9C4CEEE;
	Mon, 16 Jun 2025 22:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750111809;
	bh=BMyJEqIXakUu8Q/coxq6kmO0L2hveQX8mNILFSh4PbA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=jbgP+hzOemklZH/U/OZ92sg+8eipjkq6+P+29+RCAk8JWiX9BkK75uXwPSY7uj4wm
	 FzuRjW85xJhtppKC7oGCqEkh0nPq8bNX86HjvnZVxRZU+gaQGx3JEcfZSvxmLDS/Qt
	 Q7Jtt0jD9aPsKR6NGRee0/kwUhuokf6NYT6gcD8u4QZoZfV29/4n+W3N5tJzu4Lz4v
	 xvF9RlyTRdIuRGBNWOheZ3UAw/FGvvOUgv99QCxxBioU+GiBXun02mO1L+z9kp1M3f
	 gHzUnN2lEq06LnJKAPbENWAqM7U579ZRG5QFaBcmQEo0rI+fbU7HOLta5x836fXUWf
	 RFx5fHfEOBeYw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70D6A38111D8;
	Mon, 16 Jun 2025 22:10:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: stmmac: remove pcs_get_adv_lp() support
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175011183824.2530350.4880030632930663714.git-patchwork-notify@kernel.org>
Date: Mon, 16 Jun 2025 22:10:38 +0000
References: <E1uPkbT-004EyG-OQ@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1uPkbT-004EyG-OQ@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, alexandre.torgue@foss.st.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, pabeni@redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_151011_133976_7982EE80 
X-CRM114-Status: UNSURE (   9.74  )
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

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 12 Jun 2025 17:16:35 +0100 you wrote:
> It appears that the GMAC_ANE_ADV and GMAC_ANE_LPA registers are only
> available for TBI and RTBI PHY interfaces. In commit 482b3c3ba757
> ("net: stmmac: Drop TBI/RTBI PCS flags") support for these was dropped,
> and thus it no longer makes sense to access these registers.
> 
> Remove the *_get_adv_lp() functions, and the now redundant struct
> rgmii_adv and STMMAC_PCS_* definitions.
> 
> [...]

Here is the summary with links:
  - [net-next] net: stmmac: remove pcs_get_adv_lp() support
    https://git.kernel.org/netdev/net-next/c/883af78926c1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



