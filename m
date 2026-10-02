Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBD9FCA5FD9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 07:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cCVA2bphe9rgIaAkbT8Wl6DzYThQJL8+2Cs7Ytb8KGI=; b=1OfQVt1B4zngXHExonZVBFMUB9
	ei90Moe9LZgiNgFIFNomWRkPuUnyaCF9uubNjz08ry6sJBxBDaD7fj1Hr4c4d8vsNvGCNFZIaLkyW
	0SB+2yS5nYFKp3mcfyQzmszzTMuUCh574XQT1fjYK1HMxVP2QpqRsqGoM1zlbw2yDl4nfTexDEfvk
	2NYrDHQBFtTNQOjfaigKf3WcuBgyDLqHZICj0aaqts1jtGA72bW9wjccU7JdPU07FTDTLIkhDTjiY
	ZLcDfnpTFTX0IJYri7vLNM9JMH1WDuaMKwg0UsSbULUqBpv61GAxWWHVadQQpdSS3Bt9Zssme1ew9
	6qCfWNrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCXly-0000000ApsI-0qsp;
	Fri, 02 Oct 2026 07:33:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCXlw-0000000Aps2-3mY5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 07:33:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E929060A5F;
	Fri,  2 Oct 2026 07:33:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 544F01F000FF;
	Fri,  2 Oct 2026 07:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790926415;
	bh=cCVA2bphe9rgIaAkbT8Wl6DzYThQJL8+2Cs7Ytb8KGI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=HkDRbHYwFcy0jd7FZj8ra4WYZUhLGRjebT/KamkCt1t2y85ksNQuN8yMK3JFvGo1d
	 Js2UfJbNq185oy2eZ+WLw9igoTtC6Qs3UXA7C31Udy000Rt8zXDVOi9j8J+AZ9wsWp
	 pIOJMy5mCXF0OffFLvCWIV4y4vWNtzL9Ilj8X38vF4cTcAK0aIYOv4vJTHg3+uiXLa
	 M1fna2or2zC+qIxEw9Mslvvoz0Mn/nNQPJRTeyfYoa/j23JI1P8CpP6lPRuG/wLt1v
	 S1ILz9zX4N2+VUfnWSwiSV2aG5Htr/x0AirEOjGftXkK8BOU4EKcHtG+83yJxEw/uY
	 lGbO+faFz4f/w==
Subject: Re: [PATCH net-next v9 03/15] net: microchip: fdma: add PCIe ATU support
From: netdev-bot+sashiko@kernel.org
To: daniel.machon@microchip.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horatiu.vultur@microchip.com,
 steen.hegelund@microchip.com, UNGLinuxDriver@microchip.com, ast@kernel.org,
 daniel@iogearbox.net, hawk@kernel.org, john.fastabend@gmail.com,
 sdf@fomichev.me, herve.codina@bootlin.com, arnd@arndb.de,
 gregkh@linuxfoundation.org, mohsin.bashr@gmail.com, horms@kernel.org,
 richardcochran@gmail.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Date: Fri, 02 Oct 2026 07:33:33 +0000
Message-ID: <179092641379.434549.2030178310971788784@kernel.org>
In-Reply-To: <20260928-lan966x-pci-fdma-v9-3-a17caf60f89a@microchip.com>
References: <20260928-lan966x-pci-fdma-v9-3-a17caf60f89a@microchip.com>
X-sashiko-severity: Low
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

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] fdma_pci_atu_region_map() in
  drivers/net/ethernet/microchip/fdma/fdma_pci.c is exported.
- [Low] The alignment comment in fdma_pci_atu_region_map()
  (drivers/net/ethernet/microchip/fdma/fdma_pci.c, lines 151-155) says…
- [Low] fdma_pci_atu_region_enable() writes REGION_CTRL2 = BIT(31) with a
  single posted writel().
- [Low] fdma_pci_atu_configure_translation() programs LOWER/UPPER_BASE,
  LIMIT and LOWER/UPPER_TARGET, and fdma_pci_atu_init() only clears…

--

net: microchip: fdma: add PCIe ATU support

This commit adds PCIe ATU outbound window support to the Microchip FDMA
library. When the switch runs as a PCIe endpoint, the lan966x (and later
lan969x) FDMA engine can then reach host memory. The outbound space is
split into six regions, and new helpers combine a coherent DMA allocation
with claiming and programming a region, padding the allocation to the
64KB ATU granularity.

> diff --git a/drivers/net/ethernet/microchip/fdma/fdma_pci.c b/drivers/net/ethernet/microchip/fdma/fdma_pci.c
> new file mode 100644
> index 000000000000..dd1dc46cbc9d
> --- /dev/null
> +++ b/drivers/net/ethernet/microchip/fdma/fdma_pci.c

[ ... ]

