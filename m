Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78686C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 10:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XoadaxYhjdSUWsbXObj5YaoD7Z+XMpGabFwem+Zv9Yo=; b=RfFvlIBaUbVFz/azLaacdD040j
	hH4EMLFK0qaubL1+viPajUABtMNTfGnzJHC+0yZovhs+QQ42rIQ+JME0rxKMXFH2Odvtl1RaRQ01K
	fvsfuzsvIRyeEkD7k7ShnDNFDAQZ2W0u5QAMK2piHnsjOl4GXaxNEtnVOIsm682Cp4x0UZOrM7Q6s
	Fcyf1xffRwYMOYBt9fqnVDys31PKfXniIFiCB3g3vchGET0PjpXMEYP374gzzDBYvaOtTWLo1Yhtj
	PTTw+LD8pzU8aD/tyLAXJp717pd/DPHHzewJ3Ii9VE6giW8Gd/Ko2Dz3xs4cR3RBNy3rswVdV6ITc
	naykn4iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Mlz-0000000CgEi-1FQJ;
	Thu, 17 Apr 2025 10:47:11 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5MVL-0000000Cdro-1m9T
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 10:30:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5C210A4B2C5;
	Thu, 17 Apr 2025 10:24:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DDEDC4CEE4;
	Thu, 17 Apr 2025 10:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744885798;
	bh=L5TNFNCZpdgfPBk8qeoQJb7+QsGbPtI7TchHnfcbQNU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=uniyKtCWsLKK16Ju1bjUvXKSGXeCqgHUMzg1TNc286Rzwr7Lp5j0SscODw4pAXa6N
	 1v2jxCLsgYolN3IKD6dBiqS3Ok+haDxTViJR/eCTLnS8wwiYSmco7ueUgSTMweIihs
	 +WyX2b8KF+Ta8RRaqAZFIJ5hLlZjHT5dQAL28iodHsY149mL4gxSlDICY1+lZZjD6v
	 aKzRta9RFXjVu9Iyi97ILJMjAX7saeh1MXav44JDMKTeiNayxc/l6OgC+JVMTy7fcU
	 Em5SiAc649kjGF5GmR/fe7c4wK/FX8JbrQQQoTC+8vUUoQUtDbDncnUP1/W7taFRdh
	 sjCHZRYpfJQwA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 71884380664C;
	Thu, 17 Apr 2025 10:30:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v4 0/3] Bug fixes from XDP and perout series
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174488583626.4024823.6954419136495228052.git-patchwork-notify@kernel.org>
Date: Thu, 17 Apr 2025 10:30:36 +0000
References: <20250415090543.717991-1-m-malladi@ti.com>
In-Reply-To: <20250415090543.717991-1-m-malladi@ti.com>
To: Meghana Malladi <m-malladi@ti.com>
Cc: dan.carpenter@linaro.org, javier.carrasco.cruz@gmail.com,
 diogo.ivo@siemens.com, horms@kernel.org, jacob.e.keller@intel.com,
 john.fastabend@gmail.com, hawk@kernel.org, daniel@iogearbox.net,
 ast@kernel.org, richardcochran@gmail.com, pabeni@redhat.com, kuba@kernel.org,
 edumazet@google.com, davem@davemloft.net, andrew+netdev@lunn.ch,
 bpf@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, srk@ti.com, vigneshr@ti.com,
 rogerq@kernel.org, danishanwar@ti.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_032959_521977_976DE2E4 
X-CRM114-Status: UNSURE (   9.38  )
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

This series was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Tue, 15 Apr 2025 14:35:40 +0530 you wrote:
> This patch series consists of bug fixes from the XDP series:
> 1. Fixes a kernel warning that occurs when bringing down the
>    network interface.
> 2. Resolves a potential NULL pointer dereference in the
>    emac_xmit_xdp_frame() function.
> 3. Resolves a potential NULL pointer dereference in the
>    icss_iep_perout_enable() function
> 
> [...]

Here is the summary with links:
  - [net,v4,1/3] net: ti: icssg-prueth: Fix kernel warning while bringing down network interface
    https://git.kernel.org/netdev/net/c/75bc74446644
  - [net,v4,2/3] net: ti: icssg-prueth: Fix possible NULL pointer dereference inside emac_xmit_xdp_frame()
    https://git.kernel.org/netdev/net/c/8ed2fa661350
  - [net,v4,3/3] net: ti: icss-iep: Fix possible NULL pointer dereference for perout request
    https://git.kernel.org/netdev/net/c/7349c9e99793

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



