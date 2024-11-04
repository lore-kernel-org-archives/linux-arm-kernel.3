Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FCFBD111B3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 07:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3ytsICwmTbJhe85HPhytqFuyJa0/WkZiLuqCFnEPxn0=; b=rvqBxj+nVDy0PFqf3WJ3ztft/K
	DSforCg1KNNz0NiPt/t2aBY6FnbViQ4tXeDi5HzydRxA5pptxCO8T5lmOm4+BKmzUM7IChK4rVjP4
	u9TPHCdoOU+9XWBllFqYhFFUgxZB0KOwlfnet2mE7EqqKcUqLPlrfSpU7srHv4z6KsChTFZfsIshp
	MIA/oXbt+cLo7d+yJTjk27bh74oyrBT2TV5y3nRnZp/I6iuGJCTivw1n4Eaf9VhDhakLHkmoYn4cF
	1le/faLz7sgStOww230wXue3KF/DLtZpd7LuQjEldqkXx/4hNVjz6gmJqnsRHyGLxqQP8i9S2W7z4
	FV+RpPfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7rFo-0000000CpOV-0vt8;
	Mon, 04 Nov 2024 07:12:00 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7rCh-0000000Cp2K-0LMF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 07:08:49 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4A478MPl070079;
	Mon, 4 Nov 2024 01:08:22 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730704102;
	bh=3ytsICwmTbJhe85HPhytqFuyJa0/WkZiLuqCFnEPxn0=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=s5xFpAYwqov6w9bqiEVDICYvep4sREnxXz8Fw6lR2kSGs1cjNSkRVo801ESLL+cFy
	 mnSajd+duQpzSHmvMeXychgOlCxTZry4THM9mxAyEn8y0uLwTlu9Eh7EEIzYpdrmfk
	 H2aNAq+AtESPh2JjHTvkjcXBtFP0EfMWN31lCaH0=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4A478MmU096909
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 4 Nov 2024 01:08:22 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 4
 Nov 2024 01:08:22 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 4 Nov 2024 01:08:22 -0600
Received: from localhost (uda0492258.dhcp.ti.com [10.24.72.81])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4A478L0p003184;
	Mon, 4 Nov 2024 01:08:21 -0600
Date: Mon, 4 Nov 2024 12:38:20 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
CC: Siddharth Vadapalli <s-vadapalli@ti.com>, <bhelgaas@google.com>,
        <lpieralisi@kernel.org>, <robh@kernel.org>, <vigneshr@ti.com>,
        <manivannan.sadhasivam@linaro.org>, <thomas.richard@bootlin.com>,
        <linux-omap@vger.kernel.org>, <linux-pci@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>
Subject: Re: [PATCH] PCI: j721e: Deassert PERST# after a delay of
 PCIE_T_PVPERL_MS ms
Message-ID: <f2af6cea-8365-42eb-be53-634eb0fe7cab@ti.com>
References: <20241022083147.2773123-1-s-vadapalli@ti.com>
 <20241102141914.GA3440781@rocinante>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241102141914.GA3440781@rocinante>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241103_230847_239897_76B2F1C4 
X-CRM114-Status: GOOD (  19.10  )
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

On Sat, Nov 02, 2024 at 11:19:14PM +0900, Krzysztof Wilczyński wrote:
> Hello,
> 
> > According to Section 2.2 of the PCI Express Card Electromechanical
> > Specification (Revision 5.1), in order to ensure that the power and the
> > reference clock are stable, PERST# has to be deasserted after a delay of
> > 100 milliseconds (TPVPERL). Currently, it is being assumed that the power
> > is already stable, which is not necessarily true. Hence, change the delay
> > to PCIE_T_PVPERL_MS to guarantee that power and reference clock are stable.
> [...]
> > This patch is based on commit
> > c2ee9f594da8 KVM: selftests: Fix build on on non-x86 architectures
> > of Mainline Linux.
> 
> Why KVM?  Do you have the link to this commit handy?

Since this is a fix, I had based the patch on the latest Mainline Linux
with the head corresponding to the aforementioned commit. Link:
https://github.com/torvalds/linux/commit/c2ee9f594da8

> 
> [...]
> >  		if (pcie->reset_gpio) {
> > -			fsleep(PCIE_T_PERST_CLK_US);
> > +			msleep(PCIE_T_PVPERL_MS);
> 
> fsleep() with the same macro and for the same reason is also used in the
> j721e_pcie_probe() callback.  I think, we would want both changed.

Thank you for pointing this out. I will update it in the v2 patch.

Regards,
Siddharth.

