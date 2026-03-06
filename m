Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DF57FCC050
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 18:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nKcS5jIjZiM8pheqy5ggM9oxVmpCdMDyZKlqv6qVaWI=; b=GonOtTdnsi9Uy/ETdNDO4BD2Y/
	AJU/xblrAZMc/RoNgvXJtGn5p/1kX93VL5kV01ofA6lDTSLC8m06ds4MZ0aLtM01g5ls4iY3NiS1x
	LARlkFk4WLp47zSvtYX0SZ8cwZgk8+7OvuG97u3jhCb3OJoi1se2QBdNgbRAqUW05YwhSjOKklmzs
	jWOU7bU7khk9zkvosblJSDFb7zFsMk+fZMK6SzkLRt3ULKl3ox3PvA0tDPlFOOHkZh5vmDbxLjqL6
	g1sMReuRKv9u1I306et7xALuM3scZHQUTk9sw59DlrxvWiXFGH7a2k1QZ4+jWBQ8Naf6LcI1csgtt
	hVYh+qWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyZsp-00000004JrZ-1CWY;
	Fri, 06 Mar 2026 18:26:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyZsm-00000004JrA-1Blc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 18:26:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BBB52497;
	Fri,  6 Mar 2026 10:26:29 -0800 (PST)
Received: from [10.1.196.96] (eglon.cambridge.arm.com [10.1.196.96])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F2A313F7BD;
	Fri,  6 Mar 2026 10:26:34 -0800 (PST)
Message-ID: <969b0700-9603-4e1c-b15c-e509e4d1b0ce@arm.com>
Date: Fri, 6 Mar 2026 18:26:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm_mpam: Force __iomem casts
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Ben Horgan <ben.horgan@arm.com>, Reinette Chatre
 <reinette.chatre@intel.com>, Fenghua Yu <fenghuay@nvidia.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260216110240.159691-3-krzysztof.kozlowski@oss.qualcomm.com>
 <7b5e4218-5961-4874-bbb1-89770cd2c744@arm.com>
 <18f3f73a-9bc6-4518-b3e4-730fa0793146@oss.qualcomm.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <18f3f73a-9bc6-4518-b3e4-730fa0793146@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_102640_369179_A5ADC778 
X-CRM114-Status: UNSURE (   9.12  )
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

Hi Krzysztof, Ben,

On 27/02/2026 14:51, Krzysztof Kozlowski wrote:
> On 27/02/2026 15:06, Ben Horgan wrote:
>> On 2/16/26 11:02, Krzysztof Kozlowski wrote:
>>> Code allocates standard kernel memory to pass to the MPAM, which expects
>>> __iomem.  The code is safe, because __iomem accessors should work fine
>>> on kernel mapped memory, however leads to sparse warnings:
>>>
>>>   test_mpam_devices.c:327:42: warning: incorrect type in initializer (different address spaces)
>>>   test_mpam_devices.c:327:42:    expected char [noderef] __iomem *buf
>>>   test_mpam_devices.c:327:42:    got void *
>>>   test_mpam_devices.c:342:24: warning: cast removes address space '__iomem' of expression
>>>
>>> Cast the pointer to memory via __force to silence them.

>>> diff --git a/drivers/resctrl/test_mpam_devices.c b/drivers/resctrl/test_mpam_devices.c
>>> index 3e8d564a0c64..2de41b47c138 100644
>>> --- a/drivers/resctrl/test_mpam_devices.c
>>> +++ b/drivers/resctrl/test_mpam_devices.c
>>> @@ -324,7 +324,7 @@ static void test_mpam_enable_merge_features(struct kunit *test)
>>>  
>>>  static void test_mpam_reset_msc_bitmap(struct kunit *test)
>>>  {
>>> -	char __iomem *buf = kunit_kzalloc(test, SZ_16K, GFP_KERNEL);
>>> +	char __iomem *buf = (__force char __iomem *)kunit_kzalloc(test, SZ_16K, GFP_KERNEL);
>>>  	struct mpam_msc fake_msc = {};
>>>  	u32 *test_result;
>>>  

>> This change looks good to me.

[...]

>> Acked-by: Ben Horgan <ben.horgan@arm.com>


Thanks! I've picked this for a fixes branch. I'm not sure what Will or Catalin will think
this needs fixing during the release as the driver is behind CONFIG_EXPERT. I'll ask...


Thanks,

James

