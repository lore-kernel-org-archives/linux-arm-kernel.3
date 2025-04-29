Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95C56C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 00:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7HvGh0vHf0aJ5hPlx2/mvouJllSqfDDAfiDS+F1oxn0=; b=UcSAEAUSCTJB3XUF125bMUis/U
	73YsWfhVgGvzeO7BHCmfhOuUi5e8bKV251GGwSY8iFNpZohbPTSTsaDAbniyrnWDN6Y6bNpWFEZzV
	/IBOHlRURxDT+dQzudX13A+DKvI+qxEfHI0a4CkLW7J6/XSdb0PFJwM4mv5uTxBdI4PstCU6xpk/s
	E7Vw3q3mx2ND4Gvujiwsq8GNNiOkr0uhZ8deIyE2Q5SXvd8vDc8LsfIvyL1ucGEG2/DD6tj98RHUx
	1sMtGzLUXlQojyastqHZ1vzOwdGrxUnUnc4hVYmQF/z1flWyqgo6xXNYHDqK45WXmjmhbVTUpswzW
	HyMQZTnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Yt5-00000007tbC-2Gu7;
	Tue, 29 Apr 2025 00:31:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9YrB-00000007tNA-05kq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 00:29:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D245C614AE;
	Tue, 29 Apr 2025 00:29:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6DB8C4CEE4;
	Tue, 29 Apr 2025 00:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745886591;
	bh=xLvpM+/YuRZqwaRcqxD1kjCWYPLCDIfbBOLIg1SMM40=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=H0TKN022OBo+yn8vkT+oPyNAhr90AwmTrpcYsory0cjH1Jc8N3vZ7z9ZFLCKPcjpE
	 ombPm2xswWQAHqZP7OJKpBZkEP06mqxGjtRgeNeQQz60Ro+EecpCkyxIQI+CmKogod
	 SPf7v/JOBZduqwm7DjZ0EhfZm7J8Flw7hiC1zwzyz5ZCzL1qjBWUm/QZyhqhN69MNH
	 Yhh8n3PVgHhapQ8LJ+FhPX3GJqWR0f4ajg7yCdno74nhmtiKeb3zrcLYILkghzBjv1
	 SNljoD0ABy+LMW4pa9i5tmnGT81Vb+7X4AMTgeC0f5ttURx9IJJYJ0BqKBq95APsYq
	 h29HxEULil7fw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAF0A3822D4A;
	Tue, 29 Apr 2025 00:30:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v3] net: ti: icssg-prueth: Add ICSSG FW Stats
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174588663075.1088650.16999100387793787155.git-patchwork-notify@kernel.org>
Date: Tue, 29 Apr 2025 00:30:30 +0000
References: <20250424095316.2643573-1-danishanwar@ti.com>
In-Reply-To: <20250424095316.2643573-1-danishanwar@ti.com>
To: MD Danish Anwar <danishanwar@ti.com>
Cc: dan.carpenter@linaro.org, m-malladi@ti.com, lee@trager.us,
 maddy@linux.ibm.com, arnd@arndb.de, mpe@ellerman.id.au,
 andrew+netdev@lunn.ch, rogerq@kernel.org, corbet@lwn.net, horms@kernel.org,
 pabeni@redhat.com, kuba@kernel.org, edumazet@google.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, netdev@vger.kernel.org, srk@ti.com,
 vigneshr@ti.com
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

On Thu, 24 Apr 2025 15:23:16 +0530 you wrote:
> The ICSSG firmware maintains set of stats called PA_STATS.
> Currently the driver only dumps 4 stats. Add support for dumping more
> stats.
> 
> The offset for different stats are defined as MACROs in icssg_switch_map.h
> file. All the offsets are for Slice0. Slice1 offsets are slice0 + 4.
> The offset calculation is taken care while reading the stats in
> emac_update_hardware_stats().
> 
> [...]

Here is the summary with links:
  - [net-next,v3] net: ti: icssg-prueth: Add ICSSG FW Stats
    https://git.kernel.org/netdev/net-next/c/0d15a26b247d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



