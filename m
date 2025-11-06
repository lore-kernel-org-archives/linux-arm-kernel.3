Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E398CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 17:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=8khqmivdHqvLRaEjWc9ce8rzijxmIFPMF+BQyZmHFIg=; b=2K18WqQCF6g+zT
	UfjVpKcpkgGpRZ11wJXLMdvvaAQw44KVFTtero/ScRu+vxOHk7zc7zQHxeF2Q/Lb/iSYpi3nvxLqD
	cFljx2pfedC0xQShC6vrM9HKtsTCWeMvbM4kD35B6OyBPSXq1/tSSl2EczrTF7IX/Cag86N4t3joY
	vTmDyv/JHd60dmBpaVaFNwJU++ZcWrflLlwpDtK2bvFxlbfKygd/bR/NbU15CIfRmmCFwlXv4w5C3
	oUoEgkq2ihB92deYOurf2iCRQvIkti1gdU20TcfR6WUTmeYLlyiHq0uEfgh3OaevA/oYyQIL/WTgK
	oD36DW1waGThKEci1JWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH3wn-0000000G2W8-2RQB;
	Thu, 06 Nov 2025 17:38:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH3wl-0000000G2Vm-2A1J
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 17:38:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E12AE4018C;
	Thu,  6 Nov 2025 17:38:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90CEEC16AAE;
	Thu,  6 Nov 2025 17:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762450734;
	bh=KT4NxU4wzZtWzjzdNyOaIb2J5xsI7ldg+J7TbPIxc2s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=RKZnoXF2yCM0esJy0nNdLPHb5DCoMw2//OUPJtCchG/Cd8esCy4W7xNGUF9NZtym8
	 HKyyWeEERf8/AN3v7TvGd/1muy/vbounHttD2Uc0onBdB+RQRKH1NUJ7jKOVP9HDn9
	 Udy27sHloM66hl2xBTgbs2TbZwUcZ/Q/PVqMKc69O8gNSxB2HEzAvcW+p+ri7OXkGT
	 iDCXL8yE6hySjYsZIRNmC+WnR8BqEOjSREVal8M5UEwfGbaZgVEj0BLT7kUkRl9utH
	 HiSeM77VN+qtG1pvUMbvDqQqHVhWrp8g3W6VLu1wLV7rMErYylWqQWpoGbikP1WMgS
	 8EdbtQuGnnPDg==
Date: Thu, 6 Nov 2025 11:38:53 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>, chester62515@gmail.com,
	mbrugger@suse.com, ghennadi.procopciuc@oss.nxp.com, s32@nxp.com,
	bhelgaas@google.com, jingoohan1@gmail.com, lpieralisi@kernel.org,
	kwilczynski@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, Ionut.Vicovan@nxp.com, larisa.grigore@nxp.com,
	Ghennadi.Procopciuc@nxp.com, ciprianmarian.costea@nxp.com,
	bogdan.hamciuc@nxp.com, Frank.li@nxp.com,
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, cassel@kernel.org,
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>
Subject: Re: [PATCH 1/4 v3] dt-bindings: PCI: s32g: Add NXP PCIe controller
Message-ID: <20251106173853.GA1959661@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKfTPtC87w7RVSDAXWXRX1sjgo4s=_Z_k62+mfTXrMZwmkEpFg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_093855_576447_C09A010C 
X-CRM114-Status: GOOD (  23.61  )
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

[+cc Senchuan]

On Thu, Nov 06, 2025 at 09:09:01AM +0100, Vincent Guittot wrote:
> On Thu, 6 Nov 2025 at 08:12, Manivannan Sadhasivam <mani@kernel.org> wrote:
> > On Wed, Oct 22, 2025 at 07:43:06PM +0200, Vincent Guittot wrote:
> > > Describe the PCIe host controller available on the S32G platforms.

> > > +            phys = <&serdes0 PHY_TYPE_PCIE 0 0>;
> >
> > PHY is a Root Port specific resource, not Root Complex. So it
> > should be moved to the Root Port node and the controller driver
> > should parse the Root Port node and control PHY. Most of the
> > existing platforms still specify PHY and other Root Port
> > properties in controller node, but they are wrong.
> 
> Yeah, we had similar discussion on v1 and as designware core code
> doesn't support it, the goal was to follow other implementations
> until designware core is able to parse root port nodes.  I can add a
> root port node for the phy and parse it in s32 probe function but
> then If I need to restrict the number of lane to 1 instead of the
> default 2 with num-lanes then I have to put it the controller node
> otherwise designware core node will not get it.

I think it's better to put the PHY info, including num-lanes, in Root
Port DT nodes now even thought the DWC core doesn't explicitly support
that yet because it's much easier to change the DWC core and the
driver code than it is to change the DT structure.

That will mean a little extra code in the s32g driver now, but we will
be able to remove that eventually.  If we leave the PHY in the DT
controller node, we may eventually end up having to support two s32g
DT structures: the single RP style with PHY in the controller, and a
multiple RP style with PHY in the RP.

We'll likely have both structures for many existing drivers, but I
think it will be simpler if new drivers can avoid the old one.

The eic7700 driver is an example of num-lanes support in the driver:
https://lore.kernel.org/linux-pci/20251030083143.1341-1-zhangsenchuan@eswincomputing.com/

Bjorn

