Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 462F0F531D9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 22:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lm4eFkGsxox/hWKj+LKUT8FuBi0uODXGm0Dg0b+ZT7c=; b=qsMjAMFZG5f/Nb/rdlsifZNJEr
	idjAxNOt9lXNdE+uA0EeoXkwpRC3g1CyIQV0n40NWNhTGjObrrUHDHAPmaAEGo3frCv11rIsNqVIy
	9+l+i92IVd4RljNXbUY226qbuH3fMyshLU0EV9eYOgBOk4HNM5nKk64Qqjmf9r8YnAscgTAhHGWxk
	2Plq8UyJfu9ZojmfUbF1NNM6X6fo4iiruGGJDGqWxBXtqn42Vbj9pSi3rliSaXciPI20jYOpJZzzG
	0zJfIFCFyboD4NyffpNFvbbOhuYD+Rkw1gajDX8vyhHWQZ4AA0qdbR/Q5vciJX7X8SOxB8ylXFzCl
	zmiqOqzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCPKj-0000000GQ6G-3eaV;
	Mon, 13 Apr 2026 22:00:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCPKh-0000000GQ6A-3Hw6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 22:00:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C5D6161339;
	Mon, 13 Apr 2026 22:00:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B06FC2BCAF;
	Mon, 13 Apr 2026 22:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776117638;
	bh=tLt4MrLSUuyC46ZPh6Lc6VBJjwvbru1bIpP/5h9L/yw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=S0RBCEYIx9NUrdM0xJSW1Km/E8zIxavKc3c/ikbebwI4VTs/qucZll2NqvUKaTdBA
	 k21kXxJn3TxqrIE0nU0xmGYO5VBw+iJm1UWI+kuFVxFc5hCo5Iq8EiphFp14sHRiR9
	 ssWUZsl3Wf/Ga3d+X9Ji43SjWYk51Z3QKihrretQ1UYd0J4alaLtKlhAlduKa8lDSb
	 SvKHGewED7UG/NmGK2tvvHxIUkE/5+anFiSGSLHgRl/+X5RBGYaAKz26mJcO3dHLp4
	 J3dBglkgiQBRSHKiGqmcYKI1FQYrpIS58ylqLYW/eTTcpdKSHkqcXetp8qOf1bQdWw
	 3VdfuMw9QhrOQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02D0C3809A0C;
	Mon, 13 Apr 2026 22:00:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: stmmac: enable RPS and RBU interrupts
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177611760954.563263.9933342148326899367.git-patchwork-notify@kernel.org>
Date: Mon, 13 Apr 2026 22:00:09 +0000
References: <E1wBBaR-0000000GZHR-1dbM@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1wBBaR-0000000GZHR-1dbM@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, alexandre.torgue@foss.st.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
 pabeni@redhat.com, cfsworks@gmail.com
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

On Fri, 10 Apr 2026 14:07:51 +0100 you wrote:
> Enable receive process stopped and receive buffer unavailable
> interrupts, so that the statistic counters can be updated.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
> Since we are seeing receive buffer exhaustion on several platforms,
> let's enable the interrupts so the statistics we publish via ethtool -S
> actually work to aid diagnosis. I've been in two minds about whether
> to send this patch, but given the problems with stmmac at the moment,
> I think it should be merged.
> 
> [...]

Here is the summary with links:
  - [net-next] net: stmmac: enable RPS and RBU interrupts
    https://git.kernel.org/netdev/net-next/c/1b9707e6f1a9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



