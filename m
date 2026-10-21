Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E01606A325
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 11:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=immnOaaU;
	dkim=pass (2048-bit key, unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=QNZESh2G
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d2cc9KiUyx9GC+3ji9GNJpWFlCn58nYagXjcpo0HDLA=; b=immnOaaU/82wWtUwbT9TfE45wm
	gwmm0Jxs/EnwRe9oTRAy7edLG/clt2dKrt0iihWspew/v0V37xbirmEoeRONo/2urzYnZ47NE8GuD
	uOwHWxeZ8lx7fkBip/bdSVI0RB2rDEbEEc3crt2KgjNzkFAn11/78HTAOh+aFl1I39XPc03N6HfZq
	el+s0RyoQbHwxgDp1LQAH4rP8Cu19hgehpW/DXDFdQiY/KXOg/Eh3EKUEzBcwlINpk9JvkK85O8Tm
	+mjM28QfgPwk8dkoWTC6tquFihvc+Pmznu8slloyC32FVnFHAgR0UNOoCvFcHvL1GJYJnNiK5LiDd
	uB2eu3cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJUMu-0000000BiNd-1GJO;
	Wed, 21 Oct 2026 11:20:28 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJUMr-0000000BiN4-1HVU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 11:20:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1792581631; x=1824117631;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=fxyvfq7G7wK3zgtXtaLM2M/67lLiOjmYEHf/dJdUy5I=;
  b=QNZESh2G0hH4/4pRDeorb1i3Y0yGGFgF26uJIrasj5sXMQvv60nshipA
   3hXA4yqmUY6UooR6FYHW2L267peFafwnhPTHllvAPWn4caV38CGxCMpk9
   nk5//AVZo3Q1cj3c70XaEDCsX/JDY30oMf29PY0Uj7BtgxNHpsVpJ2xY8
   yLqwtb0pmyScdLvMWWexa2VhOsSEsIdo1WI7QAGqFGUsStlMshq/SZVb9
   zTNCcpyk0UntBhT7WoySD8tWErit931eBWq8ran1CPsoEXAiClxjV+IIE
   tpysX2aY4rjobZwB1edU/ucVMkcv4b4WYy/5z2PvC+prQqG4KxR8ZMlU5
   Q==;
X-CSE-ConnectionGUID: iGSs+gUcQAO0mntE7JBVHw==
X-CSE-MsgGUID: zIJmC+WlTvC7Bkp4sT2dRQ==
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="64407280"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 04:20:30 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.49; Wed, 21 Oct 2026 04:20:23 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Wed, 21 Oct 2026 04:20:21 -0700
Date: Wed, 21 Oct 2026 13:20:20 +0200
From: Daniel Machon <daniel.machon@microchip.com>
To: <netdev-bot+sashiko@kernel.org>
CC: <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@kernel.org>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <Steen.Hegelund@microchip.com>,
	<UNGLinuxDriver@microchip.com>, <jensemil.schulzostergaard@microchip.com>,
	<horatiu.vultur@microchip.com>, <netdev@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net] net: sparx5: don't reuse the last DCB in fdma xmit
Message-ID: <20261021112020.q5zk2xs6bvstqcue@DEN-DL-M70577.microsemi.net>
References: <20261020-sparx5-fdma-last-dcb-v1-1-fb9a956196dd@microchip.com>
 <179257635682.3135.3561272765367316822@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <179257635682.3135.3561272765367316822@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_042025_633148_51FD1281 
