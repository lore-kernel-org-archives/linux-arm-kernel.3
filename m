Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20629CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 11:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vn7fGKBprbwCzdhxVXbEyU62KnHh662FY5kO6++aHBI=; b=OfrHC5QzTC98avCl6rAMv1f29W
	W+JdFD/StRWCTVynroV0KFiQ53DfBvSdoAR8Ia1m90/8yEFXZbPoua8yyb+R4voPZTUKV2hKKqLDx
	rxAL16PRQxWoKfgXV7dfpNKiLDV/2hQ2HnzFFW8xGkSAyXcH6EYwXwp4jv4qZfGEHrBd+YdOcyZND
	Chn9wtX57niAcP9w4pBZ0ZRDqstwABJZTvQ0+wuGV8G/tWDlSyUuOSYQGgaqnmge17flx2oIa2/jy
	Ab2/GK2e5acEZa59I24qXkOze4JVIZjyjxigEqdPDIVZAYWrQ4zBcLb2CoHE3ZkVouG41vjTZRHa7
	DPI16OKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7Bbz-00000008Mzh-3WBr;
	Fri, 10 Oct 2025 11:48:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7Bbw-00000008MzH-3K1j
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 11:48:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 266AE1596;
	Fri, 10 Oct 2025 04:48:26 -0700 (PDT)
Received: from [192.168.20.16] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6CF2C3F738;
	Fri, 10 Oct 2025 04:48:33 -0700 (PDT)
Message-ID: <ed3d71a3-b454-4e9b-97bb-7eb4d0b770ec@arm.com>
Date: Fri, 10 Oct 2025 06:48:32 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coco: guest: arm64: Update ARM CCA guest driver
To: dan.j.williams@intel.com, Jonathan Cameron <jonathan.cameron@huawei.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Steven Price <steven.price@arm.com>,
 Gavin Shan <gshan@redhat.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Sami Mujawar <sami.mujawar@arm.com>
References: <20251008132758.784275-1-aneesh.kumar@kernel.org>
 <yq5aldlka6oi.fsf@kernel.org> <20251009113557.000053e6@huawei.com>
 <68e86e45599bc_199281005d@dwillia2-mobl4.notmuch>
Content-Language: en-US
From: Jeremy Linton <jeremy.linton@arm.com>
In-Reply-To: <68e86e45599bc_199281005d@dwillia2-mobl4.notmuch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_044836_892969_D145B144 
X-CRM114-Status: GOOD (  12.62  )
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

Hi,

Hi,

On 10/9/25 9:24 PM, dan.j.williams@intel.com wrote:
> Jonathan Cameron wrote:
>> On Thu, 09 Oct 2025 12:43:49 +0530
>> Aneesh Kumar K.V <aneesh.kumar@kernel.org> wrote:
>>
>>> "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org> writes:
>>>
>>>> Make preparatory updates to the ARM CCA guest driver:
>>>>
>>>>   - Switch from using a platform device to a faux device (based on
>>>>     feedback in [1])
>>>>   - Rename the device from `arm-cca-dev` to `arm-rsi-dev`, so that the
>>>>     host driver can register an equivalent `arm-rmi-dev`
>>>>
>>>> These changes are purely structural and introduce no new functionality.
>>>> Subsequent patches will extend this driver to add guest device
>>>> assignment support.
>>>>
>>>> [1] https://lore.kernel.org/all/2025073035-bulginess-rematch-b92e@gregkh
>>>>   
>>>
>>> I noticed that, this will break autoloading of the driver.
>>
>> Ah indeed.  You'd need to arrange for the arch code to call the init()
>> directly (possibly arch_initcall() as before or maybe directly from
>> arm64_rsi_init), which makes it tricky to do in a module as there
>> is nothing to kick off module autoloading. You could kick that off
>> explicitly but that's a bit ugly.
> 
> Does ARM64 not have the equivalent of MODULE_DEVICE_TABLE(x86cpu, ...)?

No, it doesn't. There is a hwcap based method, but that requires 
allocating a hwcap.



