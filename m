Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87025606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 12:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Z5ujHoeD;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=bo9O2Jkw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=jZbLu0wzSjOdnjAJn+WXuj5iQYYS4qUcPU4E+L4JQbY=; b=Z5ujHoeDqNnymW5f8V1NgSgm2O
	moiAWtDioo6/hJ0Yy04zg1+qXDvACwvnkjjCcnXa6jHD/RosQV81dfz/KqDuvUumLuiO+r79v1cFz
	GZbcRy8Ojt+lVhImrZUckIkaTWRAV2d/g4EQ8NwDHf+mmZ94hPKFCvz/UlhoRryO1fgqTQnLPpwPO
	iXcHLzEKqrg68doXJc3cwZkCK58x0/0dOTyhf1UMYr4e9HrecJ9kWX0QCp9QanJAZET3GSOeQeK+a
	sXlyJlJ9fy0C1rDUJwhDzFNMDKwpnCU6bMmHlhE8362jZDkxiE2zbgeWlhGk3sJoRBCSIxn3yJb/F
	tPi9w0DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMOuH-000000097Ar-072w;
	Thu, 29 Oct 2026 12:06:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMOuE-000000097AU-03Wa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 12:06:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9A18D1BB2;
	Thu, 29 Oct 2026 05:06:47 -0700 (PDT)
Received: from localhost (a079125.arm.com [10.164.21.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 09DC83F673;
	Thu, 29 Oct 2026 05:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793275610; bh=XuWqiX8GeiKnGK/0kw5HiwXWVYKheY7gCYzp1RS3dQ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bo9O2JkwLOS7LGpq9ufyaBMHKJAyRLCQQUNFQeXJmMvGyV9Ow2p9BmXWD+O5wgtKK
	 0NTO/+3bHJSwx0SYyMwOzqehHeOFKu4M/hQWA9xKlna72cHxmebLV0qvJkeca0VnaB
	 Jg3Wac3Ss3af0VKYKctrzqCeZvHnjSdOJMUY0iwk=
Date: Thu, 29 Oct 2026 17:36:47 +0530
From: Linu Cherian <linu.cherian@arm.com>
To: Kristina =?utf-8?Q?Mart=C5=A1enko?= <kristina.martsenko@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-efi@vger.kernel.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Hanjun Guo <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>
Subject: Re: [RFC 00/12] arm64: Add support for TLBI domains
Message-ID: <upkds2ymzuztqvxxuysm62lxcdv5oa3ji6xrxbnz3yt3vntbp6@rw54ndtnpz3y>
References: <20261001110655.461473-1-kristina.martsenko@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261001110655.461473-1-kristina.martsenko@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_050654_129072_4E572A22 
X-CRM114-Status: GOOD (  26.53  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Kristina,

On Thu, Oct 01, 2026 at 12:06:43PM +0100, Kristina Martšenko wrote:
> Hi,
> 
> This series allows the kernel to use TLBI domains. TLBI domains (FEAT_TLBID) is
> an Arm architecture feature that enables a TLB invalidation to target a subset
> of CPUs instead of the whole system. It can improve performance on systems with
> many CPUs. TLBID is not yet part of the Arm Architecture Reference Manual but
> some of it is described in the latest XML [1].
> 
> The goal of this series is to send TLBI commands only to the CPUs where a
> process has run (i.e. where its page tables have been installed). The last

Lets say if we have a TLB domain of 8 cpus and a process has ran on only
one cpu, dont we end up broadcasting to all cpus in the domain as the 
granularity is at the domain level ?
If thats true, would be good to make that clear.


> patch explains a bit about how it works. This is an RFC since I'm not familiar
> with the kernel's TLB/mm code and I'd like feedback on whether the general
> approach is correct.
> 
> A few notes and open questions:
> 
>   * Domains are described in a new "TLBI" ACPI table. This is not yet part of
>     the ACPI specification. There was an initial proposal [2] but this series
>     uses a newer WIP version of the table that aims to be published by the end
>     of the year.
> 
>   * There is currently no device tree binding since the feature is mainly meant
>     for server-class systems.
> 
>   * It's also possible to use TLBI domains to limit a KVM guest's TLB
>     invalidations to CPUs where the guest has run. I'll try to include that in
>     the next version. This series only disables domains for guests.
> 
>   * With this series a long-running process may eventually run on all CPUs and
>     just issue broadcast TLBIs. It may be worth periodically reducing the set
>     of CPUs but it's not clear when.

Do you have some thoughts on how we could reduce the set of cpus, to avoid
cross domain scheduling ? 
IIUC, this should me more of a scheduling decision with domain awareness. 


Thanks,
Linu Cherian.

