Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18D15CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 16:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cm9pr8lYyBgkPitQZZBVrQVrJZhWIxw6v/HvWsE08mg=; b=Z8bpq3JInsM7vkmvPMvV6HZcV2
	vPns9jSlUbhDn2/dQ/846uAGaefLNJMazFnCtch5nFwXV/7Gl89UDyi9ie+6nix7IS32hCGFKG+NO
	/GNiFTXQY6uXB58MPzYrum5DE2YXxkuniL2cazZt42vIpf8PYApFVTxUt3YQ6rLEcCMXOfyX1l9l6
	FW5eiYBxPyvVBJu/CUXCU8ZH2SBfZCyUZlfrI9anYqUs+rgY+hdWaQ/orzv8NWhRLPSjLb8gMLOOp
	9nsOlRPypIjIWoTsjvQCSYfJj84WtQ8/W+qz5uCbHCE75tY/Mf0bqnpYq27kS9eZNvyWg/LT3x2ID
	WiqBJBzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7GPZ-000000091BJ-1CpC;
	Fri, 10 Oct 2025 16:56:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7GPW-00000009196-1b73
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 10 Oct 2025 16:56:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=cm9pr8lYyBgkPitQZZBVrQVrJZhWIxw6v/HvWsE08mg=; b=ed5lsIrlcRDdFKRzEVVl3V+B+e
	Il+1wmgZ3zNYoPra58DtexOHlNUAKOz7D7WJEvtofyiJ5jP81b2vm/Swb/T1hO3g3Gz640IZwodIJ
	5aHJA1ZEjzwpWG9R3ddkM2t55Y0BHuNDmlxbqFOhLxsjeSYHA5dY6I7WFZfhDvEHiUn1dS4pKVkl5
	FxuwPkVKhGQrhLIfJeaV+ATyheP9Wv08BEGavC71HmLAzTa5JTm3LdD0meAc1iHS8CzzIoP1mgn3S
	FDtkmSa/xQ4I7IxFwKi/1aTp/tWVRK732CJaKdmVEHXReCEnD+HHMCZY4JghYESwlIxcmTr7LESUD
	31OnSUvg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7GPT-00000002JOn-24Uf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 16:56:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B2FA81596;
	Fri, 10 Oct 2025 09:55:54 -0700 (PDT)
Received: from [10.1.197.69] (eglon.cambridge.arm.com [10.1.197.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 557333F66E;
	Fri, 10 Oct 2025 09:55:57 -0700 (PDT)
Message-ID: <5d2b762c-f189-48fc-8ec8-c8bbc316122a@arm.com>
Date: Fri, 10 Oct 2025 17:55:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/29] arm64: kconfig: Add Kconfig entry for MPAM
To: Fenghua Yu <fenghuay@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org
Cc: D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Dave Martin <dave.martin@arm.com>,
 Koba Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 baisheng.gao@unisoc.com, Jonathan Cameron <jonathan.cameron@huawei.com>,
 Rob Herring <robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>,
 Rafael Wysocki <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>
References: <20250910204309.20751-1-james.morse@arm.com>
 <20250910204309.20751-6-james.morse@arm.com>
 <378ae328-089d-4f81-b48b-b5edac7515ed@nvidia.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <378ae328-089d-4f81-b48b-b5edac7515ed@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_175603_776036_60A6ADAF 
X-CRM114-Status: GOOD (  11.10  )
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

Hi Fenghua,

On 02/10/2025 06:06, Fenghua Yu wrote:
> On 9/10/25 13:42, James Morse wrote:
>> The bulk of the MPAM driver lives outside the arch code because it
>> largely manages MMIO devices that generate interrupts. The driver
>> needs a Kconfig symbol to enable it. As MPAM is only found on arm64
>> platforms, the arm64 tree is the most natural home for the Kconfig
>> option.
>>
>> This Kconfig option will later be used by the arch code to enable
>> or disable the MPAM context-switch code, and to register properties
>> of CPUs with the MPAM driver.
>>
>> Signed-off-by: James Morse <james.morse@arm.com>
>> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
>> CC: Dave Martin <dave.martin@arm.com>
> 
> Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>

Thanks!

James

