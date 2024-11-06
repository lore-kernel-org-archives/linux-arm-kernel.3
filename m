Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBA04D44D57
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 14:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=efS7acrXh5DSwLU5SzsYhrAffKDNrSh6CsFPp+MqqO8=; b=GIp8AQrUQwPsFKhm92Sd5+OkvJ
	FyH8TJMQdUo/VOE5A3RIIPsZN7ibQAZCdj6EwrrVnZsqAgUJXmjeuggrQfYRadI0t3QQX6DFGsryi
	u/Vt0ItkX/+k0d2SEnyk8I28K7sb+b74TCO/jRE1YPD5zXH3axq79TK8BGCbIjuR3EoEJEAoTBsA0
	e3TRpcwBnSqZoSlRORTG4w4Krcgz4FBzlsxsSUK6mMOBdIvm23rT57MUdSf44wkpTI1oddkSO+q78
	2FX8lQDaXRe0JFqdPBWgCffwk7HzNtofeX8Rx/KjLW3deK5HBV/QFGc7hYny5AqhiqdemjhGzZ8CC
	MkYHEHwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8hOD-00000003hUC-17nz;
	Wed, 06 Nov 2024 14:52:09 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8hMS-00000003h8D-0fNe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 14:50:21 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4A6EoGQR128579;
	Wed, 6 Nov 2024 08:50:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730904616;
	bh=efS7acrXh5DSwLU5SzsYhrAffKDNrSh6CsFPp+MqqO8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=uz7Wy61NG52aUG4vO4CcVaa8rbIdwKQxfFw17U4hcchUIUS+SnjsA/oNgZQWJ7E/+
	 gaMcdGmDU7OA3eWc7xWSW9dOSvyNwRd4R38h3cvjAtLFK2paUAYiOsxAftbIfE5U/C
	 k7SUDZnXCzWW5+TghopuTYcov2Nhy2+YNCMUfWDo=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4A6EoGGs110252;
	Wed, 6 Nov 2024 08:50:16 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 6
 Nov 2024 08:50:15 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 6 Nov 2024 08:50:15 -0600
Received: from [10.249.129.69] ([10.249.129.69])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4A6EoBrI125773;
	Wed, 6 Nov 2024 08:50:12 -0600
Message-ID: <4891b955-b2aa-4590-9369-65a4b77ce0fa@ti.com>
Date: Wed, 6 Nov 2024 20:20:11 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: ti: k3-am642-evm: Add dt overlay to disable
 icssg for Linux
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        MD Danish Anwar
	<danishanwar@ti.com>, <vigneshr@ti.com>, <nm@ti.com>
CC: <conor+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <robh+dt@kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <kristo@kernel.org>, <srk@ti.com>, Roger Quadros <rogerq@kernel.org>
References: <20241030114458.1358800-1-danishanwar@ti.com>
 <52f9bfc5-b2c5-47d0-b790-913dc8a8631e@linaro.org>
Content-Language: en-US
From: "Anwar, Md Danish" <a0501179@ti.com>
In-Reply-To: <52f9bfc5-b2c5-47d0-b790-913dc8a8631e@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_065020_278026_AC51C96A 
X-CRM114-Status: GOOD (  12.26  )
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



On 11/6/2024 8:15 PM, Krzysztof Kozlowski wrote:
> On 30/10/2024 12:44, MD Danish Anwar wrote:
>> Add k3-am642-evm-icssg1-disable.dtso overlay file that disables
>> icssg1-eth from Linux so that icssg peripherals can be used by
>> RTOS or some other OS running on R5 core.
>>
> 
> I first approach privately but you deny, so let's make it public: this
> is based on some old kernel. Please don't. You need to rebase and work
> on recent kernel.
> 

I might have not re-based it on latest kernel before posting this. Will
make sure to re-base on the latest kernel.

> Best regards,
> Krzysztof
> 

-- 
Thanks and Regards,
Md Danish Anwar

