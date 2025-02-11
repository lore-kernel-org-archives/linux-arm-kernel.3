Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EAB2C02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 03:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DDZxOVqvWWdUib5MULn+XRpqWunVSgm3TMh6PmtfOMM=; b=FEL6EfhSt9GvDPW2TwzLDuzxUE
	1VXgSKSr3DhEqOaupkUxPPf/EqVXvRyO557jXsPNlSGR7hWtiryAyL/vPV6iPdUKpPhr6pwy/JfkZ
	0qDISiEyINKYkAdJt6niPKRWE0ZfvDGJDdi+AiipzT1HahRZeipVzjP4B3RV1CL5A2hGaz/D4o6IB
	KKiOfcmXpMcnqScOtqAHmLhKWJ9/666Pdg3yUXICQwZAbGVH7hFjmkPEXiCnZtCNwDWPJ8IObyAks
	shf7CaTyTTTqDkfC30AUQrayAMf3vF31W4c4j/Rth5IpWOcG6//d0xbe2qPGXaEzlFEb6ceeezipO
	hpN9KS6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thggT-00000002NKX-1MFX;
	Tue, 11 Feb 2025 03:11:37 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thgf4-00000002N6r-1Xb7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 03:10:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2344AA42565;
	Tue, 11 Feb 2025 03:08:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50E1DC4CED1;
	Tue, 11 Feb 2025 03:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739243409;
	bh=YJOBToaYzUqd9DyOP+SvGJW2ufNR3336/zAErdq2/20=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=mLkr/gL7GMILaca8r3fdPmR6S/WLp5cbubv6Tl3v8+jFnUHALuNsMMlDr8YZ83rya
	 nZ/oAOgdzD8RFRGOx/rIFBVb8ywXdpThLUZxZhIFx++7zjR+/RvIE487pTKveQLcva
	 5Etmfshvb9TgDDJEeQQY0mwORHEhOWEen8GJcRIa/gii2pEaa8LsjqGaRmQOsBnduX
	 1n7vw9QPl6+hzei77a/g3blE4ht7UAsubqExNy17webSDmy4qdToLCpqKuMLoO0H+i
	 FWON+5tLp61Md5fB3weT6e1Reus7bTpmLc1IIZFnVIq3do6aoZ5/PhuXaEeuy9srHF
	 TdrVUOUvp4DMQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 25F22380AA7A;
	Tue, 11 Feb 2025 03:10:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v5 0/4] net: xilinx: axienet: Enable adaptive IRQ
 coalescing with DIM
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173924343783.3943945.3127869136485517111.git-patchwork-notify@kernel.org>
Date: Tue, 11 Feb 2025 03:10:37 +0000
References: <20250206201036.1516800-1-sean.anderson@linux.dev>
In-Reply-To: <20250206201036.1516800-1-sean.anderson@linux.dev>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, radhey.shyam.pandey@amd.com, netdev@vger.kernel.org,
 michal.simek@amd.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, shannon.nelson@amd.com,
 hengqi@linux.alibaba.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_191010_470430_B503592E 
X-CRM114-Status: UNSURE (   9.55  )
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

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu,  6 Feb 2025 15:10:32 -0500 you wrote:
> To improve performance without sacrificing latency under low load,
> enable DIM. While I appreciate not having to write the library myself, I
> do think there are many unusual aspects to DIM, as detailed in the last
> patch.
> 
> Changes in v5:
> - Move axienet_coalesce_params doc fix to correct patch
> - Rebase onto net-next/master
> 
> [...]

Here is the summary with links:
  - [net-next,v5,1/4] net: xilinx: axienet: Combine CR calculation
    https://git.kernel.org/netdev/net-next/c/e76d1ea8cb18
  - [net-next,v5,2/4] net: xilinx: axienet: Support adjusting coalesce settings while running
    https://git.kernel.org/netdev/net-next/c/d048c717df33
  - [net-next,v5,3/4] net: xilinx: axienet: Get coalesce parameters from driver state
    https://git.kernel.org/netdev/net-next/c/eb80520e8a5b
  - [net-next,v5,4/4] net: xilinx: axienet: Enable adaptive IRQ coalescing with DIM
    https://git.kernel.org/netdev/net-next/c/e1d27d29dbe5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



