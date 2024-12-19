Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 938F9E77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 05:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mmc6jucBgZmDsYveNGNTIb7SUSQtNS9OQ5CWM+MIYl8=; b=WmKp5iArjWQA7m9u92rIl8QUfx
	NBKvoAi1BGXY3wDygsk6UlbOMfOXVyvRMKDvslR+lLREjbYDae7IjQ4DEyxfCZtDVSgeGDlLSgcYG
	S9o1Z+3pQPdDpzNHXMI/yTxtawPbrP1W2S/1L+dpKOh/Ld8leAYViz5qhbs8iA0jp8JOrO7lOaQUt
	pUduSCRqCSrqsxhbnjqg2wsMx9rnbnErU0BQ9Te8++Lc5DWaqYW98G5LbDWwTe0OWxzqxDHQwRZKj
	ViqKet+/JN+eMNI3XNtzYybn1UTfhfVgfTsQAuEGiXZr6kc7VzSMahDrActA0N2wqX1IILwLg2v40
	4t18sBTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tO8mZ-00000000pvS-1cdo;
	Thu, 19 Dec 2024 05:09:07 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tO8l2-00000000plx-1B6c
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 05:07:33 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4BJ574Jl057189;
	Wed, 18 Dec 2024 23:07:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734584824;
	bh=mmc6jucBgZmDsYveNGNTIb7SUSQtNS9OQ5CWM+MIYl8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=EHkuGD2cK1KIrMQOiTPVc+NKhuHjgOfjIIxCOiFERQWQrvIwekAcHMRlMwc9ncb+d
	 hNpTM12lzTbJXlEU/lo6KB7D1x1N4vpMG0C5Th24DbXuF7hi0NxpP/9jkTE/lUpGA0
	 FoFz44kA8xFovRRofuddNappjNudKPg+cBsLsCa0=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BJ574IP100295;
	Wed, 18 Dec 2024 23:07:04 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 18
 Dec 2024 23:07:03 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 18 Dec 2024 23:07:04 -0600
Received: from [10.24.69.25] (danish-tpc.dhcp.ti.com [10.24.69.25])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BJ56wUm055129;
	Wed, 18 Dec 2024 23:06:59 -0600
Message-ID: <c6254178-6e2a-47e1-ac16-22af5affc8ca@ti.com>
Date: Thu, 19 Dec 2024 10:36:57 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 1/4] net: ti: Kconfig: Select HSR for ICSSG
 Driver
To: Larysa Zaremba <larysa.zaremba@intel.com>
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
Content-Language: en-US
From: MD Danish Anwar <danishanwar@ti.com>
In-Reply-To: <Z2L/hwH5pgBV9pSB@lzaremba-mobl.ger.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_210732_403999_410DF681 
X-CRM114-Status: GOOD (  17.99  )
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



On 18/12/24 10:29 pm, Larysa Zaremba wrote:
> On Mon, Dec 16, 2024 at 03:30:41PM +0530, MD Danish Anwar wrote:
>> HSR offloading is supported by ICSSG driver. Select the symbol HSR for
>> TI_ICSSG_PRUETH. Also select NET_SWITCHDEV instead of depending on it to
>> remove recursive dependency.
>>
> 
> 2 things:
> 1) The explanation from the cover should have been included in the commit 
>    message.

I wanted to keep the commit message brief so I provided the actual
errors in cover letter. I will add the logs here as well.

> 2) Why not `depends on HSR`?

Adding `depends on HSR` in `config TI_ICSSG_PRUETH` is not setting HSR.
I have tried below scenarios and only one of them work.

1) depends on NET_SWITCHDEV
   depends on HSR

	HSR doesn't get set in .config - `# CONFIG_HSR is not set`. Even the
CONFIG_TI_ICSSG_PRUETH also gets unset although this is set to =m in
defconfig. But keeping both as `depends on` makes CONFIG_TI_ICSSG_PRUETH
disabled.

2) select NET_SWITCHDEV
   depends on HSR

	HSR doesn't get set in .config - `# CONFIG_HSR is not set`. Even the
CONFIG_TI_ICSSG_PRUETH also gets unset although this is set to =m in
defconfig. But keeping both as `depends on` makes CONFIG_TI_ICSSG_PRUETH
disabled.

3) depends on NET_SWITCHDEV
   select HSR
	
	Results in recursive dependency

error: recursive dependency detected!
	symbol NET_DSA depends on HSR
	symbol HSR is selected by TI_ICSSG_PRUETH
	symbol TI_ICSSG_PRUETH depends on NET_SWITCHDEV
	symbol NET_SWITCHDEV is selected by NET_DSA
For a resolution refer to Documentation/kbuild/kconfig-language.rst
subsection "Kconfig recursive dependency limitations"

make[2]: *** [scripts/kconfig/Makefile:95: defconfig] Error 1
make[1]: *** [/home/danish/workspace/net-next/Makefile:733: defconfig]
Error 2
make: *** [Makefile:251: __sub-make] Error 2

4) select NET_SWITCHDEV
   select HSR

	HSR is set as `m` along with `CONFIG_TI_ICSSG_PRUETH`

CONFIG_HSR=m
CONFIG_NET_SWITCHDEV=y
CONFIG_TI_ICSSG_PRUETH=m

#4 is the only secnario where HSR gets built. That's why I sent the
patch with `select NET_SWITCHDEV` and `select HSR`

>  
>> Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
>> ---
>>  drivers/net/ethernet/ti/Kconfig | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/net/ethernet/ti/Kconfig b/drivers/net/ethernet/ti/Kconfig
>> index 0d5a862cd78a..ad366abfa746 100644
>> --- a/drivers/net/ethernet/ti/Kconfig
>> +++ b/drivers/net/ethernet/ti/Kconfig
>> @@ -187,8 +187,9 @@ config TI_ICSSG_PRUETH
>>  	select PHYLIB
>>  	select TI_ICSS_IEP
>>  	select TI_K3_CPPI_DESC_POOL
>> +	select NET_SWITCHDEV
>> +	select HSR
>>  	depends on PRU_REMOTEPROC
>> -	depends on NET_SWITCHDEV
>>  	depends on ARCH_K3 && OF && TI_K3_UDMA_GLUE_LAYER
>>  	depends on PTP_1588_CLOCK_OPTIONAL
>>  	help
>> -- 
>> 2.34.1
>>
>>

-- 
Thanks and Regards,
Danish

