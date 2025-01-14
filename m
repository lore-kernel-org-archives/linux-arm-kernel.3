Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43259E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 11:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uDOYO4M4uN/mATOW61/Y4SOcBdUxVWmXtpB9d1RoueU=; b=nG3MZIkZUkgD/v6/XJKu9oyUdb
	1P1aNp1JvF05Yp4MrImg8gZdxZFa00Z2md2sBEzk9leDqsvZvb7m21/Vg8TrSLFW1nyW+kJMPGhFZ
	pXbQg2Ep3PnoSEqNcckPwhTmS6pC+1vDpLNyBIAcPJ9CM3doDAK6fYFK817lxAqCMTBh961sS/G/0
	Lqo4BlSPj72VapHp/G/YLmcugHsMhkzFJzqhCCiaG+vpUTjfVqtIyuZJf4L9x47fBw71TFPXMDyMd
	by7p/H2AW7mfgjwleOsll5qiLuo0Ow0X30P4mKvbqa6GcloZzOky4RmW/fWlyscX0JN5jRhDwQPxK
	wl9rMZHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXf9Z-00000008GIf-1BVZ;
	Tue, 14 Jan 2025 11:32:13 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXf7c-00000008FnD-1D55
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 11:30:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 48AE5A41362;
	Tue, 14 Jan 2025 11:28:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11896C4CEDD;
	Tue, 14 Jan 2025 11:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736854211;
	bh=eLtr5K7Xjdv0cMpF3GIt3LabOZFwfihuPtDo5jsK2so=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=dSMNQRPfNWSP/t/ZXP0ZSPJDMvZrBa2o/+fHVuMyOqgXqiSlIQvMnAXQuftlBRfAS
	 PWpDa6MPZqAzZgSTgF/0I7bfRFZdYpYJVgaWr07lkeTHvZpaQ7BEwpQFjqzz2Rmw+s
	 3lEQwFmWyRvPr2rch0yVEJ2JDstb7D+beeiGDwh9GPLxzwUTqhgXWtRoTpPapcyuuv
	 kwhrWpd3Fftf10MicANRf1IZI4q1U+Y/ov5dOT4JaGBZbdDHOisrMDIS1D8rQtkgBI
	 B3YSkUsJrF4zs6u4wxAJBTDdimqmMKiGV64izclZdF449bIpJ8mQOUembPvgCZpjdD
	 wfAB5EK1FBjoQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB0C6380AA5F;
	Tue, 14 Jan 2025 11:30:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v4 0/4] Add Multicast Filtering support for VLAN
 interface
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173685423375.4146688.6660643987473950530.git-patchwork-notify@kernel.org>
Date: Tue, 14 Jan 2025 11:30:33 +0000
References: <20250110082852.3899027-1-danishanwar@ti.com>
In-Reply-To: <20250110082852.3899027-1-danishanwar@ti.com>
To: MD Danish Anwar <danishanwar@ti.com>
Cc: aha310510@gmail.com, aleksander.lobakin@intel.com, lukma@denx.de,
 m-malladi@ti.com, diogo.ivo@siemens.com, horms@kernel.org, pabeni@redhat.com,
 kuba@kernel.org, edumazet@google.com, davem@davemloft.net,
 andrew+netdev@lunn.ch, rogerq@kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, srk@ti.com,
 vigneshr@ti.com, michal.swiatkowski@linux.intel.com, larysa.zaremba@intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_033012_398919_65C83872 
X-CRM114-Status: UNSURE (   9.10  )
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
by Paolo Abeni <pabeni@redhat.com>:

On Fri, 10 Jan 2025 13:58:48 +0530 you wrote:
> This series adds Multicast filtering support for VLAN interfaces in dual
> EMAC and HSR offload mode for ICSSG driver.
> 
> Patch 1/4 - Adds support for VLAN in dual EMAC mode
> Patch 2/4 - Adds MC filtering support for VLAN in dual EMAC mode
> Patch 3/4 - Create and export hsr_get_port_ndev() in hsr_device.c
> Patch 4/4 - Adds MC filtering support for VLAN in HSR mode
> 
> [...]

Here is the summary with links:
  - [net-next,v4,1/4] net: ti: icssg-prueth: Add VLAN support in EMAC mode
    https://git.kernel.org/netdev/net-next/c/816b02e63a75
  - [net-next,v4,2/4] net: ti: icssg-prueth: Add Multicast Filtering support for VLAN in MAC mode
    https://git.kernel.org/netdev/net-next/c/04508d20b017
  - [net-next,v4,3/4] net: hsr: Create and export hsr_get_port_ndev()
    https://git.kernel.org/netdev/net-next/c/9c10dd8eed74
  - [net-next,v4,4/4] net: ti: icssg-prueth: Add Support for Multicast filtering with VLAN in HSR mode
    https://git.kernel.org/netdev/net-next/c/161087db66d6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



