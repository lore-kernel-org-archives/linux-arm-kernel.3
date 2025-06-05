Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67997C5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 22:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GjLzMU1bTvfgSMb6z/XT3mAl96bxRQT3GNEN/mU0hKA=; b=IF/PF3MwtsrCWfWdi05D7TwNqf
	/stn0XAZioGr3b+ZgBTwUQc4HDEYoJQ6wHPkpEsvm0nuVuNkfI5kBBB0MsJBRrKdkWSyKCEsyLbjP
	vJjRDPCuCjDrCN1PBN4eUU2FAMEgOz5n5fUNV+5Tk4SlP7xJNxpPubGYatIcVCTwAFvKNgzdjDz25
	8IsUVWTICWzB94XERHhrsHVkkq2H9fHsLOFhpnD342ufyceBJiiZtBZMMZd/3K8atScE721AtOthc
	CWLjcVFQAvk2xNCLiDeHceLHpoI27FfTZGDmvz6VGaeD41VbCfzz2GITWjAlnFnbcxKNr6A309r6q
	/VsAfOVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNJE5-0000000Gk2y-2BGV;
	Thu, 05 Jun 2025 22:38:21 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNJBu-0000000Gjuy-3pMn;
	Thu, 05 Jun 2025 22:36:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E7864A4FF30;
	Thu,  5 Jun 2025 22:36:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C8C2C4CEE7;
	Thu,  5 Jun 2025 22:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749162965;
	bh=1Jbyu6lBg3cYdJFmXVp6tcUglO4vtoW6ecMJkoWr3Jk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GI97G40wn+NwPG+muuWyuZ+k5CAX2GTR5U1pKevTXMAB1l/zytenR8dLG303w8nm8
	 /lQ5wbzVqL8RVMqg28CYTp3o6XX6Oh8du6nxJ6Y3C6AC/9w1bSARIWm4asoir85iQq
	 Tr/aljwW+wh3Iwsdg05AC3MUAMj6WSqJnYGCpCWl0cZMRBZTuWYiH6kI7DEdfV+Qyu
	 wZ/8yINzrom+p78SpH0KT+ef3QcaHXqfePHwTN7evo0O2GaGeoaFnDBxFlRby+lKhF
	 y6J7yjh3uRkCaRQe05VgfsY2Un70OWq6w5iDQO3TL89evBzvjrQ/ujajwrqR/A26uN
	 1l7Bpl/+/oagw==
Date: Thu, 5 Jun 2025 17:36:03 -0500
From: Rob Herring <robh@kernel.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Jim Quinlan <james.quinlan@broadcom.com>, linux-pci@vger.kernel.org,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	bcm-kernel-feedback-list@broadcom.com, jim2101024@gmail.com,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: PCI: brcm,stb-pcie: Add num-lanes
 property
Message-ID: <20250605223603.GA3375348-robh@kernel.org>
References: <20250530224035.41886-1-james.quinlan@broadcom.com>
 <20250530224035.41886-2-james.quinlan@broadcom.com>
 <6c3ec1c3-8f62-4d76-86d3-c1bbe3e1418f@broadcom.com>
 <2f79ae4e-6349-472c-b0cc-ea774b8ac7cf@broadcom.com>
 <CA+-6iNz48EFUGUOiHCSaqgsU_tKGV1=Xvw4fjoUS_AMhUHAi6w@mail.gmail.com>
 <3037cd65-89e8-4029-9ee2-4695db5987ad@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3037cd65-89e8-4029-9ee2-4695db5987ad@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_153607_017898_0CB3A357 
X-CRM114-Status: GOOD (  13.87  )
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

On Tue, Jun 03, 2025 at 10:17:26AM -0700, Florian Fainelli wrote:
> On 6/3/25 10:16, Jim Quinlan wrote:
> > On Tue, Jun 3, 2025 at 12:24 PM Florian Fainelli
> > <florian.fainelli@broadcom.com> wrote:
> > > 
> > > On 5/30/25 16:32, Florian Fainelli wrote:
> > > > On 5/30/25 15:40, Jim Quinlan wrote:
> > > > > Add optional num-lanes property Broadcom STB PCIe host controllers.
> > > > > 
> > > > > Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
> > > > 
> > > > Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
> > > 
> > > Sorry I take that back, I think this should be:
> > > 
> > > num-lanes:
> > >     enum: [ 1, 2, 4 ]
> > > 
> > > We are basically documenting the allowed values, not specifying that we
> > > can repeat the num-lames property between 1 and 4 times.

Are you confused with maxItems?

> > 
> > num-lanes is already defined as
> > 
> >      enum: [ 1, 2, 4, 8, 16, 32 ]
> 
> Right, but then we need to re-define it with our own specific constraints,
> still, don't we?

It is correct as-is.

Rob

