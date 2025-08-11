Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF816CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 16:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zUh4eRzIzbu7kb1uBHUPyv1PkYXUUHrSK4fzmBMdcvs=; b=HCkWSBZX+55rwpZPa5dvqe2nDH
	709g9B2Hu/vPPc/EYc8GFbfmomC49ka0AnwQwy43cWK/Mi/JYV6VaK6e9yuhJBp3o1Ry5LbxnB28Z
	bSRpc8SYhbawETKLlY3TPDpBJ1ZZ4GQ3S82vovvw6UEP3lkHn0ejWPhQwv0ZG/S9ZbmpAoRSPmgWf
	jFumNAZfN6D0uQnbDKdObk7cIfAdkmMrkOzZaGoXc5UZBHr2x+glt43JK80WKDqKnlptA/JdWVNj2
	EuD5sJYBAe/I3Vd/KQFPoGZd9uO7iqTPJ0imljc03PGkf/qWJQmIuVVhytybyvLsKb9i3G0ZpABk4
	affAcdNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulVLO-00000008Ocd-2HL3;
	Mon, 11 Aug 2025 16:25:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulTKY-00000007zYJ-0quP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 14:16:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 78E31613EE;
	Mon, 11 Aug 2025 14:16:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 084AAC4CEED;
	Mon, 11 Aug 2025 14:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754921813;
	bh=HyGKP4aY1hXadx5XsLIniKyUXkI3COPhu/nzmDSgxQo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ItHHJlfjKvHxionfRyG/rHhVxx33kInqnSMz7Pu266fMWV7pwMOrJw623IQOzYD0T
	 r6IQZ4PiooHbd5mKsxqMg6gEXbdaizQDcjuNE2x2qegh0fMrHJlTUxvYMGOw4AR0bY
	 EarJjmL7hNlWCDui6o6GVfTz4ouz3+JsqXYo/Vv+vW24GsakcUBecdzPZ1DwSzO8Xf
	 2MmEPQX38ElYCtM13YPN7f36F9vRVwJXLXUOi8gNJ1HKvKvzK4HvwxnWta2bC3t6oc
	 f/8kjVUooYMpP2LQQdcgQl4WSCQ/Boi1SxUO3itf638Wd/fXKvS3Y4phcPWzk/ycDZ
	 Oum+v14h4NIhw==
Date: Mon, 11 Aug 2025 19:46:41 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Ray Jui <ray.jui@broadcom.com>, Scott Branden <scott.branden@broadcom.com>, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: PCI: Add missing "#address-cells" to
 interrupt controllers
Message-ID: <6hbyofiaop3e5yeo4trypwquwoseowwrqxo776jo3uknhf4rna@3lf3paulyvtr>
References: <20250801200728.3252036-2-robh@kernel.org>
 <175490917553.10504.5537940155167451079.b4-ty@kernel.org>
 <CAL_JsqL_jiOZcydPF6LXVKu6_z6Bp32g+wXWkNgrLocrg-xgrg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_JsqL_jiOZcydPF6LXVKu6_z6Bp32g+wXWkNgrLocrg-xgrg@mail.gmail.com>
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

On Mon, Aug 11, 2025 at 08:07:31AM GMT, Rob Herring wrote:
> On Mon, Aug 11, 2025 at 5:46 AM Manivannan Sadhasivam
> <manivannan.sadhasivam@oss.qualcomm.com> wrote:
> >
> >
> > On Fri, 01 Aug 2025 15:07:27 -0500, Rob Herring (Arm) wrote:
> > > An interrupt-controller node which is the parent provider for
> > > "interrupt-map" needs an "#address-cells" property. This fixes
> > > "interrupt_map" warnings in new dtc.
> > >
> > >
> >
> > Applied, thanks!
> >
> > [1/1] dt-bindings: PCI: Add missing "#address-cells" to interrupt controllers
> >       commit: ddb81c5c911227f0c2ef4cc94a106ebfb3cb2d56
> 
> Please read the commit message.
> 
> I've already applied this to my tree.
> 

Sorry, didn't notice it. Dropped the patch from PCI tree now.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

