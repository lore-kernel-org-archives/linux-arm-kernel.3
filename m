Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ED41C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 15:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ff2cdz7fwsnmaf5KnGrXuakUCkPe3sYFjYXAWGmfpeY=; b=IKC/6dgrHDw+ZlkZD6Fd6DpgAI
	99TZ9n89O3ycoGghmUXS54EPYloAT2uNtdIBaFGpcJYzOFULhcKKnvFpylZKbDfZoFwL1ycgPfyHy
	cQ0+GcL9tKCYSIWkbKQQA5wfGSdNG/IM1IRe3IfHEjWzRvDvdr/TzTXKCAxQlIn0g1xRyOsyW+3nO
	NtWkkl1oeV69vDc95s05p11smZ3R88j7VSVRhL6s4huo4nxmMzWLyQAqfIbR2PtX3C0cyHffvxywd
	m4uPGskV+pNpP7bp1KQDbHmh6gqyUSLJ4qniUsaJDGLCciHb1R97wM15uLmzn+gUGDm550ltlKgpi
	wLYWz1LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1mu6-0000000F5LL-2c42;
	Wed, 02 Sep 2026 15:29:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1mu5-0000000F5KK-0lI7;
	Wed, 02 Sep 2026 15:29:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 99C1141A43;
	Wed,  2 Sep 2026 15:29:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 129811F000E9;
	Wed,  2 Sep 2026 15:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788362972;
	bh=Ff2cdz7fwsnmaf5KnGrXuakUCkPe3sYFjYXAWGmfpeY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=bUGCUKKRkcJPHetPZa+L66yEfGL+46CFIZch73+KGdZyPDdx1xKywZq6tZ0Gq/hFW
	 QAJcuIzfVEhC00eV2rvSi0af3CnILBoVyBFD9KARRZ0zl/09LEEh8LYRpBvStE+XVO
	 PSCfX4TKTrnKhvICHIelEYE4e4V6b35GX7/rc3Qf8/0BDuziJfQu7GgshkuS+bc5DD
	 pbJYzjeZPqy3AHvRzDf9Q14/NFBimzmgCTBY7g6uLdii87SU6lno/phIvUgi59qATa
	 NhYbAGbTwVYhb+n0WPL+cwXUmnBO7w4yW9LFv1kr3ydGYeMyXRnpUQG2cJ8ghIGGP6
	 vMaOOOshw8M8g==
Subject: Re: [net] net: airoha: enable RX_DONE interrupt for RX queue 31
From: netdev-bot+sashiko@kernel.org
To: lorenzo@kernel.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Date: Wed, 02 Sep 2026 15:29:31 +0000
Message-ID: <178836297161.3394541.17329602881799623239@kernel.org>
In-Reply-To: <20260830-airoha-rxdone-rxq31-v1-1-830a91503f2f@kernel.org>
References: <20260830-airoha-rxdone-rxq31-v1-1-830a91503f2f@kernel.org>
X-sashiko-severity: High
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider:

Critical: 0 · High: 1 · Medium: 0 · Low: 0

- [High] Incomplete fix: the patch only adds BIT(31) to
  RX_IRQ1_BANK_PIN_MASK, so the exact defect the commit message…

--

net: airoha: enable RX_DONE interrupt for RX queue 31

This adds BIT(31) to RX_IRQ1_BANK_PIN_MASK so that RX queue 31's RX_DONE
interrupt is routed to IRQ bank 1.  The stated goal is that the queue gets
drained and its buffers returned to the page pool.

> diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
> index fa9a8edce22f..8277c1c87bb3 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.h
> +++ b/drivers/net/ethernet/airoha/airoha_eth.h
> @@ -538,7 +538,7 @@ struct airoha_wdma_info {
>  
>  /* RX queue to IRQ mapping: BIT(q) in IRQ(n) */
>  #define RX_IRQ0_BANK_PIN_MASK			0x839f
> -#define RX_IRQ1_BANK_PIN_MASK			0x7fe00000
> +#define RX_IRQ1_BANK_PIN_MASK			0xffe00000
>  #define RX_IRQ2_BANK_PIN_MASK			0x20
>  #define RX_IRQ3_BANK_PIN_MASK			0x40

[Severity: High]
Does this leave the same problem in place for the other RX rings?  After the
change the union of the four bank masks is:

  0x839f | 0xffe00000 | 0x20 | 0x40 = 0xffe083ff

so rings 0-9, 15 and 21-31 are covered, but bits 10-14 and 16-20 are still
clear in every bank mask.

Those rings are still allocated and filled, because airoha_qdma_init_rx() in
drivers/net/ethernet/airoha/airoha_eth.c gates only on RX_DONE_INT_MASK:

	if (!(RX_DONE_INT_MASK & BIT(i))) {
		/* rx-queue not binded to irq */
		continue;
	}

	err = airoha_qdma_init_rx_queue(&qdma->q_rx[i], qdma,
					RX_DSCP_NUM(i));

and in drivers/net/ethernet/airoha/airoha_regs.h RX_DONE_INT_MASK expands to
0xffffffff:

	#define RX_DONE_HIGH_OFFSET	fls(RX_DONE_HIGH_INT_MASK)
	#define RX_DONE_INT_MASK	\
		((RX_DONE_HIGH_INT_MASK << RX_DONE_HIGH_OFFSET) | RX_DONE_LOW_INT_MASK)

with RX_DONE_HIGH_INT_MASK and RX_DONE_LOW_INT_MASK both 0xffff.  So the
"rx-queue not binded to irq" comment filters nothing and all 32 rings get
programmed into hardware and filled from the page pool.

Meanwhile airoha_qdma_hw_init() only unmasks RX_DONE according to the pin
masks:

	airoha_qdma_irq_enable(&qdma->irq_banks[i], QDMA_INT_REG_IDX1,
			       INT_RX1_MASK(RX_IRQ_BANK_PIN_MASK(i)));
	airoha_qdma_irq_enable(&qdma->irq_banks[i], QDMA_INT_REG_IDX2,
			       INT_RX2_MASK(RX_IRQ_BANK_PIN_MASK(i)));

and airoha_qdma_rx_napi_poll() re-arms through the same mask:

	for (i = 0; i < ARRAY_SIZE(qdma->irq_banks); i++) {
		if (!(BIT(qid) & RX_IRQ_BANK_PIN_MASK(i)))
			continue;

Since rx_intr_mask in airoha_irq_handler() comes from the per-bank irqmask,
rings 10-14 and 16-20 are never passed to napi_schedule(), so
airoha_qdma_rx_process() never runs for them and their buffers stay pinned
from probe until airoha_qdma_cleanup_rx_queue().  Is that not exactly the
behaviour the commit message describes as a bug for ring 31?

Ring 11 stands out here, since RX_DSCP_NUM() gives it 128 descriptors, the
same as rings 2 and 15 which are mapped to bank 0:

	#define RX_DSCP_NUM(_n)			\
		((_n) ==  2 ? 128 :		\
		 (_n) == 11 ? 128 :		\
		 (_n) == 15 ? 128 :		\
		 (_n) ==  0 ? 1024 : 16)

while BIT(11) is absent from all pin masks, and the ring this patch enables
(31) uses the default 16 descriptors.

Would it make sense to give airoha_qdma_init_rx() and the pin masks a single
source of truth, either by having the masks cover every ring init_rx arms, or
by having init_rx key off RX_IRQ_BANK_PIN_MASK()?

Alternatively, if the sparse mapping is deliberate and those rings are simply
unused by the hardware configuration, does the justification given for
BIT(31) still hold?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260830-airoha-rxdone-rxq31-v1-1-830a91503f2f%40kernel.org

