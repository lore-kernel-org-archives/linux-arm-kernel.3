Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C152606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 22:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DpLDb71K;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j+xRvqpw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4wNHCh54AAWOk3FutPjsVsjqvlf9bK+9IRjfMX0W13o=; b=DpLDb71K31XIUIBp+LbVuX+eQo
	NHZJulmfdwp8/ykyD2WvDYhXflaPwbflwqvAXIDl7nAIrIeNIHebd/wod4r1IKK+c0slyJ/YM+PY/
	1NCXZOsUCWgLPqUlTWs3i11ld3SaE5go98zvpCHI8X3JHHj+12sqcFxWvjg5dvPG2LLubAbXRBtBk
	LjunNF55dTAy3lO4cJWqrVuOyhl9uUdGKgccgXBDsiKgWv/ikxPXd/O0pI2xC6YF0ouXVvdnIvekk
	bvvtOBL8BUBmK8axJgbf74JF7n7AAzDusxkBLDTtEdveHNietGPT+CL30WwCTzlMouI+8nJW62y7p
	4wqzIS2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKNxo-0000000H3is-2pbz;
	Fri, 23 Oct 2026 22:42:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKNxe-0000000H3h4-49FP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 22:42:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6E9D96022C;
	Fri, 23 Oct 2026 22:42:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46AEA1F01828;
	Fri, 23 Oct 2026 22:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792795326;
	bh=4wNHCh54AAWOk3FutPjsVsjqvlf9bK+9IRjfMX0W13o=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=j+xRvqpwXo3YV5EnvWdCGlSJRFzPk5JZV6B4fEY1aVhn/OPu3YsMhudVEiorvn60N
	 xS9ckhoBCEfM6RN7xqzWydG/Q2wmeKP8/Wi/B1gWO/zF8aAJkUmFAZ/q/bYKpkm/3/
	 tYdNNtPsFfXt/csyhsM4JAYZ5+wKAZ+zPbn67IJwq9FPfyQZ/FTwMYkfYpkuwzcR2/
	 obSzLhxrzBIxPN/ZyrVYYgnOuEhLOurWJXaaiN6dRXAo6tMQr5eGuOaKBGbSGJtUVi
	 602FW790balM50S54Anu4h0yC74XyEBYBKuGKWE14+h+cH1Pe+oHCHWArAO0Ox9G9W
	 c9D+3u0HoyujQ==
Subject: Re: [PATCH net 3/3] net: stmmac: dwmac1000: stop hardware from
 dropping checksum-error packets
From: netdev-bot+sashiko@kernel.org
To: opensource@grische.xyz
Cc: netdev@vger.kernel.org, maxime.chevallier@bootlin.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, o.rempel@pengutronix.de,
 stable@vger.kernel.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, aaro.koskinen@nokia.com,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Fri, 23 Oct 2026 22:42:04 +0000
Message-ID: <179279532482.3134.8732796861806998047@kernel.org>
In-Reply-To: <20261020190319.884375-4-opensource@grische.xyz>
References: <20261020190319.884375-4-opensource@grische.xyz>
X-sashiko-severity: High
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
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 0 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] dwmac1000_dma_operation_mode_rx() now sets CSR6.DT
  (DMA_CONTROL_DT) on every dwmac1000 core, whichever descriptor format…

--

net: stmmac: dwmac1000: stop hardware from dropping checksum-error packets

This patch sets DMA_CONTROL_DT in dwmac1000_dma_operation_mode_rx(). With
that bit set, the dwmac1000 MAC hands up frames that fail the Rx checksum
offload check instead of dropping them. The aim is to make VXLAN over IPv6
with zero UDP checksums work, with the driver marking those frames
CHECKSUM_NONE.

Link: https://lore.kernel.org/all/20250625132117.1b3264e8@kernel.org/
Link: https://github.com/freifunk-gluon/gluon/issues/3783

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_dma.c
> index 3ac7a7949529c..00c8d4dfb553b 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_dma.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_dma.c
> @@ -129,6 +129,8 @@ static void dwmac1000_dma_operation_mode_rx(struct stmmac_priv *priv,
>  {
>  	u32 csr6 = readl(ioaddr + DMA_CHAN_CONTROL(channel));
>  
> +	csr6 |= DMA_CONTROL_DT;

[Severity: High]
Does this work on dwmac1000 cores that use normal descriptors?

DT is now set no matter which descriptor format is in use. Only the
enhanced descriptor parser turns checksum-only errors into csum_none, via
enh_desc_get_rx_status()->enh_desc_coe_rdes0().

stmmac_hw_init() reads enh_desc and rx_coe from separate HW capability
bits:

    priv->plat->enh_desc = priv->dma_cap.enh_desc;
    ...
    if (priv->dma_cap.rx_coe_type2)
        priv->plat->rx_coe = STMMAC_RX_COE_TYPE2;

stmmac_dwmac1_quirks() then picks ndesc_ops whenever enh_desc is 0. So the
driver allows a core with normal descriptors and Type-2 Rx COE.

ndesc_get_rx_status() can only return good_frame or discard_frame. It
never sets csum_none, and nothing in the driver checks
RDES0_PAYLOAD_CSUM_ERR from descs.h:

    if (unlikely(rdes0 & RDES0_ERROR_SUMMARY)) {
        ...
        if (unlikely(rdes0 & RDES0_IPC_CSUM_ERROR))
            x->ipc_csum_error++;
        ...
        ret = discard_frame;
    }

If ES is set for the checksum error, stmmac_rx() now drops the frame in
software and counts it as an rx error. Wouldn't VXLAN over IPv6 with zero
UDP checksums still be broken on these cores?

The comment in enh_desc_get_rx_status() says the databook does not
require ES for payload-only checksum errors. If ES is clear in that case,
ndesc_get_rx_status() returns good_frame, and stmmac_rx() does:

    if (unlikely(!coe) || !stmmac_has_ip_ethertype(skb) ||
        (status & csum_none))
        skb_checksum_none_assert(skb);
    else
        skb->ip_summed = CHECKSUM_UNNECESSARY;

Could a frame with a bad L4 checksum, which the hardware used to drop, now
reach the stack marked CHECKSUM_UNNECESSARY?

Either way, this part of the commit message would not hold for normal
descriptors:

  "CoE remains enabled, so the driver still sees the error status and
   marks the skb CHECKSUM_NONE for the stack to verify."

Would it make sense to set DT only when enhanced descriptors are in use,
or to make ndesc_get_rx_status() report csum_none for checksum errors?

> +
>  	if (mode == SF_DMA_MODE) {
>  		pr_debug("GMAC: enable RX store and forward mode\n");
>  		csr6 |= DMA_CONTROL_RSF | DMA_CONTROL_DFF;

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261020190319.884375-1-opensource%40grische.xyz

