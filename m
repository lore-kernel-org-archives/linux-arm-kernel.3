Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0175FC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 17:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tlwQdO4suNstERVRsNsnemjpPAsRvO4R1t9ZtoyagAo=; b=R5axbYaHoUf6TXYHBkjDLJHSj/
	ok+wDwZ6/SbLN/yABpRj6bVt8Jrifz7T0WnUAtVd5l0MYpoXEfPaKPCDGbHGPUBg+lmqspu6QLD0f
	1WBENBNkjJjiBHMnQmU852qGy5hOBcgzxnBz8F3kNSTRXupglyA+HSESLzX0A2LZvkSNrxozQcK61
	qqh7bMXIYJr8perD5N/uyeBqnaQbb8NkSzCMvDaB37MsMbehdGzii7UXEnfMahWKiNHD/k8Ac7D6U
	bvFVxec+bDBqWxC1YlkQdzg26ouzubEHGurd9qIXW1UZSgJ0OAdiVkjRd7S6ZB5R4jrUluf62sdkX
	MLGwoyMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSIeg-0000000DepQ-3jhA;
	Thu, 19 Jun 2025 17:02:26 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSFaj-0000000DDTC-06rv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 13:46:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 11529A545C0;
	Thu, 19 Jun 2025 13:46:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B68DFC4CEEF;
	Thu, 19 Jun 2025 13:46:03 +0000 (UTC)
Date: Thu, 19 Jun 2025 14:46:01 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: =?utf-8?Q?Miko=C5=82aj?= Lenczewski <miko.lenczewski@arm.com>
Cc: ryan.roberts@arm.com, yang@os.amperecomputing.com, will@kernel.org,
	jean-philippe@linaro.org, robin.murphy@arm.com, joro@8bytes.org,
	maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	james.morse@arm.com, broonie@kernel.org, ardb@kernel.org,
	baohua@kernel.org, suzuki.poulose@arm.com, david@redhat.com,
	jgg@ziepe.ca, nicolinc@nvidia.com, jsnitsel@redhat.com,
	mshavit@google.com, kevin.tian@intel.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev
Subject: Re: [PATCH v7 2/4] arm64: Add BBM Level 2 cpu feature
Message-ID: <aFQUmWC1MYhai1fo@arm.com>
References: <20250617095104.6772-1-miko.lenczewski@arm.com>
 <20250617095104.6772-3-miko.lenczewski@arm.com>
 <aFPu4SorUGlFt-2p@arm.com>
 <20250619115132.GA20673@e133081.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250619115132.GA20673@e133081.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_064609_128788_0807B652 
X-CRM114-Status: GOOD (  15.42  )
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

On Thu, Jun 19, 2025 at 12:51:32PM +0100, Mikołaj Lenczewski wrote:
> On Thu, Jun 19, 2025 at 12:05:05PM +0100, Catalin Marinas wrote:
> > On Tue, Jun 17, 2025 at 09:51:02AM +0000, Mikołaj Lenczewski wrote:
> > > +	 * whether the MIDR check passes. This is because we specifically
> > > +	 * care only about a stricter form of BBML2 (one guaranteeing noabort),
> > > +	 * and so the MMFR2 check is pointless (all implementations passing the
> > > +	 * MIDR check should also pass the MMFR2 check).
> > 
> > I think there's at least one implementation that behaves as
> > BBML2-noabort but does not have the ID field advertising BBML2.
> > 
> 
> Yes, I put "should" instead of "will" because of the AmpereOne
> situation, but I didn't want to "name and shame". Should I explicitly
> call this out? Or would you like me to soften the vocabulary here to imply
> that as long as the MIDR passes, the MMFR2 check is not important?

I missed the "should" part. Anyway, I would just drop the explanation
from "This is because...".

-- 
Catalin

