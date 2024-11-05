Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38A84D1CA15
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 03:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sJG6dQ+n8RgJB507eGbqHTNCrPhm5/7WuF2UnhAHnCQ=; b=oq7LmMNqGm5pcTrpn+qSMjyXis
	CuHnNpcAdY6lmoeIdtyjYsIMZ/VNn6TjnZcMX0d2P3IDQqqM2uzil+u2CXyzYM66Wn0hUNRWNF4ZA
	msvsBCwraHahZHCpp9Sk+4hfexoWsqO0+6eZp/TCm8hsVpIKW8lm8eRlJ7Lr4wl7Bf/84//HTtFdy
	ZeYNwNo7wzabjBoOD6gx9IJsys2iFlNFC74OF0zRSVGsaXkS4Qw+4VFEssWPdZ3Ycq7Zm5rdQoloy
	jgm9B85HoHS9mIhb2+Ox/H4WznwxxxLDV06uI+ay/6CKwxlf+0Bt3Ug13TiFRSv1mbfzqt9oVGnly
	RYkfTuig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8A5d-0000000FkV7-40fA;
	Tue, 05 Nov 2024 03:18:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t89xV-0000000FjNv-3jip
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 03:10:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 950315C56D4;
	Tue,  5 Nov 2024 03:09:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 085E5C4CECE;
	Tue,  5 Nov 2024 03:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730776221;
	bh=9LDC91LMilMxXjCTP/fsGGlz+9VFe99Gy7W8ZsIgP18=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=SiHh+TMZhp30Fvgu5Hk5vbLHACsRQ9BkRex/T1O0xiHydSasP+8fwv8v8ktwQyJhr
	 JsfOKAnXNwOIJuTFBppn5NLBFYquL2ol7OjUMdkUKoGsrN69WfMsKO935qgOiunpzc
	 99wuKGhMnFGzlYjvDC+ZQ0HfqT8AN7KCDkQU5cbRtPSWq3WMPfgmtIXMBee85c+FlP
	 Fa5zlaYycskdvds6wYxO3rtBuVRJCm7iLaZ3eBizT09MxFhkD+wGAj5mVv/omNfOdz
	 ZqzMsZ2NYw2w/uGoGgEBCJCAPjEzTKGqqiSL7B2sds8Puz8NH0Eso0BM5QdqtAzZKc
	 zW5A6/S522uiQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB3733809A80;
	Tue,  5 Nov 2024 03:10:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/3] Fix sparse warnings in dpaa_eth driver
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173077622975.100940.17453964424124667340.git-patchwork-notify@kernel.org>
Date: Tue, 05 Nov 2024 03:10:29 +0000
References: <20241029164317.50182-1-vladimir.oltean@nxp.com>
In-Reply-To: <20241029164317.50182-1-vladimir.oltean@nxp.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, leitao@debian.org, madalin.bucur@nxp.com,
 ioana.ciornei@nxp.com, radu-andrei.bulie@nxp.com,
 christophe.leroy@csgroup.eu, sean.anderson@linux.dev,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_191022_004665_FB023133 
X-CRM114-Status: GOOD (  11.19  )
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

On Tue, 29 Oct 2024 18:43:14 +0200 you wrote:
> This is a follow-up of the discussion at:
> https://lore.kernel.org/oe-kbuild-all/20241028-sticky-refined-lionfish-b06c0c@leitao/
> where I said I would take care of the sparse warnings uncovered by
> Breno's COMPILE_TEST change for the dpaa_eth driver.
> 
> There was one warning that I decided to treat as an actual bug:
> https://lore.kernel.org/netdev/20241029163105.44135-1-vladimir.oltean@nxp.com/
> and what remains here are those warnings which I consider harmless.
> 
> [...]

Here is the summary with links:
  - [net-next,1/3] soc: fsl_qbman: use be16_to_cpu() in qm_sg_entry_get_off()
    https://git.kernel.org/netdev/net-next/c/a12fcef429e1
  - [net-next,2/3] net: dpaa_eth: add assertions about SGT entry offsets in sg_fd_to_skb()
    https://git.kernel.org/netdev/net-next/c/81f8ee2823f3
  - [net-next,3/3] net: dpaa_eth: extract hash using __be32 pointer in rx_default_dqrr()
    https://git.kernel.org/netdev/net-next/c/0a746cf8bb6d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



