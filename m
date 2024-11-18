Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2C07D49221
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 13:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s8lkok+c8KjBG6mzXAMaB5qxafa7OdEMZ1RhybIITR0=; b=EZsQk0gAI4EHX5De0lnDAPSwy1
	oORcAfab5tj9HJCnllpVnZ9Pz4fD2ZYDQvI5mQ4ZuISRtrtJBcD/SgEZWw17zTkv+yw91fBQMYXdu
	0hqTUq1JqlncZS56PCyHRwPipoj+JZJ+KATwwYlDndTbIgqI5/nINqOaY/+OZPf0IPJtO7EB2gkFY
	ZncCmWblcvc0YDC+or8tM8di3be5Otk3j6odRtW66+wFDqOE+rZ4Yj9FHTGieilEcvaxtJfqZ/IDf
	90EOfV4duoZXT0rM80buKm5PcTGimL9VXragcid3RLlxqHspdmw+022FY+FSGgeatSKPihleYMOWf
	RQ4fURsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tD1uG-00000009bLr-1FqR;
	Mon, 18 Nov 2024 13:35:08 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tD1jv-00000009Yvp-0kEe;
	Mon, 18 Nov 2024 13:24:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=s8lkok+c8KjBG6mzXAMaB5qxafa7OdEMZ1RhybIITR0=; b=KMcdEfm7q1WJhQMgq8EmafygPP
	f1r7xrgEvyZSEg70NtxGPt2AatL8d5AZ7/iKKxkgJ+TxzwR0j+HeTv7LQ/9vxo2BIwfAFyvndye1v
	dTRW2vzRx/W5NRiTkoFHYE3tfZXxsPibfh9DO7ZLC66U4cYKRjvu3z66CHcnJY7NFkQXo3lUVYpEg
	CP+Ue4nwn2jBfsaOF4ubKIhMHbrziTka6DUGX9fIJSU1ELWosDKHpuAKWG5z4dEHzVkscG7oWRV83
	66YUVzxC1GjzBNwBLLO8YeJe4Lt5S8jKbK81Vj89cjsp1kWzj3IX8d0ZNrCReVnr0WWmgRfQcwkMH
	Czf7MeHw==;
Received: from i53875a30.versanet.de ([83.135.90.48] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tD1jl-00060I-SG; Mon, 18 Nov 2024 14:24:17 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Niklas Cassel <cassel@kernel.org>, Niklas Cassel <Niklas.Cassel@wdc.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Damien Le Moal <dlemoal@kernel.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>
Subject: Re: [PATCH] arm64: dts: rockchip: enable the mmu600_pcie IOMMU on the rk3588
 SoC
Date: Mon, 18 Nov 2024 14:24:16 +0100
Message-ID: <39365498.J2Yia2DhmK@diego>
In-Reply-To: <ZzsqdYUBNP7L9iRB@ryzen>
References: <20241107123732.1160063-2-cassel@kernel.org> <ZzsqdYUBNP7L9iRB@ryzen>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_052427_237007_10F6DA90 
X-CRM114-Status: GOOD (  27.23  )
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

Hi Niklas,

Am Montag, 18. November 2024, 12:52:23 CET schrieb Niklas Cassel:
> On Thu, Nov 07, 2024 at 01:37:33PM +0100, Niklas Cassel wrote:
> > Commit cd81d3a0695c ("arm64: dts: rockchip: add rk3588 pcie and php
> > IOMMUs") added the rk3588 SoC's pcie IOMMU and php IOMMU as disabled.
> > 
> > The mmu600_pcie is connected with the five PCIe controllers.
> > See 8.2 Block Diagram, in rk3588 TRM (Technical Reference Manual).
> > 
> > The five PCIe controllers are:
> > pcie3x4, pcie3x2, pcie2x1l0, pcie2x1l1, pcie2x1l2.
> > 
> > pcie3x4 can run in either Root Complex mode or Endpoint mode, the other
> > four PCIe controllers can only run in Root Complex mode. To describe this
> > we thus have six different device nodes in the device tree.
> > 
> > A PCIe controller in Root Complex mode needs to specify an iommu-map, such
> > that the device knows how to convert a Requester ID (PCI BDF) to an IOMMU
> > master ID (stream ID). (A PCIe controller in Endpoint mode should use the
> > iommus property, just like a regular device.)
> > 
> > If you look at the device tree bindings for msi-map and iommu-map, you can
> > see that the conversion from Requester ID to MSI-specifier data is the same
> > as the conversion from Requester ID to IOMMU specifier data. Thus it is
> > sensible to define the iommu-map property value similar to the msi-map,
> > such that the conversion will be identical.
> > 
> > Add the proper iommu device tree properties for these six device nodes
> > connected to the mmu600_pcie, so that we can enable the mmu600_pcie IOMMU.
> > (The mmu600_php IOMMU is not touched, so it is still disabled.)
> > 
> > Signed-off-by: Niklas Cassel <cassel@kernel.org>
> > ---
> 
> Hello Heiko,
> 
> Any chance of getting this picked up?
> 
> (If not now, then at least for 6.14.)

Oh, definitly :-) ... it's marked as to look at.

For 6.14 ... the patch arrived shortly before -rc7, with PCIe stuff in it.
IOMMUs + PCIe is sort of a topic I'm cautious about shortly before
the merge window ;-)


Heiko





