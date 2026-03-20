Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3096109318E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 08:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qXG8BAgH6blcllbAK08/5QVe84xrvs515ihEMjIbAPQ=; b=ZM/QoLkHEmwNSfgurAuR7DW/GN
	FlYWLmSMT+oNDaYVypGWHdUBzB6AArpU2GDJX0WBB1/8IpuQ6Y/RPk+o9DnYLddMsjqUOYD5jrVD+
	3ONjS5YwUGGXHNdC/gWbCp7I1874EnfivGi/59Rj7+B+ERDB+nbT7b73hDUnHHTeAsiNSLWmfCVoX
	ag6w7LlGb8mZNnGFplLXcCtI/Ot17sCFd8Q0kVYGNs7GEAqJILIizjtYrlIygxfcDZfqG/JKOHMA3
	FGEOQV6obrgQhMwsHMlE0CaQFZajTrgT9/2j75v+aBXydcYMQD9SLZr7C1TlERPrVpqzqQ5urAqnh
	MplueX3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VKs-0000000CMgs-0EAf;
	Fri, 20 Mar 2026 08:36:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VKp-0000000CMgj-2xjb;
	Fri, 20 Mar 2026 08:36:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BF06F60121;
	Fri, 20 Mar 2026 08:35:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4C5BC2BCAF;
	Fri, 20 Mar 2026 08:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773995758;
	bh=EXYMoywbEg6I7ipMKu2B+8UWo6AsK3Ubq2SrweO67HA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jvuq5Xp6UseMUOiaEpPby4k95jxighut/b4DZJTsuIwWnYgTLOvL0TQjn2MzwgcZF
	 hX28dbGQb0hcuVyKHgoN3lb9yVlMlyxeVfuyOZhGBJb0OW5UGQ0clrbWZvBGLRDVt4
	 OMtDfW3MNrO9ucsDZXekMlHrKzRvrMm6WPpfLRqSXAA4+wX0jWYNdYfHB6VBq1wqEE
	 +RhpJ+UWkuKqYbwB7BlLYdt0Nx2PpmrFtFmUWJ0Pibig+cHLF6UXOWsWQ1r8DlSu2x
	 x4+WIqhoOd+XXxTSlQNK89qR2ubrZyjMNx8G9f0lhyug9OANWpYKlKrv3dWWB6u41b
	 rJx34QdM0kM7g==
Date: Fri, 20 Mar 2026 08:35:54 +0000
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next] net: airoha: Reset PPE cpu port configuration
 in airoha_ppe_hw_init()
Message-ID: <20260320083554.GB1753385@horms.kernel.org>
References: <20260317-airoha-fix-ppe-def-cpu-v1-1-338533d8e234@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317-airoha-fix-ppe-def-cpu-v1-1-338533d8e234@kernel.org>
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

On Tue, Mar 17, 2026 at 05:40:47PM +0100, Lorenzo Bianconi wrote:
> Before this patch, the PPE cpu port configuration used for a specific GDM
> device was set just running ndo_init() callback during the device
> initialization. The selected PPE cpu port configuration depends on the QDMA
> block assigned to the GDM port. The QDMA block is selected according to
> the GDM port LAN/WAN configuration as specified in the commit
> '8737d7194d6d ("net: airoha: select QDMA block according LAN/WAN
> configuration"). However, the user selected PPE cpu port configuration can
> be different with respect to the one hardcoded in the NPU firmware binary.
> The hardcoded NPU PPE cpu port configuration is loaded initializing the PPE
> engine running the NPU ops ppe_init() callback in airoha_ppe_offload_setup
> routine (this is executed at runtime by the netfilter flowtable
> infrastructure during flow offloading).
> Reset the PPE cpu port configuration in airoha_ppe_hw_init routine in
> order to apply the user requested setup according to the device DTS.
> Please note this patch is fixing an issue not visible to the user (so we
> do not need to backport it) since airoha_eth driver currently supports just
> the internal phy available via the MT7530 DSA switch and there are no WAN
> interfaces officially supported since PCS/external phy is not merged
> mainline yet (it will be posted with following patches).
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Hi Lorenzo,

Thanks for the detailed commit message.

Reviewed-by: Simon Horman <horms@kernel.org>

