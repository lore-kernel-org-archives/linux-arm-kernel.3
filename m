Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6EAEF8A176
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 13:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pMj5pQuZ6VDOT5R097z4wZeimxAE2fHt8ObaXpvsvUE=; b=D4NGxGswzV43fR9Hgx7HS0D7aB
	nQak+VAM5+sGxOWEmc9in5y3bpNGNzMNK2+Z/lYK9MJJUP99WrcCtkORQRnw92R2v1R2t7kyqdcst
	J+HrZPALGcPeVbpC/YgbgdENRjn70i4cLBQSeb2/f9BkXp5ixuIAGBdLkncLUlptl37SOvWbo6klp
	mim5pqtb0YbQcQr1+z0RLRaSQACkxsX3DoljGX2xXkm5tudLfl+HE0RZSGlVtGJ336eVOpKIGUSRy
	D/AKVuYpyFasyKJFQ0HvSddACiKT8e19dIluUxRS+Jw9i6TT/FiV4JeJC/Y/xqQxNlvrLmah4qTdv
	3JWcGGrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDMn1-00000002VAn-1BE4;
	Thu, 16 Apr 2026 13:29:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDMmz-00000002VAc-2b7g;
	Thu, 16 Apr 2026 13:29:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F0E5860127;
	Thu, 16 Apr 2026 13:29:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8B0CC2BCAF;
	Thu, 16 Apr 2026 13:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776346188;
	bh=TD0UVB4QDOczS9ajeE/KW9nzXJ9QMZAv+muPY3AVbBk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ooFmWVoyjulIZ/2UdJhww0q8nlp7Uhqr1hnAlDc/yFgA3h/6B9xUU6Jjl/rCmbUlN
	 wFzZ1USo3eG1YUV8iaCJkmeKm+9Kiv79TP+4rmyp730Jh28nLW+ThOzxq0kJHFFKJw
	 Tl/L0DwZEjdYM3N8Ih037NVaBnbPmADeidO1LupkcFmQayZ1VxGmVrzcrcAltMxyyB
	 duwh0wznpmn8OiDYuDGHQ57E8X2IKTDvAKv/oDU/RwPA29tHtRJJIHkefEH1UqtkRF
	 22Fz3KLFlBa8aKbyOsbGqm0UOSAEsNuiWOn0TL84kU0KQyvXmMKQWHpte8CGk4efva
	 x11wXirEycBmw==
Date: Thu, 16 Apr 2026 14:29:44 +0100
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net v2] net: airoha: Add missing bits in
 airoha_qdma_cleanup_tx_queue()
Message-ID: <20260416132944.GA863718@horms.kernel.org>
References: <20260414-airoha_qdma_cleanup_tx_queue-fix-net-v2-1-875de57cc022@kernel.org>
 <20260415164643.GQ772670@horms.kernel.org>
 <ad_DrrC6duye_lR0@lore-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad_DrrC6duye_lR0@lore-desk>
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

On Wed, Apr 15, 2026 at 06:58:22PM +0200, Lorenzo Bianconi wrote:
> On Apr 15, Simon Horman wrote:
> > On Tue, Apr 14, 2026 at 08:50:52AM +0200, Lorenzo Bianconi wrote:
> > > Similar to airoha_qdma_cleanup_rx_queue(), reset DMA TX descriptors in
> > > airoha_qdma_cleanup_tx_queue routine. Moreover, reset TX_DMA_IDX to
> > > TX_CPU_IDX to notify the NIC the QDMA TX ring is empty.
> > > 
> > > Fixes: 23020f0493270 ("net: airoha: Introduce ethernet support for EN7581 SoC")
> > > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > > ---
> > > Changes in v2:
> > > - Move q->ndesc initialization at end of airoha_qdma_init_tx routine in
> > >   order to avoid any possible NULL pointer dereference in
> > >   airoha_qdma_cleanup_tx_queue()
> > 
> > This seems to be a separate issue.
> > If so, I think it should be split out into a separate patch.
> > 
> > > - Check if q->tx_list is empty in airoha_qdma_cleanup_tx_queue()
> > > - Link to v1: https://lore.kernel.org/r/20260410-airoha_qdma_cleanup_tx_queue-fix-net-v1-1-b7171c8f1e78@kernel.org
> > 
> > I think it was covered in the review Jakub forwarded for v1.  But FTR,
> > Sashiko has some feedback on this patch in the form of an existing bug
> > (that should almost certainly be handled separately from this patch).
> 
> Hi Simon,
> 
> I took a look to the Sashiko's report [0] but this issue is not introduced by
> this patch and, even if it would be a better approach, I guess the hw is
> capable of managing out-of-order TX descriptors. So I guess this patch is fine
> in this way, agree?
> 
> [0] https://sashiko.dev/#/patchset/20260414-airoha_qdma_cleanup_tx_queue-fix-net-v2-1-875de57cc022%40kernel.org

Hi Lorenzo,

You responded in a different sub thread, so I think this is probably
implied. But FTR:

1. I agree [0] is not introduced by this patch
2. If the hw is capable of managing TX descriptors then
   I think that [0] is a false positive

Regardless, [0] doesn't effect this patch.

