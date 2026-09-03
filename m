Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADE3BC624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 09:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RE0ASB+DdFZ2kYHuMUvbFe6R5K94GkgGPlp796qZCRQ=; b=eNymr/pAl71akTNrGL1hmw6cAg
	mg+UfyxpbH3ODjEHSNGCGcgOfFF9lXDhS0PWO4ReHzBu62TZtQk4CAFIJA+csvUNusSYCrQcBTE6S
	Z/ubPX3PPt0I0q3Ys+TZBzpD7Dtds459xYcalLY/IkCIMqvjpCtRocKO1x0ysqljJKAP40mYSQkoZ
	NnsZ7FwstQAvjHPYqy4mSwCcHp8ic7bfvG9aIXyTgTnFOEtLcaAtrmTSoFouH/h9o6I49UkDdLCS2
	oKOft+L34HbPwjpvRP9QmQNCGqtHuZYFhhN58kLXuTBRPGLskwJsjaLj10W3Jh/vU8krHiS2JAcQS
	cDnbUL4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x23Is-0000000Gs8V-0n8r;
	Thu, 03 Sep 2026 09:00:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x23Ik-0000000Gs5o-3RXu;
	Thu, 03 Sep 2026 09:00:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 203A76022C;
	Thu,  3 Sep 2026 09:00:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE8191F0155A;
	Thu,  3 Sep 2026 09:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788426005;
	bh=RE0ASB+DdFZ2kYHuMUvbFe6R5K94GkgGPlp796qZCRQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BnA8uajd9lyP7thrGqR/vwSIZFCF32l3ok4ysl1WamoE86XDm02l0gGJdxMZ7qxZH
	 qF6rZZHh14j/Z3LYYVPekElmOIYwtQNYRVuVymmcD26eN1wj19fOjl8AQ1NuYMkT8A
	 U1LMF3a0BB8LOSf51ABrPdZR4TZIhOgkGr2v29jkgZXxjOn6iOG/YGE/6iV6GgUBPe
	 jjVZ2fLwVY5GyQtOv8plQfV/vbk5NNfjZMSvUW3NqDo0BZwcGZHOgda4AU+984lLEZ
	 MN9NVrE2fbqVNbIhmyJyv6ARK6a13R31FOpVaLNN/4BmmhXh74MKODsI55dFQXHQIB
	 VV4DxQKOXqyTw==
Date: Thu, 3 Sep 2026 10:00:01 +0100
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev-bot+sashiko@kernel.org, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [net] net: airoha: enable RX_DONE interrupt for RX queue 31
Message-ID: <20260903090001.GI396647@horms.kernel.org>
References: <20260830-airoha-rxdone-rxq31-v1-1-830a91503f2f@kernel.org>
 <178836297161.3394541.17329602881799623239@kernel.org>
 <apig7UCTvWjKmzQB@lore-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <apig7UCTvWjKmzQB@lore-desk>
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

On Thu, Sep 03, 2026 at 12:19:25AM +0200, Lorenzo Bianconi wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential
> > issue(s) to consider:
> > 
> > Critical: 0 · High: 1 · Medium: 0 · Low: 0
> > 
> > - [High] Incomplete fix: the patch only adds BIT(31) to
> >   RX_IRQ1_BANK_PIN_MASK, so the exact defect the commit message…
> > 
> > --
> > 
> > net: airoha: enable RX_DONE interrupt for RX queue 31
> > 
> > This adds BIT(31) to RX_IRQ1_BANK_PIN_MASK so that RX queue 31's RX_DONE
> > interrupt is routed to IRQ bank 1.  The stated goal is that the queue gets
> > drained and its buffers returned to the page pool.
> > 
> > > diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
> > > index fa9a8edce22f..8277c1c87bb3 100644
> > > --- a/drivers/net/ethernet/airoha/airoha_eth.h
> > > +++ b/drivers/net/ethernet/airoha/airoha_eth.h
> > > @@ -538,7 +538,7 @@ struct airoha_wdma_info {
> > >  
> > >  /* RX queue to IRQ mapping: BIT(q) in IRQ(n) */
> > >  #define RX_IRQ0_BANK_PIN_MASK			0x839f
> > > -#define RX_IRQ1_BANK_PIN_MASK			0x7fe00000
> > > +#define RX_IRQ1_BANK_PIN_MASK			0xffe00000
> > >  #define RX_IRQ2_BANK_PIN_MASK			0x20
> > >  #define RX_IRQ3_BANK_PIN_MASK			0x40
> > 
> > [Severity: High]
> > Does this leave the same problem in place for the other RX rings?  After the
> > change the union of the four bank masks is:
> > 
> >   0x839f | 0xffe00000 | 0x20 | 0x40 = 0xffe083ff
> > 
> > so rings 0-9, 15 and 21-31 are covered, but bits 10-14 and 16-20 are still
> > clear in every bank mask.
> 
> Here I wanted just to align to the vendor sdk and enable rx queues 24-31 (31
> was missing) in preparation for HW GRO support. The other rx queues are
> out-of-scope.

Thanks Lorenzo,

Seems reasonable to me.

Reviewed-by: Simon Horman <horms@kernel.org>



