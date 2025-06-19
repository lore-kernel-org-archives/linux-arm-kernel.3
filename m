Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6CF3C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 17:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6wgdOi1Y3PQwpkaPu3gFnfJAHpBAD4HDBGfDgsFBnqg=; b=TBuj6vk4nIeUMTOvWqwGcuVYMQ
	/CQ5yR6U0zY0ZVes5f+WJ2DOmPOBY2E35LpZ8YPA8ee6OKZ5FnY2ewI9yzlGVYTR/K+N+rPQGpXPc
	XN0ZqoMlmdM3H8A0aj4Uzg74m+nyqHLati1JgjsvMvtt6snhxKku70uF1vZW/GaAFXD4CNTg964s2
	fJ/GSbl6q//fteyVbciVinXWpGBBlA4oh9bo7OjtQdWPtttkfK8d6AI5TghX/r0MgurHFU/6afcY6
	Lk7aVYRFR0LbXJVkFE7m6Go1Zddn+dyrUWTWruaigMk3Ha3yBf+qxOdelwoTgddPLkmzjnwkOfWxm
	7xrtFC8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSIfX-0000000DgCR-1i4H;
	Thu, 19 Jun 2025 17:03:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSGX9-0000000DJQe-0h48
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 14:46:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F1A26113E;
	Thu, 19 Jun 2025 07:46:08 -0700 (PDT)
Received: from e133081.arm.com (e133081.arm.com [10.1.36.98])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C68F63F66E;
	Thu, 19 Jun 2025 07:46:23 -0700 (PDT)
Date: Thu, 19 Jun 2025 15:46:20 +0100
From: =?utf-8?Q?Miko=C5=82aj?= Lenczewski <miko.lenczewski@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>
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
Message-ID: <20250619144620.GA30368@e133081.arm.com>
References: <20250617095104.6772-1-miko.lenczewski@arm.com>
 <20250617095104.6772-3-miko.lenczewski@arm.com>
 <aFPu4SorUGlFt-2p@arm.com>
 <20250619115132.GA20673@e133081.arm.com>
 <aFQUmWC1MYhai1fo@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aFQUmWC1MYhai1fo@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_074631_246580_9258EA69 
X-CRM114-Status: GOOD (  17.39  )
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

On Thu, Jun 19, 2025 at 02:46:01PM +0100, Catalin Marinas wrote:
> On Thu, Jun 19, 2025 at 12:51:32PM +0100, Mikołaj Lenczewski wrote:
> > On Thu, Jun 19, 2025 at 12:05:05PM +0100, Catalin Marinas wrote:
> > > On Tue, Jun 17, 2025 at 09:51:02AM +0000, Mikołaj Lenczewski wrote:
> > > > +	 * whether the MIDR check passes. This is because we specifically
> > > > +	 * care only about a stricter form of BBML2 (one guaranteeing noabort),
> > > > +	 * and so the MMFR2 check is pointless (all implementations passing the
> > > > +	 * MIDR check should also pass the MMFR2 check).
> > > 
> > > I think there's at least one implementation that behaves as
> > > BBML2-noabort but does not have the ID field advertising BBML2.
> > > 
> > 
> > Yes, I put "should" instead of "will" because of the AmpereOne
> > situation, but I didn't want to "name and shame". Should I explicitly
> > call this out? Or would you like me to soften the vocabulary here to imply
> > that as long as the MIDR passes, the MMFR2 check is not important?
> 
> I missed the "should" part. Anyway, I would just drop the explanation
> from "This is because...".
> 
> -- 
> Catalin

OK, not a problem! Will drop it.

-- 
Kind regards,
Mikołaj Lenczewski

