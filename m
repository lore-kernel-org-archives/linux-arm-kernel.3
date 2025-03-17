Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3889C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 20:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AIeXSSc3SQIeaHNXRyVHwjqWsDRR6UFZdgqsSA+aCPA=; b=HKxZaAYpybKOmbdBYq3yThAdBH
	zMEDwmpSHgUMW8dCK2T0uniB7mGyk0mYUqSM2bbkKyIFcI3eWXtsDmiy08S9Y9d+XcPxamJpb3RGz
	iauWmZdzVV8u0LOAn30exgLBdod0QHDIc4pVivORNeP+c8LK4s7+fQ0oVHLHhsnEf9JNz6+xwHOmW
	aZsyAg4ytiTSofGjHk9dKb8QhVGCseLTClof2hgnQILd0hnFn3+SrHQQneXExbUM4GQvSUZtsHTRL
	ARN6ZBzG/xS3UYVSYRC1RFRluRZ1gRu/DQViNVlVFrBCp7viYFyjLV1bIjxlW/ilTcmTBp3KkYFXi
	xfYIdF1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuGyG-00000003tzv-0eA7;
	Mon, 17 Mar 2025 20:22:00 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuGwY-00000003tnT-46QH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 20:20:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2DA22A48D3A;
	Mon, 17 Mar 2025 20:14:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66A5BC4CEE3;
	Mon, 17 Mar 2025 20:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742242813;
	bh=PGe2zkk9t3wpiVapprqxZNUBlwXJz6fSOXIRXWg3MrM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=c00kyITzeyheVyBmzCx8pY6PlwOek/naieESbTbm4FbJlZFWWiKhfeewS2jh2a+Cb
	 7umPiM/7p5nPceIxqBHWZ6Dj5qyA0aa+zZ4eaE5nqOVq1GNcdMIfrr9v8c7/B1DOQA
	 LT2vMbaF5MPsmToJQn6Eh/XyO1GINQMZnwVhXKJuSznQ/Ynsf7EULHwA0w/zzQI7JZ
	 /3DyllNlwwxI4J2qiOeHJkqRWqERyqNYEK+6iprqubwQM5ptz+0nQ7OaTuIrlp72wx
	 3BPTFaLKb0+OwSBRX7b+oliJb8nVAZhX7yHPmIny3GKw6PBelk5rmc/sk45zqG9rSH
	 +B/M3DEIqZCKw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAEE0380DBE3;
	Mon, 17 Mar 2025 20:20:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v1 1/1] stmmac: intel: Fix warning message for return
 value in intel_tsn_lane_is_available()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174224284849.3901460.9366636522852386074.git-patchwork-notify@kernel.org>
Date: Mon, 17 Mar 2025 20:20:48 +0000
References: <20250310050835.808870-1-yong.liang.choong@linux.intel.com>
In-Reply-To: <20250310050835.808870-1-yong.liang.choong@linux.intel.com>
To: Choong Yong Liang <yong.liang.choong@linux.intel.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, dan.carpenter@linaro.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_132015_086447_F8A55E3B 
X-CRM114-Status: UNSURE (   9.80  )
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
by Paolo Abeni <pabeni@redhat.com>:

On Mon, 10 Mar 2025 13:08:35 +0800 you wrote:
> Fix the warning "warn: missing error code? 'ret'" in the
> intel_tsn_lane_is_available() function.
> 
> The function now returns 0 to indicate that a TSN lane was found and
> returns -EINVAL when it is not found.
> 
> Fixes: a42f6b3f1cc1 ("net: stmmac: configure SerDes according to the interface mode")
> Signed-off-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>
> 
> [...]

Here is the summary with links:
  - [net-next,v1,1/1] stmmac: intel: Fix warning message for return value in intel_tsn_lane_is_available()
    https://git.kernel.org/netdev/net-next/c/38f13bf80130

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



