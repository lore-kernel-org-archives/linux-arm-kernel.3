Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 735EDFD460A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 03:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D77DTLjPYcyJYp6h3x02eRExgyVGPoDOVvacuyqwprw=; b=HH3iNEmLYgWBFvzN8xiQ3XcuJl
	1oQA7jjbzJyUhEoTnXhhGJvienKh1aAGRKiA7un5vBXnSRu7OzQzRq7Q5XtvUQz2HLPqzgYM+NEq/
	rKS4vLDux6beKVdqp9UinSuQbyg/20XLnBHqbBe1j4qEZK1ld36wjtJrtLgGcjT14OBp4gx5jGjXE
	lkQoNKwjD2DX8s8/hr1+ni55BsPMnRLytAQuLTxkCH1mPCXmmaxJ0xHiyDLVxCMpS31JKGY5x3N1D
	APGn8wIJEQcIjyEwAzwDGt9IG9a+7Uk2s9B5o+ODdj1FAqgi1DLM+tQzeV5io7pKDdUi39NihF/tL
	bMAjMpeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvRbl-00000005HLD-1gJi;
	Thu, 26 Feb 2026 03:00:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvRbj-00000005HKn-362Y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 03:00:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CBF9E600AE;
	Thu, 26 Feb 2026 03:00:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8006BC116D0;
	Thu, 26 Feb 2026 03:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772074806;
	bh=A2zbObXNUzm7+kP5snmUgIb06U/s9qdVnTXzJHN9oGQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=bBo2r6AtfkuAFpKg11m8RHsT4BlSdkHxWFYvkoSm2tUkh3Yqk0VNkdwteXzjUA1B0
	 BROIs/L196g8MUTCzD/O7ICp3db+N7wUN7rFJ8VNMBiiEYXWbLE6B96gNaB2Re0sJn
	 s2B31cT+UeRjlZqK4yec3qbYLXkh+WwlClY6VJh1uptg1Gge3tEGyJltMcGkIz2spk
	 QxwrZHlLJ/Z/YQWVQIM8XXWqsyS3lWBFfDdKvThCKNR69gIV0FwSo7pmsdKA96eJCR
	 Su5MNQai9kzZHzlf/BGRlGIQzSy4Vy9i+CvjVNoQcTN4XUdbkcW7cXtQCM87z71exR
	 s5cXyaAol9Evw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7CF7C380A94B;
	Thu, 26 Feb 2026 03:00:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: stmmac: fix EEE supportable interfaces
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177207481128.1011529.4880662803643128473.git-patchwork-notify@kernel.org>
Date: Thu, 26 Feb 2026 03:00:11 +0000
References: <E1vuUsD-0000000Afci-0XxO@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1vuUsD-0000000Afci-0XxO@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, alexandre.torgue@foss.st.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
 pabeni@redhat.com
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

On Mon, 23 Feb 2026 12:17:13 +0000 you wrote:
> According to the dwmac v3.74a databook, only MII, GMII and RGMII dwmac
> interface modes are supported for EEE. Restrict EEE to these modes, or
> the modules supported by a PCS other than the GMAC's integrated PCS.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  .../net/ethernet/stmicro/stmmac/stmmac_main.c  | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)

Here is the summary with links:
  - [net-next] net: stmmac: fix EEE supportable interfaces
    https://git.kernel.org/netdev/net-next/c/8215d7cbfbcf

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



