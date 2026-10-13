Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90CD4CC6B03
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 08:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xh2RuTCpYl2KVhPa0ImjxCYVt4KjsZeFKDT0mY3GZ20=; b=LGojwbFINCHhdJlEmKmrmoqeAv
	KzvjHBKrDq1VIIS2oyuagdfDkruVcyNyQvybGGPac7ZEwrrlr8vvIDRtf7X9rsP1L1hSrZjm+lSVW
	Ph4ilKlV3G1uQwKxk8TDtvWHtlbGicuZpBBLC0xTUxsB2qNFW5wzBZS8mijDNIKDxtt6gIaEO8yIG
	S7ddcqmufZNEu8Qksb13kSSqyzID1yqyOhEJofERjM9813i+e+S2q88epZbjU/a7KRLF+USpZ7Nwx
	NkA2F3EhUJ0A87rRJnA6u4IzuDlsCgAZa3VJrDdUrhHq1Q9DQlHCjpsAQPXUAstYqVDKJm+vUi1la
	f8gv5t4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGY5C-0000000CM9J-2X27;
	Tue, 13 Oct 2026 08:42:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGY59-0000000CM7W-20hU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 08:42:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6FDCC169C;
	Tue, 13 Oct 2026 01:41:52 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 702B53F66F;
	Tue, 13 Oct 2026 01:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791880915; bh=NI8CmL/lnRoC7aE++YpF7fiq+bAGnCCUDMqbYkmDDew=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bZqkt7LfHhgrP+LpLkfSWkgVJSZiTZFy4lKziZu5iR37k9EFAy02+ty8P4ISH7oZJ
	 KekFmta7QOPeZeaIU4GpQdPFpSIaN4Jm43CjCrlwnAe9zBdYufWXPGSmiCV/ITKyn4
	 5OZk62xDJBVPfh1/7axdbnw2G3tJM7jWkrMYzZEU=
Date: Tue, 13 Oct 2026 09:41:49 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: GONG Ruiqi <gongruiqi1@huawei.com>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>,
	Roberto Sassu <roberto.sassu@huaweicloud.com>,
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Eric Snowberg <eric.snowberg@oracle.com>,
	linux-integrity@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	Dan Williams <djbw@kernel.org>, Mimi Zohar <zohar@linux.ibm.com>,
	Roberto Sassu <roberto.sassu@huawei.com>,
	Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Suzuki Poulose <suzuki.poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Sami Mujawar <sami.mujawar@arm.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Jiri Pirko <jiri@resnulli.us>
Subject: Re: [PATCH RFC 0/3] security: ima: support TSM measurement registers
Message-ID: <as3uzQ7L6tJ-Lu-Q@e129823.arm.com>
References: <20260930-ima_tgx_integration_v2-v1-0-722c35370548@arm.com>
 <ebe68f6463f8ece8a5cd8ce70bba292ec4f64a41.camel@huaweicloud.com>
 <c4fe5315d70fc162f1e5648e3fccb1676710d5e6.camel@huaweicloud.com>
 <ar5tOUor0bp3MtQ6@e129823.arm.com>
 <9e74ff9d-e8a3-425e-bf7c-f973d06e6cdf@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9e74ff9d-e8a3-425e-bf7c-f973d06e6cdf@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_014159_646748_21C988CC 
X-CRM114-Status: GOOD (  23.00  )
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

> On 10/1/2026 10:24 PM, Yeoreum Yun wrote:
> > Hi Roberto,
> > 
> >> On Thu, 2026-10-01 at 13:27 +0200, Roberto Sassu wrote:
> >>> On Wed, 2026-09-30 at 14:43 +0100, Yeoreum Yun wrote:
> >>>> Confidential computing guests without a TPM can use TSM measurement
> >>>> registers to record IMA measurement digests instead of TPM PCRs.
> >>
> >> + Gong Ruiqi, of course.
> >>
> >> Roberto
> 
> Hi Roberto,
> 
> Thank you for involving me!
> 
> >>
> >>> Hi Yeoreum
> >>>
> >>> a similar patch set has been sent to the linux-integrity mailing list:
> >>>
> >>> https://lore.kernel.org/linux-integrity/20250630125928.765285-1-gongruiqi1@huawei.com/
> >>>
> >>> Could you please work with Gong Ruiqi to have a unified proposal?
> >>>
> >>> Thanks
> >>>
> >>> Roberto
> >>>
> > 
> > Thanks for letting me know and I think the proposal is almost the same
> > with the different terminology only.
> > 
> > @Gong, what do you think?
> 
> Hi Yeoreum,
> 
> Nice to see this topic picked up again — I'm glad the IMA RoT framework
> series I posted last year is still of interest.
> 
> Yes, I'd be happy to work with you on a unified proposal. It's been a
> while since I last worked on that series, so I'll first revisit my
> previous patch set, and then follow up with you to discuss the code details.
> 
> Looking forward to working with you.
> 
> BR,
> Ruiqi

Hi Ruiqi :)

Thanks for replying and I'm happy with you too.
However, I think we need to rework based on the Jiri's patch [0].

Any thought?

Link: [0] https://github.com/jpirko/linux_mlxsw/tree/wip_attestation_pre_rfc_draft1 


-- 
Sincerely,
Yeoreum Yun

