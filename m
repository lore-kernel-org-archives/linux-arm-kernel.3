Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 312FECCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 15:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jmWLeH97fIztN3BxpfVTr0ckNNYcHK6aY96DN2VwNkI=; b=MINUxhKUfBZkQ/zNYJyZp/PT9U
	C589ba8xNdJXLktwbWG3eliRxzDmitsmBxpL03lJQs+73lMbzeIv8i33fvjA/TIAlSiPF3Z2HTUsu
	TyDTeIDSNGgU9Ae4CNai5jXUapztsPmqC1ha5+XcCqH0LYtLqXEGnrf+5fUSGMC2rprNcgdjA5CLI
	ci/aG9FT7Jj+e190cXE3/o/OYZUc24acW29OFwaNHj2knjtb+Jqa4FTngTkk3dRdMdpG0LAI3H/36
	LrYcySStmrVNuRgFoF7pbSUkrYf+GAdIphEhhLMSmKmSRY9eiiU09wvzuqdhHCCl4aaNt4fCOD5eu
	Y0WKpb1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJCv3-000000094xK-3P2g;
	Wed, 12 Nov 2025 15:38:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJCv0-000000094wO-33EN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 15:37:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 17ED01515;
	Wed, 12 Nov 2025 07:37:50 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2670E3F66E;
	Wed, 12 Nov 2025 07:37:53 -0800 (PST)
Message-ID: <83ba6e8f-30be-4e82-ae1f-2443a0f16d3c@arm.com>
Date: Wed, 12 Nov 2025 15:37:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/33] arm_mpam: Add probe/remove for mpam msc driver and
 kbuild boiler plate
To: "Shaopeng Tan (Fujitsu)" <tan.shaopeng@fujitsu.com>,
 "james.morse@arm.com" <james.morse@arm.com>
Cc: "amitsinght@marvell.com" <amitsinght@marvell.com>,
 "baisheng.gao@unisoc.com" <baisheng.gao@unisoc.com>,
 "baolin.wang@linux.alibaba.com" <baolin.wang@linux.alibaba.com>,
 "bobo.shaobowang@huawei.com" <bobo.shaobowang@huawei.com>,
 "carl@os.amperecomputing.com" <carl@os.amperecomputing.com>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "dakr@kernel.org" <dakr@kernel.org>,
 "dave.martin@arm.com" <dave.martin@arm.com>,
 "david@redhat.com" <david@redhat.com>,
 "dfustini@baylibre.com" <dfustini@baylibre.com>,
 "fenghuay@nvidia.com" <fenghuay@nvidia.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "gshan@redhat.com" <gshan@redhat.com>,
 "guohanjun@huawei.com" <guohanjun@huawei.com>,
 "jeremy.linton@arm.com" <jeremy.linton@arm.com>,
 "jonathan.cameron@huawei.com" <jonathan.cameron@huawei.com>,
 "kobak@nvidia.com" <kobak@nvidia.com>,
 "lcherian@marvell.com" <lcherian@marvell.com>,
 "lenb@kernel.org" <lenb@kernel.org>,
 "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
 "peternewman@google.com" <peternewman@google.com>,
 "quic_jiles@quicinc.com" <quic_jiles@quicinc.com>,
 "rafael@kernel.org" <rafael@kernel.org>, "robh@kernel.org"
 <robh@kernel.org>, "rohit.mathew@arm.com" <rohit.mathew@arm.com>,
 "scott@os.amperecomputing.com" <scott@os.amperecomputing.com>,
 "sdonthineni@nvidia.com" <sdonthineni@nvidia.com>,
 "sudeep.holla@arm.com" <sudeep.holla@arm.com>,
 "will@kernel.org" <will@kernel.org>,
 "xhao@linux.alibaba.com" <xhao@linux.alibaba.com>
References: <20251107123450.664001-1-ben.horgan@arm.com>
 <20251107123450.664001-11-ben.horgan@arm.com>
 <OSZPR01MB879857F2126672D1EADA04668BCCA@OSZPR01MB8798.jpnprd01.prod.outlook.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <OSZPR01MB879857F2126672D1EADA04668BCCA@OSZPR01MB8798.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_073758_902560_77E1A526 
X-CRM114-Status: GOOD (  12.35  )
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

Hi Shaopeng,

On 11/12/25 07:22, Shaopeng Tan (Fujitsu) wrote:
> Hello Ben,
> 
>> From: James Morse <james.morse@arm.com>
>>
>> Probing MPAM is convoluted. MSCs that are integrated with a CPU may only be
>> accessible from those CPUs, and they may not be online.
>> Touching the hardware early is pointless as MPAM can't be used until the
>> system-wide common values for num_partid and num_pmg have been
>> discovered.
>>
>> Start with driver probe/remove and mapping the MSC.
>>
>> CC: Carl Worth <carl@os.amperecomputing.com>
>> Tested-by: Fenghua Yu <fenghuay@nvidia.com>
>> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
>> Tested-by: Peter Newman <peternewman@google.com>
>> Signed-off-by: James Morse <james.morse@arm.com>
>> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
>> ---
[...]
>> +static struct mpam_msc *do_mpam_msc_drv_probe(struct platform_device
>> +*pdev) {
>> +	int err;
>> +	u32 tmp;
>> +	struct mpam_msc *msc;
>> +	struct resource *msc_res;
>> +	struct device *dev = &pdev->dev;
>> +
>> +	lockdep_assert_held(&mpam_list_lock);
>> +
>> +	msc = devm_kzalloc(&pdev->dev, sizeof(*msc), GFP_KERNEL);
>> +	if (!msc)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	err = devm_mutex_init(dev, &msc->probe_lock);
>> +	if (err)
>> +		return ERR_PTR(err);
>> +	err = devm_mutex_init(dev, &msc->part_sel_lock);
>> +	if (err)
>> +		return ERR_PTR(err);
>> +	msc->id = pdev->id;
>> +	msc->pdev = pdev;
>> +	INIT_LIST_HEAD_RCU(&msc->all_msc_list);
>> +	INIT_LIST_HEAD_RCU(&msc->ris);
>> +
>> +	err = update_msc_accessibility(msc);
>> +	if (err)
>> +		return ERR_PTR(err);
> 
> Since the return value of update_msc_accessibility(msc) is always 0,
> this check is unnecessary.

Yes, I've changed update_msc_accessibility() to return void.
> 
> Best regards,
> Shaopeng TAN
> 
Thanks,

Ben


