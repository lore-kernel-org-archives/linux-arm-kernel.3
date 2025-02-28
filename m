Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 946D4C282C5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 12:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C6MJUKJ8ivAcDg8zvEnS4P7480VlBNsvsYgvIkxghDI=; b=HJs+IRQM4F8O23lhyP8n/S1m7X
	hTWXIItnRf6cdTxP/RseAQI0escyC+Iy9Wt0UvmdCsmWvpmbVXM4FuAaLb2q78mWkBNtvQQdhTeOJ
	u+SRPVGtR9oIyo5GLY6yYzirevC2M6aw296dw7vTvQtFHpHHPqRlMUHdMfhLC02kS4MP1SFsHdJlP
	TCeXXbNHcr1xxruS4g18EGnvvBD+U7C/m/H6X0Eu4m4PR3XCwWJPXv+d9kGxAXXhtWJg06TOfs5qv
	UrCmmlEk5YXeWUhujBZzy/syk2dR51a2ZMHx/ewVf5yYmt/bXaxtcsfkSBQ1/HF+1hX4IgCepUzka
	k5tHx86g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnzTp-0000000AuVY-0Qey;
	Fri, 28 Feb 2025 12:28:37 +0000
Received: from out30-132.freemail.mail.aliyun.com ([115.124.30.132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnzRc-0000000Au4h-3yF7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 12:26:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1740745577; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=C6MJUKJ8ivAcDg8zvEnS4P7480VlBNsvsYgvIkxghDI=;
	b=fqFVt/LHo9epLiQuqX6PRTK9p1LGJsjbwhYViYHImSGC77BPl2zCOpvZGBStCHtL0FQjL4e/HfySDDWYdvMhksNNDOPc35z2/082N1HpOgJUGkoip+J490kuPjbaKAkC68gM/fTUviYeH/iSjc9z7cG/0cRPQjumjApT4Cq5gfg=
Received: from 30.246.161.128(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0WQPe85r_1740745568 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 28 Feb 2025 20:26:10 +0800
Message-ID: <73087b1d-b43a-4fa3-b775-c8797460f01a@linux.alibaba.com>
Date: Fri, 28 Feb 2025 20:26:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v18 2/3] mm: memory-failure: move return value
 documentation to function declaration
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: yazen.ghannam@amd.com, mark.rutland@arm.com, mingo@redhat.com,
 robin.murphy@arm.com, Jonathan.Cameron@huawei.com, bp@alien8.de,
 rafael@kernel.org, linux-arm-kernel@lists.infradead.org,
 wangkefeng.wang@huawei.com, tanxiaofei@huawei.com, mawupeng1@huawei.com,
 tony.luck@intel.com, linmiaohe@huawei.com, naoya.horiguchi@nec.com,
 james.morse@arm.com, tongtiangen@huawei.com, gregkh@linuxfoundation.org,
 will@kernel.org, jarkko@kernel.org, linux-acpi@vger.kernel.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
 linux-edac@vger.kernel.org, x86@kernel.org, justin.he@arm.com,
 ardb@kernel.org, ying.huang@linux.alibaba.com, ashish.kalra@amd.com,
 baolin.wang@linux.alibaba.com, tglx@linutronix.de,
 dave.hansen@linux.intel.com, lenb@kernel.org, hpa@zytor.com,
 robert.moore@intel.com, lvying6@huawei.com, xiexiuqi@huawei.com,
 zhuo.song@linux.alibaba.com, lpieralisi@kernel.org, guohanjun@huawei.com,
 sudeep.holla@arm.com
References: <20250107081735.16159-1-xueshuai@linux.alibaba.com>
 <20250107081735.16159-3-xueshuai@linux.alibaba.com>
 <Z8BbFRupgknBTvH8@arm.com>
 <0c93542f-4521-41bc-a030-5b2d8621aa6a@linux.alibaba.com>
 <Z8GeBJ9tTayTm9s9@arm.com>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <Z8GeBJ9tTayTm9s9@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_042621_625449_B9390907 
X-CRM114-Status: UNSURE (   8.09  )
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



在 2025/2/28 19:29, Catalin Marinas 写道:
> On Fri, Feb 28, 2025 at 09:46:30AM +0800, Shuai Xue wrote:
> [...]
>>> On Tue, Jan 07, 2025 at 04:17:34PM +0800, Shuai Xue wrote:
>>>> Part of return value comments for memory_failure() were originally
>>>> documented at the call site. Move those comments to the function
>>>> declaration to improve code readability and to provide developers with
> [...]
>> By the way, could arm maintainers help to ack patch 1 and 3 if there
>> is no objection?
> 
> James Morse is listed as reviewer of the ACPI APEI code but he's busy
> with resctrl/MPAM. Adding Lorenzo, Sudeep and Hanjun as arm64 ACPI
> maintainers, hopefully they can help. Here's the full series:
> 
> https://lore.kernel.org/r/20250107081735.16159-1-xueshuai@linux.alibaba.com/
> 

Thank you for your assistance.
Looking forward to any updates.

Best regards,
Shuai


