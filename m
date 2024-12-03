Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9103EE69EA6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 15:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+qq66ObgzdyoeOydAttOyB4NML64XAQfgkqt5pmV9yM=; b=Q4HQSUjn4jgQT8zHF18PgUWbP9
	q51i1Pd4dA/uH+uolshREtXK3CxzLur967nhmGvvTHwzCgDt3gTbvwn5l+y5tWUv3BiiUte2DHUwq
	IX8AiH1MC7Jqz1KKFFzkYh8upSXTisR+nm6GnNcyXgO98GhEivI7GO6dqJB93sOkQC7XMwEiLzNw3
	l37KygyN431Q55WAT96YaM+jRqiksog3JH3EPD2l5sTaSAHthHHWzAz5Jtfbr4cW7qMbmoGbEBeLn
	CRdCVmKy4BLQwNHN6YITY1iBgVgVo/Wg1mkWVjYKuGPdJiunMZ6HOpPySJH5KMxi5pprQzwDKGpQm
	eWfZqcyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIUsV-00000009wB5-33G3;
	Tue, 03 Dec 2024 15:31:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIUrW-00000009w2U-0LUc
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 03 Dec 2024 15:30:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=+qq66ObgzdyoeOydAttOyB4NML64XAQfgkqt5pmV9yM=; b=l4Vk+p7qfgTIensu2lEhX+xvDZ
	0c2syP8jaf517ldnrS2ZxIgkFWBf9gkyYrJN+aGS/RT+/qsxi+kF6nT5S7QMTOB85BLAxyqkF5q4T
	xs/8JCgY9nNekgVC5yV5o5Za8tfZQupcW7m8ZIe1iHpLWaFRMyle+6x5xQI0Xb7khQ96CaCmadV8u
	5YSYXEFg+XNZUhfzdTbArHJVXQXJ0mD03jXKAaG5B7PmLeOwO0/93tJTdD9Sht4MW2a8zdug2+0Zj
	hSIkv+3yDshhMsl+fhVUObM5if/3CBEjlKpQTnf7n88Au/oedYq3NAYWtgKFMRHO4EkPCNWkp1hVO
	q6zZVTJw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIUrS-00000002PR8-2Xih
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 15:30:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DB204FEC;
	Tue,  3 Dec 2024 07:31:15 -0800 (PST)
Received: from [192.168.20.16] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 26B2B3F71E;
	Tue,  3 Dec 2024 07:30:44 -0800 (PST)
Message-ID: <a64a21cc-6d10-4e8f-9ab9-87aca44ca858@arm.com>
Date: Tue, 3 Dec 2024 09:30:43 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] arm64: rsi: Add automatic arm-cca-guest module
 loading
To: Gavin Shan <gshan@redhat.com>, kernel test robot <lkp@intel.com>,
 linux-arm-kernel@lists.infradead.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 steven.price@arm.com, sami.mujawar@arm.com, suzuki.poulose@arm.com,
 will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org
References: <20241203000156.72451-2-jeremy.linton@arm.com>
 <202412031348.bp5i3ws2-lkp@intel.com>
 <b1923d68-726a-4864-8661-54588a634d95@redhat.com>
Content-Language: en-US
From: Jeremy Linton <jeremy.linton@arm.com>
In-Reply-To: <b1923d68-726a-4864-8661-54588a634d95@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_153050_931526_275D0C81 
X-CRM114-Status: GOOD (  20.07  )
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

On 12/3/24 2:56 AM, Gavin Shan wrote:
> 
> 
> On 12/3/24 4:03 PM, kernel test robot wrote:
>> Hi Jeremy,
>>
>> kernel test robot noticed the following build warnings:
>>
>> [auto build test WARNING on arm64/for-next/core]
>> [also build test WARNING on linus/master v6.13-rc1 next-20241128]
>> [cannot apply to kvmarm/next soc/for-next arm/for-next arm/fixes]
>> [If your patch is applied to the wrong git tree, kindly drop us a note.
>> And when submitting patch, we suggest to use '--base' as documented in
>> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>>
>> url:    https://github.com/intel-lab-lkp/linux/commits/Jeremy-Linton/ 
>> arm64-rsi-Add-automatic-arm-cca-guest-module-loading/20241203-080347
>> base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/ 
>> linux.git for-next/core
>> patch link:    https://lore.kernel.org/r/20241203000156.72451-2- 
>> jeremy.linton%40arm.com
>> patch subject: [PATCH v2 1/1] arm64: rsi: Add automatic arm-cca-guest 
>> module loading
>> config: arm64-randconfig-004-20241203 (https://download.01.org/0day- 
>> ci/archive/20241203/202412031348.bp5i3ws2-lkp@intel.com/config)
>> compiler: clang version 20.0.0git (https://github.com/llvm/llvm- 
>> project 592c0fe55f6d9a811028b5f3507be91458ab2713)
>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/ 
>> archive/20241203/202412031348.bp5i3ws2-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new 
>> version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202412031348.bp5i3ws2- 
>> lkp@intel.com/
>>
>> All warnings (new ones prefixed by >>):
>>
>>>> drivers/virt/coco/arm-cca-guest/arm-cca-guest.c:224:21: warning: 
>>>> attribute declaration must precede definition [-Wignored-attributes]
>>       224 | static const struct __maybe_unused platform_device_id 
>> arm_cca_match[] = {
>>           |                     ^
>>     include/linux/compiler_attributes.h:356:56: note: expanded from 
>> macro '__maybe_unused'
>>       356 | #define __maybe_unused                  
>> __attribute__((__unused__))
>>           |                                                        ^
>>     include/linux/mod_devicetable.h:607:8: note: previous definition 
>> is here
>>       607 | struct platform_device_id {
>>           |        ^
>>>> drivers/virt/coco/arm-cca-guest/arm-cca-guest.c:224:55: warning: 
>>>> unused variable 'arm_cca_match' [-Wunused-const-variable]
>>       224 | static const struct __maybe_unused platform_device_id 
>> arm_cca_match[] = {
>>           |                                                       
>> ^~~~~~~~~~~~~
>>     2 warnings generated.
>>
>>
>> vim +224 drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
>>
>>     222
>>     223    /* modalias, so userspace can autoload this module when RSI 
>> is available */
>>   > 224    static const struct __maybe_unused platform_device_id 
>> arm_cca_match[] = {
>>     225        { RSI_PDEV_NAME, 0},
>>     226        { }
>>     227    };
>>     228
>>
> 
> The definition may have to be something like below, to avoid the 
> compiling warning.
> 
> static const struct platform_device_id __maybe_unused arm_cca_match[] = {

I should have tested this with clang rather than copy/pasting the 
utilization from somewhere else! It looks like a number of other kernel 
users are putting it before the '=', but its sorta annoying because it 
seems like the kind of warning that should be suppressed globally for 
this case (module device description in module that can be built in).



>         ...
> };
> 
> Thanks,
> Gavin
> 


