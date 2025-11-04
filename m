Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A761CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 01:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q0YxjxkcmTS8Q/hGiGJ3KyjCTaBwUyibAm1j2nJWy8E=; b=GcoeCRpHhNLNflj9GN8tPUMax6
	3ekNipa2WHzfdP88oEdIsHfJfXDzT67uTigX3zAni2sJmZMRFo61Kmxy0fnZpOxOvPHC2884kAt/5
	fGE0rMGTRnXQ/Y2boPuVHQ71jvk14g8mxlDn7vjeChLkDAnMZFxFAWgQPHEInReYfdfQPLTRFaa57
	vUiFyvc403zwccmrTRH0f9/4LaSNSKoVJpg+pky9RCz/Ltcyu4qKnbvp1YCyVca02+h5ApytTONyX
	ZiYUO1yPD7r3WZny9crLRkfw8x0XM+G5UCLr5o/gfspWyfkDPQQy1XjDUI6BjsURBOVUAvhtZ4aPD
	vx9tjhhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG5sj-0000000Atre-30nU;
	Tue, 04 Nov 2025 01:30:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG5sh-0000000AtrE-0Fk8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 01:30:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BF942436E0;
	Tue,  4 Nov 2025 01:30:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1562C116D0;
	Tue,  4 Nov 2025 01:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762219841;
	bh=2hn7TExh5bvx/aSQHQygAQxTFzzeJn1z4S8zBCuEYyE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=P0m+rRTQdzvbstTPD3HFTlSgA0enZRpwijBg3E7RGaOfh3LSFoYBRbsz63kvJcYwG
	 zjmBAgvtrlVnIJ8kZuYyzPAJsIJ7eoIRDUY0QTNmjeV0t4lBvrQYZ+SA6oX3WJkALx
	 G6PQxjS0s+UvxSaZ7JdfhI4thWNGQYhz3mzz0az5gTeU2bYT1iIR0d67OlRW/R9L1O
	 J+FMcfp0qvxqpBOKKv1gi8c4+lmTRjzZ7FvB1IFypDR/7/GHrNV42i7Ey05kfG0O2u
	 DIqIDM1xZX9cefoP+1YyT7WuAVTzqEZktUDcKe6bzEasrwWzWPyX59kMAjMIkSYkho
	 JhzWKtGAd9Ucg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33BB13809A8A;
	Tue,  4 Nov 2025 01:30:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: stmmac: rename devlink parameter ts_coarse
 into
 phc_coarse_adj
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176221981575.2281445.16125578755361920845.git-patchwork-notify@kernel.org>
Date: Tue, 04 Nov 2025 01:30:15 +0000
References: <20251030182454.182406-1-maxime.chevallier@bootlin.com>
In-Reply-To: <20251030182454.182406-1-maxime.chevallier@bootlin.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: alexandre.torgue@foss.st.com, joabreu@synopsys.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, richardcochran@gmail.com, linux@armlinux.org.uk,
 kory.maincent@bootlin.com, vadim.fedorenko@linux.dev,
 alexis.lothore@bootlin.com, thomas.petazzoni@bootlin.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_173043_138749_ECA90F41 
X-CRM114-Status: GOOD (  11.14  )
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

On Thu, 30 Oct 2025 19:24:53 +0100 you wrote:
> The devlink param "ts_coarse" doesn't indicate that we get coarse
> timestamps, but rather that the PHC clock adjusments are coarse as the
> frequency won't be continuously adjusted. Adjust the devlink parameter
> name to reflect that.
> 
> The Coarse terminlogy comes from the dwmac register naming, update the
> documentation to better explain what the parameter is about.
> 
> [...]

Here is the summary with links:
  - [net-next] net: stmmac: rename devlink parameter ts_coarse into phc_coarse_adj
    https://git.kernel.org/netdev/net-next/c/209ff7af79bf

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



