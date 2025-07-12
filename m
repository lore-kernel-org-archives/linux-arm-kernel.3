Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 693FDC83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Jul 2025 12:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R1WKdR1A11KfPMTQ1LSzosDix11okoAhbqtWM0/tpGA=; b=zbF344ROLTGK5L18MqCbIqqTjl
	qbUwB6CZzkruc+JM0DU7NubNrdMeieEaMlK1mfxDkILYswCu2aLeznXl0PaEbCPxCMrsWHhxc+LqX
	Wq4lcVZkjH/TiHd7E+2RjCpA6IKsNqBct9Ua92/YdLIrfczIzNvgnzWnRXXvHptY7nht3RvS9xAVV
	jpooUxoRPZdBCHJ71iBrfZdNyYI8FUQXrgHTnR8MIUE0XcRwQ3iCjmect16dg8/TkX30f00jXn1bX
	jHcmH9bSCsrtdDcjxFWXLHfrG4onx5+l4QdQRFTTsNKMlF4Lij8RA0HwiFLdp4gAxlHMc7PM5Iv4i
	oLbN9cYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaZUc-0000000GeAG-0rhv;
	Sat, 12 Jul 2025 12:38:14 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaZSE-0000000Gdzo-12Wl
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Jul 2025 12:35:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EA10CA54B59;
	Sat, 12 Jul 2025 12:35:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EB56C4CEEF;
	Sat, 12 Jul 2025 12:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752323744;
	bh=lXFoGeveBkgpPfzpXT/Ao/zuuvCsduR2W62DWuGCibk=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=HkcU4nEmSaxfhj0q87QWOddf180UgwMkXuU/IH0d8XZQNbecFYpReNPy5z5vlMlXO
	 S8adonG+rrJhDcf9Ouo8igpbrKJlRVDoaMAx2Yy6h0PcpQXIsXJ1iY62zYXO28Q3Om
	 8qmnCNPXNp878uWScf8TTPeJwsyuWWhWlQ5M9GIxquvF/DUXwrPbtD795THy1Nmpi+
	 OHsEsgBnMIci0YYE80HCWVjFPhrjh20ax0U2WtpVn1f9qIah9ejcIFjP+3aMpUBT9E
	 6becPzLvmKfK1wxKF1Sr1UJJYDS4Ln/ig2CsEOiaTy+V9CzpOWG8B4fuBFG36ILrX7
	 DaWAgtKXG4lvA==
Message-ID: <b6897cec-eb02-451c-8b81-013a8166e2be@kernel.org>
Date: Sat, 12 Jul 2025 07:35:40 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: net: altr,socfpga-stmmac.yaml: add minItems
 to iommus
To: Matthew Gerlach <matthew.gerlach@altera.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 maxime.chevallier@bootlin.com, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20250707154409.15527-1-matthew.gerlach@altera.com>
 <b752c340-bbb5-479f-bc2c-a9e8541509c3@kernel.org>
 <c048d76e-8187-440f-9f28-b6594810d5dd@altera.com>
Content-Language: en-US
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <c048d76e-8187-440f-9f28-b6594810d5dd@altera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250712_053546_355161_96D1F0E3 
X-CRM114-Status: GOOD (  18.41  )
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

On 7/9/25 17:23, Matthew Gerlach wrote:
> 
> 
> On 7/8/25 11:54 PM, Krzysztof Kozlowski wrote:
>> On 07/07/2025 17:44, Matthew Gerlach wrote:
>> > Add missing 'minItems: 1' to iommus property of the Altera SOCFPGA SoC
>> > implementation of the Synopsys DWMAC.
>>
>> Why? Explain why you are doing thing, not what you are doing. What is
>> obvious which makes entire two-line commit msg redundant and useless.
> This conversion to yaml was a merge of two separate conversions from 
> Ding Nguyen and myself plus some resolved issues highlighted by Rob 
> Herring, but I missed the minItems:
> 
> https://lore.kernel.org/lkml/20250626234816.GB1398428-robh@kernel.org/
> 
>>
>> Original binding had no iommus and referenced commit does not explain
>> why they appeared during conversion in the first place.
> The text version of the binding was created before the device trees for 
> the Agilex family, which do support iommus, were accepted into the kernel.
>>
>> > > Fixes: 6d359cf464f4 ("dt-bindings: net: Convert socfpga-dwmac 
>> bindings to yaml")
>> > Signed-off-by: Matthew Gerlach <matthew.gerlach@altera.com>
>> > ---
>> >  Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml | 1 +
>> >  1 file changed, 1 insertion(+)
>> > > diff --git 
>> a/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml 
>> b/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
>> > index c5d8dfe5b801..ec34daff2aa0 100644
>> > --- a/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
>> > +++ b/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
>> > @@ -59,6 +59,7 @@ properties:
>> >        - const: ptp_ref
>> > >    iommus:
>> > +    minItems: 1
>> >      maxItems: 2
>>
>> Why this has to be flexible on given SoC? This is weird. Same hardware
>> differs somehow?
> Dinh can you comment on this binding from 
> https://lore.kernel.org/all/20250624191549.474686-1-dinguyen@kernel.org/?
> 

This might have been a copy/paste error.

DInh


