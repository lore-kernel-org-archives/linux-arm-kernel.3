Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C79BBE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 05:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sIEekh1dcWJLz/wg6VM5yynHoFyG0LGIZRZL+MHvV9I=; b=c5GtWEi2O8EQC5ffoC7JfeWsHb
	UozptmRVbh9yhxhMPb0hjbSru2Peroaln1SHxKAO4XL5JBaszORyYNpLtN01xxTgoNaqCRrMM80c4
	ORGYaYPiEAeKFdW7/LfiRbAI2ZY1jxR/WLqAbKp2nhyIWaX8je3mc4z9JSK2fFgfw43bBXpqCLw2E
	XO+QXFM0tUwhNPAukfCh21gbkwyA3wQ4K0ll/RQJiAAQ2+wABDWxeIJWK1uv0fSmSA7kUWTEtuPEs
	kSLrQaZAVy5Bq+PlVApAtovpJkZUwt1fa9tB/Yt4PFa3QFifzHTLcJScQYfVNvOO9ZUzY2dHHWui3
	a0A/39Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOVdD-00000003yhW-45s2;
	Fri, 20 Dec 2024 05:32:59 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOVc4-00000003yby-31Nm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 05:31:49 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4BK5VSCV009994;
	Thu, 19 Dec 2024 23:31:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734672688;
	bh=sIEekh1dcWJLz/wg6VM5yynHoFyG0LGIZRZL+MHvV9I=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=a/y/hGBYuzR6VzGdv2nQEpJrd6NviOFqMOd/51UN2ykjidLnB05z8Yff2oBH3JLJ3
	 QhMIVw3LZGHxn8jk32C3um0yS2WSi8aTlqEhth4bUKfVskHHPsmqbgG0zVezqau6B6
	 dTWOsZJmdwu2fwhCJm+SbBA9t2AHvBRL8nTE7XnM=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BK5VSWw054409;
	Thu, 19 Dec 2024 23:31:28 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 19
 Dec 2024 23:31:27 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 19 Dec 2024 23:31:27 -0600
Received: from [10.250.150.168] ([10.250.150.168])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BK5VKFA112689;
	Thu, 19 Dec 2024 23:31:21 -0600
Message-ID: <73bc878e-a323-44ef-b90f-11723ce129e3@ti.com>
Date: Fri, 20 Dec 2024 11:01:20 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 1/4] net: ti: Kconfig: Select HSR for ICSSG
 Driver
To: Larysa Zaremba <larysa.zaremba@intel.com>,
        MD Danish Anwar
	<danishanwar@ti.com>
CC: <aleksander.lobakin@intel.com>, <lukma@denx.de>, <m-malladi@ti.com>,
        <diogo.ivo@siemens.com>, <rdunlap@infradead.org>,
        <schnelle@linux.ibm.com>, <vladimir.oltean@nxp.com>,
        <horms@kernel.org>, <rogerq@kernel.org>, <pabeni@redhat.com>,
        <kuba@kernel.org>, <edumazet@google.com>, <davem@davemloft.net>,
        <andrew+netdev@lunn.ch>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>, <srk@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>
References: <20241216100044.577489-1-danishanwar@ti.com>
 <20241216100044.577489-2-danishanwar@ti.com>
 <Z2L/hwH5pgBV9pSB@lzaremba-mobl.ger.corp.intel.com>
 <c6254178-6e2a-47e1-ac16-22af5affc8ca@ti.com>
 <Z2RQ7xj6IwPXsqHO@lzaremba-mobl.ger.corp.intel.com>
Content-Language: en-US
From: "Anwar, Md Danish" <a0501179@ti.com>
In-Reply-To: <Z2RQ7xj6IwPXsqHO@lzaremba-mobl.ger.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_213148_845210_F55D72AB 
X-CRM114-Status: GOOD (  29.70  )
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

On 12/19/2024 10:29 PM, Larysa Zaremba wrote:
> On Thu, Dec 19, 2024 at 10:36:57AM +0530, MD Danish Anwar wrote:
>>
>>
>> On 18/12/24 10:29 pm, Larysa Zaremba wrote:
>>> On Mon, Dec 16, 2024 at 03:30:41PM +0530, MD Danish Anwar wrote:
>>>> HSR offloading is supported by ICSSG driver. Select the symbol HSR for
>>>> TI_ICSSG_PRUETH. Also select NET_SWITCHDEV instead of depending on it to
>>>> remove recursive dependency.
>>>>
>>>
>>> 2 things:
>>> 1) The explanation from the cover should have been included in the commit 
>>>    message.
>>
>> I wanted to keep the commit message brief so I provided the actual
>> errors in cover letter. I will add the logs here as well.
>>
> 
> Commit message has to be as verbose as needed to provide enough context for 
> whoever needs to explore the code history later.
>  

Sure I will update the commit message.

