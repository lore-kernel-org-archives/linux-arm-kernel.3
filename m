Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42A2ECF6BE4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 01:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R1lMg1Iu693E0qXqx4BVGUMi6q64LXfZXFzgn7j73J4=; b=JjVlJMzP9zBSPCyg/zo63YyPFC
	iJ+tsXdIPAAcZiTtgVCOWyC+GwjRRuqnvJw+aXbfwGnrjTemfP/R2EqGA2dZGyqb+/RdwUXDZVD1H
	iFKpr+cNiboNMFN6TVeT3+bQMOHs7O8a9bL8+WcG5gIDB4cwFd5ZGOm+GsDpEOHDLK8esEoy6VV9a
	ileeJEIRmWQVRgY///gNyN3ifEG9CfbHeEPfV4mgKYMiMOZ+Cd9s9z9UpwF4E88I8oLbWVvO19A/w
	UyYamUPP1C2rW+TiTRUBjeIy5KKO7I6dyK7qFQnl5+gAyZmAdkUgGLVtEoCYi4riQCdCMQv0zpOoi
	wRx7cBkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdIGy-0000000E0WI-1yYJ;
	Wed, 07 Jan 2026 01:23:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdIGw-0000000E0Vt-29hq;
	Wed, 07 Jan 2026 01:23:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3962C41983;
	Wed,  7 Jan 2026 01:23:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16701C116C6;
	Wed,  7 Jan 2026 01:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767749017;
	bh=5cFJO5s3wQK+4Ifp8ZJthLIPbVJ6jfkCvYSf0lyofR4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=m2sIklyEBO/CYs87pAiZmQ0zUYGPZraIpqStPxRNwuP0iqIouTC1ySo5YrGMhJBwM
	 sKoxSIjDrplOvYKegAUM6rD1Q+kGMb9Dc/b6+qi/TnSSJLOBQB19RtFVTOLiXQknGM
	 BnPNgh2BRkqKoq3wzFlJS0QQi13oA7LLt3WJRP5rZL2Ws4b466LEmpfxsRZSLF0RM7
	 s/yRLd985tmyAXW2s2hsp8kVC2/L9liGveDwtEy3+JgvLTUhs/cDWpOmJle/3RK48+
	 Puqp/4173YlxUf6JynVZ9/Caj0l0mEURC2b+FIxoNQFSk1EXIxdYwkJB1+yBp5sTvu
	 /kRc4Yv2cNbhQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B5A58380CEF5;
	Wed,  7 Jan 2026 01:20:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: airoha: Use gdm port enum value whenever
 possible
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176774881426.2188953.14906966324669227872.git-patchwork-notify@kernel.org>
Date: Wed, 07 Jan 2026 01:20:14 +0000
References: <20260105-airoha-use-port-idx-enum-v1-1-503ca5763858@kernel.org>
In-Reply-To: <20260105-airoha-use-port-idx-enum-v1-1-503ca5763858@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_172338_577951_B2F9207E 
X-CRM114-Status: UNSURE (   8.72  )
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

On Mon, 05 Jan 2026 10:40:47 +0100 you wrote:
> Use AIROHA_GDMx_IDX enum value whenever possible.
> This patch is just cosmetic changes and does not introduce any logic one.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  drivers/net/ethernet/airoha/airoha_eth.c | 40 +++++++++++++++++---------------
>  1 file changed, 21 insertions(+), 19 deletions(-)
> 
> [...]

Here is the summary with links:
  - [net-next] net: airoha: Use gdm port enum value whenever possible
    https://git.kernel.org/netdev/net-next/c/4d513329b87c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



