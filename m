Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA13EC79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 07:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R1AqE60xrKybP1elGY6Eu9TkumxPQD37e09X11zrnvM=; b=3ZnKmWrzFze5h2c6m8rp8rgZu7
	3IoEBpmZ9RUrl6feTVhGvLDtrkrIZnCuY4CuSEGd41ww1r2ma4L6viAYRrrQN69hiu+6eTD1tglXM
	AQaInNjA92hnuEYjdg1cZ5rT4YGbp5TycCTj9yQex23Zlvja1ZKNBIIx03t2RKLwsUB0UwMebkpjl
	8p5e6Gk+8KupnIFBHF+8xIziIMg8NQ/BeXcNR5RZjlVVaAjXwB3la81dL+LCbMimLumlQV32eJec9
	0V+Uh0uzo/wM2F6Pj+XMcmSBR8WCfxjitO+A66fDqSUHZuNJ1fwKCD9ga0taOxj0nscCn9bybJcP4
	3BkAE+yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4YnM-0000000Da5b-1M1b;
	Thu, 10 Sep 2026 07:02:04 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4YnJ-0000000Da5B-1lZt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 07:02:02 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 21425102B79;
	Thu, 10 Sep 2026 09:01:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1789023714;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=R1AqE60xrKybP1elGY6Eu9TkumxPQD37e09X11zrnvM=;
	b=hfX9LYllfGjdL8YY/3p6OtO1dvWBcgbYqEu6QednOJWh0o3JN52QQw3eRqpKf2hoB7KP3Q
	aazovdjVt7ZWTNo8MVQRd+8UZg4t4EzhqpqkqcSPmyQcW1oTp4Offa5OqXo0pe++e4Mgcg
	hykUfM1/wYvBeMt34mVF+ZliVcbfj3SmRd6VJhe6KYj+OksucGTGyGZZapLGIgtfyOWKsv
	HC0XbBieLP1MkYI5zJjuuyBx2RCYmMTJbAwQ4NhVJuoEOy63TrZ3DNvCpXrGIw3QNr2oyi
	ihZsM6ixTym23+W3mBKRzrShsc4J6Y0wglaPbcD1xIJPGdR5G3F2Q8iqkhtlCg==
Message-ID: <1c39be54-c931-40a2-a806-fa963b2188ec@nabladev.com>
Date: Thu, 10 Sep 2026 09:01:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Marek Vasut <marex@nabladev.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: soc: xilinx: Document ifm ZynqMP
 VHIP6 EvalBoard
To: Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org
Cc: Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260909182641.165383-1-marex@nabladev.com>
 <082df9b0-0517-4580-8ba8-cf6f4d3e0713@amd.com>
Content-Language: en-US
In-Reply-To: <082df9b0-0517-4580-8ba8-cf6f4d3e0713@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_000201_685626_D09AC3FE 
X-CRM114-Status: GOOD (  11.57  )
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

On 9/10/26 8:22 AM, Michal Simek wrote:
> 
> 
> On 9/9/26 20:26, Marek Vasut wrote:
>> Document ifm ZynqMP VHIP6 EvalBoard reference design binding.
>> The board is populated with four ethernet ports, QSPI NOR,
>> eMMC, UART and USB host interfaces.
>>
>> Signed-off-by: Marek Vasut <marex@nabladev.com>
>> ---
>> Cc: Conor Dooley <conor+dt@kernel.org>
>> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
>> Cc: Michal Simek <michal.simek@amd.com>
>> Cc: Rob Herring <robh@kernel.org>
>> Cc: devicetree@vger.kernel.org
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-kernel@vger.kernel.org
>> ---
>> V2: No change
>> ---
>>   Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml 
>> b/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
>> index c9f99e0df2b35..49ef4e0c68501 100644
>> --- a/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
>> +++ b/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
>> @@ -44,6 +44,11 @@ properties:
>>             - const: xlnx,zynq-zed
>>             - const: xlnx,zynq-7000
>> +      - items:
>> +          - const: ifm,zynqmp-vhip6-evalboard
>> +          - const: ifm,zynqmp-vhip6
>> +          - const: xlnx,zynqmp
>> +
>>         - items:
>>             - enum:
>>                 - xlnx,zynqmp-zc1751
> 
> Can you please provide any link to public documentation about this board?
> I wasn't able to find anything through google..

I do not know whether there is any, it is an internal board from which 
other boards get derived.

What would you like to know ?

