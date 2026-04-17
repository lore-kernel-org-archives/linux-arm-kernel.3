Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F6BCF8E499
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 02:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MJa8pdLEdVqabC8vwNoSVmX2YrTRj9w7t3c5Vn/uyLY=; b=Nul1v1d9MY8c4ofKIe5rwZ4KRg
	yLNUU9liIX5VEKWmmK/XXhgr+5yAJOKOcY4yx9EJrWLDmS8onFavejklvNIF7POrCoGsQ7KmN8pXe
	jFHaUUaiwm4X8IgCIyGMfdBZVMVtgDc2Ydl6SRmk/itsLf130ZYxCRT8v+aTncN6jeXU860y9oN2E
	VlRY4O/jLU+Swb9gZsMJXkt7+dZTYg9wye2n37Csl+RmCI5cSy/jpza15tz84BiYSdOuOcpErotRE
	dTwGuUjrmtnmIZrZuPGhnYCpuEBtDZqDMpA39DlFG/IIk+S42QxPIXrz+VlI0wBS8hooiwGq4HrSJ
	oeJZ4+eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDYfN-00000003JWi-3ibz;
	Fri, 17 Apr 2026 02:10:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDYfM-00000003JWX-0NLz;
	Fri, 17 Apr 2026 02:10:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 20B2060181;
	Fri, 17 Apr 2026 02:10:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E78A7C2BCB3;
	Fri, 17 Apr 2026 02:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776391842;
	bh=/bgy00+4dQ+qdVqSAhqIMgVG2c+nPIoBLaK7Cx2GAZM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=qE1Vv+EVo5h4eXbn8veFGVomCLLA1gDOOcpiaeHoxK0sNI2x8YDPlhvRIYUehdM/u
	 RDgpzqs9eZn8UMSkCXZAU1DxAHDDPyVqugxfRJIgdj/vGS8UQDMoL74HiJPSKPUoLy
	 7ecnGFwge0/zDdR2uom1oa1rNm3NiJCoDuiE54RS80VNUXTh8Wye7RlR6bR6jURZhP
	 jbMektIYQxKzfRBvuRga3lLIqvaxtIh8ZQV2312YwOyTbIA/KIb2+OakRvY46fJ2fQ
	 RsI8kkMLXlFK9TfV0wPwGx+ner4mpGwFkBgTLARbgKzSAO8fR7nCQRF2TwkM2GtA3k
	 Onhr/3VQnHA1w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FD38380AA76;
	Fri, 17 Apr 2026 02:10:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2] net: airoha: Wait for NPU PPE configuration to
 complete in airoha_ppe_offload_setup()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177639181104.3482475.13335009889872843570.git-patchwork-notify@kernel.org>
Date: Fri, 17 Apr 2026 02:10:11 +0000
References: <20260414-airoha-wait-for-npu-config-offload-setup-v2-1-5a9bf6d43aee@kernel.org>
In-Reply-To: <20260414-airoha-wait-for-npu-config-offload-setup-v2-1-5a9bf6d43aee@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
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

On Tue, 14 Apr 2026 16:08:52 +0200 you wrote:
> In order to properly enable flowtable hw offloading, poll
> REG_PPE_FLOW_CFG register in airoha_ppe_offload_setup routine and
> wait for NPU PPE configuration triggered by ppe_init callback to complete
> before running airoha_ppe_hw_init().
> 
> Fixes: 00a7678310fe3 ("net: airoha: Introduce flowtable offload support")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> 
> [...]

Here is the summary with links:
  - [net,v2] net: airoha: Wait for NPU PPE configuration to complete in airoha_ppe_offload_setup()
    https://git.kernel.org/netdev/net/c/f3206328bb52

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



