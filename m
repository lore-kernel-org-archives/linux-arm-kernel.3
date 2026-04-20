Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9052EF588D4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 13:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KH4wlOTtaGpAG5J48/iEhjMU1BkjNSldMrsyCHnmmSk=; b=ow0AL502Ute4FX/H+KoVAS6pEp
	qyUT4aYJ0DfuQNZcmH1WbQXDG8L1MWb1gPxvHm2mDSutzaoRdjflgh0gVWVkWImx0aHuQW0nzsh9K
	QWx4vGsKSNOqUVfst3/CRIvuEy/HckXpLvHoaeVJO7Xi1uTlzWmuBLCihrvR2Fd+PP1h0tVVVP/f9
	BoREdpnsHhURKuUQs+63OYdjbYDrTx2CHnmdYHEsmBkPzu51GU2r7DY6NdLBPkBEqjbYTISP6zwun
	eZ/6jMwBeXT3YzlvYaGgDkeFdhYC2L3h1cxDxSB0soBplDPNS1T2/s5KyrO6X8diefBB+vC8O9ZB6
	hEKH93vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEp74-000000077dQ-2gmy;
	Mon, 20 Apr 2026 13:56:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEp71-000000077co-2Ai2;
	Mon, 20 Apr 2026 13:56:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 42C7642D7F;
	Mon, 20 Apr 2026 13:56:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21CB0C19425;
	Mon, 20 Apr 2026 13:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776693390;
	bh=xf0tTaO3Gm8Xjis1WLnRLgpsFcTzaHDM0gKsVSqZMNU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MVl48ex9RER8/JzKxBkveYrE2ellMnaOAMPIczfkVEb1EpZPZgr9KZPsv9HRLl48G
	 QFlUHOAsaIUMvYpd/MPSkBKE+MCj0UCqW7rguc2HCUGkdRWFOES6FiB7jM6pcCYi18
	 IZZG7I+1J+DP9uwF7qeTPJikPlw0G8xmdyIlNDlj+jP75S00I0bKE5p63nvR6Wa7lt
	 1BscwQCskJB2r4C8rsiHiGt5uyW1/2JmDX8nLcahuXa7kIZyF1u9FZB7Aiiw9WqFRZ
	 6hqvpd0UGceMhUMGSNQ6mtb31U4X1Ig26789VT56Y8o72E2Oni9SalLfHss7LdzuVR
	 RjAOnddA/Nyuw==
Date: Mon, 20 Apr 2026 14:56:25 +0100
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net v4 0/2] net: airoha: Fix
 airoha_qdma_cleanup_tx_queue() processing
Message-ID: <20260420135625.GQ280379@horms.kernel.org>
References: <20260417-airoha_qdma_cleanup_tx_queue-fix-net-v4-0-e04bcc2c9642@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260417-airoha_qdma_cleanup_tx_queue-fix-net-v4-0-e04bcc2c9642@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_065631_586162_B0835DB3 
X-CRM114-Status: GOOD (  13.60  )
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

On Fri, Apr 17, 2026 at 08:36:30AM +0200, Lorenzo Bianconi wrote:
> Add missing bits in airoha_qdma_cleanup_tx_queue routine.
> Fix airoha_qdma_cleanup_tx_queue processing errors intorduced in commit
> '3f47e67dff1f7 ("net: airoha: Add the capability to consume out-of-order
> DMA tx descriptors")'.
> 
> ---
> Changes in v4:
> - Drop patch 2/3 to move entries to queue head in case of DMA mapping
>   failure in airoha_dev_xmit().
> - Link to v3: https://lore.kernel.org/r/20260416-airoha_qdma_cleanup_tx_queue-fix-net-v3-0-2b69f5788580@kernel.org
> 
> Changes in v3:
> - Move ndesc initialization fix in a dedicated patch.
> - Add patch 2/3 to move entries to queue head in case of DMA mapping
>   failure in airoha_dev_xmit().
> - Cosmetics.
> - Link to v2: https://lore.kernel.org/r/20260414-airoha_qdma_cleanup_tx_queue-fix-net-v2-1-875de57cc022@kernel.org
> 
> Changes in v2:
> - Move q->ndesc initialization at end of airoha_qdma_init_tx routine in
>   order to avoid any possible NULL pointer dereference in
>   airoha_qdma_cleanup_tx_queue()
> - Check if q->tx_list is empty in airoha_qdma_cleanup_tx_queue()
> - Link to v1: https://lore.kernel.org/r/20260410-airoha_qdma_cleanup_tx_queue-fix-net-v1-1-b7171c8f1e78@kernel.org
> 
> ---
> Lorenzo Bianconi (2):
>       net: airoha: Move ndesc initialization at end of airoha_qdma_init_tx()
>       net: airoha: Add missing bits in airoha_qdma_cleanup_tx_queue()
> 
>  drivers/net/ethernet/airoha/airoha_eth.c | 40 +++++++++++++++++++++++++++-----
>  1 file changed, 34 insertions(+), 6 deletions(-)

Thanks for the updates, this series looks good to me:

Reviewed-by: Simon Horman <horms@kernel.org>


As is the way of things, Sashiko has some feedback on this patchset.
Please consider looking over it for potential follow-up changes.
I do not think that needs to block progress of this patchset.


