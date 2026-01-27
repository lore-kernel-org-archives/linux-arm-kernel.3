Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E42A9D2F036
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 14:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xGh9zaQAUEJ/U9uRcea7/tH7ChPi2RgaDJQUqEGPI+s=; b=G1MVIFAyHSQqNhTb3G9ygIiMpz
	QbGEQ/uNimmOZU41v2+sQowvVWO0hZu10ZbpmU8GonYgbPhIoHSM0H6lKhfWY1RpBFgizmiK9iC7Y
	kJyeb74K6rRaGJYI6C1u7CIcCupV03fMU21nzeWhVkYjy479upbfsJimU4hQWrtF1BciVDxvDIR6I
	jSg+nVBIKqimFgp3/ZWk7qEi5k8T1I6NzGe9gBz1RBMTQF8Uf6WcCcSoGv3+XW1+AlwerTSXMSWDv
	Ya9mIju1yEuUmow0Oaf03aZ7klLbAroGg4GQpB7kQMULHNK8DNQfLfLpx7JEUxmPMAk2O1fOESZcu
	7J5Vlxwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkk5h-0000000EOos-3a1V;
	Tue, 27 Jan 2026 14:30:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkk5e-0000000EOnF-0D4k
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 14:30:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 81CA31595;
	Tue, 27 Jan 2026 06:30:36 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E27663F73F;
	Tue, 27 Jan 2026 06:30:38 -0800 (PST)
Message-ID: <37f87d5d-bd70-4b13-93e0-8024108be948@arm.com>
Date: Tue, 27 Jan 2026 14:30:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: cpufeature: Add support for the MPAM v0.1
 architecture version
To: Zeng Heng <zengheng4@huawei.com>, james.morse@arm.com,
 miko.lenczewski@arm.com, thuth@redhat.com, mark.rutland@arm.com,
 yeoreum.yun@arm.com, robh@kernel.org, james.clark@linaro.org,
 ahmed.genidi@arm.com, xry111@xry111.site, oupton@kernel.org,
 lpieralisi@kernel.org, catalin.marinas@arm.com, mrigendra.chaubey@gmail.com,
 suzuki.poulose@arm.com, maz@kernel.org, ardb@kernel.org, broonie@kernel.org,
 will@kernel.org, kevin.brodsky@arm.com, leo.yan@arm.com,
 anshuman.khandual@arm.com, yang@os.amperecomputing.com, frederic@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 bobo.shaobowang@huawei.com
References: <20260104133434.1887677-1-zengheng4@huawei.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <20260104133434.1887677-1-zengheng4@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_063046_142062_0E2E3416 
X-CRM114-Status: GOOD (  12.22  )
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

Hi Zeng,

On 1/4/26 13:34, Zeng Heng wrote:
> According to the MPAM spec [1], the supported architecture versions are
> v1.0, v1.1 and v0.1. MPAM versions v0.1 and v1.1 are functionally
> identical, but v0.1 additionally supports the FORCE_NS feature.
> 
> ID_AA64PR | ID_AA64PR | MPAM Extension | Notes
> F0_EL1.   | F1_EL1.   | Architecture   |
> MPAM      | MPAM_frac | version        |
> ---------------------------------------------------------------------------
> 0b0000    | 0b0001    | v0.1           | MPAM v0.1 is implemented.
>           |           |                | MPAM v0.1 is the same as MPAM v1.1
>           |           |                | with FORCE_NS which is
>           |           |                | incompatible with MPAM v1.0.
> ---------------------------------------------------------------------------
> 0b0001    | 0b0000    | v1.0           | MPAM v1.0 is implemented.
> ---------------------------------------------------------------------------
> 0b0001    | 0b0001    | v1.1           | MPAM v1.1 is implemented.
>           |           |                | MPAM v1.1 includes all features of
>           |           |                | MPAM v1.0.
>           |           |                | It must not include FORCE_NS.
> 
> FORCE_NS is a feature that operates in EL3 mode. Consequently, the current
> Linux MPAM driver is also compatible with MPAM v0.1. To support v0.1, the
> existing driver which only checks ID_AA64PFR0_EL1.MPAM for the major
> version needs to examine ID_AA64PFR1_EL1.MPAM_frac for the minor version
> as well.
> 
> [1] https://developer.arm.com/documentation/ddi0598/db/?lang=en
> 
> Signed-off-by: Zeng Heng <zengheng4@huawei.com>
So far we've avoided added MPAM 0.1 support as we don't know of any
machines using it. What's your motivation here? Do you have a machine
with MPAM 0.1 that runs mainline linux?

Thanks,

Ben


