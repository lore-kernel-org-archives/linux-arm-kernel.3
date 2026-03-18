Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7988E103E162
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 11:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A91dVhJaQ/2kLGs4hbSOo7+E1RH1/oM9kkFdb3UqDOs=; b=sJCR5mjGheGH8Y3C1CGp4X9zsQ
	ECtoIIvJTNTE9Y5LLghR8G5NeYTyJ0DNEKaN7KY39OT6s6zY3EajHtxXPuKPSyNIMZ3s1rdjsR806
	+Nq8t8snnQtb9xey8psHYHCJVSVIOuUGL5gy57rpKDJ9RtnaDELFBaDsXGHUsG6lI31+XJ/vzgCdq
	4KozppLydV21ixorMJUHIqyzDCFk1WEjIynTjwPs9AbA4gdtsO+8rapmdVUWBsegICEBLhbF7Fxw/
	K6G2R3B8MfOOfxpTQ4scocRPD4NEQ1SBlpbAyPkSdAN97evbuLYP+IXB6iNKxaCXDqP+zHQX/8Jqt
	T5SZUGlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2otE-00000008Ibk-0Xnk;
	Wed, 18 Mar 2026 11:16:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2otA-00000008IaU-2guY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 11:16:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 872DA1E2F;
	Wed, 18 Mar 2026 04:16:29 -0700 (PDT)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 17CF93F73B;
	Wed, 18 Mar 2026 04:16:30 -0700 (PDT)
Message-ID: <8dc8eb43-9bc5-46d3-8ce8-06d25fd5eeb7@arm.com>
Date: Wed, 18 Mar 2026 11:16:29 +0000
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH v5 00/41] arm_mpam: Add KVM/arm64 and resctrl glue code
To: Howard Zhang <Howard.Zhang@arm.com>, James Morse <James.Morse@arm.com>
Cc: "amitsinght@marvell.com" <amitsinght@marvell.com>,
 "baisheng.gao@unisoc.com" <baisheng.gao@unisoc.com>,
 "baolin.wang@linux.alibaba.com" <baolin.wang@linux.alibaba.com>,
 "carl@os.amperecomputing.com" <carl@os.amperecomputing.com>,
 Catalin Marinas <Catalin.Marinas@arm.com>, "corbet@lwn.net"
 <corbet@lwn.net>, Dave Martin <Dave.Martin@arm.com>,
 "david@kernel.org" <david@kernel.org>,
 "dfustini@baylibre.com" <dfustini@baylibre.com>,
 "fenghuay@nvidia.com" <fenghuay@nvidia.com>,
 "gshan@redhat.com" <gshan@redhat.com>, Joey Gouly <Joey.Gouly@arm.com>,
 "jonathan.cameron@huawei.com" <jonathan.cameron@huawei.com>,
 "kobak@nvidia.com" <kobak@nvidia.com>,
 "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
 "lcherian@marvell.com" <lcherian@marvell.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "maz@kernel.org" <maz@kernel.org>, "oupton@kernel.org" <oupton@kernel.org>,
 "peternewman@google.com" <peternewman@google.com>,
 "punit.agrawal@oss.qualcomm.com" <punit.agrawal@oss.qualcomm.com>,
 "quic_jiles@quicinc.com" <quic_jiles@quicinc.com>,
 "reinette.chatre@intel.com" <reinette.chatre@intel.com>,
 Rohit Mathew <Rohit.Mathew@arm.com>,
 "scott@os.amperecomputing.com" <scott@os.amperecomputing.com>,
 "sdonthineni@nvidia.com" <sdonthineni@nvidia.com>,
 Suzuki Poulose <Suzuki.Poulose@arm.com>,
 "tan.shaopeng@fujitsu.com" <tan.shaopeng@fujitsu.com>,
 "will@kernel.org" <will@kernel.org>,
 "xhao@linux.alibaba.com" <xhao@linux.alibaba.com>,
 "zengheng4@huawei.com" <zengheng4@huawei.com>
References: <A76F5D3E-4AB1-4418-B250-2ED9DD1BBE56@arm.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <A76F5D3E-4AB1-4418-B250-2ED9DD1BBE56@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_041637_720555_BEC2E6A9 
X-CRM114-Status: GOOD (  12.12  )
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

Hi Howard,

On 3/18/26 09:52, Howard Zhang wrote:
> Hi Ben, James,
> 
> I have a few questions regarding MPAM support in the kernel:
> 
> Are there any plans to upstream L3 partitioning with capacity-based allocation (in addition to the existing way-based partitioning)?

Yes, there is some preliminary work required to establish how new schema will be added to
resctrl but I expect cache capacity, CMIN/CMAX, to be some of the first features to use it.
[1] has some discussion on now to introduce new schema.

[1] https://lore.kernel.org/lkml/aPtfMFfLV1l%2FRB0L@e133380.arm.com/

> 
> Thanks for your time.
> 
> Best regards,
> Howard

Thanks,

Ben

