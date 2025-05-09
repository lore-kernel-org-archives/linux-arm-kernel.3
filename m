Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24C6BC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 04:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rsjVb3bVFbqZxCpwgqOn0OzmwPrb1CwyQw6zTxUSgRk=; b=aKdK/AsHOMrsjhnKHfRKHKjf0k
	xlkzXXvGOUqOh6lYoE8uS4fmHI8iijr0Ig7pG6Iv9+/6WQ/s9VjfZ2iT5/VUOHDBWUT2rEGysOoNY
	/70tKAV6MgGvYzcdILF85a604chhDH3SAfkTB7mkhPDi8hGLtSwoRZP6O5/+oVKXcBxcWIDNEhIkm
	5C4OaKgIZ93lFetJFCFJ0MrN6dno2v82RKS345UkzeSuu2XeNuw4XMjfEeUgPHeI47+Ae7UvC17Bi
	Z7gv7WvSfe+9iQ5d/YdRcVJ6fTS3jr1UZaGBnUs/U5X5vDdnfEa1/nuiL/OmlFwLnQdJVZB/kZQeI
	MJWJxF7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDEuO-00000002Pq5-2bCg;
	Fri, 09 May 2025 04:00:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDEHN-00000002LzB-0jiE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 03:20:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 953CB49EC8;
	Fri,  9 May 2025 03:20:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69C55C4CEE7;
	Fri,  9 May 2025 03:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746760804;
	bh=NY9f4q2kixUeTEknFQvFoV+AD+81IXXwblbM2CctxyA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=lyi099k6fyh1ahKM/tIi2w1iD/oHFITWbewaXU85RAhs+2ImiRhUMBLcf1bBVf0Cg
	 IUDKwZdC220PhgWaq7heBSTYpoTXLtChkVBQDVdT3N0UMiRsFfifWyASo5x1ET2GWH
	 5TJUM319B4kyqdQ7xFGWDdlATCmBwMy2FnH7kZ02beNN9qepzcvadR1eI0h5jqExlj
	 gvS8iSfn1Fo06yiztqXMR531F175M5zkI5XoaE7PyjFTJvdoElQZr4P4t6Me+0ZXQY
	 OqVZk/Y2E8RLNk+gDJ99htcy2OYiD4iNe7FQ2Xg2fpwyiGAKmsEl6yQH/2GLY4K+Ov
	 Z0BlxGOkIyVwg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33BFF380AA7D;
	Fri,  9 May 2025 03:20:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v7 net-next 00/14] Add more features for ENETC v4 - round 2
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174676084300.3115683.12773669022927548558.git-patchwork-notify@kernel.org>
Date: Fri, 09 May 2025 03:20:43 +0000
References: <20250506080735.3444381-1-wei.fang@nxp.com>
In-Reply-To: <20250506080735.3444381-1-wei.fang@nxp.com>
To: Wei Fang <wei.fang@nxp.com>
Cc: claudiu.manoil@nxp.com, vladimir.oltean@nxp.com, xiaoning.wang@nxp.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, christophe.leroy@csgroup.eu,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 timur@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_202005_260123_14ED4EAF 
X-CRM114-Status: GOOD (  13.58  )
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

On Tue,  6 May 2025 16:07:21 +0800 you wrote:
> This patch set adds the following features.
> 1. Compared with ENETC v1, the formats of tables and command BD of ENETC
> v4 have changed significantly, and the two are not compatible. Therefore,
> in order to support the NETC Table Management Protocol (NTMP) v2.0, we
> introduced the netc-lib driver and added support for MAC address filter
> table and RSS table.
> 2. Add MAC filter and VLAN filter support for i.MX95 ENETC PF.
> 3. Add RSS support for i.MX95 ENETC PF.
> 4. Add loopback support for i.MX95 ENETC PF.
> 
> [...]

Here is the summary with links:
  - [v7,net-next,01/14] net: enetc: add initial netc-lib driver to support NTMP
    https://git.kernel.org/netdev/net-next/c/4701073c3deb
  - [v7,net-next,02/14] net: enetc: add command BD ring support for i.MX95 ENETC
    https://git.kernel.org/netdev/net-next/c/e3f4a0a8ddb4
  - [v7,net-next,03/14] net: enetc: move generic MAC filtering interfaces to enetc-core
    https://git.kernel.org/netdev/net-next/c/401dbdd1c23c
  - [v7,net-next,04/14] net: enetc: add MAC filtering for i.MX95 ENETC PF
    https://git.kernel.org/netdev/net-next/c/6c5bafba347b
  - [v7,net-next,05/14] net: enetc: add debugfs interface to dump MAC filter
    https://git.kernel.org/netdev/net-next/c/df6cb0958089
  - [v7,net-next,06/14] net: enetc: add set/get_rss_table() hooks to enetc_si_ops
    https://git.kernel.org/netdev/net-next/c/66b3fb001156
  - [v7,net-next,07/14] net: enetc: make enetc_set_rss_key() reusable
    https://git.kernel.org/netdev/net-next/c/7e1af4d6e4b4
  - [v7,net-next,08/14] net: enetc: add RSS support for i.MX95 ENETC PF
    https://git.kernel.org/netdev/net-next/c/2627e9873d69
  - [v7,net-next,09/14] net: enetc: change enetc_set_rss() to void type
    https://git.kernel.org/netdev/net-next/c/42fb12220ade
  - [v7,net-next,10/14] net: enetc: enable RSS feature by default
    https://git.kernel.org/netdev/net-next/c/2219281242fc
  - [v7,net-next,11/14] net: enetc: extract enetc_refresh_vlan_ht_filter()
    https://git.kernel.org/netdev/net-next/c/014e33e2d8e9
  - [v7,net-next,12/14] net: enetc: move generic VLAN hash filter functions to enetc_pf_common.c
    https://git.kernel.org/netdev/net-next/c/5d7f6f6836a1
  - [v7,net-next,13/14] net: enetc: add VLAN filtering support for i.MX95 ENETC PF
    https://git.kernel.org/netdev/net-next/c/f7d30ef6c1f7
  - [v7,net-next,14/14] net: enetc: add loopback support for i.MX95 ENETC PF
    https://git.kernel.org/netdev/net-next/c/932ce98041ff

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



