Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA976081CC2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 16:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IqIW1OlS;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N4LNZN6P
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=f8l2LmN6DtBiLYVSfIRSx6ttVI0HwmkTK4KfTo8Elvw=; b=IqIW1OlS4han+P
	yuDaUzd7sGk8r2uySHQZYerCL7Al3ErWdYB4Ux1AJDjVfv+mHRmS8qwguYLnXcRsEnsgdMdo3HelM
	DLD7v5Ax6681l+I4ZPS09e27X7KujwT7CwMveBdE32ZHudg5P+NBn/LLUNd+s87nDLT/RImC+GX69
	5mZzVNzqZ/tgFeZRPMq8+0We3fNElTMTpvnUZaHQuWxYvAC2g0OavRPHkfoxf+CdVQf0akXAqDoqm
	/N1q+XpruDQ71Yen/6+HrEdbbaPtAZuC/d4VSl2u/9OYv136ixfbLunY4E4f8SBmhwkCsESxSXiXX
	hXX5dR7c5RPTlLGDzxuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNubr-0000000HFZj-24wt;
	Mon, 02 Nov 2026 16:10:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNubp-0000000HFZ4-3tqm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 16:10:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 66A7A43C87;
	Mon,  2 Nov 2026 16:10:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49C651F00A1C;
	Mon,  2 Nov 2026 16:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793635809;
	bh=f8l2LmN6DtBiLYVSfIRSx6ttVI0HwmkTK4KfTo8Elvw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=N4LNZN6Pwse3wB2tvlu7AWD0gJ+cmP28PNDFWeb4CB7xfg3WQBE8jtgMqqXezFl3v
	 p3CV4mjP07kQ8ZuikENyfZnCStztkeHDK54Fl7hdLTfW3SJ+01pBQklBv3yvhZuHog
	 Mkt1GfyqI55PPtl6Kq29ewT74mFeMBwykakXAk70tQ2LY4tct/IJkrVBogRx1Oavse
	 5ctZMFwdTjlPi7JsnVsPgXd87ZKDF+cqnFYmyw3+ZTe/d+egopTX1NmXI0s2IePyHN
	 FVkPouZXiFOylFwfLjLWNgk30QTRhhx8cZ9YBZmSxMGxaNMbTcUy4oxS9ErbWEAJqB
	 c2TFbj7M+rEVA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 40283380821F;
	Mon,  2 Nov 2026 16:10:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v5 0/3] net: stmmac: re-apply taprio offload in
 __stmmac_open() and stmmac_resume()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179363580779.29416.13751914901506623948.git-patchwork-notify@kernel.org>
Date: Mon, 02 Nov 2026 16:10:07 +0000
References: <20261029-stmmac-est-fixes-v5-0-85b830a795a9@oss.qualcomm.com>
In-Reply-To: <20261029-stmmac-est-fixes-v5-0-85b830a795a9@oss.qualcomm.com>
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 richardcochran@gmail.com, linux@armlinux.org.uk, Jose.Abreu@synopsys.com,
 james.hilliard1@gmail.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, rayagond@vayavyalabs.com
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello:

This series was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Thu, 29 Oct 2026 11:33:54 +0100 you wrote:
> Reconfigure MTL_EST registers after sw reset in __stmmac_open().
> Remove priv->est->enable dependency in est_configure().
> Initialize est_lock at probe time.
> 
> Changes in v5:
> - Reconfigure preemption_class in stmmac_setup_est().
> - Bail out in stmmac_setup_est() if ptp is not enabled.
> - Link to v4: https://lore.kernel.org/r/20261026-stmmac-est-fixes-v4-0-999dac4de44f@oss.qualcomm.com
> 
> [...]

Here is the summary with links:
  - [net,v5,1/3] net: stmmac: initialize est_lock at probe time
    https://git.kernel.org/netdev/net/c/98caed39c1db
  - [net,v5,2/3] net: stmmac: pass the desired EST enable state to est_configure()
    https://git.kernel.org/netdev/net/c/e4f5b46dfb8a
  - [net,v5,3/3] net: stmmac: re-apply taprio offload in __stmmac_open() and stmmac_resume()
    https://git.kernel.org/netdev/net/c/23d96de472f7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



