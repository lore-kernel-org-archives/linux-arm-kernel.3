Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79DE210AB83C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 01:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JykuTy3mBIw6sODUzKyWLl3fD03aPFkdVSGqdj/7SDw=; b=YCE54e16orEXafj/O9sN24rpxV
	8gvWc3OF6XnuTAwiBW/xfWdrEfXCN+zvbyeGgobnEVkOKIP1FD9vjHQU1McBMAGIYE2WPIM3XoO/+
	GBxqZoYcvDdwGt0v+l/wvQ6+ne7pJbO6W70rD0rHFY5kmsJe3b+vL5N7MxL7BC4po1xfTgvDz9RsC
	38qhfIPPWF0LmOOwwg9GTsOnaGaHBuRrrcYN87fh0CWQkHgOSCqNm+z9oi6j1ntYs2WkrTEk5/j82
	jGKSf1R8Q/HbLJgsj7Es5domwT12xoul9Xd+YXmyKBQjIaX/IclObjyuwIvvWNvTnJ6cNSJ3CL5Yw
	/ARC4itA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5w4C-00000006URI-2OO4;
	Fri, 27 Mar 2026 01:32:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5w4B-00000006URC-0Kmh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 01:32:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1025060103;
	Fri, 27 Mar 2026 01:32:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4761C19423;
	Fri, 27 Mar 2026 01:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774575169;
	bh=2jW+B2lXjwLgZb3cDkL7mX6Gb7T5UWGOWeSgPIBscW0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ZXDXEZvrfbba5SXaPx+s9TyX3f3xwmko6tdteBUp4OqwMzZl2Tu3DijxDIkmFmNGw
	 PQI73u+fc0F62JnMperkHNN/7SG1wze0fLP8r5FfS3+XMYLHSQsUVT/5cKFSff4+4w
	 B9EU2vPnuacs3cFkGNUaC3kWDJPF5YsYUJIzGYmJCxhG2hNuLFW5bo9mo0SCnGiEPa
	 QzdDqnhMFZDvE285ndvp29Ns0cBLREcUN5xmVFjQj9N7KVgsOwsrmLBzqy57bAFCUE
	 5TJwCWQs8YgIyLaJ9k1ukwWOBbNTGDN7z4KzzKZmJ+eplrm0BT4ZbNzG1PjwQpgSYc
	 TKUelsOgpRznw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 400403809A07;
	Fri, 27 Mar 2026 01:32:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/5] net: stmmac: dwmac-socfpga: Cleanup
 .fix_mac_speed
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177457515578.3250412.707977713955076913.git-patchwork-notify@kernel.org>
Date: Fri, 27 Mar 2026 01:32:35 +0000
References: <20260324092102.687082-1-maxime.chevallier@bootlin.com>
In-Reply-To: <20260324092102.687082-1-maxime.chevallier@bootlin.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: andrew@lunn.ch, kuba@kernel.org, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, horms@kernel.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, linux@armlinux.org.uk,
 thomas.petazzoni@bootlin.com, alexis.lothore@bootlin.com,
 rohan.g.thomas@altera.com, mun.yew.tham@altera.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
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

On Tue, 24 Mar 2026 10:20:55 +0100 you wrote:
> Hi everyone,
> 
> This small series does a bit of cleanup in the dwmad-socfpga glue
> driver, especially around the .fix_mac_speed() operation.
> 
> It's mostly about re-using existing helpers from the glue driver, as
> well as reorganizing the code to make the local private structures a
> little bit smaller.
> 
> [...]

Here is the summary with links:
  - [net-next,1/5] net: stmmac: dwmac-socfpga: Move internal helpers
    https://git.kernel.org/netdev/net-next/c/845a04411118
  - [net-next,2/5] net: stmmac: dwmac-socfpga: Use the socfpga_sgmii_config() helper
    https://git.kernel.org/netdev/net-next/c/a7be7cc12442
  - [net-next,3/5] net: stmmac: dwmac-socfpga: Use the correct type for interface modes
    https://git.kernel.org/netdev/net-next/c/9b04ecdfb876
  - [net-next,4/5] net: stmmac: dwmac-socfpga: get the phy_mode with the dedicated helper
    https://git.kernel.org/netdev/net-next/c/adf1536f79a5
  - [net-next,5/5] net: stmmac: dwmac-sofcpga: Drop the struct device reference
    https://git.kernel.org/netdev/net-next/c/9bd1af853750

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



