Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F282C5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 19:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ED8eqHdTv64gQstfC56Ow6bZBOe8x1ePNie/0Y4oVZU=; b=JGHzaExKYPjDu0kUyP5DdN3Q1+
	1hrJfg2f4lyFcw4Owu4XIOSCel/IFNS/DkyjTa8jfRuDH6J1jJkHI3M68I+MjMxt8Dymv7Q9jCcUf
	DjdOtdmoYGjyaIyAzoRbbHFP0EoX8qqytobWU5C75C0/N+QRItYSjLi2gxnBSiMPmRn4/Oh0gMHsd
	+Vqa/8qm9C925GDTjEBfS8AiaRAWS3MnwGEKeEFU5D04w36AJafP7YBNMcEVmieM6K/33zNkRGnOm
	sowyHIsRYIMPuJyKf91mKSkvCbqkRLDBSUId6r+MdDcu+dxSp9Zxb9qTTo5GRgaVKsPv/gSc6aXFB
	dniJQvLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuEhQ-0000000GttM-31bO;
	Wed, 12 Aug 2026 19:33:16 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuEhM-0000000Gts8-1z7B;
	Wed, 12 Aug 2026 19:33:15 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8786311A705;
	Wed, 12 Aug 2026 21:33:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1786563185;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=ED8eqHdTv64gQstfC56Ow6bZBOe8x1ePNie/0Y4oVZU=;
	b=fGnrOCSTNX2NlStNgvZoVWdpVAUR25aGrikNpgSdV49w063CUcRdklzwrUw0lXsfYzbLar
	BrcehqdHgDePwKkNLArWE3zazdl9BWMK+QSIk0HzCcixVgskQCh+UWKIyVz2Je+t7K5rzI
	ufSKA7pnRYl/J9/AkoadK2RQc1uHTMiq30zPZtOkemGNy4J7xRkQrBK/9r//7lOCWKdA3V
	KD0FGZ9C/nn4pgl+AJ6jEEFql6+HRySPbQ0HGOw8IhIuqeWGmJqTJjMZ7YiVOB1htEceaO
	Fr5MoprhMTjIgLJyIM0d3hLQaL4Xk3cV2UfPOIIF6OE12DZVqesaDb9aY0j3JA==
Message-ID: <ea21d4fb-04a1-4280-9a73-6f566be2b015@nabladev.com>
Date: Wed, 12 Aug 2026 20:30:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] dt-bindings: phy: Document ST STM32MP25 USB2-FEMTO
 PHY
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-usb@vger.kernel.org, Pankaj Dev <pankaj.dev@st.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Rahul Kumar <rahul.kumar05@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Christian Bruel <christian.bruel@foss.st.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Rosen Penev <rosenp@gmail.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org,
 kernel@dh-electronics.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20260812010157.1772849-1-marex@nabladev.com>
 <20260812010157.1772849-2-marex@nabladev.com>
 <20260812-silky-omniscient-dalmatian-b268cb@quoll>
 <ff691741-a110-44e8-90e7-ac54a96de1af@nabladev.com>
 <ff957fbb-b8ed-485d-adaa-18258ed693a6@kernel.org>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <ff957fbb-b8ed-485d-adaa-18258ed693a6@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_123312_667527_90627601 
X-CRM114-Status: GOOD (  17.23  )
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

On 8/12/26 1:22 PM, Krzysztof Kozlowski wrote:
> On 12/08/2026 12:56, Marek Vasut wrote:
>> On 8/12/26 12:15 PM, Krzysztof Kozlowski wrote:
>>> On Wed, Aug 12, 2026 at 02:55:41AM +0200, Marek Vasut wrote:
>>>> From: Pankaj Dev <pankaj.dev@st.com>
>>>>
>>>> Document USB2 PHY for STM32MP25 USB2 controllers, which includes the
>>>> USB2.0 host-only controller and USB 2.0 part of the DWC3 controller.
>>>> Two such PHYs in total are present in STM32MP25 SoC, they both are
>>>> slightly different, therefore they use different compatible string
>>>
>>> What is slightly different? This should be either here, or better, in
>>> "description" part.
>>
>> They are both Synopsys FEMTO-PHY , but they are each attached to a
>> different controller (one to USB 2.0 host , the other to DWC3 DRD) , and
>> their control bits in the system controller register are different for
>> each variant.
>>
>> I extended the description in V2.
> 
> Depending on the actual difference, this rather belongs to the phandle
> to syscon, instead of separate compatible.

Modeling that in the phandle to syscon won't scale, the PHY driver is 
simple thus far and does not control all the bits in that syscon, if we 
were to somehow extend the phandle to syscon to describe the various bit 
mappings and differences in it, it would look awful quickly. Hence the 
separate compatible strings, so the driver can match on them, derive 
match data from them and use the match data to figure out differences of 
each instance.

>>>> to discern them.
>>>>
>>>> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
>>>> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
>>>> Signed-off-by: Marek Vasut <marex@nabladev.com>
>>>> Signed-off-by: Pankaj Dev <pankaj.dev@st.com>
>>>> Signed-off-by: Rahul Kumar <rahul.kumar05@st.com>
>>>
>>> Incomplete/incorrect DCO chain. Who sends it? Rahul?
>> This is lifted from the ST downstream kernel fork, it's a combination of
>> a bunch of commits there and then cleaned up. Pankaj and Fabrice did
>> most of the downstream work, I did the clean up for upstreaming. I
>> collected the SoB lines from all the commits from ST downstream fork and
>> added mine, hence this list. How shall I address this correctly, with
>> some Co-developed-by tag ? Who gets which tag ?
> 
> Everything explained in submitting patches. The SoBs represent the
> chronological lifecyle of the patch. Person sending the patch is
> obviously the last one touching. How Rahul could touch the code AFTER
> you sent it?
Fixed for all patches in V2, thanks.

