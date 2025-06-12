Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2777C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 05:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f0hXMw8ptRoZo8p1kCUGMksKDyTuNXCp9RDEBkWxjOA=; b=L/8n3RgblDj+F3x5bDFHMwcDb7
	IrW/I3scvBozgtO6/k57ENlLDwkrHr3292fk4RHnJFGum5GWyh+EhyH6pHkc1N+lCDy57dGLGtMkm
	XJknkg32e189VJVansXwUIEmMK1fUVOkhGG9mPrAbRoZhfY2iWYIVmSWP6asM2Q1xtCNBOnctJOkU
	8fkohAVc3ndMLKGtRehb00oCWfcgjuxSqXFihdJntwJTkmO8Riy6iCZpWDv0vmwDHc4qDXD5WTI6X
	RyFPuBY9EOWAnv0Gi0LfuJVCNlYHmepMwT83uxk8MJ45elABkLoFNx7KtFkMkfS0zezpdlODmPh7v
	UbcVnesg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPaRV-0000000CE3U-2v8L;
	Thu, 12 Jun 2025 05:25:37 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPaMy-0000000CDfW-15Pz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 05:20:58 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55C5KqE32777873;
	Thu, 12 Jun 2025 00:20:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749705652;
	bh=f0hXMw8ptRoZo8p1kCUGMksKDyTuNXCp9RDEBkWxjOA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=ePPip87uWoVMAXtwg7UZuCmvzjYTFrqY4z0RyKdYQe047ftJS5HKh8iNxGQYadiBG
	 GhLLq45++EdhLh1Rd9eTQSF6nB2lSj6n+J5Il4cmk6S7UrsCGB0Gd1GOWPJM0XMcNx
	 dwqD3ruNjFI6L4b5YXEJ8Tbiuu3eXUKdQezzBbHg=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55C5KpNN2306843
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 12 Jun 2025 00:20:51 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 12
 Jun 2025 00:20:51 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 12 Jun 2025 00:20:50 -0500
Received: from [10.24.69.25] (danish-tpc.dhcp.ti.com [10.24.69.25])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55C5KjFH1459677;
	Thu, 12 Jun 2025 00:20:46 -0500
Message-ID: <42ac0736-cb5a-4d99-a11c-6f861adbdb5f@ti.com>
Date: Thu, 12 Jun 2025 10:50:45 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: ti: icssg-prueth: Add prp offload support
 to ICSSG driver
To: Jakub Kicinski <kuba@kernel.org>, Himanshu Mittal <h-mittal1@ti.com>
CC: <pabeni@redhat.com>, <edumazet@google.com>, <davem@davemloft.net>,
        <andrew+netdev@lunn.ch>, <linux-kernel@vger.kernel.org>,
        <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Roger Quadros
	<rogerq@kernel.org>, <m-malladi@ti.com>,
        <pratheesh@ti.com>, <prajith@ti.com>
References: <20250610061638.62822-1-h-mittal1@ti.com>
 <20250611170424.08e47f1a@kernel.org>
Content-Language: en-US
From: MD Danish Anwar <danishanwar@ti.com>
In-Reply-To: <20250611170424.08e47f1a@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_222056_387681_F660005E 
X-CRM114-Status: GOOD (  15.26  )
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



On 12/06/25 5:34 am, Jakub Kicinski wrote:
> On Tue, 10 Jun 2025 11:46:38 +0530 Himanshu Mittal wrote:
>> Add support for ICSSG PRP mode which supports offloading of:
>>  - Packet duplication and PRP trailer insertion
>>  - Packet duplicate discard and PRP trailer removal
>>
>> Signed-off-by: Himanshu Mittal <h-mittal1@ti.com>
>> ---
>>  drivers/net/ethernet/ti/icssg/icssg_prueth.c | 23 +++++++++++++++++++-
>>  drivers/net/ethernet/ti/icssg/icssg_prueth.h |  3 +++
>>  2 files changed, 25 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.c b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
>> index 86fc1278127c..65883c7851c5 100644
>> --- a/drivers/net/ethernet/ti/icssg/icssg_prueth.c
>> +++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
>> @@ -138,6 +138,19 @@ static struct icssg_firmwares icssg_hsr_firmwares[] = {
>>  	}
>>  };
>>  
>> +static struct icssg_firmwares icssg_prp_firmwares[] = {
>> +	{
>> +		.pru = "ti-pruss/am65x-sr2-pru0-pruprp-fw.elf",
>> +		.rtu = "ti-pruss/am65x-sr2-rtu0-pruprp-fw.elf",
>> +		.txpru = "ti-pruss/am65x-sr2-txpru0-pruprp-fw.elf",
>> +	},
>> +	{
>> +		.pru = "ti-pruss/am65x-sr2-pru1-pruprp-fw.elf",
>> +		.rtu = "ti-pruss/am65x-sr2-rtu1-pruprp-fw.elf",
>> +		.txpru = "ti-pruss/am65x-sr2-txpru1-pruprp-fw.elf",
>> +	}
>> +};
> 
> AFAIU your coworker is removing the static names, please wait until 
> the dust is settled on that:
> 
> https://lore.kernel.org/all/20250610052501.3444441-1-danishanwar@ti.com/

Yes, it's better to wait for that patch to get merged before we add new
firmware.

-- 
Thanks and Regards,
Danish

