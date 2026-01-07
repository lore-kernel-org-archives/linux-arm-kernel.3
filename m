Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0138CF6BE4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 02:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rs9i/dpcFls+6gnrrGAaTSrNpo/sLIYIwNh6FKmNBtQ=; b=eWi+O5oHfQPoJgWD1rg6TEQYGH
	Xbajv5zCiwkQZso5I7SvI4ii+1zd1Drn4M7NFSO4f2JMZwM/t8FtHAEfbF4ZkeQP+uNqr+P8VTM1T
	0FhYprgPGDqNKBNWQ69UfnlPJ8jIHpoMg9LOGCURILbnnMy6RtA4SPu/hRl/9BkKyAbadfWNo2KEs
	dqOZNyqSqCm36YP9RAj7cyl3YykgHY50O1jNEhK/9pSwa1xWNbV3KaX4Bs6YmAX/7TY9u9QhcuV/N
	8I6nr6P4uPa65w+0/cKKjmxD9i+etVspLxWXE9Y9hQityI70rQG/wecoInOjt1srffQFbfK861f57
	bYN/XATg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdIz0-0000000E23E-1gVG;
	Wed, 07 Jan 2026 02:09:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdIyx-0000000E22r-1q3l
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 02:09:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D00A342AA5;
	Wed,  7 Jan 2026 02:09:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 580F7C116C6;
	Wed,  7 Jan 2026 02:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767751742;
	bh=zc/jxjcF6joL67iBKRqLw1dlXUV+eOqt9LCpxQHLzMc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=A1b36/RosaUrz9qbTDLKQ62OAD4gm9IcmjQIlcNRiShtU9MzbZXy1XefApwe2k0+z
	 onpGCQtMZ09mvbgAbucuBe1aAwisrNQfj7lSX1KWo2HLMEySiAhU2+FTxxtoN3OpkD
	 HZnQ0pGCspxYd1QrKr0D45hVjSWP2kVv7yAMkeNG0eokPZhchrFrwvjR58uMj6q8YU
	 8S2VkCjZQWIbWBTmvrpLF4SQ/9AmFXWjP20Q+6qLM77E26gxx/kjwd3dkf6YELhEsU
	 kBzxvC6oeR92xzw/5iOo19C+jFG5paCR2QeOyYriiH9B/3gFsg31rXE/B808+b4RNh
	 zi8Ez0t4BSuNg==
Message-ID: <8435a4f3-9afc-46fd-a6d5-9b86a417e01c@kernel.org>
Date: Tue, 6 Jan 2026 20:09:00 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] dt-bindings: net: altr,socfpga-stmmac: deprecate
 'stmmaceth-ocp'
To: Rob Herring <robh@kernel.org>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Mamta Shukla <mamta.shukla@leica-geosystems.com>,
 Ahmad Fatoum <a.fatoum@pengutronix.de>,
 bsp-development.geo@leica-geosystems.com,
 Pengutronix Kernel Team <kernel@pengutronix.de>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260105-remove_ocp-v2-0-4fa2bda09521@kernel.org>
 <20260105-remove_ocp-v2-3-4fa2bda09521@kernel.org>
 <20260106190126.GA2537154-robh@kernel.org>
Content-Language: en-US
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <20260106190126.GA2537154-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_180907_522285_68212822 
X-CRM114-Status: GOOD (  17.41  )
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



On 1/6/26 13:01, Rob Herring wrote:
> On Mon, Jan 05, 2026 at 06:08:22AM -0600, Dinh Nguyen wrote:
>> Make the reset name 'stmmaceth-ocp' as deprecated and to use 'ahb' going
>> forward.
>>
>> Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
>> ---
>>   .../devicetree/bindings/net/altr,socfpga-stmmac.yaml          | 11 +++++++++--
>>   1 file changed, 9 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml b/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
>> index fc445ad5a1f1..4ba06a955fe2 100644
>> --- a/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
>> +++ b/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
>> @@ -13,8 +13,6 @@ description:
>>     This binding describes the Altera SOCFPGA SoC implementation of the
>>     Synopsys DWMAC for the Cyclone5, Arria5, Stratix10, Agilex5 and Agilex7
>>     families of chips.
>> -  # TODO: Determine how to handle the Arria10 reset-name, stmmaceth-ocp, that
>> -  # does not validate against net/snps,dwmac.yaml.
>>   
>>   select:
>>     properties:
>> @@ -84,6 +82,15 @@ properties:
>>         - sgmii
>>         - 1000base-x
>>   
>> +  resets:
>> +    minItems: 1
> 
> That's already the min in the referenced schema.
>

Yeah, I had to add this, else it would fail the 'make dt_binding_check 
DT_SCHEMA_FILES'.

>> +
>> +  reset-names:
>> +    deprecated: true
>> +    items:
>> +      - const: stmmaceth-ocp
> 
> This says stmmaceth-ocp is the 1st entry, but it is the 2nd.
> 
> You can't really fix this to validate a DT using stmmaceth-ocp. I would
> just drop this. So that leaves this with just dropping the TODO.

Got it.

Thanks,
Dinh


