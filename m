Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33152E77182
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 22:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fzot05a1ws6fWFNqWjBX2i+R9eiLx4sQkGNi476jcXM=; b=zsZEmbYCJn+lit26rogw5tpJF8
	YmIlzWV2DRp06vzl8dOTtRRxSjiVViS0AIs95gQrZwAsX5EMxUIou9buIHxLybkWoJmm8XefcB1aK
	QjCDjwD/AwYGF5N0XRyDReDDHxExfYlLsrMSvX/ufnTv07wcNvwuuyrwac6FY5zWyxxsb5UxwJ1uv
	J8tczuMi1iM1FvgIIbwgXqbaHzwkop2waj50mLYtTFQTG+oVC5ys6/m9/ZH5+0dLpHeJTgIhZPFGg
	8upYJyvQyIwGCAfTd0NNV4lqTnEeSSL7wYIgPbgfDDVsztT96ypgPz8lhjXAo9Ci9LMD+XqJsNxBL
	EPkSyqFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLVM2-0000000GMsX-04PU;
	Wed, 11 Dec 2024 22:38:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLVG6-0000000GKZS-1CgG;
	Wed, 11 Dec 2024 22:32:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A14CC5C67FC;
	Wed, 11 Dec 2024 22:31:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0BF5C4CED2;
	Wed, 11 Dec 2024 22:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733956361;
	bh=il/LP0fiktwHyC77+kl7PbXayxiUWzB2aK3hHeyKOp0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Y5CBumuGwdaTIUle2/mYmKPRDobxNEAa6rBA9JYi6bEbIedw9zcOvMM5DJA5ZB/mM
	 eBJPdavTIV5zeA0YCCQINKu9mGMdUWA0ufAK3v1xo3N8M1wPmqXw3uu8Ui8gCIzOR4
	 T7Q/G21LeE2qTojctC1ulmTVtfyUzQCyEBcjTzR0TykkdXTYP/rxRQkttrsLqn7Fmw
	 5S8OI7FlbZSdax0So7Bpu+k/453ZrHLon6OIs5btOoqZ8uzprsc9uF1Ug431XOrRt1
	 tWauQ4VvZ8v7rE1lmeXPQmFo11ZCU4/ohbbs+x9p3z5lkALa65fkEbJOCLs129/ijO
	 QHq4KQSfWq8ZQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAEA9380A965;
	Wed, 11 Dec 2024 22:32:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v1] dma: fix typo in the comment
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <173395637749.1729195.15051372994717315610.git-patchwork-notify@kernel.org>
Date: Wed, 11 Dec 2024 22:32:57 +0000
References: <20240918034114.860132-1-yanzhen@vivo.com>
In-Reply-To: <20240918034114.860132-1-yanzhen@vivo.com>
To: Yan Zhen <yanzhen@vivo.com>
Cc: linux-riscv@lists.infradead.org, vkoul@kernel.org,
 paul.walmsley@sifive.com, samuel.holland@sifive.com, michal.simek@amd.com,
 dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, opensource.kernel@vivo.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_143242_368105_5CE3627C 
X-CRM114-Status: UNSURE (   8.50  )
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

This patch was applied to riscv/linux.git (fixes)
by Vinod Koul <vkoul@kernel.org>:

On Wed, 18 Sep 2024 11:41:14 +0800 you wrote:
> Correctly spelled comments make it easier for the reader to understand
> the code.
> 
> Replace 'enngine' with 'engine' in the comment &
> replace 'trascatioin' with 'transaction' in the comment &
> replace 'descripter' with 'descriptor' in the comment &
> replace 'descritpor' with 'descriptor' in the comment &
> replace 'rgisters' with 'registers' in the comment.
> 
> [...]

Here is the summary with links:
  - [v1] dma: fix typo in the comment
    https://git.kernel.org/riscv/c/39d283d14692

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



