Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0550AFC97E6
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 18:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aUEpCG5sCYpbYpwrXU7A/1WPG8TU8b3xSeUByhDZ0G4=; b=RVZwsdysm3C/T3RkqCZ8kLiJ5X
	UYeH24nX9UdF/90gFHmsIWsWzD4Ej6sQa1H+ZaFWhc6zzqK2DH0t12uuaT4rqLEHhE80YiAF/LCZi
	W3qAbYVlY5iqudAr+ZrLlKxnTWdJ3S7z/FJnDwLURUhHX4FG76pFnJ4prJ1DkUYi+41kpA/2PE4Hk
	72CssWv+7bCdnrOLi9Rqedty2wOXU82/9iFwS0SSj8IxN05A28Ul/2MY/Rup7X/b+L7lej9Y8/kd8
	I17HzOi6eOotzPgAwD+ctgv5W7j05mn5oSwgWhr2cpN/HP6bkM4x2o8Z3gzT6Mp8BptmrcYGZCEim
	woVuwV/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6vDf-0000000AFey-03Zm;
	Sun, 29 Mar 2026 18:50:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6vDc-0000000AFec-2AKp;
	Sun, 29 Mar 2026 18:50:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3A2C941B20;
	Sun, 29 Mar 2026 18:50:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DD7AC2BCB1;
	Sun, 29 Mar 2026 18:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774810239;
	bh=O82FpE/7ZgUmCxQeK0am6BAdKnT2A6ZdwoNVv3WFz5w=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=FaRTxRSG1VuymtP02WGPHzUkmXvzxs2ZnPhrpHxCDzor/J0ZcNxBiOQTGAmm6Dbdj
	 IojhvHCiJMHRNo0yWJtMkS7fhNE/bo5AbTpRhjvq24fIElUnik4SHYeO9MpG7nOuZP
	 tNvWXfSol5idU2kOwo3qymDS3DVHkl5rl0GvhU1vT2XOk47maa9uhTTFbP/laHLfgh
	 Au9F3RDZVp4xzUjopO2WRirIEsUFzUgj1vFcul8FzE/bQ+wLbojC+SWhIkArHhcysz
	 /Bi7Ei6gj7lB+kIlZWdXAQRv8TD6+BUY+QxBRek0mF68LYoY2PeQqMEV2wZO0bgMVD
	 5V76/1hQhNHPw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02DD13930012;
	Sun, 29 Mar 2026 18:50:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: stmmac: dwmac-rk: Fix typo in comment
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177481022378.437043.15447396546007070348.git-patchwork-notify@kernel.org>
Date: Sun, 29 Mar 2026 18:50:23 +0000
References: <tencent_833D2AD6577F21CF38ED1C3FE8814EB4B308@qq.com>
In-Reply-To: <tencent_833D2AD6577F21CF38ED1C3FE8814EB4B308@qq.com>
To: =?utf-8?b?6LCi6Ie06YKmIChYSUUgWmhpYmFuZykgPFlla2luZ0ByZWQ1NC5jb20+?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: linux-rockchip@lists.infradead.org, Yeking@Red54.com, heiko@sntech.de,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, rmk+kernel@armlinux.org.uk,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_115040_576372_BF64290F 
X-CRM114-Status: UNSURE (   9.02  )
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

On Sat, 28 Mar 2026 13:43:31 +0000 you wrote:
> Correct the typo "rk3520" to "rk3528" in comment.
> 
> Signed-off-by: 谢致邦 (XIE Zhibang) <Yeking@Red54.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - net: stmmac: dwmac-rk: Fix typo in comment
    https://git.kernel.org/netdev/net-next/c/30fcf28d83ee

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



