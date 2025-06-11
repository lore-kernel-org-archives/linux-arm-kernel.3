Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B39EC677C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 01:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QDEOQmnvnplS2coaoF2aGBFke/jZ+NsrVq8betPNt2M=; b=gKsy9hj5naGb5W+ujdwYgYtoXc
	fITV03CPXNV+1MLnHsgWqJV8yN4gAob2Xc/47IiA6MsuNuwNOwKatKVsshOMjYAPkFMZtgFBofpHm
	WCoEhdHNW0NvHeSOeE7BU1xu8T2dkAC8ddzOs+cEcQzRD9RZm7QWRLWVaGlrx0N+ExhqHjPdofNRw
	mc9WxNCYQUBkTTGE1mqlsfzO2obVC3zxnCxVVzsIuSAiokxsJGluzE3knHUX2NmhVi+lDNQoDPYwn
	AfvR0VCG86t49sQF9WvY34uvWgx4jfjfRBmhXY+ZVTd9wgQcymcvNFGRnfzYhNPbZ7VDjPyIkm5x9
	LqsplANw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP9r7-00000008WGM-1cQJ;
	Wed, 11 Jun 2025 01:02:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP9ox-00000008W6m-3lB4;
	Wed, 11 Jun 2025 01:00:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7ECED5C4D29;
	Wed, 11 Jun 2025 00:57:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB8DBC4CEED;
	Wed, 11 Jun 2025 01:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749603601;
	bh=cDlgL9TIpTlOy9qfViDqqnNylmEqXONsBlqRKuuJ9Mg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=KI2wiENi0OoTu8cyoIEtIpz5gUvXQ92Id8s+MbreiV4S+yc9084DLWGoL9R0LvsZZ
	 VjR2rlLDR66AN70GIa12bO1S4/HIm8ls70zfdK64hDvTMxEfH17wzsy+pYTEUt4R+o
	 +4QdjB29x4EggOerNzzgWYjH4INFm3f7c13Biy931vJrOd7e1L4yF7RnVCpHJJdOXX
	 EY33BfGMsqRbeKnUgLpKgxxkgZUfsl3lpT7Ih3Fdk7mzO2CEd3gCOR1/3PX5qHVsXK
	 2CgFP3s2b9sAk0c6aa2C4MNoH41bMzSSu2poCijR9sQv7r/dRWOAxzvJfq0JwO4QVw
	 wgjfk+NoiXsIw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33C5438111E3;
	Wed, 11 Jun 2025 01:00:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: airoha: Add PPPoE offload support
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174960363200.2754897.16334165620003903309.git-patchwork-notify@kernel.org>
Date: Wed, 11 Jun 2025 01:00:32 +0000
References: <20250609-b4-airoha-flowtable-pppoe-v1-1-1520fa7711b4@kernel.org>
In-Reply-To: <20250609-b4-airoha-flowtable-pppoe-v1-1-1520fa7711b4@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_180003_978226_6913722E 
X-CRM114-Status: UNSURE (   9.04  )
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

On Mon, 09 Jun 2025 22:28:40 +0200 you wrote:
> Introduce flowtable hw acceleration for PPPoE traffic.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  drivers/net/ethernet/airoha/airoha_ppe.c | 31 +++++++++++++++++++++++--------
>  1 file changed, 23 insertions(+), 8 deletions(-)
> 
> [...]

Here is the summary with links:
  - [net-next] net: airoha: Add PPPoE offload support
    https://git.kernel.org/netdev/net-next/c/0097c4195b1d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



