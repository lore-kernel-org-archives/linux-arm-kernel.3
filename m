Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8517BE77198
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 23:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=PCrEa2eqiGdRhCaAuf73LiJEX1P4cmcw8rxMXvN3h20=; b=IvihTliXjAYgo4kC0wePxzO0Bs
	RdylmZOLYZ/8fyUvDbEtW8Cci7mX/9bMdn3YPyDCBenZnm4K1Eit25ZDbPTNa4H7cCjIDSDW+B8/O
	1fsIit6dxOVXkcM8XqyFB2lr5wG8RD6rucV3QxHWk3RCcZGU9HwdbRzgX3v9faphC+NdFN1wa7wdU
	D8nfBSyRFTISvwT3ZSp9yXQmhHpdKHEgZCEdpBHJg4DbRc2km7c3cKNDe1hf3TpKYZtpQXgu9U3s0
	fC4rIziQ5HC37lJL+Jw7A4FHvxPo4hHO1H9vTIljYb66C+POWBl0YT0/QQqDvPVds+b1Ja+WzGvZC
	ANh0o24w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVIjF-00000006VHC-0Yjk;
	Tue, 07 Jan 2025 23:11:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVIea-00000006UND-35r8;
	Tue, 07 Jan 2025 23:06:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9F31F5C060E;
	Tue,  7 Jan 2025 23:05:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46902C4CEDF;
	Tue,  7 Jan 2025 23:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736291185;
	bh=VfAnBfuX08F+R34YGFjPDdCZbCRXPGtckNSQu09Cp8k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=cOXT9/e9xxyBFaU6ZRyl43N5yOhkdSW3pm+L4KFDvPaD4x4bhaPDx6vsx/+XK15JB
	 ufQhgPuoW8HeB5VsOY57a1OQnNFYyGITDl/MGXWbZcc8V+rKTVX7tK4/fNWSL5cRJT
	 YtgV0laPpn4XfecnAbcURnxone1ng/4plt6Eiae1K14ASLBiDClGM0r/kZMxZNAJx8
	 B8rJG874PHgtYWGEiEBgv8D2hwmFL2CI3yGqY+uirRMi1sBDWdPxXwGN9CofAI4udG
	 MkB8aA5vkzdhC9sPCpCx7WjD3gUDWyW00nopCYQjAS9Xqe7QR07g3Aplq0O/3ma3Yw
	 VlpA8jCaUFgFQ==
Date: Tue, 7 Jan 2025 17:06:23 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jianjun Wang =?utf-8?B?KOeOi+W7uuWGmyk=?= <Jianjun.Wang@mediatek.com>
Cc: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	Xavier Chang =?utf-8?B?KOW8teeNu+aWhyk=?= <Xavier.Chang@mediatek.com>,
	"manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "kw@linux.com" <kw@linux.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"bhelgaas@google.com" <bhelgaas@google.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ryder Lee <Ryder.Lee@mediatek.com>
Subject: Re: [PATCH 3/5] PCI: mediatek-gen3: Disable ASPM L0s
Message-ID: <20250107230623.GA189234@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8b7b0d1bca5088bda46a651481b9a42f3be1a75d.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_150628_823028_9DBAF112 
X-CRM114-Status: GOOD (  19.85  )
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

On Tue, Jan 07, 2025 at 02:44:37AM +0000, Jianjun Wang (王建军) wrote:
> On Fri, 2025-01-03 at 13:15 -0600, Bjorn Helgaas wrote:
> > On Fri, Jan 03, 2025 at 02:00:13PM +0800, Jianjun Wang wrote:
> > > Disable ASPM L0s support because it does not significantly save
> > > power but impacts performance.
> > 
> > This seems like a user/administrator decision, not a driver
> > decision.
> > 
> > L0s reduces power at the cost of performance for *all* PCIe
> > devices, although the actual numbers may vary.
> 
> We have encountered some compatibility issues when connected with
> some PCIe EPs, these issues are probabilistic and disabling the L0s
> can fix them.

This sounds like either a software problem in ASPM or a hardware
problem in one of the devices.  If it's a Linux ASPM issue, obviously
we should find and fix that.  If it's an endpoint hardware issue, we
should fix the driver or quirk it to avoid L0s on all platforms, not
just this one.

If it's a mediatek-gen3 hardware issue, we should disable L0s as you
do here.  But if the reason is to work around a hardware erratum, we
should describe it as such.

Justifying it as "L0s really doesn't save much power, so disable it"
is an invitation for somebody to come back and ask why L0s doesn't
work when the lspci output claims it *should* work.

> Users may not be aware of these issues, so I think disabling L0s
> through the driver might be the better way, since it does not
> significantly save power and we usually use L1ss for power-saving
> when the link is idle.

Users should not need to be aware of probabilistic behavior problems
related to ASPM.  It's *our* problem to make sure users never see
issues like that :)

Bjorn

