Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CE19C98324
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 20:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YHkMxQooC2tRVfPMnOlsBhSHdC58bg6gLKzsTSxr2+s=; b=vyxhDzqoxYvZsrAV4b9LK7a/a7
	OTmEUQG5QXRTOzSMtQJ6WNLZbXolzJb4xtOF9yx2AjvE3LNRAt5Y5P6xzxjBpIW0FE3FmgcSqSTBv
	0XD6w3GeieE9cQsA/e9PqVfR/NjJKjFSq5VFBA43/a6gy1KTN6SiohBZeFuRp1VOZX/0ekDB3S8cw
	7GepUujrMYyinurDZkBlgM+YVwekzxYYmid/BTJ6EYAVRCuGkGJerpiryCKs18gKp5kNtA9GFcF2q
	spWuWAO+TU/RvXKpZNeGXe8lTefEITJE053o66WLT+pjC0USYL+kI73k/fzRo/2oQx1EBFqTbCr90
	vZdVa56w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xACuX-0000000EQZS-0KiP;
	Fri, 25 Sep 2026 20:52:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xACuK-0000000EQTO-355G
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 20:52:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2F7726025F;
	Fri, 25 Sep 2026 20:52:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89E481F00893;
	Fri, 25 Sep 2026 20:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790369555;
	bh=YHkMxQooC2tRVfPMnOlsBhSHdC58bg6gLKzsTSxr2+s=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=L9g30EiK0FsV1GEDudwje+Tetrpiwzw50beq+oi0YICWr46OSAoeWJ6MFaVpl/Y0r
	 4XNXzTC1Z5qnkYKLWqHdZmDp19kVCsDhKh86HKA7uLlZnf/YPdtojUgKALnAWdqZKF
	 /6blq7RhqZT429p7ep95OkS2y2dn4LpP+fsU6q5GlH1xeCNv9xV2eP9+2IbjR2De7b
	 VsIbvWO9zMudZiLENvCyGY2TeplQMUOFS2ZfFg20eh7Gu+c6QfqxESh4Uy3TBFRO+z
	 P/mEpupt/EL8yY4vNOeQIYqtBOWZ3hy8bRNjmronWoFuGVRiY0NCj6xwamTgTn0J/M
	 tdb6suPf/2C9Q==
Subject: Re: [PATCH net-next v8 14/15] misc: lan966x-pci: dts: extend cpu reg
 to cover PCIE DBI space
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
Date: Fri, 25 Sep 2026 20:52:34 +0000
Message-ID: <179036955409.2160803.9449763908060819367@kernel.org>
In-Reply-To: <20260924-lan966x-pci-fdma-v8-14-201c7b707d8b@microchip.com>
References: <20260924-lan966x-pci-fdma-v8-14-201c7b707d8b@microchip.com>
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

- [Low] Concern: nothing enforces the contract between the DT "cpu" reg
  size and the driver's hard-coded TARGET_PCIE_DBI offset (0x400000)…

--

misc: lan966x-pci: dts: extend cpu reg to cover PCIE DBI space

This patch grows the "cpu" reg of the switch node in the lan966x PCI
overlay from 1MB to 8MB. The FDMA engine programs its ATU outbound windows
through registers at offset 0x400000 and above, and the old mapping did
not reach them.

> diff --git a/drivers/misc/lan966x_pci.dtso b/drivers/misc/lan966x_pci.dtso
> index 7b196b0a0eb65..7bb726550cafd 100644
> --- a/drivers/misc/lan966x_pci.dtso
> +++ b/drivers/misc/lan966x_pci.dtso
> @@ -135,7 +135,7 @@ lan966x_phy1: ethernet-lan966x_phy@2 {
>  
>  				switch: switch@e0000000 {
>  					compatible = "microchip,lan966x-switch";
> -					reg = <0xe0000000 0x0100000>,
> +					reg = <0xe0000000 0x0800000>,

[Severity: Low]
This isn't a bug, but the driver only works if the size here is large
enough, and nothing in the driver checks that.

The driver computes the DBI target from a fixed offset into the "cpu"
resource:

drivers/net/ethernet/microchip/lan966x/lan966x_main.c:
	{ TARGET_PCIE_DBI,             0x400000, 0 }, /* 0xe0400000 */

lan966x_create_targets() then adds that offset to the ioremapped base
without comparing it to resource_size():

	lan966x->regs[iomap->id] = begin[iomap->range] + iomap->offset;

fdma_pci_atu_addr_get() in drivers/net/ethernet/microchip/fdma/fdma_pci.c
adds a further FDMA_PCI_ATU_ADDR (0x300000) + idx * 0x200 + offset:

	return addr + FDMA_PCI_ATU_ADDR + FDMA_PCI_ATU_IDX_SIZE * idx + offset;

With this patch, the in-tree overlay covers the highest register touched
(about 0x700A18 into the cpu range). The native lan966x.dtsi still uses a
1MB cpu reg, but it never reaches this path, because lan966x_is_pci() is
false there and lan966x_shutdown() returns early.

So there is no in-tree problem. Would it still make sense to check in
lan966x_create_targets() that TARGET_PCIE_DBI plus the ATU range fits
within the "cpu" resource on PCI, rather than depending on the DT size
alone?

>  					      <0xe2000000 0x0800000>;
>  					reg-names = "cpu", "gcb";
>

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260924-lan966x-pci-fdma-v8-0-201c7b707d8b%40microchip.com

