Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF702E7716C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 14:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WYkF8Jl7PXN/6GtOUv5i7MYbBh/DkRzPp4tW4MXD1sE=; b=qtHrLn/b6JIFvyoRSO+3sFFCq/
	F5ftx4f/IMt7QTSUIFmPX7ywABtIWixHq+9hJ/vE7WH2gfcCiOJouasXOPLwQcnglQfyuShMqCvnX
	RBi7hgpf4/Hkf6Ba7FCYioreiKisLxCKXCALSd8jge987fylOPy43pcWuXRzgIUsqvvhaYURRH4Bd
	GCmh+rCjezM6cQuyCPQQkOnbyps0llWgilQJ78TBkoimZ6JWWcjiTPdm3FYoVZdp0MHsW98KK8Ujt
	cQVNdTf5H3jPJJdfTFscCSDKMBsA58njF5KCthXztDbvMXVKoXg3KAZqZymg9aBITKb51eRTbl4W6
	3hWtiZJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJCqY-0000000GKPH-3yj0;
	Thu, 05 Dec 2024 14:28:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJCpF-0000000GKDA-1XPq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 14:27:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A45661063;
	Thu,  5 Dec 2024 06:27:55 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 659BF3F5A1;
	Thu,  5 Dec 2024 06:27:26 -0800 (PST)
Date: Thu, 5 Dec 2024 14:27:24 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Liviu Dudau <liviu.dudau@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Sudeep Holla <sudeep.holla@arm.com>,
	"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH] arm64: dts: fvp: Update bus-range property
Message-ID: <Z1G4TCY9ekezAc8Y@bogus>
References: <20241128152543.1821878-1-aneesh.kumar@kernel.org>
 <173339457335.691023.1334271427632194234.b4-ty@arm.com>
 <Z1GxQHY1XkQcPFc0@e110455-lin.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z1GxQHY1XkQcPFc0@e110455-lin.cambridge.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_062729_443929_3F085FA3 
X-CRM114-Status: GOOD (  13.00  )
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

On Thu, Dec 05, 2024 at 01:57:20PM +0000, Liviu Dudau wrote:
> On Thu, Dec 05, 2024 at 10:31:03AM +0000, Sudeep Holla wrote:
> > On Thu, 28 Nov 2024 20:55:43 +0530, Aneesh Kumar K.V (Arm) wrote:
> > > These days, the Fixed Virtual Platforms(FVP) Base RevC model supports
> > > more PCI devices. Update the max bus number so that Linux can enumerate
> > > them correctly. Without this, the kernel throws the below error while
> > > booting with the default hierarchy
> > >
> > > pci_bus 0000:01: busn_res: [bus 01] end is updated to 01
> > > pci_bus 0000:02: busn_res: can not insert [bus 02-01] under [bus 00-01] (conflicts with (null) [bus 00-01])
> > > pci_bus 0000:02: busn_res: [bus 02-01] end is updated to 02
> > > pci_bus 0000:02: busn_res: can not insert [bus 02] under [bus 00-01] (conflicts with (null) [bus 00-01])
> > > pci_bus 0000:03: busn_res: can not insert [bus 03-01] under [bus 00-01] (conflicts with (null) [bus 00-01])
> > > pci_bus 0000:03: busn_res: [bus 03-01] end is updated to 03
> > > pci_bus 0000:03: busn_res: can not insert [bus 03] under [bus 00-01] (conflicts with (null) [bus 00-01])
> > > pci_bus 0000:04: busn_res: can not insert [bus 04-01] under [bus 00-01] (conflicts with (null) [bus 00-01])
> > > pci_bus 0000:04: busn_res: [bus 04-01] end is updated to 04
> > > pci_bus 0000:04: busn_res: can not insert [bus 04] under [bus 00-01] (conflicts with (null) [bus 00-01])
> > > pci 0000:00:01.0: BAR 14: assigned [mem 0x50000000-0x500fffff]
> > >
> > > [...]
> > 
> > Applied to sudeep.holla/linux (for-next/juno/fixes), thanks!
> > 
> > [1/1] arm64: dts: fvp: Update bus-range property
> >       https://git.kernel.org/sudeep.holla/c/4f776d81bf92
> 
> Thanks for the quick response. TBH, I did not receive your initial review
> email, that's why I've messaged thinking it got lost.

No I hadn't responded on the list yet. I queue and wait for a day for the
kbuild bot or any other bots to report no failures before I officially respond
as applied as I wouldn't have tried all build configs in general but it
doesn't apply for DT files though 😉.

--
Regards,
Sudeep

