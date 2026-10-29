Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16353606A325
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 01:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vbeACTQg;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NZkxNseB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=C+g/wT11APppTzz0f7SFqiBVevvCXND/eQhkE+RuOIo=; b=vbeACTQg1oCar0QLBdz4A8BRsZ
	mG9LVHwdFFv+9FwuZFKa4V3Ccg2Ar9nsFYeyQzg2OM9iOrSGE8G0OrmMFuBbUOnX/lkQpjC8NSBzV
	TtJWKZt73t+9XpJiv4zpuw1w09INiA9kWSoO/h6QRpTnVPsKCRwmycsajUSAnqlPicOeLKRoj8tdU
	Rc/U+miElLTY9TEEQbLX+7hKj1B+K99ziMctwXMBlrKDyrLXISK6npCpU7CZgtepAJXLqWB5Gm/uI
	CVX9x0YdSImEVHjcc6MthBLLPB9PCNfqRE+8bmnKpN37DBQJz1RFE52+iqH6ddfCKeei+J7ZNsvIY
	0srnX3WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMEUx-000000087lY-44bV;
	Thu, 29 Oct 2026 01:00:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMEUp-000000087iE-1Es7;
	Thu, 29 Oct 2026 00:59:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AA1A240E33;
	Thu, 29 Oct 2026 00:59:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B74541F01828;
	Thu, 29 Oct 2026 00:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793235598;
	bh=C+g/wT11APppTzz0f7SFqiBVevvCXND/eQhkE+RuOIo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=NZkxNseBY1JtqdNRyiCxvgJOKzAdzUQps9jKcTtsa5I4Jcj4yuT3pQfhNdlhC2ixm
	 nIAFV5mo+vgiwCY3PQsswiQBrMkx9ZbTl2SGXKBmVQuJrJ1q+4s+bAwU57mn+WlZqt
	 sv8HPHXNnUSEHu8m8EfTFeaoErFs84t5kuk8fSK6VMVNpFpaQdrzZC0Xt5zJX2b+kZ
	 i0AlPqCAnJDSvpswOh4+qvgifbN4rLAuj/5IQwYb+nPwKhd/mDMunOO90oJe3lb8M5
	 Dm/whZeDZrll2dvgakA7iO/yefFtJ7/AiEsd635wyp95WU3TndXVW0e+GTwY0rRUpi
	 h6bNH5Wf1EP/Q==
Subject: Re: [PATCH net v6 4/4] net: ethernet: mtk_wed: setup WDMA_RING_TX(0)
 for non-DBDC MT7986
From: netdev-bot+sashiko@kernel.org
To: hujy652@gmail.com
Cc: nbd@nbd.name, lorenzo@kernel.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 sujuan.chen@mediatek.com, rex.lu@mediatek.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, sashiko-bot@kernel.org
Date: Thu, 29 Oct 2026 00:59:57 +0000
Message-ID: <179323559733.3134.3679438988787780948@kernel.org>
In-Reply-To: <20261026-wedfix-v6-4-a52f6b15d2fc@gmail.com>
References: <20261026-wedfix-v6-4-a52f6b15d2fc@gmail.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The patch adds two early returns to mtk_wed_start() in
  drivers/net/ethernet/mediatek/mtk_wed.c.

--

net: ethernet: mtk_wed: setup WDMA_RING_TX(0) for non-DBDC MT7986

On v2 WED hardware where rx_ring[0] is not allocated (non-DBDC MT7986),
this patch makes mtk_wed_start() program WDMA_RING_TX(0), because WED RX
still sends through that ring. It also adds error messages and early
returns for when the WDMA RX or TX ring setup fails.

> diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethernet/mediatek/mtk_wed.c
> index 3044a7a8ea03e..f40ac5794341c 100644
> --- a/drivers/net/ethernet/mediatek/mtk_wed.c
> +++ b/drivers/net/ethernet/mediatek/mtk_wed.c
> @@ -2345,7 +2345,20 @@ mtk_wed_start(struct mtk_wed_device *dev, u32 irq_mask)
>  
>  	for (i = 0; i < ARRAY_SIZE(dev->rx_wdma); i++)
>  		if (!dev->rx_wdma[i].desc)
> -			mtk_wed_wdma_rx_ring_setup(dev, i, 16, false);
> +			if (mtk_wed_wdma_rx_ring_setup(dev, i, 16, false)) {
> +				dev_err(dev->hw->dev, "wdma rx ring %d setup failed\n", i);
> +				return;
> +			}
> +
> +	/*
> +	 * non-DBDC MT7986 allocates only rx_ring[1] and tx_wdma[1] during setup
> +	 * but tx_wdma[0] is also needed for WED to function.
> +	 */
> +	if (mtk_wed_is_v2(dev->hw) && !dev->rx_ring[0].desc)
> +		if (mtk_wed_wdma_tx_ring_setup(dev, 0, MTK_WED_WDMA_RING_SIZE, !!dev->tx_wdma[0].desc)) {
> +			dev_err(dev->hw->dev, "wdma tx ring 0 setup failed\n");
> +			return;
> +		}

[Severity: Medium]
Can these early returns leave WED half-configured without the caller
noticing?

mtk_wed_start() is static void, and the ops callback is
void (*start)(struct mtk_wed_device *dev, u32 irq_mask), so the error
goes no further than this function.

Both returns happen after mtk_wed_rx_buffer_alloc() has succeeded, and
maybe after some WDMA_RING_RX(i) and MTK_WED_WDMA_RING_RX(i) registers
have been written. They then skip mtk_wed_hw_init(),
mtk_wed_configure_irq(), mtk_wed_set_ext_int(), mtk_wed_dma_enable() and
dev->running = true.

In mt76, mt7915_dma_start() has already written the WED IRQ mask to
MT_INT_MASK_CSR or MT_INT_WED_MASK_CSR. It then continues as if WED were
running:

drivers/net/wireless/mediatek/mt76/mt7915/dma.c:mt7915_dma_start() {
    ...
		mtk_wed_device_start(&dev->mt76.mmio.wed, wed_irq_mask);
	}

	irq_mask = reset ? MT_INT_MCU_CMD : irq_mask;

	mt7915_irq_enable(dev, irq_mask);
	mt7915_irq_disable(dev, 0);

	return 0;
}

mtk_wed_device_active() is just !!(_dev)->ops. So the WLAN driver keeps
sending traffic and IRQ handling through a WED whose DMA was never
enabled, and the only sign is the dev_err in the log. mt7996 calls
mtk_wed_device_start() the same way.

The rx_wdma change also alters behavior that is unrelated to the
WDMA_RING_TX(0) fix. Before this patch, a failed rx_wdma allocation left
only that one WDMA RX ring unprogrammed, and WED still started. Now one
dma_alloc_coherent() failure in mtk_wed_ring_alloc() stops the whole WED
datapath from being enabled.

This can only happen on the first start under allocation failure. SER
restarts reuse the rings that were already allocated.

The commit message says "add error messages and bail when mtk_wed_start
fails". It does not mention that callers cannot see the bail, or that no
state is rolled back.

Would it be better to propagate the error? For example, the start op
could return int and the mt7915/mt7996 dma_start paths could handle the
failure. Another option is to fall back to non-WED operation.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261026-wedfix-v6-0-a52f6b15d2fc%40gmail.com

