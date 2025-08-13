Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56012CA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 01:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EJUYcTOJUJSu2mPwLc7qg64eNYE1cCnM1aoJb8LiDXM=; b=Hd5bXvFkgujdLZ/4iZH1a7h7R8
	dCRRPw9NOKye9YaQRUZo+1V3PDytD/LOmCbsTaUeQEymXNvi+a8UatXiQy6zytVXgW8H4muKzaS+/
	0J7NEqwKeuLhDBBGjtNwzh5JTfCFoJuwYpnF20WQ7PHNQG+d29N6R0J5e6CwiM0T2EjL1ABiZpyyT
	L0WsrPtmSZ6qPjPlidD7i/0R3b4tNCE5MjuF7ntH6lBAhUYffrRgyG50EghJ1k0yovOpjtWroFCGN
	v2zbDpTLQtqIhxQhD8I8ORv5479Ia2HXUCoXmaXtEIQuUVGay7NKWhUBBJvTk11LSDsYmK+uoKQED
	fo49BJNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um0CW-0000000CKeG-15CU;
	Wed, 13 Aug 2025 01:22:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um09y-0000000CKUp-2KLe;
	Wed, 13 Aug 2025 01:20:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7EBD3600B0;
	Wed, 13 Aug 2025 01:20:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12942C4CEF0;
	Wed, 13 Aug 2025 01:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755048009;
	bh=0OvQcSBq7+nWfUTs0J8PYw0DBRmzFTWE1hI4XBot3Ek=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=rckoJnAbdr6SDwFTCpifJP3CXyIKCp2JAyVGAJCMzU2Yb50Z8L2QyT+g+C36PYcIQ
	 XbAU7olp91xZdfzeOjZYFmIRQKuN4Mn4RpwaXGLq00JHa98ZITidgRvOudkM9pkArv
	 xCkatqb2CpqtPbhIVJNeIwtxDVdctGOgDKWNqRZ4+A7e4aSczfe/3S44AEgbnIDbtH
	 FrVu1y0ffWLJ6WZFmy//1Pq4cEoFEAaPEv42JmzTNQuZ4UgxeakTaq6z618Row18qu
	 rFte8M4R022SDwy1JvuKYyP2XqQb6Z4cM+JqUGnWDQyRfzMVJ17+lcAKFlHqtS/j9E
	 QlYDpSdwp2Jyw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 34A9C39D0C2E;
	Wed, 13 Aug 2025 01:20:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/9] net: stmmac: improbe suspend/resume
 architecture
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175504802100.2913300.7913222842711784004.git-patchwork-notify@kernel.org>
Date: Wed, 13 Aug 2025 01:20:21 +0000
References: <aJo7kvoub5voHOUQ@shell.armlinux.org.uk>
In-Reply-To: <aJo7kvoub5voHOUQ@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, alexandre.torgue@foss.st.com,
 andrew+netdev@lunn.ch, angelogioacchino.delregno@collabora.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, matthias.bgg@gmail.com,
 mcoquelin.stm32@gmail.com, netdev@vger.kernel.org, pabeni@redhat.com
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

On Mon, 11 Aug 2025 19:50:58 +0100 you wrote:
> Hi,
> 
> This series improves the stmmac suspend/resume architecture by
> providing a couple of method hooks in struct plat_stmmacenet_data which
> are called by core code, and thus are available for any of the
> platform glue drivers, whether using a platform or PCI device.
> 
> [...]

Here is the summary with links:
  - [net-next,1/9] net: stmmac: add suspend()/resume() platform ops
    https://git.kernel.org/netdev/net-next/c/07bbbfe7addf
  - [net-next,2/9] net: stmmac: provide a set of simple PM ops
    https://git.kernel.org/netdev/net-next/c/7e84b3fae58c
  - [net-next,3/9] net: stmmac: platform: legacy hooks for suspend()/resume() methods
    https://git.kernel.org/netdev/net-next/c/b51f34bc85e3
  - [net-next,4/9] net: stmmac: intel: convert to suspend()/resume() methods
    https://git.kernel.org/netdev/net-next/c/062b42801733
  - [net-next,5/9] net: stmmac: loongson: convert to suspend()/resume() methods
    https://git.kernel.org/netdev/net-next/c/38772638d6d1
  - [net-next,6/9] net: stmmac: pci: convert to suspend()/resume() methods
    https://git.kernel.org/netdev/net-next/c/c91918a1e976
  - [net-next,7/9] net: stmmac: rk: convert to suspend()/resume() methods
    https://git.kernel.org/netdev/net-next/c/d7a276a5768f
  - [net-next,8/9] net: stmmac: stm32: convert to suspend()/resume() methods
    https://git.kernel.org/netdev/net-next/c/c7308b2f3d0d
  - [net-next,9/9] net: stmmac: mediatek: convert to resume() method
    https://git.kernel.org/netdev/net-next/c/d6e1f2272960

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



