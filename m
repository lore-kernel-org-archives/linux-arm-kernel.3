Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F41EBC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 02:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k2o88t0K/PFxDsiQXLBfracmzzJ5NJDtZEOcbvIR5SY=; b=ZvQcSppDtkSzg0n8N0PrJBqyuL
	Dy31tatGXxi38IsOlAa/c0D7gjJWJ/Djd9u00n+NoCTJE72swu/RwX5keH2rPm+LN0mY3hLYFIEbE
	vcn+qTMBnUGHbbdNj17ffP2GUgmrW7hHAexhsfCRGmdsN4YcCl30SNILn1uj8OsEDtmgBb8/6qasE
	+tNlEQU2XFCsCVeMbTXNf+QhSJDe9pAU1v6yZsH7Z3W25dyO+XlfhRvAPMSQglZb4S4BDqbt7g4Vv
	RKpbb9ZtkLXXZjFlium0EIJ+pneCQKs4T6KNHFWr9GSHyJTKfnuxS4HqSHj4UsrJrB9XzcOViM2nb
	DUF6wQaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZKJZ-000000079wp-1F7F;
	Wed, 09 Jul 2025 02:13:41 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZKFm-000000079dm-2rhB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 02:09:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0856E5C6445;
	Wed,  9 Jul 2025 02:09:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A41B7C4CEED;
	Wed,  9 Jul 2025 02:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752026984;
	bh=Tge18Np48taeWjJACOO6TUJgmCjNPLeql+dotgV6YSo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=dm+yJ3At23CkipXs+0O1nAne2zg2jFc59qtDHBiNtXDjGIP6DETAAsgcFtZXRSqyD
	 1b0PiyePUBi9Sf2nCD1rcnU6gDOoUdeaFqkclFOkDQhfsDzITDS+los819gXHUMkiV
	 kvKz8Z60vQ7jM64QXUN361WZWha4m1NjeVHLEs2CbaghXbh+rgKDRSCMOybTcOzBy1
	 RkT/wYuChpdk538c6UeN+TZsHqsp3cJuoD1+02dXsXp3uV7a2LIdONOa2WILAWpkTl
	 5JTVCPL/X3W+1XQkGiTPoWy/ayLrJ49o1RFtvChK8FLEbg2t298+pZnCXDFXUkkeiQ
	 DecyY+/T+Fq+Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 9605E380DBEE;
	Wed,  9 Jul 2025 02:10:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] dt-bindings: net: altr,socfpga-stmmac.yaml: add minItems
 to
 iommus
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175202700747.194427.6933538958086222973.git-patchwork-notify@kernel.org>
Date: Wed, 09 Jul 2025 02:10:07 +0000
References: <20250707154409.15527-1-matthew.gerlach@altera.com>
In-Reply-To: <20250707154409.15527-1-matthew.gerlach@altera.com>
To: Matthew Gerlach <matthew.gerlach@altera.com>
Cc: dinguyen@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, maxime.chevallier@bootlin.com,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_190946_759181_4DB71FE1 
X-CRM114-Status: UNSURE (   9.89  )
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

On Mon,  7 Jul 2025 08:44:09 -0700 you wrote:
> Add missing 'minItems: 1' to iommus property of the Altera SOCFPGA SoC
> implementation of the Synopsys DWMAC.
> 
> Fixes: 6d359cf464f4 ("dt-bindings: net: Convert socfpga-dwmac bindings to yaml")
> Signed-off-by: Matthew Gerlach <matthew.gerlach@altera.com>
> ---
>  Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml | 1 +
>  1 file changed, 1 insertion(+)

Here is the summary with links:
  - dt-bindings: net: altr,socfpga-stmmac.yaml: add minItems to iommus
    https://git.kernel.org/netdev/net-next/c/8a00a173d1a4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



