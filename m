Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F62DE6F06E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 16:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3MR9DUEEMCuhZKoRt+j/KBmR0Iks+HA8M9VlcRYBJ8c=; b=XZ71Qw6wSDr1fc7UBuawLbvp1y
	1o57UTeILOeC1lykVYadyJv9pzk/qwi09EdSlZ9KzZ3V4PIdl41Od++yY5qN+W3oBqKUr1bMFpBCr
	NDFxe6/vCWTK8omCJFK/P0nglDylAOP62r7iMDov6VMTG8rOUx/uqswfdtViWDBYdfSfTrJEfy/wW
	S0+ikNPbqbYICGiUnGguqoBAd1V8Vxx0ut1mi9UOu3O20q5O/MD/otRranYrLLHT3OWhluGi3Z2G1
	2CwfvOK9o1x0NgYRBwJjZnSbmEaB5boO6RwkYDlQKUkxJPjXZgkVYxajg8c5wVSsEWU8rqTMrBe/r
	qX3NLmxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6uVF-00000007g1b-2AfB;
	Fri, 01 Nov 2024 16:28:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6uQM-00000007eeY-3le9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 16:23:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 63407FEC;
	Fri,  1 Nov 2024 09:23:24 -0700 (PDT)
Received: from [10.1.33.21] (e122027.cambridge.arm.com [10.1.33.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E53A63F73B;
	Fri,  1 Nov 2024 09:22:47 -0700 (PDT)
Message-ID: <a5967441-0ea7-4c17-a87b-3f95c0ef0642@arm.com>
Date: Fri, 1 Nov 2024 16:22:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/43] arm64: RME: ioctls to create and configure
 realms
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Gavin Shan <gshan@redhat.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 Alper Gun <alpergun@google.com>
References: <20241004152804.72508-1-steven.price@arm.com>
 <20241004152804.72508-10-steven.price@arm.com> <yq5acyjic9dm.fsf@kernel.org>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <yq5acyjic9dm.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_092259_075587_AC428319 
X-CRM114-Status: UNSURE (   8.19  )
X-CRM114-Notice: Please train this message.
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

On 30/10/2024 07:55, Aneesh Kumar K.V wrote:
> Steven Price <steven.price@arm.com> writes:
> 
>> +
>> +out_undelegate_tables:
>> +	while (--i >= 0) {
>> +		phys_addr_t pgd_phys = kvm->arch.mmu.pgd_phys + i * PAGE_SIZE;
>> +
>> +		WARN_ON(rmi_granule_undelegate(pgd_phys));
>> +	}
>> +	WARN_ON(rmi_granule_undelegate(rd_phys));
>> +free_rd:
>> +	free_page((unsigned long)rd);
>> +	return r;
>> +}
>> +
> 
> we should avoid that free_page on an undelegate failure? rd_phys we can
> handle here. Not sure how to handle the pgd_phys.

Good point. I think for pgd_phys setting kvm->arch.mmu.pgt=NULL should
be sufficient to prevent the pages being freed.

Thanks,
Steve


