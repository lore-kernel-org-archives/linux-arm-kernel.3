Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 546E2C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 09:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JyPZl8MjDJAyq5XxRRx62R/Qh5a744uvuUmkjqbA0Qc=; b=Z4ofLXV/H09Hyhzud2LGRT4zuJ
	5nGfG9dWYnXWpPw44b41g9ORDcKLfY7u4E6uetUG03EV7Ffx2MujXBDRgoenBAE3WK0dlQigAQUsW
	WhjGOoM4K3D0Jt3DSrw1XXOhX5np1zEu7dxLp/nunGsSM02q0/03hGB57b6K6n6j7zHPMxcZr44Bm
	ghkjcr/i62wllJFXKUsIj5VcfOyzwlKE5PuwbiFzyEPlfitAryPHJ3yel1mqX+4J19LWeQcrozQas
	+8n73feO4q7Awxd7vYJR67ddtdk6dAX1mey4v71jymxLRaXhyIU9XT4+opPxMZeiGVsb9bsnvDvz3
	PxQ9jeJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzuVD-00000005hcz-1s9b;
	Wed, 02 Apr 2025 09:35:19 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzuPp-00000005gxg-2Oru
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 09:29:46 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5329TcIv3883367
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 2 Apr 2025 04:29:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1743586178;
	bh=JyPZl8MjDJAyq5XxRRx62R/Qh5a744uvuUmkjqbA0Qc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=o93tEZRE6wTUbVpeez+hnlVOzkJ7fxp8EcrneN4/uJAPO7Yn9d6S9ojHUeEmLZ8o5
	 OiC9FElbGeiJVToUwH6eXt2PORPfsS+OysLMZjw3eoJh8S1EoBmJCCSVM2wDtOCYft
	 WmdGNSLxrTaWBRKUZifc7Y979b5pamgIKRko6eu4=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5329TcQD050918;
	Wed, 2 Apr 2025 04:29:38 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 2
 Apr 2025 04:29:38 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 2 Apr 2025 04:29:38 -0500
Received: from [10.24.68.210] (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [10.24.68.210])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5329TY1R026769;
	Wed, 2 Apr 2025 04:29:35 -0500
Message-ID: <6d4d8d36-5c15-492d-8adf-17d95ae1e38b@ti.com>
Date: Wed, 2 Apr 2025 14:59:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: soc: ti: ti,j721e-system-controller: Add
 PCIe ctrl property
To: Rob Herring <robh@kernel.org>, Andrew Davis <afd@ti.com>,
        Siddharth
 Vadapalli <s-vadapalli@ti.com>
CC: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero
 Kristo <kristo@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20241016233044.240699-1-afd@ti.com>
 <20241016233044.240699-2-afd@ti.com> <20241018130447.GA40439-robh@kernel.org>
Content-Language: en-US
From: Jayesh Choudhary <j-choudhary@ti.com>
In-Reply-To: <20241018130447.GA40439-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_022945_708631_F14360BD 
X-CRM114-Status: GOOD (  15.01  )
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

Hello Rob,

On 18/10/24 18:34, Rob Herring wrote:
> On Wed, Oct 16, 2024 at 06:30:40PM -0500, Andrew Davis wrote:
>> Add a pattern property for pcie-ctrl which can be part of this controller.
>>
>> Signed-off-by: Andrew Davis <afd@ti.com>
>> ---
>>   .../bindings/soc/ti/ti,j721e-system-controller.yaml          | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml b/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
>> index 378e9cc5fac2a..2a64fc61d1262 100644
>> --- a/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
>> +++ b/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
>> @@ -68,6 +68,11 @@ patternProperties:
>>       description:
>>         The node corresponding to SoC chip identification.
>>   
>> +  "^pcie-ctrl@[0-9a-f]+$":
>> +    type: object
>> +    description:
>> +      This is the PCIe control region.
> 
> What goes in this node?

This node corresponds to PCIe control register
(used/updated by j721e_pcie_driver for setting the mode, RC or EP)

There are new overlays now that need to be updated as well, with
each SoC.
Will re-roll v2 with updated description and examples in the bindings
and taking into account the new overlays.

Warm Regards,
Jayesh

> 
>> +
>>   required:
>>     - compatible
>>     - reg
>> -- 
>> 2.39.2
>>

