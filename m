Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F83ECCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 16:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jWQyXzPktnHM0lyhtci7hdJLuhRFo2haHp8zTfqpcOc=; b=Mdv0P3SWbp64q/RLHWzj2YyO9R
	q4aBr+wxEo/5ZOMS0CeCP22WgFxkYc3F3Gj13INx/72noOrhdX2YcDA2TTwJ8SERCt04xcIrZKOFb
	OUg4/SRFTSX8fYUPL1TU64z96e3Qxth5dOKLvbsCkSY2JxvyonP7FAhVRG56gyKVLNr/6Lzz97Oq3
	ZkzeoMnPWrz3STy/+Sg1z2MycS/qihVdSu1o+4aEhKaevLoTi3m33VrhttXgsV/Ca5UaLOEvorLGw
	7ZzIleqIjjUmTx16qSrYi+tnL6a4j58x81hPiWcjvN8Gaz0YCik1Cd3ekXKrOcuBzdDo4mE68cM0R
	+DHjcUSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIUMm-00000005l8q-48R9;
	Mon, 10 Nov 2025 16:03:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIUMi-00000005l7m-0RZ4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 16:03:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 964732F;
	Mon, 10 Nov 2025 08:03:27 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A15E43F66E;
	Mon, 10 Nov 2025 08:03:30 -0800 (PST)
Message-ID: <29bb9d3c-cc78-46f2-b3dd-dbe12c59b2a9@arm.com>
Date: Mon, 10 Nov 2025 16:03:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/33] arm_mpam: Add basic mpam driver
To: james.morse@arm.com
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
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
References: <20251107123450.664001-1-ben.horgan@arm.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <20251107123450.664001-1-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_080336_207272_AEAE6E4B 
X-CRM114-Status: UNSURE (   6.14  )
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

Hi all,

On 11/7/25 12:34, Ben Horgan wrote:

> 
> The rest of the driver can be found here: (no updated version - based on v3)
> https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot/v6.18-rc1
> 

James has kindly hosted a branch with my rebase of the rest of the
driver here.
https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/log/?h=mpam/snapshot/v6.18-rc4

This can be used to help with more testing.

Thanks,

Ben


