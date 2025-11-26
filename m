Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85E48D10F23
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 11:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2tyyhCVfPZVGVbQWEIjLv+ZnyqZ0OW01VEz0K7p1BRY=; b=OKUFvXSik3WB98/HM8zrRVGwEj
	s8voqalE0hx07Ksa9igmIRjWk4bWbrhpqneHzTPVlotJBU2V/LGR1e0BW/difmY7KlAFAD1kd7XX0
	Eoku6BrJR+KMU3YF4M6VsFpDubIIjdre1Unj55MTqI5ysECXyziCtBXuvbldE8iwxKYriid7xHE0h
	YCxBYclxiqNCFXbN8uMrxH0PsKgcWsiz3Vycz8Qqhkj0d0kGm1GU8dQMP9cXVd3ZAjvRr9u3SYBjQ
	JAlIcx5wYOMHMZhf/eze4NMs+lfi3OBaaGZrCtCToTkbzwd57JwK+zSWufNxDOt770JSvdrMVlJdt
	yUXbD2WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vODlb-0000000Eusp-1vXu;
	Wed, 26 Nov 2025 11:32:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vODla-0000000Eusi-3HgY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 11:32:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A7987601DE;
	Wed, 26 Nov 2025 11:32:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06FB3C113D0;
	Wed, 26 Nov 2025 11:32:53 +0000 (UTC)
Message-ID: <7d85ed0e-c551-44d4-9d4f-ec72d9da5c45@linux-m68k.org>
Date: Wed, 26 Nov 2025 21:32:49 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] m68k: coldfire: Mark platform device resource
 arrays as const
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
 Frank Li <Frank.Li@nxp.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Olivia Mackall <olivia@selenic.com>, Herbert Xu
 <herbert@gondor.apana.org.au>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, oe-kbuild-all@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20251124-b4-m5441x-add-rng-support-v3-1-f447251dad27@yoseli.org>
 <202511250103.RMNoU3xH-lkp@intel.com>
 <aSVgcoNNeLJshwvU@yoseli-yocto.yoseli.org>
Content-Language: en-US
From: Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <aSVgcoNNeLJshwvU@yoseli-yocto.yoseli.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi Jean-Michel,

On 25/11/25 17:53, Jean-Michel Hautbois wrote:
> On Tue, Nov 25, 2025 at 01:48:24AM +0800, kernel test robot wrote:
>> Hi Jean-Michel,
>>
>> kernel test robot noticed the following build warnings:
>>
>> [auto build test WARNING on ac3fd01e4c1efce8f2c054cdeb2ddd2fc0fb150d]
>>
>> url:    https://github.com/intel-lab-lkp/linux/commits/Jean-Michel-Hautbois/m68k-coldfire-Mark-platform-device-resource-arrays-as-const/20251124-210737
>> base:   ac3fd01e4c1efce8f2c054cdeb2ddd2fc0fb150d
>> patch link:    https://lore.kernel.org/r/20251124-b4-m5441x-add-rng-support-v3-1-f447251dad27%40yoseli.org
>> patch subject: [PATCH v3 1/3] m68k: coldfire: Mark platform device resource arrays as const
>> config: m68k-allnoconfig (https://download.01.org/0day-ci/archive/20251125/202511250103.RMNoU3xH-lkp@intel.com/config)
>> compiler: m68k-linux-gcc (GCC) 15.1.0
>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251125/202511250103.RMNoU3xH-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202511250103.RMNoU3xH-lkp@intel.com/
>>
>> All warnings (new ones prefixed by >>):
>>
>>>> arch/m68k/coldfire/device.c:141:35: warning: initialization discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
>>       141 |         .resource               = mcf_fec0_resources,
>>           |                                   ^~~~~~~~~~~~~~~~~~
>>
>>
>> vim +/const +141 arch/m68k/coldfire/device.c
> 
> Frank, I mentionned this warning in v2, do you have a suggestion ?

FWIW, I looked at other similar use cases - that is platform drivers specifying
constant resources like this - and it seems they mostly do not use const for
them. There is quite a few cases throughout superh and arm architecture code.

Regards
Greg



> Thanks !
> JM
> 
>>
>> b7ce7f0d0efc1a arch/m68k/platform/coldfire/device.c Greg Ungerer      2011-12-24  136
>> b7ce7f0d0efc1a arch/m68k/platform/coldfire/device.c Greg Ungerer      2011-12-24  137  static struct platform_device mcf_fec0 = {
>> bea8bcb12da09b arch/m68k/platform/coldfire/device.c Steven King       2012-06-06  138  	.name			= FEC_NAME,
>> b7ce7f0d0efc1a arch/m68k/platform/coldfire/device.c Greg Ungerer      2011-12-24  139  	.id			= 0,
>> b7ce7f0d0efc1a arch/m68k/platform/coldfire/device.c Greg Ungerer      2011-12-24  140  	.num_resources		= ARRAY_SIZE(mcf_fec0_resources),
>> b7ce7f0d0efc1a arch/m68k/platform/coldfire/device.c Greg Ungerer      2011-12-24 @141  	.resource		= mcf_fec0_resources,
>> f61e64310b7573 arch/m68k/coldfire/device.c          Greg Ungerer      2018-03-28  142  	.dev = {
>> f61e64310b7573 arch/m68k/coldfire/device.c          Greg Ungerer      2018-03-28  143  		.dma_mask		= &mcf_fec0.dev.coherent_dma_mask,
>> f61e64310b7573 arch/m68k/coldfire/device.c          Greg Ungerer      2018-03-28  144  		.coherent_dma_mask	= DMA_BIT_MASK(32),
>> f61e64310b7573 arch/m68k/coldfire/device.c          Greg Ungerer      2018-03-28  145  		.platform_data		= FEC_PDATA,
>> f61e64310b7573 arch/m68k/coldfire/device.c          Greg Ungerer      2018-03-28  146  	}
>> b7ce7f0d0efc1a arch/m68k/platform/coldfire/device.c Greg Ungerer      2011-12-24  147  };
>> 63a24cf8cc330e arch/m68k/coldfire/device.c          Antonio Quartulli 2024-10-29  148  #endif /* MCFFEC_BASE0 */
>> b7ce7f0d0efc1a arch/m68k/platform/coldfire/device.c Greg Ungerer      2011-12-24  149
>>
>> -- 
>> 0-DAY CI Kernel Test Service
>> https://github.com/intel/lkp-tests/wiki


