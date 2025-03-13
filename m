Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 187DEC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 11:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6/bBCs1pNp98zIOWu+apBXT+Mts8ncEi8aIE4qzcjIQ=; b=hHleFuuSIJ7VeEhZfQtzn9aI27
	9qND5CgTIXy/V/aFXin/5s8/4za00WzLZeMwbSv7xH5dLMjkmkksZDHeb65Kll1RVPTHjRPZXHjR4
	gFPytWLTw34T14NaaFEz7lH3hCq15mvWFw8mL9jDuAnRSAgAytpXTwD6+4PytsQ+8j1CI97HMcn7j
	Aa6TkDWSiUr2BfCEMEDThQorYGQPZhIESgaBt6jLi1ZLR//kCIUzOVrz0PmgZ5bvnqNmQZfSbsY7z
	SRMC2paiQl2XKfvDzoR+FqDkaNRqztknXOId0CylA9XHidfFQw1D4cwFF9EtMaaIf4EEGvSgP7jhH
	IAKDwFYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsgox-0000000B3SZ-1rHI;
	Thu, 13 Mar 2025 11:33:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsglp-0000000B2mV-3VOs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 11:30:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DC5DD1F02;
	Thu, 13 Mar 2025 04:30:47 -0700 (PDT)
Received: from mazurka.cambridge.arm.com (mazurka.cambridge.arm.com [10.2.80.18])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7436E3F673;
	Thu, 13 Mar 2025 04:30:33 -0700 (PDT)
Date: Thu, 13 Mar 2025 11:30:30 +0000
From: =?utf-8?Q?Miko=C5=82aj?= Lenczewski <miko.lenczewski@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: ryan.roberts@arm.com, yang@os.amperecomputing.com, corbet@lwn.net,
	catalin.marinas@arm.com, will@kernel.org, jean-philippe@linaro.org,
	robin.murphy@arm.com, joro@8bytes.org, akpm@linux-foundation.org,
	mark.rutland@arm.com, joey.gouly@arm.com, maz@kernel.org,
	james.morse@arm.com, broonie@kernel.org, anshuman.khandual@arm.com,
	oliver.upton@linux.dev, ioworker0@gmail.com, baohua@kernel.org,
	david@redhat.com, jgg@ziepe.ca,
	shameerali.kolothum.thodi@huawei.com, nicolinc@nvidia.com,
	mshavit@google.com, jsnitsel@redhat.com, smostafa@google.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev
Subject: Re: [PATCH v3 0/3] Initial BBML2 support for contpte_convert()
Message-ID: <20250313113030.GA24356@mazurka.cambridge.arm.com>
References: <20250313104111.24196-2-miko.lenczewski@arm.com>
 <e8749c86-fe93-4123-aa2e-5677e7a2c695@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e8749c86-fe93-4123-aa2e-5677e7a2c695@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_043037_922625_3778F0AE 
X-CRM114-Status: GOOD (  10.93  )
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

On Thu, Mar 13, 2025 at 11:22:07AM +0000, Suzuki K Poulose wrote:
> Hi Miko,
> 
> On 13/03/2025 10:41, Mikołaj Lenczewski wrote:
> > Hi All,
> >  
> Nothing about the patch functionality, but :
> 
> Minor nit: Generally it is a good idea to add "What changed" from the
> previous posting.  That gives the reviewers an idea of what to look for
> in the new version. Something like:
> 
> Changes since V2:
>   {Adding a link to the posting is an added bonus, as we can look up the 
> discussions easily}
>   - blah blah
>   - ..
> 
> 
> Cheers
> Suzuki

Ah, yes. My apologies. Will make sure to include such a changelog with
links to previous versions in future. I do not know why I did not
include it here, other than it not crossing my mind...

-- 
Kind regards,
Mikołaj Lenczewski

