Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F036DECD98C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 17:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xPGMqPPsasRtVDuykkmeQIHkWW8UR4LE56RB/n5jxOY=; b=t7UoDdejtYKK7dqcdo5Gge8RcN
	/ZDh1wTwdr/tNbEV+cA6SgY0TUGJduWkKXo8qQ/OTWfIDMeh7Tj0+HgT4XSNQ5EFsjpuHZX/C5nrE
	CAMg0Ep47HkUniVL05a6ng0W37Fk4Sm+3A2iA3EIsuHtTz7SF4Je+hgh7M3A7+P8OV54mzm5+dlbM
	IIobMWs1N93ZmP4e6sg4NVokBBVrTUT2Jcs3mooRlijrNBZ5x2AQv9oHKaW4tpSPPXTeHZpnfsFsG
	/kaBf5zvBgqvQxh1/WtNru3IDKACo9qSE4vryOTY2BayTFn7m4bsOD2h798bLU/wiSEtOm32MFHcn
	6pyG9aew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo3BM-0000000AIDC-0KPq;
	Thu, 05 Feb 2026 17:30:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo3BJ-0000000AICP-2Nlb;
	Thu, 05 Feb 2026 17:30:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B56A14448A;
	Thu,  5 Feb 2026 17:30:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 946A2C2BC87;
	Thu,  5 Feb 2026 17:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770312616;
	bh=nmhl7oJPwOQKGhvS5Y0LaKirKo62bY/yf4EL+9kA0OA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=F/StjmdvehKAzGGyVRuefB9Wz8w4AvzGJhIV2ZSFJQgxLah7OT3B2RVmRNjpfXNEM
	 91aaioJzFFMtuYgrQP+Yiy428mYEoz0jqtTmtpXWSrP6FtS0EDDKKWo0O6OPR+agZF
	 PQsGxIlsMk0K4omsx2ch1cJEiOBc0TsAiBNFutCVn4AxMXvKD9Jf3PYItHezUrH4Dk
	 VOSiYNAdBTmNzJjHcQ2kznnntFWjwpg3qbU9b/a//4GekZak5knSCATNl3m6VQzTn+
	 KpymdsP2FvnP2lnGrZeDISkhfhjxLkraW6ZPMq1e+GtO1sE10Pa8l+qiKxczb2LUs8
	 upXQlFpC7haaw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 8534B3808200;
	Thu,  5 Feb 2026 17:30:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/6] net: stmmac: rk: final cleanups part
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177031261432.500992.15994609944563824228.git-patchwork-notify@kernel.org>
Date: Thu, 05 Feb 2026 17:30:14 +0000
References: <aYMN2gZMfLPKuukG@shell.armlinux.org.uk>
In-Reply-To: <aYMN2gZMfLPKuukG@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, alexandre.torgue@foss.st.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, heiko@sntech.de, kuba@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
 pabeni@redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_093017_635782_EFE2C1B8 
X-CRM114-Status: UNSURE (   9.54  )
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

On Wed, 4 Feb 2026 09:14:02 +0000 you wrote:
> Hi,
> 
> This is the last part of my current dwmac-rk cleanups.
> 
>  drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 361 ++++++++++---------------
>  1 file changed, 150 insertions(+), 211 deletions(-)

Here is the summary with links:
  - [net-next,1/6] net: stmmac: rk: introduce flags indicating support for RGMII/RMII
    https://git.kernel.org/netdev/net-next/c/d323769d64f2
  - [net-next,2/6] net: stmmac: rk: replace empty set_to_rmii() with supports_rmii
    https://git.kernel.org/netdev/net-next/c/a9d4aff670ed
  - [net-next,3/6] net: stmmac: rk: rk3328: gmac2phy only supports RMII
    https://git.kernel.org/netdev/net-next/c/f365541bf7b6
  - [net-next,4/6] net: stmmac: rk: rk3528: gmac0 only supports RMII
    https://git.kernel.org/netdev/net-next/c/d7d92037cbd8
  - [net-next,5/6] net: stmmac: rk: use rk_encode_wm16() for clock selection
    https://git.kernel.org/netdev/net-next/c/5c1fc7cb81df
  - [net-next,6/6] net: stmmac: rk: rk3506, rk3528 and rk3588 have rmii_mode in clock register
    https://git.kernel.org/netdev/net-next/c/b10d56b0db3a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



