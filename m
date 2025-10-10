Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08BC6CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 16:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RofIudv5YXMEEthWbgRH6JEHQjcGmNomXmHjIUiRjlY=; b=YSAsTjZXDIMaWNASCUJ7tS3HRe
	Wbcfd79oQ9U/Zp4c/iKqlDnqwEHtloL7jw6MQwCiadgaBOK9lOSRZhuukCyUjqBeUwmYKCorEXz/A
	ZO/IctqngeD7xMs22h6U/4qmbhj+I8a5DHOL4t0tgQddpBl07a8H3qT8wnxe1kZsq6i7eKr5TGC0U
	X1nNysr5qgI2NzmJ5arwLGHz5y5HryfRjUncBmCJospWkUoaTp5kN2RN4FICzyXG02lgaHUSYZHyk
	ZRdbiJ+yGPi+rPWcQLE1bRWw5JFp4a+d5Cz7xCfAr4tBHNWCNdNgfqv+ydOQ60bJyLFyRbuhHWyrE
	fPrrFlPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7GPe-000000091Ex-2R0o;
	Fri, 10 Oct 2025 16:56:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7GPc-000000091DU-3zrZ
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 10 Oct 2025 16:56:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=RofIudv5YXMEEthWbgRH6JEHQjcGmNomXmHjIUiRjlY=; b=Ydat7GGOW1OISNwq+fl8ZtIO3h
	FeYtz2gaOUsxYInvmB+ssVnNOmm2Ean0QNAA7FCmezjWMN6U6apFQ63vLNuMey/d75J8xpG3YjAeO
	gtPPlfyUPyzKqw0JfvCcwPGVrRlnOT4fi9YyP/rupxTjyqfgZJz3XhomkoFNvbiOrnNYkhksB3Mt9
	GtKEXKQQvuyZlcWziuQizzDlVmBWa7OmSjBidx4zwQU5thMpv/HQWMwOw+23+YW2/V586OoD65tPB
	OU72hZBsHCzuDvWmA0WqhhDYgtXU5Stike+96NNOPpzrcl+JS2k4QyGu4lSRjLzjnqMKkmvLPJSG6
	aU9FQZEA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7GPZ-00000002JQ6-43ii
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 16:56:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 373D0153B;
	Fri, 10 Oct 2025 09:56:01 -0700 (PDT)
Received: from [10.1.197.69] (eglon.cambridge.arm.com [10.1.197.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 10FE13F66E;
	Fri, 10 Oct 2025 09:56:02 -0700 (PDT)
Message-ID: <ae1f55e4-d7b0-48cb-9cf9-da272cc934ac@arm.com>
Date: Fri, 10 Oct 2025 17:55:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/29] arm64: kconfig: Add Kconfig entry for MPAM
To: Gavin Shan <gshan@redhat.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org
Cc: D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Dave Martin <dave.martin@arm.com>,
 Koba Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 fenghuay@nvidia.com, baisheng.gao@unisoc.com,
 Jonathan Cameron <jonathan.cameron@huawei.com>, Rob Herring
 <robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>,
 Rafael Wysocki <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>
References: <20250910204309.20751-1-james.morse@arm.com>
 <20250910204309.20751-6-james.morse@arm.com>
 <ef45ce3a-7a78-45c8-8196-75923af7c6ab@redhat.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <ef45ce3a-7a78-45c8-8196-75923af7c6ab@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_175610_349793_7B9E4883 
X-CRM114-Status: GOOD (  10.95  )
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

Hi Gavin,

On 03/10/2025 01:32, Gavin Shan wrote:
> On 9/11/25 6:42 AM, James Morse wrote:
>> The bulk of the MPAM driver lives outside the arch code because it
>> largely manages MMIO devices that generate interrupts. The driver
>> needs a Kconfig symbol to enable it. As MPAM is only found on arm64
>> platforms, the arm64 tree is the most natural home for the Kconfig
>> option.
>>
>> This Kconfig option will later be used by the arch code to enable
>> or disable the MPAM context-switch code, and to register properties
>> of CPUs with the MPAM driver.

> Reviewed-by: Gavin Shan <gshan@redhat.com>

Thanks!

James

