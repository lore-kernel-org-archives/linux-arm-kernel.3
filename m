Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C36E2D3B7EA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 14:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aTiH5HAxrxt4Q/8HiYZa4AwIODsYXQjnh1VIP3qiNv0=; b=Hj+wIpxLWN9ZkaFxF6kWKp4NRO
	ziapUufjwQKuebCjIRXhCURjsi13Jhub/zDbKYS8nO9hOLi7VaCq/Y3QuL+r/GvfdGx1Mt13DaSKZ
	cvbBIBKA4B6bBN8U+AaDqQI+y/z/2vGOP0vQVT2UQJPtlaeMJQ1A6YatAeR5O3iOG219vIe2hbMwE
	A01hmMgXggyoGbnnUpB+FLYJ5G4RsUVV7iqMCfmI3GbiA13Au+26edIMNIP0TGZFZbKuwaQSMz5Cn
	2LIhb6TxX5B+fuGNzymTRmocX6He8ZLFHnLIJ/nPbLsQjrh2vr/6VkFGUctnDNY+xzI7RcJKD5nbs
	XbyLGjbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSytL-0000000EPkG-1Rbr;
	Tue, 09 Dec 2025 14:40:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSytI-0000000EPjd-2S9W
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 14:40:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EDF7E175D;
	Tue,  9 Dec 2025 06:40:25 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DF16A3F73B;
	Tue,  9 Dec 2025 06:40:29 -0800 (PST)
Message-ID: <41bcd0d2-d5b8-4f3d-b0b3-132387f547ed@arm.com>
Date: Tue, 9 Dec 2025 14:40:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 00/38] arm_mpam: Add KVM/arm64 and resctrl glue code
To: James Morse <james.morse@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@kernel.org>, Dave Martin <dave.martin@arm.com>,
 Koba Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 fenghuay@nvidia.com, baisheng.gao@unisoc.com,
 Jonathan Cameron <jonathan.cameron@huawei.com>, Gavin Shan
 <gshan@redhat.com>, rohit.mathew@arm.com, reinette.chatre@intel.com,
 Punit Agrawal <punit.agrawal@oss.qualcomm.com>
References: <20251205215901.17772-1-james.morse@arm.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <20251205215901.17772-1-james.morse@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_064036_669893_2CDD0658 
X-CRM114-Status: GOOD (  13.42  )
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

Hi James and all,

As James is otherwise occupied, I am planning to post a follow up
version of this series once it's had time to be reviewed. I will be
posting my own review comments; please give them extra scrutiny.

On 12/5/25 21:58, James Morse wrote:
> This is the missing piece to make MPAM usable resctrl in user-space. This has
> shed its debugfs code and the read/write 'event configuration' for the monitors
> to make the series smaller.
> 
[...]
> 
> This series is based on arm64/for-next/core, and can be retrieved from:
> https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/glue/rfc
> 
> There is no snapshot branch - this is it!
> I'll push the extras branch once I've gotten a handle on the DT shaped mess in
> there.

One major departure from the previous snapshot branches referenced in
the base driver series is that the same MPAM setting are used for
kernel-space and user-space. That is, MPAM1_EL1 is set to the same value
as MPAM0_EL1 rather than keeping the default value. The advantages of
this are that it is closer to the x86 model where the closid is globally
applicable, all partids are usable from user-space and user-space can't
bypass MPAM controls by doing the work in the kernel. However, this
causes some priority inversion where a high priority task waits to take
a mutex held by another whose resources are restricted by MPAM.
Thanks,

Ben


