Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B91DC71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 23:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WTND09Bsc5qA0HEByq6/8KDzq+eITUKYUeQCoUogxaI=; b=ED7vrasxLHA5G1vB8V3pPblMjL
	78F6l9j3/8J3qMk9TdGUXUon1323EieGnC3S7dvWFVtUDSIj2RLaW/iQAWdgcqJUr21ytLNX3V4O3
	keAKtJFoTBHVMUU5OlAs/UumeMz8b9OGcd2ANHiHkLBWazExIWvtZOWcMGvxEg0FcMtIl6myzJWuy
	qJF2x8nR+Qg0MqKhCkIDk/wxtHf9Kj/xJQ3WNC5MJzo5M7AE5XAsRi7JpNe9qSy/RiCb0xwJay3YJ
	Hej/U6slUykvE7mE3GHRx34sEZMfM8uJYvLdx4tR6btR4bsQla/r6m+wmz9AekF/7IjH/lEAW73K8
	ZsPMVbEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRfnG-00000008ckC-1jt1;
	Tue, 17 Jun 2025 23:32:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRfl3-00000008cXp-0vj8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 23:30:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DDCBB4351C;
	Tue, 17 Jun 2025 23:30:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF843C4CEE3;
	Tue, 17 Jun 2025 23:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750203024;
	bh=tcMHWk4FkgjU/bW20uI6112m4lCsw+x2BSh1ZhtUv2w=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=lwGoNx2HcdoFIqXfNx2lyArccnRGQvr9Cbvt01sXr/oLXvauWbaCk71QzAFv9YQMz
	 fbtEU3kqLl3nno0scsgd/MYZ+kqIEJei7DwVEl3y2jj2BCF+elOaPWF9OVtY2bWbdF
	 eYHJu1VFJ3Z3EivQdMmBS9b0K9Ky+1yvhx6llYBuY009Jwhh/cDwkaDz8qOmDdEGJk
	 LKsfeABU/tnIP0x0k2eNWjZQnPNYTgdh8y6RYevgF8MWavZrcAFy6utYFb90s1EJ/o
	 NPW0I3dBICjMhLJZm9C1/CevHnSth/DGZuFbwl3oj/7G7SUFJRdZWUnScmMdda7RX0
	 4FFDgoecp44/g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70D2E38111DD;
	Tue, 17 Jun 2025 23:30:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/4] nte: stmmac: visconti: cleanups
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175020305298.3735715.14567227448478806213.git-patchwork-notify@kernel.org>
Date: Tue, 17 Jun 2025 23:30:52 +0000
References: <aFCHJWXSLbUoogi6@shell.armlinux.org.uk>
In-Reply-To: <aFCHJWXSLbUoogi6@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, alexandre.torgue@foss.st.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, nobuhiro1.iwamatsu@toshiba.co.jp, pabeni@redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_163025_277176_71BB43E4 
X-CRM114-Status: UNSURE (   8.34  )
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

On Mon, 16 Jun 2025 22:05:41 +0100 you wrote:
> Hi,
> 
> A short series of cleanups to the visconti dwmac glue.
> 
>  .../net/ethernet/stmicro/stmmac/dwmac-visconti.c   | 129 ++++++++++++---------
>  1 file changed, 74 insertions(+), 55 deletions(-)

Here is the summary with links:
  - [net-next,1/4] net: stmmac: visconti: re-arrange speed decode
    https://git.kernel.org/netdev/net-next/c/7d7525876b5a
  - [net-next,2/4] net: stmmac: visconti: reorganise visconti_eth_set_clk_tx_rate()
    https://git.kernel.org/netdev/net-next/c/1923c6c3a8b7
  - [net-next,3/4] net: stmmac: visconti: clean up code formatting
    https://git.kernel.org/netdev/net-next/c/1a3a638d2d23
  - [net-next,4/4] net: stmmac: visconti: make phy_intf_sel local
    https://git.kernel.org/netdev/net-next/c/d54d42a41b65

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



