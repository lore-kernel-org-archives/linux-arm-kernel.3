Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 231CAC36018
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 18:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CDdUjHIXgpWEcsBAwN2q7JYGFn8IlnaahOuXxE6djS4=; b=phLknOHWeGqljn
	ZLKvgntOvuiWuNd/DRVASCgs/iTMfKXVXPtbKC+YFS7rKM3yHDsOAWeJUTbPKf3ZFCjXf6+FLWkLT
	eO2XbXqMb1SWCnL/J6W2LxRXr0Lq9uy/68PLCgu1AHIhi2yzd3fobBL8+EkyJGLkIToSm6BH9Hf9+
	Wzudq+/DSWrSgxIPGOiQVNDLeYJfmpkx2s57fffJS0dRGhHHwLMTDUojE4tQsO7f6q4NZNhzcCNrC
	tK/UfY7FJUt853Ae+VC97Jjho+HllzGXjuUSb24TIMUKq8rJXoIGMSSZRJ3k1Mh5ZxvZ/RW0EsE63
	WN331dm9MvRNpKdwvgYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1rZl-00000001fSj-2qoo;
	Mon, 07 Apr 2025 18:52:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1qWJ-00000001PZE-3ddk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 17:44:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 034C75C4D05;
	Mon,  7 Apr 2025 17:42:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6486BC4CEDD;
	Mon,  7 Apr 2025 17:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744047866;
	bh=7zVyw8dBACn0jbPMoiyXuDYILfE08Q4qXUzBs6PoXIQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=PXL7q/iVHF16iYIelGRyJ0X+jvpOeIcd1w/P3IAzcI6dT9KoqugVYED3VssP0vSNh
	 kN9QOBgSD8ikX3v1pZvrNOugHFgoYkkF4Gx+Z30Pnwdupso0SSk/Io14R+pPQx4Mfd
	 mIOhSaS+VyaJff5IJ20ScGDdXbl0LS6k11pf3CC39ZUBacwstJseoj/WI1joWkfQwH
	 RQUXfe6lAROhiiXfjO6xPHrXwIp46MqYgN6YnxAX1ZSgXvgOAsGPavZxTcBts4P3aF
	 nq35fvxQymYR4SS3TCBSrsMd1cHNcZiRvwJETq3zX5IT7bREZbHNcPlVAhvfBf9xQQ
	 5DPRZ4BapvsuA==
Date: Mon, 7 Apr 2025 10:44:24 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Parvathi Pudi <parvathi@couthit.com>
Subject: Re: [PATCH net-next v4 00/11] PRU-ICSSM Ethernet Driver
Message-ID: <20250407104424.01cc42f2@kernel.org>
In-Reply-To: <20250407102528.1048589-1-parvathi@couthit.com>
References: <20250407102528.1048589-1-parvathi@couthit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_104427_959855_03CBF4A5 
X-CRM114-Status: GOOD (  12.34  )
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
Cc: nm@ti.com, vigneshr@ti.com, tony@atomide.com, edumazet@google.com, glaroque@baylibre.com, pmohan@couthit.com, diogo.ivo@siemens.com, robh@kernel.org, javier.carrasco.cruz@gmail.com, praneeth@ti.com, m-karicheri2@ti.com, basharath@couthit.com, pabeni@redhat.com, devicetree@vger.kernel.org, conor+dt@kernel.org, schnelle@linux.ibm.com, mohan@couthit.com, richardcochran@gmail.com, prajith@ti.com, rogerq@kernel.org, jacob.e.keller@intel.com, ssantosh@kernel.org, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, rogerq@ti.com, srk@ti.com, pratheesh@ti.com, m-malladi@ti.com, netdev@vger.kernel.org, rdunlap@infradead.org, linux-kernel@vger.kernel.org, danishanwar@ti.com, afd@ti.com, andrew+netdev@lunn.ch, horms@kernel.org, krishna@couthit.com, krzk+dt@kernel.org, davem@davemloft.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon,  7 Apr 2025 15:55:17 +0530 Parvathi Pudi wrote:
> The Programmable Real-Time Unit Industrial Communication Sub-system (PRU-ICSS)
> is available on the TI SOCs in two flavors: Gigabit ICSS (ICSSG) and the older
> Megabit ICSS (ICSSM).
> 
> Support for ICSSG Dual-EMAC mode has already been mainlined [1] and the
> fundamental components/drivers such as PRUSS driver, Remoteproc driver,
> PRU-ICSS INTC, and PRU-ICSS IEP drivers are already available in the mainline
> Linux kernel. The current set of patch series builds on top of these components
> and introduces changes to support the Dual-EMAC using ICSSM on the TI AM57xx,
> AM437x and AM335x devices.
> 
> AM335x, AM437x and AM57xx devices may have either one or two PRU-ICSS instances
> with two 32-bit RISC PRU cores. Each PRU core has (a) dedicated Ethernet interface
> (MII, MDIO), timers, capture modules, and serial communication interfaces, and
> (b) dedicated data and instruction RAM as well as shared RAM for inter PRU
> communication within the PRU-ICSS.

This was posted prior to the "net-next is OPEN" announcement:
https://lore.kernel.org/all/20250407055403.7a8f40df@kernel.org/

In the interest of fairness towards those who correctly wait 
for the tree to be open I will ask you to repost this again,
in a couple of days.

Thanks!
-- 
pw-bot: defer

