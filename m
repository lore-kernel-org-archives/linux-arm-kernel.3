Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 826DEE9D40F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 16:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tghBpVNRN8kMsqE+bEpNSug4Qe716Cw4ZYis7x7QKlg=; b=tC3GKODg75s1K9O/bWgj96qfgf
	5l7MMLUUWB697tULCZD0x8U7yqarH5BJwX2V/eNPcgoKgoZueatHm6HhSlxhA+B4A14M2Gi4XqsiV
	LHPf/v7LduFOtDmg96GhXgtELrqbf631COCgu76Ay4xb5h9ibims1fgodv1DGmAey2My1XNTUrSKw
	FsV2UY5aKDC0KMo1HmmsMbaNVGMB2lC6uv/K7GnmmapK8t7yNHza0XjCwOHxfCfsuqkCFZYRA+CZe
	Ri6SA4ET/YRWO80NUb9Lul47dRA6IBbRJwfU6x1oFBsjjV6gTnu0VjEEUSAgHhOWuYbwCanwU4SNY
	Jz6GFngA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnfog-00000008lMe-2rTf;
	Wed, 04 Feb 2026 16:33:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnfod-00000008lLs-2af9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 16:33:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0EC3C4346C;
	Wed,  4 Feb 2026 16:33:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADE50C116C6;
	Wed,  4 Feb 2026 16:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770222796;
	bh=vGUdrP9f8bzyMrk2MhQOk5OCdnX7t/LoR9oHraUNTvs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oUyGXZd7nCw58nsV+VJcuJ9CM9+gbjOJU3fst9huZsh/834chl7BkBj5HPNHFqKfb
	 jDg5wH48KKBHUPkhgHo+Odf0QG0EyF+bjlXCQR7wM9HZeI00Pqxe+5RVUZlhZfQ1Px
	 EwvNOQlLo42iPZECRVvCjNIsflWzbso/dNRe1RLId2oVJ9psUKeIUwdc3TAcMjPuTM
	 F04A2ALyINa9fTVD0/X+L5P+UzjYEU0KmMjTsfhW8bHAvNI+vRxnIckerIGu75/wDz
	 EPVsadjDBXdbxtrwP1yPThPoS9Sda8CmE7xagMaJJrxGBeBVeF0xw/qo/BFzOhdqqq
	 iosHNhxhmZ52g==
Date: Wed, 4 Feb 2026 16:33:10 +0000
From: Simon Horman <horms@kernel.org>
To: Parvathi Pudi <parvathi@couthit.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, danishanwar@ti.com,
	rogerq@kernel.org, pmohan@couthit.com, basharath@couthit.com,
	afd@ti.com, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, alok.a.tiwari@oracle.com,
	pratheesh@ti.com, j-rameshbabu@ti.com, vigneshr@ti.com,
	praneeth@ti.com, srk@ti.com, rogerq@ti.com, krishna@couthit.com,
	mohan@couthit.com
Subject: Re: [PATCH net-next v13 0/3] STP/RSTP SWITCH support for PRU-ICSSM
 Ethernet driver
Message-ID: <aYN0xmOIaHeAvWNI@horms.kernel.org>
References: <20260130124559.1182780-1-parvathi@couthit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260130124559.1182780-1-parvathi@couthit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_083319_694920_A00DCD0F 
X-CRM114-Status: GOOD (  25.69  )
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

On Fri, Jan 30, 2026 at 06:13:42PM +0530, Parvathi Pudi wrote:
> Hi,
> 
> The DUAL-EMAC patch series for Megabit Industrial Communication Sub-system
> (ICSSM), which provides the foundational support for Ethernet functionality
> over PRU-ICSS on the TI SOCs (AM335x, AM437x, and AM57x), was merged into
> net-next recently [1].
> 
> This patch series enhances the PRU-ICSSM Ethernet driver to support bridge
> (STP/RSTP) SWITCH mode, which has been implemented using the "switchdev"
> framework and interacts with the "mstp daemon" for STP and RSTP management
> in userspace.
> 
> When the  SWITCH mode is enabled, forwarding of Ethernet packets using
> either the traditional store-and-forward mechanism or via cut-through is
> offloaded to the two PRU based Ethernet interfaces available within the
> ICSSM. The firmware running on the PRU inspects the bridge port states and
> performs necessary checks before forwarding a packet. This improves the
> overall system performance and significantly reduces the packet forwarding
> latency.
> 
> Protocol switching from Dual-EMAC to bridge (STP/RSTP) SWITCH mode can be
> done as follows.
> 
> Assuming eth2 and eth3 are the two physical ports of the ICSS2 instance:
> 
> >> brctl addbr br0
> >> ip maddr add 01:80:c2:00:00:00 dev br0
> >> ip link set dev br0 address $(cat /sys/class/net/eth2/address)
> >> brctl addif br0 eth2
> >> brctl addif br0 eth3
> >> mstpd
> >> brctl stp br0 on
> # STP to RSTP mode
> >> mstpctl setforcevers br0 rstp
> >> ip link set dev br0 up
> 
> To revert back to the default dual EMAC mode, the steps are as follows:
> 
> >> ip link set dev br0 down
> >> brctl delif br0 eth2
> >> brctl delif br0 eth3
> >> brctl delbr br0
> 
> The patches presented in this series have gone through the patch verification
> tools and no warnings or errors are reported.
> 
> Sample test logs obtained from AM33x, AM43x and AM57x verifying the
> functionality on Linux next kernel are available here:
> 
> [Interface up Testing](https://gist.github.com/ParvathiPudi/91b05f4e6d69d72f55ddd4e95301ab20)
> 
> [Ping Testing](https://gist.github.com/ParvathiPudi/9e7573ea85ef72a3ebcbdb4c902f3b8a)
> 
> [Iperf Testing](https://gist.github.com/ParvathiPudi/30abedf115aba19542e0156486766553)
> 
> [1] https://lore.kernel.org/all/20250912104741.528721-1-parvathi@couthit.com/
> 
> This is the v13 of the patch series [v1]. This version of the patchset
> addresses the comments made on [v12] of the series.
> 
> Changes from v12 to v13:
> 
> *) Reverted the use of kmalloc_obj() and kzalloc_obj() back to kmalloc() and kzalloc(),
> since the corresponding changes are not reflected in the net-next branch.
> *) Addressed AI review warnings on patch 3 of the series.
> *) Rebased the series on latest net-next.

Thanks,

I notice that this series has been marked as Changes Requested in
Patchwork. But overall it looks good to me.

Feel free to add the following for the series:
Reviewed-by: Simon Horman <horms@kernel.org>


