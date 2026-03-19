Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C38321090222
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 12:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CLg6UEMO/XZ9OUs/DIOblp5o8X4np6mpRi1GG34cJ88=; b=5EEZrfn/yz9yFv
	gef6YJeYsJTLS8jnuyDBw80XMrf9KLyOoZ90YtVjmLk0JXg50KcDDyf1rys1D5u27N5GLhfEApwsu
	SkKio2D7BjZodOhJc6GC9f/e6EHoH+sMINsSIiYh/CkuBn/QqL+18bG2WJWdw+rMuYRWwLij4yxFe
	LCD5NQDFRX4sTRVSNyXSRzM/g4mHbrLnfkxP+gYqmNoMMvR3nDfhUOKzkCT27Mfh9J2LT/w91Os2G
	pCmBuhLyr4eGqe688OqTpTeNA+xEZfyPz8/w9tqeuEam19Vhm72PBdq9FNmQ1hCt9oK8CqJKjL7Nn
	dziEtIHx8iuRqWh6/QYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3CsB-0000000AdV6-2CtT;
	Thu, 19 Mar 2026 12:53:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Cs9-0000000AdU4-1m9N
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 12:53:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F12FC1A25;
	Thu, 19 Mar 2026 05:53:01 -0700 (PDT)
Received: from [192.168.178.23] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 50BEA3F778;
	Thu, 19 Mar 2026 05:52:39 -0700 (PDT)
Message-ID: <3645f5db-29dd-405e-82ef-643ec229879a@arm.com>
Date: Thu, 19 Mar 2026 13:52:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/8] firmware: smccc: lfa: Register DT interrupt
To: kernel test robot <lkp@intel.com>, Mark Rutland <mark.rutland@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Sudeep Holla <sudeep.holla@kernel.org>
References: <20260317103336.1273582-8-andre.przywara@arm.com>
 <202603182202.gpyCz2RF-lkp@intel.com>
Content-Language: en-US
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <202603182202.gpyCz2RF-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_055309_582751_7F0D17CC 
X-CRM114-Status: GOOD (  21.27  )
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
Cc: Conor Dooley <conor+dt@kernel.org>, vsethi@nvidia.com, Salman Nabi <salman.nabi@arm.com>, Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org, vwadekar@nvidia.com, Trilok Soni <trilokkumar.soni@oss.qualcomm.com>, devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, oe-kbuild-all@lists.linux.dev, Nirmoy Das <nirmoyd@nvidia.com>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,

On 3/18/26 15:21, kernel test robot wrote:
> Hi Andre,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on robh/for-next]
> [also build test ERROR on arm/for-next arm/fixes arm64/for-next/core clk/clk-next kvmarm/next rockchip/for-next shawnguo/for-next soc/for-next linus/master nferre-at91/at91-next v7.0-rc4 next-20260317]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Andre-Przywara/dt-bindings-arm-Add-Live-Firmware-Activation-binding/20260318-082717
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
> patch link:    https://lore.kernel.org/r/20260317103336.1273582-8-andre.przywara%40arm.com
> patch subject: [PATCH v2 7/8] firmware: smccc: lfa: Register DT interrupt
> config: arm64-randconfig-004-20260318 (https://download.01.org/0day-ci/archive/20260318/202603182202.gpyCz2RF-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 12.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260318/202603182202.gpyCz2RF-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202603182202.gpyCz2RF-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>     drivers/firmware/smccc/lfa_fw.c: In function 'lfa_register_dt':
>>> drivers/firmware/smccc/lfa_fw.c:878:16: error: implicit declaration of function 'devm_request_threaded_irq'; did you mean 'devm_request_region'? [-Werror=implicit-function-declaration]
>       878 |         return devm_request_threaded_irq(dev, irq, lfa_irq_handler,
>           |                ^~~~~~~~~~~~~~~~~~~~~~~~~
>           |                devm_request_region
>>> drivers/firmware/smccc/lfa_fw.c:880:42: error: 'IRQF_COND_ONESHOT' undeclared (first use in this function)
>       880 |                                          IRQF_COND_ONESHOT, NULL, NULL);
>           |                                          ^~~~~~~~~~~~~~~~~
>     drivers/firmware/smccc/lfa_fw.c:880:42: note: each undeclared identifier is reported only once for each function it appears in
>     drivers/firmware/smccc/lfa_fw.c:881:1: warning: control reaches end of non-void function [-Wreturn-type]
>       881 | }
>           | ^
>     cc1: some warnings being treated as errors

For the records: including <linux/interrupt.h> fixes this issue.

Thanks for the heads up, will add this in a follow-up post.

Cheers,
Andre

> 
> 
> vim +878 drivers/firmware/smccc/lfa_fw.c
> 
>     863	
>     864	static int lfa_register_dt(struct device *dev)
>     865	{
>     866		struct device_node *np;
>     867		unsigned int irq;
>     868	
>     869		np = of_find_compatible_node(NULL, NULL, "arm,lfa");
>     870		if (!np)
>     871			return -ENODEV;
>     872	
>     873		irq = irq_of_parse_and_map(np, 0);
>     874		of_node_put(np);
>     875		if (!irq)
>     876			return -ENODEV;
>     877	
>   > 878		return devm_request_threaded_irq(dev, irq, lfa_irq_handler,
>     879						 lfa_irq_handler_thread,
>   > 880						 IRQF_COND_ONESHOT, NULL, NULL);
>     881	}
>     882	
> 