X-CRM114-Status: GOOD (  39.35  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
> 
> Critical: 0 (1) · High: 1 · Medium: 0 · Low: 0
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [High] net: sparx5: unguarded fdma_dcb_advance() in sparx5_fdma_xmit()
>   breaks tx ring
> 
> Pre-existing issues:
> - [Critical] This problem wasn't introduced by this patch, but the patch
>   adds a new way to reach it.
> 
> --
> 
> net: sparx5: don't reuse the last DCB in fdma xmit
> 
> This patch adds a check to sparx5_fdma_xmit() so it rejects the next tx
> DCB when that DCB is fdma->last_dcb. This uses the same !fdma_is_last()
> guard as lan966x and lan969x, so the tail of the chain is never re-added
> and the frame is not lost.
> 
> > diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c b/drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c
> > index dbe86f937b21..221b2f1932f6 100644
> > --- a/drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c
> > +++ b/drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c
> > @@ -218,7 +218,8 @@ int sparx5_fdma_xmit(struct sparx5 *sparx5, u32 *ifh, struct sk_buff *skb,
> >       void *virt_addr;
> >
> >       fdma_dcb_advance(fdma);
> > -     if (!fdma_db_is_done(fdma_db_get(fdma, fdma->dcb_index, 0)))
> > +     if (!fdma_db_is_done(fdma_db_get(fdma, fdma->dcb_index, 0)) ||
> > +         fdma_is_last(fdma, fdma_dcb_next_get(fdma)))
> >               return -EINVAL;
> 
> [Severity: High]
> Does this fully fix the drift described in the commit message? The
> underlying problem looks like it is still there: fdma_dcb_advance() runs
> before the done check, and fdma->dcb_index is not restored when
> sparx5_fdma_xmit() returns -EINVAL. The new fdma_is_last() test only
> covers the moment dcb_index lands exactly on last_dcb.
> 
> When the ring is full, a failed xmit leaves dcb_index on the oldest
> in-flight DCB. The next call advances again before checking anything,
> so if the FDMA has completed that DCB in the meantime it is skipped and
> we test a newer DCB that is still in flight. Each failure moves
> dcb_index one step further, so a burst can keep dropping frames while
> completed DCBs sit unused behind dcb_index.
> 
> If dcb_index ends up just behind last_dcb and the FDMA then drains the
> chain, every DCB is done and the ring is idle. The next xmit advances
> onto last_dcb, hits the new fdma_is_last() check and returns -EINVAL,
> which sparx5_port_xmit_impl() treats as a drop:
> 
>         if (ret == -EBUSY)
>                 goto busy;
>         if (ret < 0)
>                 goto drop;
> 
> The lost frame becomes a counted drop, but it is still a drop on an
> empty ring. lan966x_fdma_get_next_dcb() and lan969x_fdma_get_next_dcb()
> don't hit this because they use !fdma_is_last() inside a loop over all
> DCBs and pick another free one, rather than failing on a single index.
> 
> The previous tail is also still unsafe. Say the FDMA has halted on
> last_dcb at index L and dcb_index is at L - 2. The first frame advances
> to L - 1, which is done and not last, so it is linked from
> dcbs[L].nextptr and becomes the new last_dcb. __fdma_dcb_add() does not
> clear the done bit on dcbs[L], so if a second frame comes in before the
> FDMA has fetched dcbs[L].nextptr after the reload, it advances onto L,
> which is still done and no longer last. Re-adding it rewrites
> dcbs[L].nextptr to FDMA_DCB_INVALID_DATA, so dcbs[L - 1] is cut out of
> the chain. Its frame is lost, and since the FDMA never visits it again
> its done bit stays clear, so later xmits that land on it fail too.
> 
> The drift itself dates back to f4aa7e361ae2, but since this patch is
> meant to fix it, would it be cleaner to fix it at the source, by only
> committing the dcb_index advance once the DCB has been accepted (or
> rolling it back on failure)? Then dcb_index always follows last_dcb,
> the next DCB is always the oldest one, and the fdma_is_last() check
> should not be needed. Alternatively, sparx5 could search the ring the
> way lan969x_fdma_get_next_dcb() does.
>

The drift is pre-existing and not what I intended to fix. That said, I think I
can fix both with a simple change where the ring index is computed from the last
index instead.

pw-bot: cr


