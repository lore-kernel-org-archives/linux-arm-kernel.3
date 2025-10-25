Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2134BCCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Oct 2025 02:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WfC+LK6Bf7kgzR7Ycp7lGDt/dSD1XD4UxgZ5RDW/PIE=; b=dhvLJBrtJLsRvQmpHgcqFqe4QA
	TJh/i0fu0lDXj5imsdTZgVi5s2QJ77gwW89fy0yTeeERLIDWU7+vBUrsUZDld/jwTKPu5g33vRCWR
	5IowvuuiYOzZUd2ee2tSxpTJgpZ3rwxHDWiAsmLSo3yLWn2o1e1iuzfwaSDcS5Ox0GV/gQ41l/kp0
	5mL5yaMIT21ZV0UoUt1lztXDFfANClIp1hURrnRiYbmr9LxsAMo8bZ9qL1mX+gmpk3zzmdvqlvTXy
	Ij8lQMxpUsZBjwYNzmBqVNf8kj3QT5Mn+HOe1FftCaK7Q0ECoOXQw8QuYkAih02q7MpuNXKTMrPU4
	TLkUMkMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCTkH-0000000Aonn-3jMp;
	Sat, 25 Oct 2025 02:11:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCTkE-0000000AomN-41jT;
	Sat, 25 Oct 2025 02:11:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6063945759;
	Sat, 25 Oct 2025 02:11:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EFCEC4CEF1;
	Sat, 25 Oct 2025 02:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761358262;
	bh=EJ/Aqtc+3CNTqVJNJQJ98eezwGN+8vLTVQDAuZan1Yw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=sU/IWdhwzB32/JIa1gMSB5YRGpBBP4f3dotAQoI/K9H1vQpCO5ij3NwrUtuOmipxX
	 +HsxEGNAATmwzhEb7rUeqkVyXqZOEGRg+iQIZchXWkzATZdmPFtNvWRshd5A1Mnwsn
	 6dyLrmK9ZX7/mpIGwAeQS4J+TX32TDEuNsIDz26zvS8kIVk/iJchyWVbKNBPRRdSz8
	 A2IMLYCMhdnuPCaIJxdzxRfn/3cpngKsH88zV99UhwN1srxF0W/Qo7exoLDEsiFOOu
	 oWh7auGWXNMTbgS4ZytjLWPQYUfCsfXmG16OccgXompon9CF5JEs89280v2FRXWVo9
	 Yy9V/SkexXZwQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAEE8380AA59;
	Sat, 25 Oct 2025 02:10:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 0/5] DWMAC support for Rockchip RK3506
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176135824149.4124588.13375979090680382599.git-patchwork-notify@kernel.org>
Date: Sat, 25 Oct 2025 02:10:41 +0000
References: <20251023111213.298860-1-heiko@sntech.de>
In-Reply-To: <20251023111213.298860-1-heiko@sntech.de>
To: Heiko Stuebner <heiko@sntech.de>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, jonas@kwiboo.se
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_191103_022971_FCD1C407 
X-CRM114-Status: GOOD (  14.84  )
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

On Thu, 23 Oct 2025 13:12:07 +0200 you wrote:
> Some cleanups to the DT binding for Rockchip variants of the dwmac
> and adding the RK3506 support on top.
> 
> As well as the driver-glue needed for setting up the correct RMII
> speed seitings.
> 
> changes in v2:
> - add Conor's Acks to dt-bindings
> - add Andrew's Reviews to first 3 patches
>   I didn't add the driver Review, as I did address Jonas' comments
> - adapt to Jonas' comments in the driver
> - add a patch for a MAINTAINERS entry (Jakub)
> 
> [...]

Here is the summary with links:
  - [v2,1/5] dt-bindings: net: snps,dwmac: move rk3399 line to its correct position
    https://git.kernel.org/netdev/net-next/c/32dd679b88d5
  - [v2,2/5] dt-bindings: net: snps,dwmac: Sync list of Rockchip compatibles
    https://git.kernel.org/netdev/net-next/c/e774c91dca45
  - [v2,3/5] dt-bindings: net: rockchip-dwmac: Add compatible string for RK3506
    https://git.kernel.org/netdev/net-next/c/4a667bec74b3
  - [v2,4/5] ethernet: stmmac: dwmac-rk: Add RK3506 GMAC support
    https://git.kernel.org/netdev/net-next/c/2010163a8ea4
  - [v2,5/5] MAINTAINERS: add dwmac-rk glue driver to the main Rockchip entry
    https://git.kernel.org/netdev/net-next/c/384d84263295

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



