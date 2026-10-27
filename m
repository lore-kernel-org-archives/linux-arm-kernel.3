Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D52606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 14:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3WvfItET;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Y1y72I7Z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=YCM1R6dVVWvuIH+UBR6TH5CMJ3bKt8HZdVGd2g1zmYs=; b=3WvfItET5kh0qdPXKslqF2X3lv
	xr0EDgkGsp/Z6jA4KDniHFuuU7TWpja3PNQCDF3Abc7f3U+nLY8J6CmpHFYnhpBVW+9vvm7HJUpDJ
	/Vu1dS9Ksm9+a8Hy19D94iD0BQwhTNbK4R6h8YLHII4bn5uzeUxQjS+b4hJ5i5MjonQDtplqyyIpe
	/QA6sGRecZqWggduu4MlMeaTBC5ZIqudeXTo6YNsOAal+Yw7y+r8aZ+uhNWk40AIustYX+LV93Z9h
	daheFWWj913JHXouKMnVRLrcklGEUj9efaY0fktPIgOBXExEqa2ndnsYTY9P0KOjQqVqLVr2I/ulu
	WlhYuPqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLi50-000000051Kx-0rOB;
	Tue, 27 Oct 2026 14:23:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLi4x-000000051KV-0z1m
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 14:23:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D4A8F15A1;
	Tue, 27 Oct 2026 07:23:00 -0700 (PDT)
Received: from e142392.arm.com (e142392.arm.com [10.2.213.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7565A3F7B4;
	Tue, 27 Oct 2026 07:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793110984; bh=5oj/0Olu6P0vOlAuhliwwyRovCufR2SAkrdb83vbrEU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y1y72I7ZZgHOwDZ52neOkUJTOFHLGM6SpPrLJVlApi2ONKuPpXy5gvo/YDy6bjRdY
	 UjZ8l/7y5kF6noVILXl0H6e+7Nb7KYz93CLjCCr7D1N2FQkJe6kC1ZNYqjb4NZfw1c
	 kqwUht3UItiP8Y9UtMdtZaMB+dEp84ku6EU01etY=
Date: Tue, 27 Oct 2026 14:22:50 +0000
From: Kristina =?utf-8?Q?Mart=C5=A1enko?= <kristina.martsenko@arm.com>
To: Jinqian Yang <yangjinqian1@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-efi@vger.kernel.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Linu Cherian <linu.cherian@arm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo <guohanjun@huawei.com>, 
	Sudeep Holla <sudeep.holla@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>
Subject: Re: [RFC 00/12] arm64: Add support for TLBI domains
Message-ID: <cs3tsczrky7egqzde6gnsf7l22t53jit3cygtwe56yfeka5ue7@zesz6zptww3v>
References: <20261001110655.461473-1-kristina.martsenko@arm.com>
 <9eb6e0fe-5d8a-499c-b19b-ce73fe982451@huawei.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9eb6e0fe-5d8a-499c-b19b-ce73fe982451@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_072307_431083_0F29E6D7 
X-CRM114-Status: GOOD (  28.08  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 19, 2026 at 04:52:04PM +0800, Jinqian Yang wrote:
> Hi,
> 
> On 2026/10/1 19:06, Kristina Martšenko wrote:
> > Hi,
> > 
> > This series allows the kernel to use TLBI domains. TLBI domains (FEAT_TLBID) is
> > an Arm architecture feature that enables a TLB invalidation to target a subset
> > of CPUs instead of the whole system. It can improve performance on systems with
> > many CPUs. TLBID is not yet part of the Arm Architecture Reference Manual but
> > some of it is described in the latest XML [1].
> > 
> > The goal of this series is to send TLBI commands only to the CPUs where a
> > process has run (i.e. where its page tables have been installed). The last
> > patch explains a bit about how it works. This is an RFC since I'm not familiar
> > with the kernel's TLB/mm code and I'd like feedback on whether the general
> > approach is correct.
> > 
> 
> Thanks for posting this series.
> 
> I'm working on the KVM side of TLBID, and have a series that
> virtualizes TLBI domains for guests. It includes:
> 
>  - per-vCPU vDomain configuration via a new capability and
>    two ioctls
>  - VTLBID_EL2 programming at vCPU load/put, mapping vDomains
>    to physical domains
>  - a guest visible TLBIDIDR_EL1 with virtual domain counts,
>    and conditional exposure of ID_AA64MMFR4_EL1.TLBID
> 
> You mentioned you planned to look at KVM support in your next
> version. Would it be OK for us to post this as an RFC on top
> of your series? :)

Thanks for sharing.

I’m starting to look at KVM support but I’m not working on exposing
domains to guests. I’m looking at if we can track which CPUs a guest has
run on and transparently redirect all of a guest’s TLBIs to a single
domain that contains those CPUs. This could be a fallback in case the
guest is not configured to have virtual domains itself (which your
series enables).

I think there is some overlap between what we’re doing (e.g. configuring
VTLBID), but also lots of separate parts. So no objection from my side,
please feel free to post your series.

Thanks,
Kristina


