Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E24D5F45A12
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 23:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iJoCQbUHtDGduh7rAAxtmwt6sJK0OHIMMIxYbg++lp0=; b=3EhMtwi0w+QXB0WYInHiTSwSAW
	oEB2Ng3IXn4WpSY+1wom1N7vcYMH0pwIE9k5SNkTosh+Rzg+bbX61OonNNUB2xxp4w2TD+P+r16B5
	TTNL4MUiLoo2sXWkPR9VNFP0hLch59YLxXj+IcrHGoRe/dyxyoZoBdRHJcqi6uIYAVzJ8A3Ho8YRQ
	2gt3oHzQiveqnpL6fyB3VYefeDIHuRowj2dFmR0maluAs7qJywPTSwPoZnJZG74hLE7kDnWeDqZl7
	nsX3al5Ok2O+M/Il7sLA9AVCTCFXKSmOrUGl7vpUcn1c4gMAX6oq96dKdWM61gHP9UXGCmpMlRWwN
	nqgxc1qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBKzi-0000000CuYX-3KTF;
	Fri, 10 Apr 2026 23:10:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBKzg-0000000CuY6-1vJU;
	Fri, 10 Apr 2026 23:10:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9B05D405AC;
	Fri, 10 Apr 2026 23:10:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75376C19421;
	Fri, 10 Apr 2026 23:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775862631;
	bh=d03e/dwvqQqza4+LkOtN4S9qpgWPwtbFnEF2jM8WwD4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=c4yH7//Ryte+HInfzodnE8TM+M7waoNYQV18sNZWou6kgUEXpzvAiRrcW8Q44bXWQ
	 8UNd1k4doTFMrbPUAq4VSFR4aMfEK8lWumOrzM+p3JKDyzNbcKUzY0ujgFhLaeOPuI
	 W3sYzccII5DOjY5jIHDOQHE1zTN6YMlIqpxN6JWdEDgY4G3aqsnBvbimojwcrcB+fN
	 YV7WmkxQkHzrE4Q4H5nKnzj54kjjG1Lz1CtW5IT8zK1sFJUNHJhoTK/kuKqFq6uNh5
	 wJ+LsMnsnc0xLtZS5Uh6+vZXjtd7jBxLjB/PVDVW8Bkg4mxwujDPc8+CqdbayGGaZx
	 i93RBW3EknWCw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02CF53809A88;
	Fri, 10 Apr 2026 23:10:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: airoha: Fix FE_PSE_BUF_SET configuration if PPE2
 is available
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177586260580.2678602.13239417012036836659.git-patchwork-notify@kernel.org>
Date: Fri, 10 Apr 2026 23:10:05 +0000
References: <20260408-airoha-reg_fe_pse_buf_set-v1-1-0c4fa8f4d1d9@kernel.org>
In-Reply-To: <20260408-airoha-reg_fe_pse_buf_set-v1-1-0c4fa8f4d1d9@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org, xuegang.lu@airoha.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_161032_518438_9ACE354C 
X-CRM114-Status: GOOD (  10.40  )
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

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 08 Apr 2026 12:20:09 +0200 you wrote:
> airoha_fe_set routine is used to set specified bits to 1 in the selected
> register. In the FE_PSE_BUF_SET case this can due to a overestimation of
> the required buffers for I/O queues since we can miss to set some bits
> of PSE_ALLRSV_MASK subfield to 0. Fix the issue relying on airoha_fe_rmw
> routine instead.
> 
> Fixes: 8e38e08f2c560 ("net: airoha: fix PSE memory configuration in airoha_fe_pse_ports_init()")
> Tested-by: Xuegang Lu <xuegang.lu@airoha.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> 
> [...]

Here is the summary with links:
  - [net] net: airoha: Fix FE_PSE_BUF_SET configuration if PPE2 is available
    https://git.kernel.org/netdev/net/c/02f729643959

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



