Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9276DCED620
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 14:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O9iTh2137MeLwet+uDUJcLWb/j2J20Ht3p6GhuvNkQM=; b=C177KHM5jObK/UPSfv7OMGvToC
	hMwK3TQ0tL/18g3ieDzCfwBmtmKYx01VtkotKmPGWQG+lRGDD+4JLFqMv7shGgNBbFnfM8fAhUH53
	4ACH03y3k1PmlMwbi/T2yJsIcUKaczVbhmdPzz8WyJbaVvXg4Bskp9Ta2uZJpZXJASq1pPaNkIreJ
	RVE7zFQgTfFRdLigsaq/HPLadzEfnF1vmTPnZEM5hg4tvYAcMTvey/LCDVo1aN5+t4ucgMgejOi/r
	WkujPPTz7KVpqxLe+Df10aBcNnD5NAveaV76eIRViG+f7JeVDrPr25lhojz6TmBOLvP10RSKnKUzg
	bDvOyvCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLMQp-00000000XUt-1zDu;
	Tue, 18 Nov 2025 14:11:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLMQl-00000000XUX-2geV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 14:11:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 994C1FEC;
	Tue, 18 Nov 2025 06:11:30 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2ADE73F740;
	Tue, 18 Nov 2025 06:11:33 -0800 (PST)
Message-ID: <753f4d26-efa9-4ffd-a820-7c2a53c0bc5f@arm.com>
Date: Tue, 18 Nov 2025 14:11:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/33] arm_mpam: Add basic mpam driver
To: Drew Fustini <fustini@kernel.org>
Cc: james.morse@arm.com, amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, bobo.shaobowang@huawei.com,
 carl@os.amperecomputing.com, catalin.marinas@arm.com, dakr@kernel.org,
 dave.martin@arm.com, david@redhat.com, dfustini@baylibre.com,
 fenghuay@nvidia.com, gregkh@linuxfoundation.org, gshan@redhat.com,
 guohanjun@huawei.com, jeremy.linton@arm.com, jonathan.cameron@huawei.com,
 kobak@nvidia.com, lcherian@marvell.com, lenb@kernel.org,
 linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, lpieralisi@kernel.org, peternewman@google.com,
 quic_jiles@quicinc.com, rafael@kernel.org, robh@kernel.org,
 rohit.mathew@arm.com, scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 sudeep.holla@arm.com, tan.shaopeng@fujitsu.com, will@kernel.org,
 xhao@linux.alibaba.com
References: <20251107123450.664001-1-ben.horgan@arm.com> <aRoG+UptQg9mix+7@x1>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <aRoG+UptQg9mix+7@x1>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_061139_746940_C34BAEE8 
X-CRM114-Status: GOOD (  15.42  )
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

Hi Drew,

On 11/16/25 17:16, Drew Fustini wrote:
> On Fri, Nov 07, 2025 at 12:34:17PM +0000, Ben Horgan wrote:
>> Hi all,
> [snip]
>> The rest of the driver can be found here: (no updated version - based on v3)
>> https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot/v6.18-rc1
> 
> Does anyone know of a hosting platform that offers ARM machines that
> have MPAM?

As far as I know there aren't any.

There is some MPAM support in the Orion Radxa board which is likely the
cheapest option. The MPAM acpi table isn't in the firmware though so
you'd need to load a custom table. James has this working.

> 
> I see there are Ampere systems on Oracle but I wasn't sure if those have
> MPAM.
> 
> I'm getting a RISC-V QoS patch series ready (Ssqosid ext and CBQRI spec)
> and I'd like to get a better understanding of how resctrl works on MPAM
> in practice.
> 
> Thanks,
> Drew


Thanks,

Ben