> +/* Configure the address translation in the ATU. */
> +static void
> +fdma_pci_atu_configure_translation(struct fdma_pci_atu_region *region)
> +{
> +	struct fdma_pci_atu *atu = region->atu;
> +	int idx = region->idx;
> +
> +	writel(lower_32_bits(region->base_addr),
> +	       fdma_pci_atu_addr_get(atu->addr,
> +				     FDMA_PCI_ATU_LWR_BASE_ADDR, idx));
> +
> +	writel(upper_32_bits(region->base_addr),
> +	       fdma_pci_atu_addr_get(atu->addr,
> +				     FDMA_PCI_ATU_UPP_BASE_ADDR, idx));
> +
> +	/* The OB address space lies entirely below 4GB, so the limit always
> +	 * fits the lower limit register and the upper one is left alone.
> +	 */
> +	writel(region->limit_addr,
> +	       fdma_pci_atu_addr_get(atu->addr, FDMA_PCI_ATU_LIMIT_ADDR, idx));

[Severity: Low]
Should REGION_CTRL1 (offset 0x0) and the upper limit register (offset
0x20) be written explicitly, either here or in fdma_pci_atu_init()?

Neither fdma_pci_atu_configure_translation() nor fdma_pci_atu_init()
writes them. fdma_pci_atu_init() only clears the enable bit through
fdma_pci_atu_region_disable(). As a result, the TLP type, function
number, INCREASE_REGION_SIZE and the upper limit all depend on reset
values.

For comparison, dw_pcie_prog_outbound_atu() in
drivers/pci/controller/dwc/pcie-designware.c always writes CTRL1. On
4.60a and later it also writes the upper limit:

	if (dw_pcie_ver_is_ge(pci, 460A))
		dw_pcie_writel_atu_ob(pci, atu->index, PCIE_ATU_UPPER_LIMIT,
				      upper_32_bits(limit_addr));
	...
	dw_pcie_writel_atu_ob(pci, atu->index, PCIE_ATU_REGION_CTRL1, val);

This driver never changes those registers, so reloading it can't leave
them stale. It would only matter if something else, such as endpoint-side
firmware, had programmed the ATU before the host driver bound. No in-tree
path doing that was found.

Would writing CTRL1 = 0 at init be reasonable hardening?

[ ... ]

> +/* Map a host DMA address into a free outbound region. */
> +struct fdma_pci_atu_region *
> +fdma_pci_atu_region_map(struct fdma_pci_atu *atu, u64 target_addr, int size)
> +{

[ ... ]

> +	/* The ATU region base is only ever aligned to FDMA_PCI_ATU_REGION_ALIGN;
> +	 * require the same alignment of the host target address, since the ATU
> +	 * translates addr - target_addr + base_addr and any misalignment here
> +	 * would shift every translated address by the same amount.
> +	 */

[Severity: Low]
Is the translation direction in this comment reversed?

In struct fdma_pci_atu_region, base_addr is the OB window address and
target_addr is the host DMA address. The file header says the ATU turns
FDMA OB addresses into host DMA addresses, so the hardware computes
target_addr + (addr - base_addr).

The formula in the comment is the host to OB direction. That is what the
software helper fdma_pci_atu_translate_addr() computes:

	return region->base_addr + (addr - region->target_addr);

This does not affect the code's behaviour. Could the comment instead
describe the OB to host translation that the ATU performs?

> +	if (!IS_ALIGNED(target_addr, FDMA_PCI_ATU_REGION_ALIGN))
> +		return ERR_PTR(-EINVAL);

[Severity: Low]
Should size also be checked for FDMA_PCI_ATU_REGION_ALIGN alignment here?

The prototype comment in fdma_pci.h says:

  /* Map a host DMA address into a free ATU region. target_addr and size must be
   * FDMA_PCI_ATU_REGION_ALIGN aligned; a misaligned target_addr returns -EINVAL.
   */

However, fdma_pci_atu_region_map() only rejects a misaligned target_addr.
Any size in the range 0 < size <= fdma_pci_atu_region_size() is accepted
and programmed directly:

	region->limit_addr = region->base_addr + size - 1;

The commit message says the hardware widens the limit to the 64KB
boundary. The padding that keeps the widened window inside owned memory
is applied only in fdma_alloc_coherent_and_map():

	fdma->size = ALIGN(fdma->size, FDMA_PCI_ATU_REGION_ALIGN);

That wrapper is the only caller in the series, so no current path passes
an unaligned size. A future direct caller of the exported
fdma_pci_atu_region_map() could, though, and that would open a window
past the end of its buffer.

Would an IS_ALIGNED(size, FDMA_PCI_ATU_REGION_ALIGN) check next to the
target_addr check make the function match its documented contract?

> +
> +	mutex_lock(&atu->lock);

[ ... ]

> +	region->target_addr = target_addr;
> +	region->limit_addr = region->base_addr + size - 1;
> +	region->in_use = true;
> +
> +	fdma_pci_atu_configure_translation(region);
> +	fdma_pci_atu_region_enable(region);

[Severity: Low]
Should the enable bit be read back before fdma_pci_atu_region_map()
returns success?

fdma_pci_atu_region_enable() is a single posted writel() of BIT(31) to
REGION_CTRL2, and nothing checks whether it took effect.
dw_pcie_prog_outbound_atu() programs the same register layout. It polls
for PCIE_ATU_ENABLE and returns -ETIMEDOUT if the bit never appears:

	/*
	 * Make sure ATU enable takes effect before any subsequent config
	 * and I/O accesses.
	 */

Unmap is similar. fdma_pci_atu_region_unmap() posts the disable with no
flushing read, and fdma_free_coherent_and_unmap() then frees the buffer
right away through fdma_free_coherent().

In the lan966x user, fdma_pci_atu_region_map() is followed by
non-posted reads through the same BAR before FDMA_CH_ACTIVATE, and the
channels are polled until inactive before every unmap. That probably
hides this in practice.

Would a readback after the enable and the disable writes make the
ordering explicit?

> +
> +	mutex_unlock(&atu->lock);
> +
> +	return region;
> +}

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260928-lan966x-pci-fdma-v9-0-a17caf60f89a%40microchip.com

