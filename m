Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B327C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qlp2W2ZoWT0g/2iDAwQG4KolUTYZcbXzmtbmfk1B6EI=; b=0sLJ9A4eGzZdrX9CxKaOdJTEt4
	+aYwKOUNFcm0p7g59PI0oUM0o7eLe10DUUSF0xFKFivDX9wJbXhvrNyrmp8LPva0Of0cItzYnSNAJ
	8Znl2czwEita66moWXVC+ntRgWgxABGXUZdt4lk2nAiZKRkALgHsucXxh008EtUyeIQT7tOjpPJN9
	8KG5WYHfkbkC0DxvUsZWgoRA0/iyTNf+5YIJgNRyh1cxNd1RT2IxCnmepzsWz8SXZ9SFAMcA9L7se
	gKDuMbG5PfYF4hpp7W8z9VimqfJMoNWc3yJNuZEIMhDOdoxZhoas5bqbBNYSQWCHhcX3/Htu26zED
	AYX4qTqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjjI-00000008XuD-21vT;
	Thu, 27 Feb 2025 19:39:32 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tngcF-000000083Ft-2d5e
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 16:20:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8F11261F36;
	Thu, 27 Feb 2025 16:19:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC1A2C4CEE6;
	Thu, 27 Feb 2025 16:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740673202;
	bh=VpDZza7QXbnhces+of61OvEOBdzoZhLzbcuTIudJynw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=i+8iK5uwh70kd0GxxW6snP2DPzw8Mq3aSRuYooC4m0M52JYgVJ7M5sG/J9xnyBCB5
	 R61VgB7uv1EaFEEuNs9QHJl2QFanAEN8WpPWvZbnhBzh0SVmfamOsaKL3XxRIkTIJG
	 knVOMemJjTh2fz02wv/7AODLLsBShcs7xFQPRekGBGpvhJYDsnfiQ+j4DqgG0il76P
	 MvyK8pMpc2DT66QbOnEnkIGWxUD4IBbNkTbA8Je09TVlYYr/OA0PXUSlBkKx6elL8m
	 GddSaEd3zYIjLfYMqfaRMpee6NkwRfxIMphjYgnPHm11pd/mLUcr6mgqBDq3hiFFPn
	 8U1nC5nR30eyA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB540380AACB;
	Thu, 27 Feb 2025 16:20:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: ti: icss-iep: Reject perout generation request
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174067323473.1484560.3837727172875875732.git-patchwork-notify@kernel.org>
Date: Thu, 27 Feb 2025 16:20:34 +0000
References: <20250227092441.1848419-1-m-malladi@ti.com>
In-Reply-To: <20250227092441.1848419-1-m-malladi@ti.com>
To: Meghana Malladi <m-malladi@ti.com>
Cc: vigneshr@ti.com, javier.carrasco.cruz@gmail.com, jacob.e.keller@intel.com,
 diogo.ivo@siemens.com, horms@kernel.org, richardcochran@gmail.com,
 pabeni@redhat.com, kuba@kernel.org, edumazet@google.com, davem@davemloft.net,
 andrew+netdev@lunn.ch, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, srk@ti.com, rogerq@kernel.org,
 danishanwar@ti.com
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

On Thu, 27 Feb 2025 14:54:41 +0530 you wrote:
> IEP driver supports both perout and pps signal generation
> but perout feature is faulty with half-cooked support
> due to some missing configuration. Remove perout
> support from the driver and reject perout requests with
> "not supported" error code.
> 
> Fixes: c1e0230eeaab2 ("net: ti: icss-iep: Add IEP driver")
> Signed-off-by: Meghana Malladi <m-malladi@ti.com>
> 
> [...]

Here is the summary with links:
  - [net] net: ti: icss-iep: Reject perout generation request
    https://git.kernel.org/netdev/net/c/54e1b4becf5e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



