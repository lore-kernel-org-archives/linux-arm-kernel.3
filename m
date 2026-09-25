Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9053DC98321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 20:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rfx4GRgvaRSdSRGh67ySOhLQR6YOyXcLJQEKF3xm+uQ=; b=y2YnIOD5O/qb0LbZv1G6zfd6nz
	+vn29zc9fyHWNRcH3k7JzGzIBSijGtPFSEnN2pGoEh37MSdyvi/Hd08zU2U0QVQZzV7IgIWiPDv9t
	J1SELbrYS9cUF33pIVsLkQiN+3Kgq18XMeBlLrvoRJ2lz1cO5mtoIpvXldvVQsEP/89v7gegdXQ+c
	htXJJvIJWRkblGxLUdwVguPk8NUhbzqkHgAIHyfHPGts1F9D6UkExIH3a9NKCdyeYmytJYzium+a+
	7fSMvRk17WKl4wIJ038ohMFYLnCouavR7KtMR0YLM3brqJk3r9BqutBoIapszHHcj5LPdkpQfqjSd
	1uNyzLYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xACuB-0000000EQQQ-3fB3;
	Fri, 25 Sep 2026 20:52:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xACu9-0000000EQQ3-1p9s
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 20:52:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8F5E960136;
	Fri, 25 Sep 2026 20:52:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E6CA1F000FF;
	Fri, 25 Sep 2026 20:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790369544;
	bh=rfx4GRgvaRSdSRGh67ySOhLQR6YOyXcLJQEKF3xm+uQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=YUeuS2OIUvqqJgk4p/wOad84NalwtD7NDOQZ2xu/uyG5DW+pSalc/JeC/WvK7lSU7
	 Z3i+So38NNBb3x+J9J9g8upxv0sucDiNKCc287SKspU7pfLhxgd+2pFfd2fs4vLMLH
	 bAarbx+fQjnpmRV9v4SxLd55X1BZggBArsSCxxAdBqJzUGsREmFEKWIcoFy4M0w2yl
	 SFjzBn2l530wUQXbpso5Hm5Ztf0LrKFYHb3kvBSPsStRBfi6U/K7N3V2yv8okzDMbe
	 SQzzd0i5d4K7SbwxKEZJwChbwYivR0I838hONEQSnqe3R5hJMod85hnHk5EtMG6Q4G
	 +3XDB7voHoerg==
Subject: Re: [PATCH net-next v8 03/15] net: microchip: fdma: add PCIe ATU support
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
Date: Fri, 25 Sep 2026 20:52:22 +0000
Message-ID: <179036954263.2160803.8852252834530526539@kernel.org>
In-Reply-To: <20260924-lan966x-pci-fdma-v8-3-201c7b707d8b@microchip.com>
References: <20260924-lan966x-pci-fdma-v8-3-201c7b707d8b@microchip.com>
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

- [Low] fdma_pci_atu_region_map()
  (drivers/net/ethernet/microchip/fdma/fdma_pci.c) is exported.
- [Low] The ATU region claimed in fdma_alloc_coherent_and_map() is
  released only by fdma_free_coherent_and_unmap().
- [Low] If fdma_pci_atu_region_map() fails, fdma_alloc_coherent_and_map()
  calls fdma_free_coherent() (fdma_api.c:154) but leaves fdma->dcbs and…
- [Low] fdma_pci_atu_region_map() sets the iATU enable bit (CTRL2, offset
  0x4) with a bare writel() and never reads it back.
