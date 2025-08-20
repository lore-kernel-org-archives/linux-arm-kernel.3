Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92C36CA0EF8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 22:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y9fvFMsYcWq3AtenQ7/rWI6QzYZlacD9gFS8dazMyL8=; b=Gk37+0QUcCtI7fYqjH6eFRU/Z+
	qtEeh2n5Yhd22EQjBsGCD7y0re5NrgYb988JbmqAtePZrKAEHR8dlBZvtYSCElPjTax5XyC7n25sP
	Wki9eqnJd5RWSQoiETwVPNJ20Kb9enszDxMLKFRZuhs6gdQpGeXbuPxLVK1+11rMS4ASttKQm09fN
	qo0K1NBefN4sB6h32h8q6/uT2IYw437JgoKLM5ZiFJEvcj3YsDUAJ4LS+mRpOMYLjJbPamqTNFqwe
	bTf17Oq+jKOKPpmmy/Q+C/5Pr1FV4i4uV5rvNdISqjxLChFWw5zlNBM2N/1yt7F4ai7vow4P1pr7y
	oJ6JlBZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uorKP-0000000F6Pu-2LJY;
	Wed, 20 Aug 2025 22:30:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uonGq-0000000EeGa-1GeT;
	Wed, 20 Aug 2025 18:10:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6A8F2601EA;
	Wed, 20 Aug 2025 18:10:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EA50C4CEE7;
	Wed, 20 Aug 2025 18:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755713447;
	bh=dhLdG+B/qqIKsNIOpmDMrekjcCjsTEeLUNAtyAFWLp0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A8gjU6a9is/YEO6ukBdCLUYoyhrtKoNGY4ZkAhgvlHdgCNrK08OADxsr3Y029eVut
	 20aOGUHZ4/TAZsHRAETzFqxFGnFg5MAXBgBG8eOf1yPHXXWlEXn6+uk9+h+P4UAf7c
	 kQv8kfC95wMtBVolXzn3t/+2V0tf9W/rwvYzYBZMxxur7YBFhJ3GkeyDqzx0zzt/9s
	 J3IHjDroCTuVQiKypsAVwl/nVjk+DxQwgkkdXolO0GnR9gEDc7A2h7d+5sxmuxnWHZ
	 Ra4kJfvkgOQvXtr5eYUMsXtpJ35dxcc2bwn81R9ASc1Um003fyX19EZiZZ1dnhAb0u
	 VJObWf+atZN9Q==
Date: Wed, 20 Aug 2025 23:40:32 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Jim Quinlan <james.quinlan@broadcom.com>
Cc: linux-pci@vger.kernel.org, Nicolas Saenz Julienne <nsaenz@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, 
	Cyril Brulebois <kibi@debian.org>, bcm-kernel-feedback-list@broadcom.com, jim2101024@gmail.com, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>, 
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 0/3] PCI: brcmstb: Add 74110a0 SoC configuration
Message-ID: <l6szj4z4u4vhhacnwqvb2j6s562kgns5m2fspoxjggda4v22wv@65n2y56ake2r>
References: <20250703215314.3971473-1-james.quinlan@broadcom.com>
 <wxrnpfu7ofpvrwxxiyj4am73xcruooc4kaii2zgziqs4qbwhgj@7t3txfwl24tu>
 <CA+-6iNw6t36LogOroyQ8wNLOrSYPOJB0nxijbzcs2UWjwFkMXQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+-6iNw6t36LogOroyQ8wNLOrSYPOJB0nxijbzcs2UWjwFkMXQ@mail.gmail.com>
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

On Wed, Aug 20, 2025 at 01:08:41PM GMT, Jim Quinlan wrote:
> On Tue, Aug 19, 2025 at 10:51 AM Manivannan Sadhasivam <mani@kernel.org> wrote:
> >
> > On Thu, Jul 03, 2025 at 05:53:10PM GMT, Jim Quinlan wrote:
> > > This series enables a new SoC to run with the existing Brcm STB PCIe
> > > driver.  Previous chips all required that an inbound window have a size
> > > that is a power of two; this chip, and next generations chips like it, can
> > > have windows of any reasonable size.
> > >
> > > Note: This series must follow the commits of two previous and pending
> > >       series [1,2].
> > >
> > > [1] https://lore.kernel.org/linux-pci/20250613220843.698227-1-james.quinlan@broadcom.com/
> > > [2] https://lore.kernel.org/linux-pci/20250609221710.10315-1-james.quinlan@broadcom.com/
> >
> > Have you considered my comment on this series?
> > https://lore.kernel.org/linux-pci/a2ebnh3hmcbd5zr545cwu7bcbv6xbhvv7qnsjzovqbkar5apak@kviufeyk5ssr/
> 
> Hi Mani,
> I'm sorry, I thought I replied to this but obviously I did not.
> 

No issues!

> Your points are valid.  Our PCIe HW block keeps on mutating, and each
> time it does we add new code that is triggered off of the soc_base
> config setting.  The end result is not easy on the eyes.
> 
> I  also have submitted the series "PCI: brcmstb: Include cable-modem
> SoCs".  I don't think it has review comments yet, but I am guessing
> that you will make the same points.
> 

Yes. I intentionally didn't give any comments or merge it since I have the same
refactoring comments.

> So it looks like what you are asking for is a refactoring of the
> driver and, AFAICT, I need to first submit separate series that does
> this before submitting the this and the cable modem submission.  Do
> you agree with that?
> 

Yes, I agree. Refactoring will make life easier for both you and me :)

- Mani

-- 
மணிவண்ணன் சதாசிவம்

