Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEAAEC7114A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 19:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U0X8ZH/rfO/Z6losPFjqk2K4HYFkVNB0nAVwC7e9oDU=; b=cSbtOng5uPOISHzj8JHk5aouEo
	BicJ/a8TGm/Qeo4lpjUwcJ+vURncYMLSzimQpeN9cfBpXHSfTwiSCpKIDbOg5SDhBgVVnRoTo5dcH
	eSsTELFjjwSozWlUeyOG4AgzaF0irmUKFqBdsloRU6RbwCnu1L3f6sLBv5iPHIam81+PBDmDjDJNV
	zzKEaMKZo7L65yD/5XXfOPlLCY90EbOlPD7463cyQqfdZa9z+dzsNohJFL5/3jX1Qgl9u8ygNF88s
	tP2E+T/INaO5s+Y6w5K1z9UTDPX4iQT9AxnmEDwkqZ9utY7EpED8TTWOtVRUZezQX1g6+5KrjgyO3
	TpHCMSGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPnsK-0000000EMCN-3gju;
	Thu, 12 Jun 2025 19:46:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPkTs-0000000DuFM-1URn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 16:08:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 752986113B;
	Thu, 12 Jun 2025 16:08:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B62BAC4CEEB;
	Thu, 12 Jun 2025 16:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749744523;
	bh=7+b3JmMUKKzZHXO8vtquG03ptonMmn+AG6H+hfCo32c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Yu1eX2+yaTkbsl/d4yM4lfN2qNWWfjohdrJaOUTEURh2W67frVLVNJ9rRCgFxQrZf
	 ndFlg8mMHcvOcqS4PhqSjZpEbYibip25n9/WMXx9yOX9Qth3pi9r1Ayvek6EEAdSHv
	 dpNwxRCRDKpCbTYgUBrbAGwJ94lvMUwnRRjqgU+jxCip+i+JE/KLG2QPyM/zn8B4rJ
	 Q8E6oTzwL6dbMpRzg3e6H8iuHtrL7hK+9Sl08Ggg407bIOdcfokMKeKs+14qTtTgx8
	 HyWxtWvtY4MFq9igWIknEFRf4dzrpbgGHF6GMIobafqVsAe1ZXwkLzRnaepfDdulDX
	 7aP4hDoAddGvQ==
Date: Thu, 12 Jun 2025 21:38:32 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Jingoo Han <jingoohan1@gmail.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Richard Zhu <hongxing.zhu@nxp.com>, 
	Lucas Stach <l.stach@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	Niklas Cassel <cassel@kernel.org>
Subject: Re: [PATCH v11 10/11] PCI: dwc: Print warning message when
 cpu_addr_fixup() exists
Message-ID: <az74rxjpfahjwmz7fg5agn47org7arpblariuauujhovkaieha@d6r2yp23vqan>
References: <20250313-pci_fixup_addr-v11-0-01d2313502ab@nxp.com>
 <20250313-pci_fixup_addr-v11-10-01d2313502ab@nxp.com>
 <v77jy5tldwuasjzqirlwx45zigt6bpnaiz67e4w7r2lxqrdsek@5qzzobothf5r>
 <aEr3nGCqRuyIwA37@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aEr3nGCqRuyIwA37@lizhi-Precision-Tower-5810>
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

On Thu, Jun 12, 2025 at 11:51:56AM -0400, Frank Li wrote:
> On Thu, Jun 12, 2025 at 08:16:03PM +0530, Manivannan Sadhasivam wrote:
> > On Thu, Mar 13, 2025 at 11:38:46AM -0400, Frank Li wrote:
> > > If the parent 'ranges' property in DT correctly describes the address
> > > translation, the cpu_addr_fixup() callback is not needed. Print a warning
> > > message to inform users to correct their DTB files and prepare to remove
> > > cpu_addr_fixup().
> > >
> >
> > This patch seem to have dropped, but I do see a value in printing the warning to
> > encourage developers/users to fix the DTB in some way. Since we fixed the driver
> > to parse the DT 'ranges' properly, the presence of cpu_addr_fixup() callback
> > indicates that the translation is not properly described in DT. So DT has to be
> > fixed.
> 
> This patch already in mainline with Bjorn's fine tuned at when merge.
> 
> 	fixup = pci->ops ? pci->ops->cpu_addr_fixup : NULL;
>         if (fixup) {
>                 fixup_addr = fixup(pci, cpu_phys_addr);
>                 if (reg_addr == fixup_addr) {
>                         dev_info(dev, "%s reg[%d] %#010llx == %#010llx == fixup(cpu %#010llx); %ps is redundant with this devicetree\n",
>                                  reg_name, index, reg_addr, fixup_addr,
>                                  (unsigned long long) cpu_phys_addr, fixup);
>                 } else {
>                         dev_warn(dev, "%s reg[%d] %#010llx != %#010llx == fixup(cpu %#010llx); devicetree is broken\n",
>                                  reg_name, index, reg_addr, fixup_addr,
>                                  (unsigned long long) cpu_phys_addr);
>                         reg_addr = fixup_addr;
>                 }
> 
>                 return cpu_phys_addr - reg_addr;
>         }
> 
> I have not seen this "dev_warn(pci->dev, "cpu_addr_fixup() usage detected. Please fix your DTB!\n");"
> 

This patch is supposed to add this warning and nothing else.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

