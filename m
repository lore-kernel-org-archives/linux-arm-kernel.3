Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 941D7CA1009
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 17:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/Ex5Ruupp+iSliQyyGJXOWquzJhUs9ncVlh9Xx0KAOg=; b=Hmuh7JMXKBs5ld
	q6t/I7umtjGpzhRkvkeusQNA3zaegOGKgSbAMFwlNOMEKRRqqLuGHL0p/43gaDoPuyqJ83et53G4e
	WWRKmDGFg6NZH0tHd5ewi+MxlYgmJRrZShwlfC2qJn82m0vv4j6rBg5jYsJJxksHkDn33HwvIo+ax
	Yz4ZjPZjumbyR0VTZlXm++OkAeN5zUr33N4mdtVmo0w7P/6OyRKKRw24aKsxOm34glh9szJp9NgYX
	ItfJWhuNi+kQg67iqIFRT8INQ9vxOhcHfem6tY4WANHrFAjsD77TudGxaIvizS2TONbnlcWbz8y2s
	RW5+Dz1wtG7pK9+v+SDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utr80-00000007AaS-3r4j;
	Wed, 03 Sep 2025 17:18:37 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utncM-00000006bwL-3j0J
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 13:33:44 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 583DXBu83272899;
	Wed, 3 Sep 2025 08:33:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756906391;
	bh=/Ex5Ruupp+iSliQyyGJXOWquzJhUs9ncVlh9Xx0KAOg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=YkJ4AduFBdZIueNM42g9orDKKPqATkUZHCsXGm20hLws3KsAx86RMTX21VDvV/2pq
	 bVoU3sgTH4BKRRH/obxMVs4lyd1UJo52sFDb/T+Yh+km72vZZvzxmoPL04jNdDQn1q
	 waxyljNGAE9MySM9myHfZPqH5dYuUPTIiHpOLWeo=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 583DXAeE3556800
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 3 Sep 2025 08:33:10 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 3
 Sep 2025 08:33:09 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 3 Sep 2025 08:33:09 -0500
Received: from [10.249.130.74] ([10.249.130.74])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 583DWvvN1636883;
	Wed, 3 Sep 2025 08:32:58 -0500
Message-ID: <38c054a3-1835-4f91-9f89-fbe90ddba4a9@ti.com>
Date: Wed, 3 Sep 2025 19:02:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 2/8] dt-bindings: remoteproc: k3-r5f: Add
 rpmsg-eth subnode
To: Krzysztof Kozlowski <krzk@kernel.org>,
        MD Danish Anwar
	<danishanwar@ti.com>
References: <20250902090746.3221225-1-danishanwar@ti.com>
 <20250902090746.3221225-3-danishanwar@ti.com>
 <20250903-peculiar-hot-monkey-4e7c36@kuoka>
 <d994594f-7055-47c8-842f-938cf862ffb0@ti.com>
 <f2550076-57b5-46f2-a90a-414e5f2cb8d7@kernel.org>
Content-Language: en-US
From: "Anwar, Md Danish" <a0501179@ti.com>
In-Reply-To: <f2550076-57b5-46f2-a90a-414e5f2cb8d7@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_063343_029324_3E6DC7F9 
X-CRM114-Status: GOOD (  26.34  )
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



On 9/3/2025 6:24 PM, Krzysztof Kozlowski wrote:
> On 03/09/2025 09:57, MD Danish Anwar wrote:
>>>> Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
>>>> ---
>>>>  .../devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml     | 6 ++++++
>>>>  1 file changed, 6 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
>>>> index a492f74a8608..4dbd708ec8ee 100644
>>>> --- a/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
>>>> +++ b/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
>>>> @@ -210,6 +210,12 @@ patternProperties:
>>>>            should be defined as per the generic bindings in,
>>>>            Documentation/devicetree/bindings/sram/sram.yaml
>>>>  
>>>> +      rpmsg-eth:
>>>> +        $ref: /schemas/net/ti,rpmsg-eth.yaml
>>>
>>> No, not a separate device. Please read slides from my DT for beginners
>>
>> I had synced with Andrew and we came to the conclusion that including
>> rpmsg-eth this way will follow the DT guidelines and should be okay.
> 
> ... and did you check the guidelines? Instead of repeating something not
> related to my comment rather bring argument matching the comment.
> 
> 
> ...
> 
>> @@ -768,6 +774,7 @@ &main_r5fss0_core0 {
>>  	mboxes = <&mailbox0_cluster2 &mbox_main_r5fss0_core0>;
>>  	memory-region = <&main_r5fss0_core0_dma_memory_region>,
>>  			<&main_r5fss0_core0_memory_region>;
>> +	rpmsg-eth-region = <&main_r5fss0_core0_memory_region_shm>;
> 
> You already have here memory-region, so use that one.
> 

There is a problem with using memory-region. If I add
`main_r5fss0_core0_memory_region_shm` to memory region, to get this
phandle from driver I would have to use
	
	of_parse_phandle(np, "memory-region", 2)

Where 2 is the index for this region. But the problem is how would the
driver know this index. This index can vary for different vendors and
their rproc device.

If some other vendor tries to use this driver but their memory-region
has 3 existing entries. so this this entry will be the 4th one.

But the driver code won't work for this. We need to have a way to know
which index to look for in existing memory-region which can defer from
vendor to vendor.

So to avoid this, I thought of using a new memory region. Which will
have only 1 entry specifically for this case, and the driver can always

	of_parse_phandle(np, "rpmsg-eth-region", 0)

to get the memory region.

>>  };
>>
>>  &main_r5fss0_core1 {
>>
>>
>> In this approach I am creating a new phandle to a memory region that
>> will be used by my device.
> 
> 
> 
> Best regards,
> Krzysztof

-- 
Thanks and Regards,
Md Danish Anwar


