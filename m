Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36117C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 15:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wl/RXJwnlW0HcAbSZbnsW1EyC94rw8Ynnk5XKByQikc=; b=4fL5lQdiSWNT0DxtF0fWyOYO1C
	7IRLgts4JB/rvOiSj6Uk80Sr8fdyvyMmryAFgGWsoAGAXJcI57s9eaJzNYkLlTgJGLs8ZHVa/ynyp
	qLV3ezA3QKqhucTz+nEBQUQkJVQ77ZO1nMjO6zHwznAbgoTywZliYnJoITB8SOasw3sWCMISMxiI/
	50xoNkRwm2sTdaBpxynh5C88p+Vv0FhENJHN6Hb5MrtbZOrkYsv1L3jeKAqgcZvAGzHkhJ0Ah7UuQ
	OztLqv3koLG4myENB4EAML9GehAOx0gpT7RsUXgjagKBjeG00opD4lnf0++72BQNQaRS0nUJz+a/E
	alVBqnOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnJFQ-00000004GbM-409R;
	Wed, 26 Feb 2025 15:22:56 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnIrq-00000004Bug-2tTy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 14:58:36 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51QEwTxr1494032
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 Feb 2025 08:58:29 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740581909;
	bh=Wl/RXJwnlW0HcAbSZbnsW1EyC94rw8Ynnk5XKByQikc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=j5dP5LnMQM7gc5c8CJtu7tCaBhh1NK0I534IFjJzWTP6NACP1kZWlqJcVMdi6jNOF
	 7D/cRRUf7FqYAZBFLSSafVJGf8rZWYKi4ZzhMO8MclirPHW8QFErQPS2B+3y3bByUL
	 FM3nOoMh7ggxuMDzTOvDaJG+r6rE6wtjdHdbzczg=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51QEwSCI100560
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 26 Feb 2025 08:58:29 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 26
 Feb 2025 08:58:28 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 26 Feb 2025 08:58:28 -0600
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51QEwSY6121157;
	Wed, 26 Feb 2025 08:58:28 -0600
Message-ID: <8cf95899-bebb-46a2-843e-debdfb5079ff@ti.com>
Date: Wed, 26 Feb 2025 08:58:28 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] arm64: dts: ti: k3-am62a/p: Add r5fss nodes
To: Markus Schneider-Pargmann <msp@baylibre.com>
CC: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Tero Kristo <kristo@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>,
        Hari Nagalla <hnagalla@ti.com>
References: <20250122-topic-dt-updates-am62-wkup-v6-13-v1-0-f74835b91da9@baylibre.com>
 <c81ccd05-4fb7-4ec0-8cc0-c59ac4dff91e@ti.com>
 <qlqxmqluqrw36bkjaa7efcsk6cinyr2rxvznfhz6dopeu67dsf@w4lkuq65uwno>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <qlqxmqluqrw36bkjaa7efcsk6cinyr2rxvznfhz6dopeu67dsf@w4lkuq65uwno>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_065834_778492_2CC36FBD 
X-CRM114-Status: GOOD (  13.17  )
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

Hi Markus,

On 2/25/25 4:28 AM, Markus Schneider-Pargmann wrote:
> Hi Judith,
> 
> On Mon, Feb 24, 2025 at 09:06:56AM -0600, Judith Mendez wrote:
>> Hi Markus,
>>
>> On 1/22/25 3:54 AM, Markus Schneider-Pargmann wrote:
>>> Hi,
>>>
>>> am62p-wakeup already has the r5fss node defined, but it is currently
>>> missing from the am62a-wakeup domain in the devicetree. This is added as
>>> part of the series.
>>>
>>> For am62a and am62p starter kit boards the r5fss memory region is added
>>> and referenced for the r5fss core 0 node.
>>
>>
>> This has already been sent here:
>> https://lore.kernel.org/linux-devicetree/20250210221530.1234009-1-jm@ti.com/
> 
> yes, I saw that recently. Could you please cc me on the next version?
> 

Sure no problem. (:

> Thanks!
> 
> Best
> Markus


