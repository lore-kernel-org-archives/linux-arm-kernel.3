Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CB0BCAC59F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 22:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0y3R+vXn/zF0Q/9lfFYRjSeyh8cD2OhzFylHKO1b0BE=; b=hVHrlSP81D8cGhBkbfHpC9flMe
	l2aq5V0SJ/t7SXY7raGMk47P9v57BoCWT1wrP9UAj/YZxR/4iqtTmb7AA8laaM7r39tK3Or681lx7
	e2wqgaQCIADdKDd/QmrN7C08dfCcBuo66CKjnDAX3nF5ztv6boVtazQZooikwhjKnsWtdUICjdeOT
	YzZxKXtMqev59hHNVZvYG8u+RtJVI34tFmBH1SvAFRihhU0F5/jMzBZZIbmd69iL8IOKZbc2vyMEs
	0u6mqq5dPb3gUpTZ0cLM8YwXGvbCPGDWbxTrlznBJACIcbB1ThBTj9f3iPPGBd0hPoW98hn+QnP6o
	GjPhqe4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz0fA-0000000FGJm-3l6Y;
	Wed, 17 Sep 2025 22:30:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz0f9-0000000FGIo-178S;
	Wed, 17 Sep 2025 22:30:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E04374050A;
	Wed, 17 Sep 2025 22:30:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE635C4CEE7;
	Wed, 17 Sep 2025 22:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758148206;
	bh=s76GbDrYFwwZwSum2VWjLTNSOLDqXR0ee9PKdLqdIN4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=XTF+07cY9h6ulIkYEmSAadUHSirIAkCR8PdSvFN1oItDmlNlxKzY+kznsK77kbpFE
	 BN1YJFtQ6eGSftAWvNzyYAEnBRlE0bEMhx91x/tm5D6MfP72y7vPB0B/M49qZrgSmX
	 XOVTqEYu5g7KbyvgnV1JbFjn2WVl8IqNrgIAqYSuN6Firz9MpGdPKhwbB42bik2GTM
	 jsch48DbkuV4HnJeV4OtZuIE2LgVxFI+D7+HI0olM7xXbyjkGeQst1hhMqTvs9LCH7
	 kGlq57ypU2AErDcAWg2ta4F74R6tI1v8bSCS050Vne2FjYx8PXe9LeTETfj8iU6WUA
	 DqpLpcLGV++kg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70CCB39D0C28;
	Wed, 17 Sep 2025 22:30:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] Revert "net: ethernet: stmmac: dwmac-rk: Make
 the
 clk_phy could be used for external phy"
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175814820725.2170568.16324588910347581106.git-patchwork-notify@kernel.org>
Date: Wed, 17 Sep 2025 22:30:07 +0000
References: <0A3F1D1604FEE424+20250916012628.1819-1-kernel@airkyi.com>
In-Reply-To: <0A3F1D1604FEE424+20250916012628.1819-1-kernel@airkyi.com>
To: Chaoyi Chen <kernel@airkyi.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, rmk+kernel@armlinux.org.uk, jonas@kwiboo.se,
 david.wu@rock-chips.com, sebastian.reichel@collabora.com, ziyao@disroot.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, chaoyi.chen@rock-chips.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_153007_326766_CAA00AE9 
X-CRM114-Status: UNSURE (   9.06  )
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

On Tue, 16 Sep 2025 09:26:28 +0800 you wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> This reverts commit da114122b83149d1f1db0586b1d67947b651aa20.
> 
> As discussed, the PHY clock should be managed by PHY driver instead
> of other driver like dwmac-rk.
> 
> [...]

Here is the summary with links:
  - [net-next] Revert "net: ethernet: stmmac: dwmac-rk: Make the clk_phy could be used for external phy"
    https://git.kernel.org/netdev/net-next/c/a09655dde754

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



