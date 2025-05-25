Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24B2BC54E90
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 May 2025 16:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=//mQyHOvgd60hlwlBfkJlLilq+NxvUUM2TdM0Q7NaI0=; b=fLPKBxrB1qnbZAYjy4D2N8718B
	Mn4SPleG7XyNMdBcSsZGnblE/loQhgkSwrqpsAk/38o9ffAShOcMwjwaMwnEwQfPCjcHr4QJgWuAh
	1ARqk4cSA2US+nsZGIDa32BYaUrT7W2+Uz+iCqybuY1ueawhH1hLjiBi8L2ZlYBVQk/JAoQCqhxeq
	HO3bU6/KEPDv2rs6n/qDUmJ9huRfR5nFBe/1X3peZLaa5tA4IefS4nZ+iUBx+TATYlpkampFJ2rd8
	3g8z7S9hsmmxXAh+WQsRpsj9s4mneByZVEYCLjKYRJh3obeOGJKiWeoAyWuIpo+hqOSSCtL9sltIk
	PHUAzbeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJEGa-00000007LVj-1ZOZ;
	Sun, 25 May 2025 16:32:04 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJEEV-00000007LNq-28rU;
	Sun, 25 May 2025 16:29:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4BD985C0E0E;
	Sun, 25 May 2025 16:27:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 031A8C4CEEA;
	Sun, 25 May 2025 16:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748190593;
	bh=buKQ91DVa6mfMekbfV41GafTrSLBNM6MUcueVdughRI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=p7T/G7zwCDsndiskqcvoaytbaSmt2B+NWbUXhf85yhNnpPLSt9Xqb2WG+z9ELvVSU
	 nKp2nA1Hd209lMJIdorz3BStIlT1XoFgE/XtN9Acajx9k+tCBZbVlz7yU9KyRlMRby
	 D6tshsfLuALmOtJBA0dWI9IG2skNwwm5HESqOOibG1vESbzxnr6tNovHJLXQh2/vwc
	 zdDXxW8ZFSaH2BZFFkLK0qhBpC/JYfh3bMgL6jn1E/rHyLS1fqgrgnudOa8nkpt4hN
	 T+46AKJXHOr7hTI4lYtNG3R0bypyfHX3mELgXtZUchIp3R49udt31xffRXe1++Gj5n
	 9IYg5q8BQoBtw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAF83380AAFA;
	Sun, 25 May 2025 16:30:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: ethernet: mtk_eth_soc: Correct spelling
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174819062775.4171016.10242834560334242547.git-patchwork-notify@kernel.org>
Date: Sun, 25 May 2025 16:30:27 +0000
References: <20250520-mtk-spell-v1-1-2b0d5b4a4528@kernel.org>
In-Reply-To: <20250520-mtk-spell-v1-1-2b0d5b4a4528@kernel.org>
To: Simon Horman <horms@kernel.org>
Cc: nbd@nbd.name, sean.wang@mediatek.com, lorenzo@kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250525_092955_588201_FA9096A7 
X-CRM114-Status: UNSURE (   9.16  )
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
by David S. Miller <davem@davemloft.net>:

On Tue, 20 May 2025 15:33:33 +0100 you wrote:
> Correct spelling of platforms, various, and initial.
> As flagged by codespell.
> 
> Signed-off-by: Simon Horman <horms@kernel.org>
> ---
>  drivers/net/ethernet/mediatek/mtk_eth_soc.h | 4 ++--
>  drivers/net/ethernet/mediatek/mtk_wed.c     | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

Here is the summary with links:
  - [net-next] net: ethernet: mtk_eth_soc: Correct spelling
    https://git.kernel.org/netdev/net-next/c/d09a8a4ab578

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



