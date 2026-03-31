Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF7651061B2B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 01:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zqxsAEm3zB3tx9HPvoc1xGSBviNoU0UH8MfgLojT/GU=; b=GWtmuqHE5tXW+xvGmhZ7VM6Cty
	4hpYV1vb5F9F+Oyy+U82ZhQpKu6nbVR6VyTmHTZfFOQFf6YexR5FeA61/dYpYpSpCzrJrcQQ+7XUM
	cH9Z/+YD3hzjIJhwSGEPSjgC2JMFEO0G0LBnBl/P6VDjX+ZWbfBF7/cEQuKCZuJ+Jt7nMsscU2B9c
	xHIKDgxOh0954zVD7n7FL5gnkWn1PBKHWu8uQaIYWDaW/kDqVPmuoAIu8n351ke7sd2Sz0vU/srCl
	UqCqRdLCtcHZMqhSJkc/uD9c+f9I/jXzrsqdwUsD/pKbnJHhp3K6+xX57CYRkDBBj41LJBLqRHmCF
	L30SI3dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Ncj-0000000C78I-3bTX;
	Tue, 31 Mar 2026 01:10:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Nch-0000000C77t-2brQ;
	Tue, 31 Mar 2026 01:10:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 08AE141879;
	Tue, 31 Mar 2026 01:10:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBA05C4CEF7;
	Tue, 31 Mar 2026 01:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774919426;
	bh=rFMcBYeopbsen4UF2EndeJk0OSUhO9PRv3WemTAI2lg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=RQkykAGaQ8Hda8DjWN61ks9t9LmuKde1eVeVeGWbUzz0oHlCGDlH4H3z3Vl/ad9cJ
	 c+PKO00Z7ZWqGD4UAjwUBlN3p0jdqz+K26VG4Mqa8MTq5VTlaU47qTruPNWjKzJe0q
	 LxV+1phkBqKa9yc2Na470eyflxZQxt7Etu8pMcYTTXO2TNxJKWQp5/LQFLVS7TToxI
	 rpO6+BM5ruLjphPUFO1GKDsAYzOJhOfXrAQHNSpac6QZLYyNS4LcWObYoHDMC2+dYH
	 1L0gAcAfK7Ay3gm6ir5LHPTq+2KDzWUE5Ko+BvsDF4EXCnqDGqqhvOMN+ih+BZ4+tX
	 rba94M3WRROCg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 0CF32392FF97;
	Tue, 31 Mar 2026 01:10:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2] net: airoha: Delay offloading until all
 net_devices are fully registered
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177491941075.2043537.8277292762892112886.git-patchwork-notify@kernel.org>
Date: Tue, 31 Mar 2026 01:10:10 +0000
References: <20260329-airoha-regiser-race-fix-v2-1-f4ebb139277b@kernel.org>
In-Reply-To: <20260329-airoha-regiser-race-fix-v2-1-f4ebb139277b@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_181027_681898_CC576166 
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

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sun, 29 Mar 2026 12:32:27 +0200 you wrote:
> Netfilter flowtable can theoretically try to offload flower rules as soon
> as a net_device is registered while all the other ones are not
> registered or initialized, triggering a possible NULL pointer dereferencing
> of qdma pointer in airoha_ppe_set_cpu_port routine. Moreover, if
> register_netdev() fails for a particular net_device, there is a small
> race if Netfilter tries to offload flowtable rules before all the
> net_devices are properly unregistered in airoha_probe() error patch,
> triggering a NULL pointer dereferencing in airoha_ppe_set_cpu_port
> routine. In order to avoid any possible race, delay offloading until
> all net_devices are registered in the networking subsystem.
> 
> [...]

Here is the summary with links:
  - [net-next,v2] net: airoha: Delay offloading until all net_devices are fully registered
    https://git.kernel.org/netdev/net/c/cedc1bf327de

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



