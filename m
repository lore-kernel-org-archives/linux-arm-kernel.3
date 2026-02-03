Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2215CE83048
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 03:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iMZG7af7eFy4j0l8uaEkKW4DOxCDXhfEE1F812Xo8Ss=; b=R6NMU5zHExIhnT620U24ExErXe
	skpURAg+kGHEkp7u2Sump4OTMboohQA35OO+juJhf6rjbK8j3Yd82Mo/kyyWT4rKkrBbUiABwUxUb
	OieEtCgyUbOj3ILuAP2BYrK6m3axjxXkTlRj0BcYnpqicBxSp9BPlITafNhuSXYhRmVIA3tETlOmC
	sX6e0wDZZGhoh68qCF70hpH72T2HLFkxNUeCkZIps068FM+ckJW9OnAuAm59vWigxJb2UtaOkFpEd
	qYejBxf2RRxHhyOACn6e2jWKQQsz6TnDuUedWYhe8oEYjHTuHchzzWoOVb3odWHVHskGdq+41kfIM
	WITaqR/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn6xi-00000005zV8-04SS;
	Tue, 03 Feb 2026 03:20:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn6xe-00000005zTd-2nlT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 03:20:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 89616444A8;
	Tue,  3 Feb 2026 03:20:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61F46C116D0;
	Tue,  3 Feb 2026 03:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770088817;
	bh=p+FiLRV+y9yrAkTwRKO1Fs+7DQQpdn3ZhTr9uVCv5u0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=WFr/7be7IU0hP9/394w9OwSBa7mSWQuGh/yeC0BaaQYaNsYilI+9C+oHWuoIYAIB0
	 /I2eAkeBKSArSS37VUo3nNgSYl1jdV0PtcGFsxxN6H2e41W8DzNeLSUixoGeQJYvds
	 EXDgBqVqpcWeybo7BszMNVngQr4EwhDTpqCTlWncvWWykU/tAGEkx2x/7gOFnSv41b
	 T6K4ogCY7Retz8xrCt9jlhMuHhyLiKhGWpbuIMt1iUoCpKB48ywvuqzsF7RWq/G3q8
	 rJtCyLwXMuEIE5LPdFjXhRwOrSXmdSoiI9qIxFvTFdjUmSeUaA3IRs8F4kf4NL3PNw
	 YWjL3ZWlVxJKQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 541EE3808200;
	Tue,  3 Feb 2026 03:20:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v3 0/2] Add support for Renesas RZ/G3L GBETH
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177008881412.1295553.10983924810242410033.git-patchwork-notify@kernel.org>
Date: Tue, 03 Feb 2026 03:20:14 +0000
References: <20260131161250.5047-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260131161250.5047-1-biju.das.jz@bp.renesas.com>
To: Biju <biju.das.au@gmail.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, richardcochran@gmail.com, geert+renesas@glider.be,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, magnus.damm@gmail.com,
 biju.das.jz@bp.renesas.com, peppe.cavallaro@st.com, joabreu@synopsys.com,
 netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_192019_965767_E28247A1 
X-CRM114-Status: GOOD (  10.39  )
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

On Sat, 31 Jan 2026 16:12:41 +0000 you wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> The Renesas RZ/G3L GBETH IP uses Synopsys DesignWare MAC version 5.30
> compared to other Renesas SoC such as RZ/V2H that use MAC version 5.20.
> 
> The RZ/G3L GBETH requires an extra clock compared to RZ/G3E and has pps
> interrupts. Document the Renesas RZ/G3L GBETH IP in bindings and add
> support for the RZ/G3L GBETH in dwmac-renesas-gbeth glue driver.
> 
> [...]

Here is the summary with links:
  - [net-next,v3,1/2] dt-bindings: net: renesas,rzv2h-gbeth: Document Renesas RZ/G3L SoC
    https://git.kernel.org/netdev/net-next/c/3ac2aa31b489
  - [net-next,v3,2/2] net: stmmac: dwmac-renesas-gbeth: Add support for RZ/G3L SoC
    https://git.kernel.org/netdev/net-next/c/1ba377008420

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