- [Low] fdma_pci_atu_configure_translation() and fdma_pci_atu_init()
  never write iATU REGION_CTRL1 (offset 0x0: TLP type, function number,…

--

net: microchip: fdma: add PCIe ATU support

This patch adds PCIe ATU support to the shared Microchip FDMA library. It
lets lan966x (and later lan969x) DMA to host memory when running as a PCIe
endpoint. The outbound address space is split into six regions. New
helpers combine coherent DMA allocation with claiming and programming an
ATU region, and the mapped allocation is padded to the 64KB ATU
granularity.

> diff --git a/drivers/net/ethernet/microchip/fdma/fdma_api.c b/drivers/net/ethernet/microchip/fdma/fdma_api.c
> index e78c3590da9e6..a3c9e3097c5c2 100644
> --- a/drivers/net/ethernet/microchip/fdma/fdma_api.c
> +++ b/drivers/net/ethernet/microchip/fdma/fdma_api.c
> @@ -127,6 +127,50 @@ void fdma_free_phys(struct fdma *fdma)
>  }
>  EXPORT_SYMBOL_GPL(fdma_free_phys);
>  
> +#if IS_ENABLED(CONFIG_MCHP_LAN966X_PCI)
> +/* Allocate coherent DMA memory and map it in the ATU. */
> +int fdma_alloc_coherent_and_map(struct device *dev, struct fdma *fdma,
> +				struct fdma_pci_atu *atu)
> +{
> +	struct fdma_pci_atu_region *region;
> +	int err;
> +
> +	if (WARN_ON(fdma->atu_region))
> +		return -EBUSY;
> +

[ ... ]

> +	err = fdma_alloc_coherent(dev, fdma);
> +	if (err)
> +		return err;
> +
> +	region = fdma_pci_atu_region_map(atu, fdma->dma, fdma->size);
> +	if (IS_ERR(region)) {
> +		fdma_free_coherent(dev, fdma);
> +		return PTR_ERR(region);
> +	}

[Severity: Low]
If fdma_pci_atu_region_map() fails here, the buffer is freed, but
fdma->dcbs and fdma->dma still point at it. A later
fdma_free_coherent_and_unmap() or fdma_free_coherent() on the same struct
fdma would then call dma_free_coherent() on this buffer a second time.
Could that happen?

No caller later in the series seems to do this:
lan966x_fdma_pci_rx_alloc()/tx_alloc() just return the error.
lan966x_fdma_pci_init() frees only the rx struct when the tx allocation
fails. lan966x_fdma_pci_reload() puts the old structs back with memcpy()
on failure.

Would clearing fdma->dcbs and fdma->dma after the rollback free still be
worth doing?

> +
> +	fdma->atu_region = region;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(fdma_alloc_coherent_and_map);
> +
> +/* Free coherent DMA memory and unmap the memory in the ATU. */
> +void fdma_free_coherent_and_unmap(struct device *dev, struct fdma *fdma)
> +{
> +	fdma_pci_atu_region_unmap(fdma->atu_region);
> +	fdma->atu_region = NULL;
> +	fdma_free_coherent(dev, fdma);
> +}

[Severity: Low]
This is the only path that releases the region claimed in
fdma_alloc_coherent_and_map(). The plain fdma_free_coherent() is still
exported and does not touch fdma->atu_region.

What happens if a by-value copy of struct fdma is freed with
fdma_free_coherent(), as the platform lan966x_fdma_reload() does? The
region would stay in_use, with an enabled outbound window pointing at
freed memory. The next map could also hit WARN_ON(fdma->atu_region).

Later in the series the PCIe path looks correct. lan966x_fdma_pci_reload()
sets rx.fdma.atu_region and tx.fdma.atu_region to NULL before
reallocating, then frees the old copies with
fdma_free_coherent_and_unmap(). The platform lan966x_fdma_reload() only
runs through lan966x_fdma_ops, which never maps ATU regions.

Would it help to document that fdma_free_coherent() must not be used on
a mapped struct fdma?

[ ... ]

> diff --git a/drivers/net/ethernet/microchip/fdma/fdma_pci.c b/drivers/net/ethernet/microchip/fdma/fdma_pci.c
> new file mode 100644
> index 0000000000000..dd1dc46cbc9dc
> --- /dev/null
> +++ b/drivers/net/ethernet/microchip/fdma/fdma_pci.c
> @@ -0,0 +1,208 @@

[ ... ]

> +/* Configure the address translation in the ATU. */
> +static void
> +fdma_pci_atu_configure_translation(struct fdma_pci_atu_region *region)
> +{

[ ... ]

> +	/* The OB address space lies entirely below 4GB, so the limit always
> +	 * fits the lower limit register and the upper one is left alone.
> +	 */
> +	writel(region->limit_addr,
> +	       fdma_pci_atu_addr_get(atu->addr, FDMA_PCI_ATU_LIMIT_ADDR, idx));

[Severity: Low]
This writes base, limit and target, but it never writes REGION_CTRL1
(offset 0x0: TLP type, function number, INCREASE_REGION_SIZE) or
UPPER_LIMIT (offset 0x20). fdma_pci_atu_init() doesn't write them either;
it only clears the enable bit.

Does this code depend on those registers still holding their reset values
(memory request type, function 0, no increased region size)? For
comparison, dw_pcie_prog_outbound_atu() always writes CTRL1 explicitly.

No other agent that programs these registers has been identified, and
this driver never writes them. Would setting CTRL1 and UPPER_LIMIT to 0
during setup be reasonable hardening?

[ ... ]

> +/* Map a host DMA address into a free outbound region. */
> +struct fdma_pci_atu_region *
> +fdma_pci_atu_region_map(struct fdma_pci_atu *atu, u64 target_addr, int size)
> +{

[ ... ]

> +	if (!IS_ALIGNED(target_addr, FDMA_PCI_ATU_REGION_ALIGN))
> +		return ERR_PTR(-EINVAL);

[ ... ]

> +	region->target_addr = target_addr;
> +	region->limit_addr = region->base_addr + size - 1;

[Severity: Low]
target_addr is checked for FDMA_PCI_ATU_REGION_ALIGN alignment, but size
is not, and size goes straight into limit_addr here.

The commit message says the hardware widens a limit that is not 64KB
aligned. fdma_pci_atu_region_map() is exported. If a caller passed a size
such as 0x1234, would the outbound window then extend to
target_addr + 0xffff, past the end of the caller's buffer?

This isn't reachable today. The fdma_pci.h comment says "target_addr and
size must be FDMA_PCI_ATU_REGION_ALIGN aligned". The only in-tree caller,
fdma_alloc_coherent_and_map(), pads fdma->size with ALIGN() first.

Could an IS_ALIGNED(size, FDMA_PCI_ATU_REGION_ALIGN) check that returns
-EINVAL go next to the target_addr check, so the documented precondition
is enforced?

> +	region->in_use = true;
> +
> +	fdma_pci_atu_configure_translation(region);
> +	fdma_pci_atu_region_enable(region);

[Severity: Low]
fdma_pci_atu_region_enable() sets the enable bit in CTRL2 (offset 0x4)
with a bare writel(), and success is returned without reading the bit
back. On the other side, fdma_pci_atu_region_unmap() clears the bit with
a posted write, and fdma_free_coherent_and_unmap() frees the buffer right
after.

dw_pcie_prog_outbound_atu() polls CTRL2 after enabling a region, with the
comment "Make sure ATU enable takes effect before any subsequent config
and I/O accesses". Does the lan966x iATU need a similar read-back?

In the series as posted, lan966x_fdma_rx_start() reads registers on the
same endpoint before it activates a channel, and those reads would flush
the enable write. Every unmap caller also first waits for the channels to
go idle via lan966x_fdma_rx_disable()/tx_disable(). So this only matters
if the hardware needs settle time beyond that flush.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260924-lan966x-pci-fdma-v8-0-201c7b707d8b%40microchip.com

