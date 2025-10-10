Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62DC1CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 16:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SL5o12mLazwlRJEKXLYDhbwx9B7wdDTY6BGG6jKEbGE=; b=nYHr6gqSdf94NvIJt7zU0JMUei
	PqZYjzRDwQmoOq9fMREXRnwBQ+BtkB5l4JyxovINi1AAdkJhlq3zh2gvyoC5QGgxhwchPD50ivrSL
	AVUzFT/45dqK/q6Sa5ZOOBd/gPoxHmiC3qRgIOJJVXj4njtDw+vokI2shC0sYby/8k9yWug09+1JS
	E6HV42xTRn8UceTJ88opu0zoOxWZmG6r/FiJZSCUt6fgcz/2M2Ty48erqq2psbzqzgblkZy3OfAjz
	qXOBWY3Xo6BvTWnSDR6xrgepurXoyEzcEWCNlbiPJ8ss2THRy55bpvW1vhW2BrUh1fp29s4qU/z70
	Lr44PXuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7GOK-000000090b8-3dHM;
	Fri, 10 Oct 2025 16:54:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7GOK-000000090aF-0vsy
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 10 Oct 2025 16:54:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=SL5o12mLazwlRJEKXLYDhbwx9B7wdDTY6BGG6jKEbGE=; b=noSANieTKP+9QXbO+Fvu8ea1HQ
	KDsZjV99Iz7SCYWQiNag5KuoTzpcOkPw8k40AClAOYyMHcKd3D3NTdPZyJuW+zQztUJOFjv4LoMuP
	BLjYPNUURxkDkTOQXd1UkW8jE0wPDptciZ+1FqNyVmE+HRqll15RAyYCV6wjdPnfVRFv15OEKugos
	heWi3Ty/bT7oaHR28nmq9IFtTffsIRUtMqd3bGTmsY49YUFc+3JznY5PcpJ1kkqiW23qbWU0Xh54+
	69MtYcFFVTXOk2PJtrHFjXTYEy0LvubLREiMEmKw73rUsmejC+cS1UOXw3t1/9zCbg24LCfJzU7X2
	NH9A59RA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7GOH-00000002JCM-06u4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 16:54:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 41C7C1713;
	Fri, 10 Oct 2025 09:54:40 -0700 (PDT)
Received: from [10.1.197.69] (eglon.cambridge.arm.com [10.1.197.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1691A3F66E;
	Fri, 10 Oct 2025 09:54:42 -0700 (PDT)
Message-ID: <b2d79768-fb1c-4a15-8a1c-f519bc81eeb7@arm.com>
Date: Fri, 10 Oct 2025 17:54:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 29/29] arm_mpam: Add kunit tests for props_mismatch()
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
 <20250910204309.20751-30-james.morse@arm.com>
 <1c0907cc-5cfe-448e-a308-c347566c1f68@nvidia.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <1c0907cc-5cfe-448e-a308-c347566c1f68@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_175449_241319_7FA3A4AB 
X-CRM114-Status: UNSURE (   7.39  )
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

Hi Fenghua,

On 26/09/2025 03:36, Fenghua Yu wrote:
> On 9/10/25 13:43, James Morse wrote:
>> When features are mismatched between MSC the way features are combined
>> to the class determines whether resctrl can support this SoC.
>>
>> Add some tests to illustrate the sort of thing that is expected to
>> work, and those that must be removed.
>>
>> Signed-off-by: James Morse <james.morse@arm.com>
> 
> Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>


Thanks!

James

