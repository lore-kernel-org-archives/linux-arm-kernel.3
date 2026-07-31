Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE1D8C54F54
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 16:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3oSPo/QkAHOUHrcuIVZ6KwocCD4v1uwf/1m4LU9tfeE=; b=RBrrPlKA/l/81QCVORKG0I3fjc
	dEPZmNPbmfQrJD6IlOhu6MW0SUCJJD0I2U5Z0Jhw8dzrzoemX2w0LwPr+MDYZ6djCWBd5QfTgIiyM
	ED9oK09Lb22hZ/YiK1KmSb0Iaj1jsQaHWV44pHb5sFNBPqQ/OpKZ0QUzTGpT8Yd0xRcPSCMohrla/
	paQKtRdcXtOlSJDJfZVcl+Tee5kt5ibDvSCdWhI1OGtyxPh37f82w6j9YdEMC6ySkr52S2F+f8FGZ
	65X1V6jIwR3RbN+9frIAwCLDVEduq8fIjHlgHC+TUlKHyBRnYhWmdvD1X+BWLJyuHuVh4C/H4ZNEL
	RmhEZ4OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpq9j-0000000D8oY-1dcT;
	Fri, 31 Jul 2026 16:32:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpq9h-0000000D8nU-0ik1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 16:32:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2E4B1204C;
	Fri, 31 Jul 2026 09:32:12 -0700 (PDT)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 71A233F86F;
	Fri, 31 Jul 2026 09:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785515536; bh=VbxlaKfrlvVQz4HJBJtoAZXt2oWQTXMKrfRAQCHlrvA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hPN34vbp4F+JtFjYjq6NM52DmQeW5hEDr6P+aePDLP9XQTBQlk/4DQFEiSoKV7i9C
	 9tODQZM7wZhedQAcGCLw4TeprZtegBAK6FHBJmda9baR/SbeWQElXQPVb/B+u6elaV
	 RDBrh+ctknoQg4I+hoR4xBAtYGanTZKVFUFlZhpc=
Message-ID: <771b0fb7-7689-49dd-a06f-8bef174e432d@arm.com>
Date: Fri, 31 Jul 2026 18:32:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/10] arm_mpam: Add MPAM-Fb firmware support
To: Ben Horgan <ben.horgan@arm.com>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, Hanjun Guo <guohanjun@huawei.com>,
 Sudeep Holla <sudeep.holla@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 James Morse <james.morse@arm.com>,
 Reinette Chatre <reinette.chatre@intel.com>, Fenghua Yu <fenghuay@nvidia.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
 Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
 Ganapatrao Kulkarni <ganapatrao.kulkarni@oss.qualcomm.com>,
 Trilok Soni <tsoni@quicinc.com>, Srinivas Ramana <sramana@qti.qualcomm.com>,
 Niyas Sait <niyas.sait@arm.com>, Lee Trager <lee@trager.us>,
 Ritwick Sharma <ritwick.sharma@arm.com>, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260730152539.2712312-1-andre.przywara@arm.com>
 <af820923-c423-4f19-99dd-7d8fdd2da864@arm.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <af820923-c423-4f19-99dd-7d8fdd2da864@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_093217_328766_A694B981 
X-CRM114-Status: GOOD (  16.85  )
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

Hi Ben,

On 7/30/26 19:10, Ben Horgan wrote:
> Hi Andre,
> 
> On 7/30/26 16:25, Andre Przywara wrote:
> [...]
>> The first six patches rework all MSC access wrappers to propagate error
>> information. Pure MMIO based MSC accesses would never fail, but the
>> MPAM-Fb access can go wrong in multiple ways. The patches have been split
>> up purely for reviewing reasons, if the number is a problem, we could as
>> well squash them. Please note that until the very last patch of this series
>> any MSC accesses would always only return 0, it's only the final enablement
>> of MPAM-Fb that could possibly introduce errors. Hence all former patches
>> can add error handling gradually, those code paths wouldn't be triggered
>> before patch 10/10.
> 
> I had a go at injecting some errors and noticed that at least some aren't getting to user space.
> When writing the schemata file any MPAM-Fb error is not propagated to the user. The
> resctrl_arch_update_domains() continues to return 0 as there are some missing links in the chain
> down to the writes, e.g. __write_config() always returns 0.

Ah yeah, that's true. With the write functions using a compatible 
prototype (just ignoring the new return value) this is harder to check, 
since the compiler is just fine with it.

So I propagate all MSC access errors now in mpam_reprogram_ris_partid(), 
and the depending mpam_apply_config(), __write_config and 
mpam_reset_ris() functions. From my quick analysis I'd say that covers 
all functions now that mpam_devices.c exports. That will be a new patch 
07/11.

Cheers,
Andre

