Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F11DCA1009
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 08:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=La6ncxcZEmWdKtlYiqu4qaaCsos1RqPeSH44Dfbmrsg=; b=eRlLGyUi7OlCy+
	RXK7Hm65tIs7Q0PUUmoR1g5Hi4G5bd3Avgftnjp9YnUrL6lyB9ksTFL3YeiYVKkSXNFT8I6lBd5gv
	RsVKhttIJoG/z8uD5Vtgca9uqi7BnztO4rm071clhc9MH5b8MpGAtJ/ug1bF/dgxhREfHlwzwHdDA
	VNuASLZLvX6D3vspkIRwdjfhmDyEaV0m6QJ/4le4HKOA0mMVVHE8NdiyiQtbkL4R63tdHCnBtInV+
	9nKw9goFqKUQgdsx1GUr8f5OU6/GKAErxejv5yplO7KubtbKZ2I4AWdhpPtIqNJSxFR/rzRw4uorI
	iQ80yrUMRGNsMgpKd3mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utiyw-00000005dUw-3SCx;
	Wed, 03 Sep 2025 08:36:42 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utiAH-00000005Db8-2zYZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 07:44:23 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5837hlMt2779765;
	Wed, 3 Sep 2025 02:43:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756885427;
	bh=La6ncxcZEmWdKtlYiqu4qaaCsos1RqPeSH44Dfbmrsg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=oOC5tY9q0MixsxO5Xobph2w7N4vEUNiRky93Q69HAAoIx2sePLaFHBWx0X3ND+G1E
	 3FU6rH9ecK8AXPX9Y4vFv5fmMEZnKD9TkEnHh8cjFxWAnuDv91+beFx84zl5YwhTeZ
	 rA6bQxoBaqnERooaaKdWbS7tAcH0XNXKIPTNtoXo=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5837hle13356790
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 3 Sep 2025 02:43:47 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 3
 Sep 2025 02:43:46 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 3 Sep 2025 02:43:46 -0500
Received: from [172.24.231.152] (danish-tpc.dhcp.ti.com [172.24.231.152])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5837hbje1211215;
	Wed, 3 Sep 2025 02:43:37 -0500
Message-ID: <ce3b3241-b944-4d2b-95e9-259c71b26026@ti.com>
Date: Wed, 3 Sep 2025 13:13:36 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 1/8] dt-bindings: net: ti,rpmsg-eth: Add DT
 binding for RPMSG ETH
To: Krzysztof Kozlowski <krzk@kernel.org>
References: <20250902090746.3221225-1-danishanwar@ti.com>
 <20250902090746.3221225-2-danishanwar@ti.com>
 <20250903-dark-horse-of-storm-cf68ea@kuoka>
Content-Language: en-US
From: MD Danish Anwar <danishanwar@ti.com>
In-Reply-To: <20250903-dark-horse-of-storm-cf68ea@kuoka>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_004421_848865_11D1EFA0 
X-CRM114-Status: GOOD (  19.94  )
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
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-doc@vger.kernel.org, linux-remoteproc@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Fan Gong <gongfan1@huawei.com>, Xin Guo <guoxin09@huawei.com>, Lei Wei <quic_leiwei@quicinc.com>, Rob Herring <robh@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Michael Ellerman <mpe@ellerman.id.au>, Lee Trager <lee@trager.us>, Jakub Kicinski <kuba@kernel.org>, Mengyuan Lou <mengyuanlou@net-swift.com>, Lorenzo Bianconi <lorenzo@kernel.org>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Roger Quadros <rogerq@kernel.org>, Lukas Bulwahn <lukas.bulwahn@redhat.com>, linux-arm-kernel@lists.infradead.org, srk@ti.com, Paolo Abeni <pabeni@redhat.com>, Tero Kristo <kristo@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, netdev@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, Simon Horman <horms@kernel.org>, Parthiban Veerasooran <Parthiban.Veerasooran@microchip.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "David S. Miller" <davem@davemloft.net>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Krzysztof,

On 03/09/25 12:48 pm, Krzysztof Kozlowski wrote:
> On Tue, Sep 02, 2025 at 02:37:39PM +0530, MD Danish Anwar wrote:
>> Add device tree binding documentation for Texas Instruments RPMsg Ethernet
>> channels. This binding describes the shared memory communication interface
>> between host processor and a remote processor for Ethernet packet exchange.
>>
>> The binding defines the required 'memory-region' property that references
>> the dedicated shared memory area used for exchanging Ethernet packets
>> between processors.
>>
>> Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
>> ---
>>  .../devicetree/bindings/net/ti,rpmsg-eth.yaml | 38 +++++++++++++++++++
>>  1 file changed, 38 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/net/ti,rpmsg-eth.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/net/ti,rpmsg-eth.yaml b/Documentation/devicetree/bindings/net/ti,rpmsg-eth.yaml
>> new file mode 100644
>> index 000000000000..1c86d5c020b0
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/net/ti,rpmsg-eth.yaml
>> @@ -0,0 +1,38 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/net/ti,rpmsg-eth.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Texas Instruments RPMsg channel nodes for Ethernet communication
>> +
>> +description: |
>> +  RPMsg Ethernet subnode represents the communication interface between host
>> +  processor and a remote processor.
>> +
>> +maintainers:
>> +  - MD Danish Anwar <danishanwar@ti.com>
>> +
>> +properties:
>> +  memory-region:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description: |
>> +      Phandle to the shared memory region used for communication between the
>> +      host processor and the remote processor.
>> +      This shared memory region is used to exchange Ethernet packets.
>> +
>> +required:
>> +  - memory-region
>> +
>> +additionalProperties: false
> 
> This cannot be really tested and is pointless binding... Really, one
> property does not make it a device node.
> 
> 

I tried to do something similar to google,cros-ec.yaml and
qcom,glink-edge.yaml

They are also rpmsg related and used by other vendors. I created similar
to that as my use case seems similar to them.

The only difference being I only need one property.


-- 
Thanks and Regards,
Danish


