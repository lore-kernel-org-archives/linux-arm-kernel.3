Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2F50CD3436
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 03:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dWDrmbH/nh19OGeB9tG1Hw5e09VKA/1IueRnzMbUVdY=; b=18oRgzK5rY2wyAudSrg/raNZhm
	JouUSs9NZg5xOTVxWaFJj8bQnPKeMyP8sNR0vbu3qzpSJDAywvhbEpCbHhWiZ7lzheZIrmkEn5Nf0
	22OVgH7h1UyhSMEP8vIZ8DT/1rTUTFUF4jUVltzHV5bzgApNBWoWf7N9iDFddfeishprHNVpP6EKL
	dSJHRr/2wTbf/8MvPdAvuq18fRU5FvSbzaRfiHJwV/bY1w3sqCD+1N4g/+WIo+dFDDA/5yGe0RX4x
	0nin4MVngK3ih/fzJvJqP1rD7ZpGJOs3X9vxQuQI4u8K3Obrm1+3PAAwjdW9o2yv6X7EbytYrLwOP
	aifuzWrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLCBg-00000005TJc-2OFo;
	Fri, 08 May 2026 03:47:40 +0000
Received: from [113.46.200.219] (helo=canpmsgout04.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLCBc-00000005TI4-3ero
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 03:47:39 +0000
dkim-signature: v=1; a=rsa-sha256; d=h-partners.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=dWDrmbH/nh19OGeB9tG1Hw5e09VKA/1IueRnzMbUVdY=;
	b=dvGJ0ZOI0N9DSIHNxe6TWK7gwCgGOOKOh3/7HUQDHJnVwvFaGC7Ao2zZDS8VUTJl0y9kZqzvI
	JJKNBenjboI+jvU2J8M5yS5UkZ7oYowojHnfXBOFAeH/DDS0BSVvt1RK4VhsgRLHIZ1wOiv3qE5
	8Kipn9AiShXWrA1OdYD/6RM=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4gBZcS1zh5z1prkv;
	Fri,  8 May 2026 11:39:36 +0800 (CST)
Received: from kwepemf100008.china.huawei.com (unknown [7.202.181.222])
	by mail.maildlp.com (Postfix) with ESMTPS id AED394056E;
	Fri,  8 May 2026 11:47:12 +0800 (CST)
Received: from [10.174.179.37] (10.174.179.37) by
 kwepemf100008.china.huawei.com (7.202.181.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Fri, 8 May 2026 11:47:08 +0800
Message-ID: <cdddd32a-a485-0ef9-180b-edf29f4738bd@huawei.com>
Date: Fri, 8 May 2026 11:47:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 2/2] arm_mpam: Update architecture version check for
 MPAM MSC
Content-Language: en-US
From: Zeng Heng <zengheng4@huawei.com>
To: James Morse <james.morse@arm.com>, <ben.horgan@arm.com>,
	<xry111@xry111.site>, <catalin.marinas@arm.com>, <maz@kernel.org>,
	<ardb@kernel.org>, <yang@os.amperecomputing.com>, <ryan.roberts@arm.com>,
	<kevin.brodsky@arm.com>, <reinette.chatre@intel.com>,
	<miko.lenczewski@arm.com>, <will@kernel.org>, <suzuki.poulose@arm.com>,
	<thuth@redhat.com>, <james.clark@linaro.org>, <lpieralisi@kernel.org>,
	<broonie@kernel.org>, <oupton@kernel.org>, <anshuman.khandual@arm.com>,
	<yeoreum.yun@arm.com>, <leo.yan@arm.com>, <mrigendra.chaubey@gmail.com>,
	<fenghuay@nvidia.com>, <ahmed.genidi@arm.com>, <mark.rutland@arm.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<wangkefeng.wang@huawei.com>
References: <20260203095406.6437-1-zengheng4@huawei.com>
 <20260203095406.6437-3-zengheng4@huawei.com>
 <b9900d7a-eaaf-4f1a-b79e-aa968a7b6e29@arm.com>
 <01ef61ca-7ba7-b282-7ec6-b1df5c301aa5@huawei.com>
In-Reply-To: <01ef61ca-7ba7-b282-7ec6-b1df5c301aa5@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.179.37]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemf100008.china.huawei.com (7.202.181.222)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_204737_552177_BED0723C 
X-CRM114-Status: GOOD (  11.27  )
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

Hi James,

On 2026/5/8 10:26, Zeng Heng wrote:

>> I think its simpler to rule out the unsupported combinations, 
>> something like:
>> | static bool mpam_msc_check_aidr(struct mpam_msc *msc)
>> | {
>> |     u32 rev;
>> |
>> |     rev = __mpam_read_reg(msc, MPAMF_AIDR) & MPAMF_AIDR_ARCH_REV;
>> |
>> |      /*
>> |      * v0.0 and >v2.x aren't supported, but anything else should be 
>> backward
>> |     * compatible to v0.1 or v1.0.
>> |     */
>> |     if (!rev)
>> |         return false;
>> |     if (rev & MPAMF_AIDR_ARCH_MAJOR_REV > MPAM_ARCHITECTURE_V1)
>> |         return false;
>> |

Oops, after more complete version number testing, I found there's an
operator precedence issue here. The correct fix is:

	if ((rev & MPAMF_AIDR_ARCH_MAJOR_REV) > MPAM_ARCHITECTURE_V1)
		return false;

Note that '>' has higher precedence than '&'.


With this fix included:
Tested-by: Zeng Heng <zengheng4@huawei.com>


>> |     return true;
>> | }
>>
>>> +    if (!mpam_msc_check_aidr(msc)) {
>>> +        dev_err_once(dev, "MSC does not match MPAM architecture\n");
>>>           return -EIO;
>>>       }
>>
>> I'd like to keep the 'v1.x' in this message - this should help folk 
>> with old stable
>> kernels running on new hardware work out why the feature isn't available.
>> (assuming they have some documentation that says v2.0 in it!)
>>
>> I've rebased this with the above changes, which I'll post shortly for 
>> fixes.
>>
>>
> 
> Agreed. Keep the backward compatibility extension for versions
> (compatible with v0.x(x>0) and 1.x), and remove the redundant
> MPAM_ARCHITECTURE_Vx_x macro definitions.
> 
> I've verified locally that everything works fine.
> 