>>> 2) Why not `depends on HSR`?
>>
>> Adding `depends on HSR` in `config TI_ICSSG_PRUETH` is not setting HSR.
>> I have tried below scenarios and only one of them work.
>>
>> 1) depends on NET_SWITCHDEV
>>    depends on HSR
>>
>> 	HSR doesn't get set in .config - `# CONFIG_HSR is not set`. Even the
>> CONFIG_TI_ICSSG_PRUETH also gets unset although this is set to =m in
>> defconfig. But keeping both as `depends on` makes CONFIG_TI_ICSSG_PRUETH
>> disabled.
> 
> I do not understand your problem with this option, CONFIG_HSR is a visible 
> option that you can enable manually only then you will be able to successfully 
> set CONFIG_TI_ICSSG_PRUETH to m/y, this is how the relation with NET_SWITCHDEV 
> currently works.
> 

The only problem with this option is that when I do `make defconfig`, it
will unset CONFIG_TI_ICSSG_PRUETH.

I will have to manually change the arch/arm64/configs/defconfig to set
HSR=m and then only `make defconfig` will enable CONFIG_TI_ICSSG_PRUETH

Currently HSR is not enabled in defconfig. I will have to send out a
patch to set HSR=m in defconfig

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index c62831e61586..ff3e5d960e2a 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -129,6 +129,7 @@ CONFIG_MEMORY_FAILURE=y
 CONFIG_TRANSPARENT_HUGEPAGE=y
 CONFIG_NET=y
 CONFIG_PACKET=y
+CONFIG_HSR=m
 CONFIG_UNIX=y
 CONFIG_INET=y
 CONFIG_IP_MULTICAST=y


Since I am the only one needing HSR, I thought it would be better if I
select HSR and it only gets built if CONFIG_TI_ICSSG_PRUETH is enabled
instead of always getting built.

For this reason I thought selecting HSR would be good choice, since just
selecting HSR wasn't enough and resulted in recursive dependency,  I had
to change NET_SWITCHDEV also to select.

BTW `NET_DSA` selects `NET_SWITCHDEV` (net/dsa/Kconfig:9)

> Just 'depends on' is still a preferred way for me, as there is not a single 
> driver that does 'select NET_SWITCHDEV'
> 
>>
>> 2) select NET_SWITCHDEV
>>    depends on HSR
>>
>> 	HSR doesn't get set in .config - `# CONFIG_HSR is not set`. Even the
>> CONFIG_TI_ICSSG_PRUETH also gets unset although this is set to =m in
>> defconfig. But keeping both as `depends on` makes CONFIG_TI_ICSSG_PRUETH
>> disabled.
>>
>> 3) depends on NET_SWITCHDEV
>>    select HSR
>> 	
>> 	Results in recursive dependency
>>
>> error: recursive dependency detected!
>> 	symbol NET_DSA depends on HSR
>> 	symbol HSR is selected by TI_ICSSG_PRUETH
>> 	symbol TI_ICSSG_PRUETH depends on NET_SWITCHDEV
>> 	symbol NET_SWITCHDEV is selected by NET_DSA
>> For a resolution refer to Documentation/kbuild/kconfig-language.rst
>> subsection "Kconfig recursive dependency limitations"
>>
>> make[2]: *** [scripts/kconfig/Makefile:95: defconfig] Error 1
>> make[1]: *** [/home/danish/workspace/net-next/Makefile:733: defconfig]
>> Error 2
>> make: *** [Makefile:251: __sub-make] Error 2
>>
>> 4) select NET_SWITCHDEV
>>    select HSR
>>
>> 	HSR is set as `m` along with `CONFIG_TI_ICSSG_PRUETH`
>>
>> CONFIG_HSR=m
>> CONFIG_NET_SWITCHDEV=y
>> CONFIG_TI_ICSSG_PRUETH=m
>>
>> #4 is the only secnario where HSR gets built. That's why I sent the
>> patch with `select NET_SWITCHDEV` and `select HSR`
>>

I still think 4 is the best option. Only difference here is that we have
to `select NET_SWITCHDEV` as well.

>>>  
>>>> Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
>>>> ---
>>>>  drivers/net/ethernet/ti/Kconfig | 3 ++-
>>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/net/ethernet/ti/Kconfig b/drivers/net/ethernet/ti/Kconfig
>>>> index 0d5a862cd78a..ad366abfa746 100644
>>>> --- a/drivers/net/ethernet/ti/Kconfig
>>>> +++ b/drivers/net/ethernet/ti/Kconfig
>>>> @@ -187,8 +187,9 @@ config TI_ICSSG_PRUETH
>>>>  	select PHYLIB
>>>>  	select TI_ICSS_IEP
>>>>  	select TI_K3_CPPI_DESC_POOL
>>>> +	select NET_SWITCHDEV
>>>> +	select HSR
>>>>  	depends on PRU_REMOTEPROC
>>>> -	depends on NET_SWITCHDEV
>>>>  	depends on ARCH_K3 && OF && TI_K3_UDMA_GLUE_LAYER
>>>>  	depends on PTP_1588_CLOCK_OPTIONAL
>>>>  	help
>>>> -- 
>>>> 2.34.1
>>>>
>>>>
>>
>> -- 
>> Thanks and Regards,
>> Danish

-- 
Thanks and Regards,
Md Danish Anwar

