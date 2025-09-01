Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09151CA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 16:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HHzZ0FqxIESHVBS2IBNz7HEwrKQZ2pXuzyqx5o4fT7c=; b=WjfNyrvG+LjsBtBCaL1/MQ8iwx
	iR99mDCxQ+uhj8QqqY9h64HKRQM5h47Rl6qlTu5ytLNy+fYKdRQVicGvdGi+v0svBjWKdKz+mhHND
	aKXD8iCPUaVYVHpPfIqno45jETZJKZTuV8FKCVn6bONCGSDEz3oCUrPju8i/cs9/MDqCzt2pt0e01
	tu1PtulVFUTxGwr6RH/wP4rEahrwtMz2cwQq/C9Iy1KQblJvCmjbNP+pc4Q0dYjM1vt/9v/mGsT4t
	Q4vkEyA562uSr/CtKEAavGdTOWEw6DyqLmI1dvhQ646hVH3wLJqpf/qXLrRv4jWg1Nnfm/zQLxbKF
	WQd6U9Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut7VJ-0000000DGs4-1r3g;
	Mon, 01 Sep 2025 16:35:37 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut3im-0000000CWSH-06Qp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 12:33:17 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 581CXDQS2771404;
	Mon, 1 Sep 2025 07:33:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756729993;
	bh=HHzZ0FqxIESHVBS2IBNz7HEwrKQZ2pXuzyqx5o4fT7c=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=FfZxRvOf5QnnBH32Fid7wFq1Y80oqVV9QxdqtUvPatJgn5w4nHctuAa0dn3ZZnVBv
	 BmxEBwznbQ9Gxnn7qtUc/Hf4xwOefiQ30Hne7gAIuiBZHcH3ji6FcY4NO4oaIUekI/
	 4k9EM9ZYu+dUKo6TlziueAkphlNV8Y3pMfKzUwyU=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 581CXDCw1541782
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 1 Sep 2025 07:33:13 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 1
 Sep 2025 07:33:12 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 1 Sep 2025 07:33:12 -0500
Received: from [10.24.68.177] (akashdeep-hp-z2-tower-g5-workstation.dhcp.ti.com [10.24.68.177])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 581CX89Y2511477;
	Mon, 1 Sep 2025 07:33:09 -0500
Message-ID: <b3973566-0959-456d-bed7-c64bf3c34c44@ti.com>
Date: Mon, 1 Sep 2025 18:03:08 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: ti: k3-pinctrl: Add the remaining macros
To: Dhruva Gole <d-gole@ti.com>
CC: <vigneshr@ti.com>, <praneeth@ti.com>, <nm@ti.com>, <afd@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <vishalm@ti.com>, <sebin.francis@ti.com>
References: <20250731115631.3263798-1-a-kaur@ti.com>
 <20250731115631.3263798-4-a-kaur@ti.com>
 <20250813130521.zpe7lguful6gyhjz@lcpd911>
Content-Language: en-US
From: Akashdeep Kaur <a-kaur@ti.com>
In-Reply-To: <20250813130521.zpe7lguful6gyhjz@lcpd911>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_053316_171391_42CFBC13 
X-CRM114-Status: GOOD (  13.73  )
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

Hi Dhruva,

On 13/08/25 18:35, Dhruva Gole wrote:
> Akashdeep,
> 
...
>> Add the missing macros for deep sleep configuration control.
> 
> Please can you add sources/ links to the TRM/collateral and sections where you get
> all this information from?

Added TRM reference links
> 
>> Reword the existing deep sleep macros to provide combinations that can
>> directly be used in device tree files.
> 
> I am not very clear on what this line is trying to say. Can you explain
> a bit more with an example of a reword and how it is helping?
Added example
> 
>>
>> Signed-off-by: Akashdeep Kaur <a-kaur@ti.com>
...
>> +#define WKUP_LVL_EN_SHIFT	    (7)
>> +#define WKUP_LVL_POL_SHIFT	    (8)
>> +#define ST_EN_SHIFT		        (14)
>> +#define DRV_STR_SHIFT		    (19)
>> +#define DS_ISO_OVERRIDE_EN_SHIFT (22)
>> +#define DS_ISO_BYPASS_EN_SHIFT  (23)
> 
> Seeing it on lore and in my git log -p as well, the alignment looks off.
> Please fix it.
> 
Fixed
>>   
>>   /* Schmitt trigger configuration */
>>   #define ST_DISABLE		(0 << ST_EN_SHIFT)
...
>> +
>> +#define WKUP_DISABLE        (0 << WKUP_EN_SHIFT)
>> +
> 
> These too, fix all alignment issues please.
Fixed
> 
>>   /* Only these macros are expected be used directly in device tree files */
>>   #define PIN_OUTPUT		(INPUT_DISABLE | PULL_DISABLE)
...

Regards,
Akashdeep Kaur


