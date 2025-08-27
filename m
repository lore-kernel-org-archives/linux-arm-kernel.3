Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77A28CA0FFD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 20:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6CxfeRoVOtE1jiaoaQ64CLALcZq/vbzgZXW19/gX9+Q=; b=eza/+zUvDcZmfTjZ/VCRfRauOc
	9MnGmLVgGW6aaaduMhy7LuRA5wS7uXMfQwTib5anRZq1WJR7bMEJJicDgb5OOAhKQhNzoiH6wmYGE
	yuHoEcT8P8dK644hBufauBp7J+pqlxeCucE2ltAl8hqmG0EMuEQDPyUKFY+mCFGmAQDYU31hpMx2c
	6gUr3+percmn3sBiKtshgU0RVLICjhfyCiAL1SuCTzz2kPtNIASBNT9FMemzB7Y8A9reA7MzVD9pk
	E2ivSlVx/srGUDNxwQAvtOUSaqKIyzwwu1HxZ4itpRd0/UASOmDu+tlb0VwwjT1s4XsKjS0IE4Azc
	QEGPy6+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urMgx-0000000Gjyv-03iq;
	Wed, 27 Aug 2025 20:24:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urIg3-0000000G84y-0NpP;
	Wed, 27 Aug 2025 16:07:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6AE8C43D3A;
	Wed, 27 Aug 2025 16:07:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35D71C4CEEB;
	Wed, 27 Aug 2025 16:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756310830;
	bh=8/nHBBY+4VBhT+YC6UcqQvlwOolIbFpQ9L4LggP+E0w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=X4QVOu/5Y1nL6frM1iU4gWhATYdfU0A2DDYCR/HCU+tNO4/rv0GSkcWe1bav1YKZS
	 qQ9atRMkj6ljLH8X6u7yydleAg+yG4d+QuB4R9PB+FsmKZHxZWYZT5clhh/lDkLG5O
	 6ypIT8ddQeiXDVgm1tRCXvHlGmz09/9B97PucyrKh+CY95TSCS3PyV+bs1LCKbtegx
	 xCK8S/DKDtQ+GQvVGCdsQAmlNIqDcAHa9h3iYaW+VFn+19EiDRkU4WreLRRBGX3K78
	 5OQgM0pEeYdx+hlyoKl4p9avrBArAhHYmoJqIXBj61VIx1Uzmy2MLjog6VVU9OZnmF
	 I2IwA8MCBqDvQ==
Message-ID: <a89ba427-b174-42c3-b3b4-5e4079942c3c@kernel.org>
Date: Wed, 27 Aug 2025 18:07:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 01/22] dt-bindings: usb: snps,dwc3: Allow multiple
 iommus
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>,
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Neal Gompa <neal@gompa.dev>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-phy@lists.infradead.org
References: <20250821-atcphy-6-17-v1-0-172beda182b8@kernel.org>
 <20250821-atcphy-6-17-v1-1-172beda182b8@kernel.org>
 <20250822-skinny-clay-harrier-64dc58@kuoka>
 <e4c730d2-6ee1-46d7-850b-8ebbe0a1bfcd@kernel.org>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <e4c730d2-6ee1-46d7-850b-8ebbe0a1bfcd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_090711_156698_5BFD2139 
X-CRM114-Status: GOOD (  15.69  )
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

On 24.08.25 10:31, Krzysztof Kozlowski wrote:
> On 22/08/2025 09:22, Krzysztof Kozlowski wrote:
>> On Thu, Aug 21, 2025 at 03:38:53PM +0000, Sven Peter wrote:
>>> Apple's dwc3 variant requires two iommus.
>>>
>>> Signed-off-by: Sven Peter <sven@kernel.org>
>>> ---
>>>   Documentation/devicetree/bindings/usb/snps,dwc3.yaml | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
>>> index 4380bb6fa2f08a475b557e80467abc2861f622e2..6d35dcc605c01977f4fc6fdb6f12976f1cef2b9e 100644
>>> --- a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
>>> +++ b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
>>> @@ -60,7 +60,7 @@ properties:
>>>     dma-coherent: true
>>>   
>>>     iommus:
>>> -    maxItems: 1
>>> +    maxItems: 2
>>
>> Never tested. You anyway need specific constraints.
> I realized that's pretty vague, so clarifying: you changed all bindings
> to have two iommus and that's unexpected. All other devices have only
> one IOMMU mapping here, so they need to stay like that. If these IOMMUs
> differ, you should also list them, but probably that's not the case here.

Makes sense, thanks for the detailed explanation.

I don't quite understand why this controller needs two iommus but they 
must essentially be programmed to the same mapping for xhci to work.
All of device mode goes through one of them and xhci buffers are split 
between the two iommus (iirc I saw the command ring using the first one 
and the event ring the second one and then just decided to program them 
the same since anything else would result in a big mess).



Thanks,


Sven


