Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F8F0C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 10:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d8O6fFnjMjpDKRifzUk7kx5KqSBY/1uFfVeONDwnnGI=; b=LbE9awsffyF2tTHaxbDKdUZW8a
	u+9cfpqg1sElLbk8EU1FkEHOAnu9j9f6eKmVRmhmwbQPTTMynvDTIBqA0JhRV+FhpNidZWVlsGYUA
	UXaNrqZJpGaV6tgxzQox1keOpu15n7ImTDcSyWTg2pT2Ue3l5paMBeKLNJ+4YSzyNdxeZk7FFjLfO
	xV9+moGUKyPGH5qJbm+onhDuxiP1TNgW50akA2V9ziUt+1EWoPsZ3c1wB1NfMRmpkpUlQxy2eoQ9T
	X9jVeIsqGCIZ8/TP63VBwBke+yiHlgREs947EhNrSJ5XwcSWUlPrGDMXWrmKjKVuxPvXus8DqsPUP
	d+2N1UVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7ApA-00000006kKC-1CCP;
	Tue, 22 Apr 2025 10:25:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u79e0-00000006VWk-38Sz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 09:10:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C2DF15C56C3;
	Tue, 22 Apr 2025 09:08:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 808D8C4CEE9;
	Tue, 22 Apr 2025 09:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745313019;
	bh=PUT42nkj9usmklJLJ4eRA+ccH4Iy+u8VjhnyxVvTqHQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Z1Cs5znabA2xidBwGbGv1mLmiBxQFrFX9uqpN6d3sFrfXhhZLU6wyfCSeQe+sA/T4
	 sTytT6Flmsrup0Mv4hyM+atO115mMQ1ufEPiumC5WjySNAyl++c6RsgoQW24hvpm8D
	 lF47uuBSnIcrTAQl/MnqT4tSpjpGDB1DQIpOgUHHkLF5vHUR23AXeKPLEzpTq6bS8u
	 5wpHybmr7fwUNDM+leGM2fmVCGm8Zrrq2mMO9801xppnbhSeijG+3HQcXSYOiIT1j+
	 lgAt7hJ9XsfWG1G/sfuTuUT4ibbJ4FoSHRlt4l40ihHwHvA1MT0K2LXS03ieBZXOtj
	 OAJ3HcAfbM0fg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33A9F39D6546;
	Tue, 22 Apr 2025 09:10:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH][next] net: axienet: Fix spelling mistake "archecture" ->
 "architecture"
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174531305799.1477965.14224114982471679309.git-patchwork-notify@kernel.org>
Date: Tue, 22 Apr 2025 09:10:57 +0000
References: <20250418112447.533746-1-colin.i.king@gmail.com>
In-Reply-To: <20250418112447.533746-1-colin.i.king@gmail.com>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: radhey.shyam.pandey@amd.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 michal.simek@amd.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_021020_840332_463EB8BE 
X-CRM114-Status: UNSURE (   9.73  )
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

On Fri, 18 Apr 2025 12:24:47 +0100 you wrote:
> There is a spelling mistake in a dev_error message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/net/ethernet/xilinx/xilinx_axienet_main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - [next] net: axienet: Fix spelling mistake "archecture" -> "architecture"
    https://git.kernel.org/netdev/net-next/c/61fde5110ee9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



