Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD0C4CD37B7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 07:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LkOzZoVd0ggvedLkiqns2Dvr0VBEZQvfpPAxD6tfAyU=; b=NdSHmNs7EaWCIPdNG4Nq1wFz67
	Ask8vMp7v9Ym3c2wzhG9oB0NAhb2lWML8LVqqlQkaWHPkhzav94AFXi6M0tzf8ZgeGCzzD1QmdKVM
	+UqJOn0txDMzKsBty6J8SzlE5yRGUcjpxPqCKY9mb5HJzWZhWbYVH+Z7I9rY5PeddHV7KrYeP27Ea
	xm8LA0DMxXKRnn2v+CBcMtcEztoNcV6+NPubmocZ0U42nvK49NvGw+qoZwjNsrdXk3wmRGxKWXadV
	sVxBI3pwG80ybauujobATWXB13qzLdNzBJov6BUwnwlwqxlb9tArLhOI9oP0J3GVqc8+nQIKhiT8E
	QQK2P2qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMKxt-0000000CaaA-406Q;
	Mon, 11 May 2026 07:22:09 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMKxq-0000000CaZV-2AM9;
	Mon, 11 May 2026 07:22:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1778484121;
	bh=sFa6mjTeZA+YdjdzIRkDzWZvvTvkozLyw4GG3pLu5g8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=R0ATEsm367q/tkMguEZtJEF8nYKvKUL0gTj0GCcC8/uZna4C01SpMlCgkLx2kQYk0
	 O5H+L/N0pbg0Oz228uuYg+9w152APlplCi51FE76IIfaJp3/Ao5751ugoplRzFLXdN
	 g9jttptHdPwZRptAyQbvZw67uX58bZAMEZO8TB6j7UetCC5jYJkcUdwj4+lqte2MYg
	 15hnSw+r9vFlVNlzqozLqLBGEz/SYnR94ROkin6AdwacWP9rDGsiFITS/v7IhvDaDU
	 R6ZSKwaTYUi0tjHH9K/+vSP4xTPTQtu1fjZ3KxWhwRiGMuX6Mfx3guxwFpoZ9DJw0E
	 s3THntGpbBFrw==
Received: from [100.64.1.43] (unknown [100.64.1.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8C5AE17E05FC;
	Mon, 11 May 2026 09:22:01 +0200 (CEST)
Message-ID: <36e114a3-8240-480b-a53a-6aa3810bf089@collabora.com>
Date: Mon, 11 May 2026 09:22:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 1/5] dt-bindings: vendor-prefixes: Add Verisilicon
To: Diederik de Haas <diederik@cknow-tech.com>, joro@8bytes.org,
 will@kernel.org, robin.murphy@arm.com, krzk+dt@kernel.org,
 conor+dt@kernel.org, heiko@sntech.de
Cc: iommu@lists.linux.dev, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, kernel@collabora.com,
 Conor Dooley <conor.dooley@microchip.com>
References: <20260415072349.44237-1-benjamin.gaignard@collabora.com>
 <20260415072349.44237-2-benjamin.gaignard@collabora.com>
 <DIEC8YT0XK4O.VAG6G4H31KJM@cknow-tech.com>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <DIEC8YT0XK4O.VAG6G4H31KJM@cknow-tech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_002206_704400_43EBC166 
X-CRM114-Status: GOOD (  10.21  )
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


Le 09/05/2026 à 19:56, Diederik de Haas a écrit :
> On Wed Apr 15, 2026 at 9:23 AM CEST, Benjamin Gaignard wrote:
>> Verisilicon Microelectronics is a company based in Shanghai, China,
>> developping hardware blocks for SoC.
>>
>> https://verisilicon.com/
>>
>> Add their name to the list of vendors.
>>
>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>> Acked-by: Conor Dooley <conor.dooley@microchip.com>
>> ---
>>   Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
>> index ee7fd3cfe203..ebd9072300a8 100644
>> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
>> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
>> @@ -1761,6 +1761,8 @@ patternProperties:
>>       description: Variscite Ltd.
>>     "^vdl,.*":
>>       description: Van der Laan b.v.
>> +  "^verisilicon,.*":
>> +    description: VeriSilicon Microelectronics
>>     "^vertexcom,.*":
>>       description: Vertexcom Technologies, Inc.
>>     "^via,.*":
> FTR: Another version of this patch is already present in Linus' tree:
> c131d78840d7 ("dt-bindings: vendor-prefixes: add verisilicon")

It seems it has been merged right 7.0-rc1 that I used for this series.
Both are almost identical so we can ignore mine.

Regards,
Benjamin


