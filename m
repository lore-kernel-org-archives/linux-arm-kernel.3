Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFB5DC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 16:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+nG65IMJGU90LIp+KPu1A94jltMOWp+N9pJ0I889NC4=; b=yFUKZSQ7oDvQwuoJN16JJn6HyZ
	4MpEb3l0pXLX6KlQ7C3k5dq8HQuckU58z5HFfCuru+jG4MqSZoRRsXt5q/bPh6psi9GzKQ4AmYPq7
	5pjJjR8FD9rs/tASGg5A/2S/3XgpBolkthnkFjWFSJXeB1xa92QcpZcAcenE9UGL0MY58SCxfpb58
	jXYMYwu7m1rtHwxd2JhJPJ+seCdYCfYH/XrNO9s5jejIG90/B1oY2pT3KNiMpmsPmcWFO3r1JNOJ1
	T/Q4Tgn/eVkmegK82lpFyfYNrqKfhueGFbzIK3Z+cfgWDPbEtn0xtxKpZRcmSIN+c3swq2Pmj5kQi
	YfUUFuhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7GDd-00000007qZF-0lb4;
	Tue, 22 Apr 2025 16:11:33 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Duv-00000007LuJ-3nE1;
	Tue, 22 Apr 2025 13:44:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745329444;
	bh=4DLjZ0GtZDfpf9Y+X2fCfeTSaPWs41kU9nP2/X/cyNQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=J1IHv8tU3VNYbRw81M3WLG61BspSVXRPAMqt1cHr7qQ7MUvmm1t7TdYn+ZzuOksJG
	 quEMnv9lDyFzOvHLPVoDogC1M+3+SnkMNsTOhIY9vyzCST4ot8aYVcXpaMtl3hgTYR
	 wf+Q6A9iFdOUMZyUFJgrzx7QvKzmouCx3iTT25yBOoMd2ci2Z6ws2dvbUSHv8sfqlp
	 HdDHDiVcZkLxk/r0y7vAoh4KqXgtF+KCO2NW5cb0EWK5u8ctyTiatgHnRDGtDT7aeX
	 zgOWyzkWJAGhFdB/OdYy8pG0axAzSBNr0d5uEMEOtXbeOxfVMDLaOQ9Vv7WoK6D7Br
	 C5QmxkLJ/yANw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C1EAA17E0B9D;
	Tue, 22 Apr 2025 15:44:03 +0200 (CEST)
Message-ID: <4f4a1761-dbb3-4c95-8c68-359c7e9ae6b4@collabora.com>
Date: Tue, 22 Apr 2025 15:44:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: mailbox: mediatek,gce-mailbox: Add support
 for MT6893
To: Rob Herring <robh@kernel.org>
Cc: jassisinghbrar@gmail.com, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, houlong.wei@mediatek.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
References: <20250416120230.147844-1-angelogioacchino.delregno@collabora.com>
 <20250421213833.GA2966253-robh@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250421213833.GA2966253-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_064406_090972_7E73E0A4 
X-CRM114-Status: GOOD (  12.85  )
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

Il 21/04/25 23:38, Rob Herring ha scritto:
> On Wed, Apr 16, 2025 at 02:02:30PM +0200, AngeloGioacchino Del Regno wrote:
>> Add a compatible string for the MediaTek Dimensity 1200 (MT6893)
>> SoC using MT8195 as a fallback, and add a header for the GCE
>> mailbox found in MT6893.
>>
>> Similarly to MT8195, this SoC has two GCE hardware instances, but
>> the event values are different (hence requiring its own header).
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   .../mailbox/mediatek,gce-mailbox.yaml         |   4 +
>>   include/dt-bindings/gce/mediatek,mt6893-gce.h | 312 ++++++++++++++++++
>>   2 files changed, 316 insertions(+)
>>   create mode 100644 include/dt-bindings/gce/mediatek,mt6893-gce.h
>>
>> diff --git a/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
>> index 73d6db34d64a..277d290d852b 100644
>> --- a/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
>> +++ b/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
>> @@ -19,6 +19,7 @@ properties:
>>       oneOf:
>>         - enum:
>>             - mediatek,mt6779-gce
>> +          - mediatek,mt6893-gce
>>             - mediatek,mt8173-gce
>>             - mediatek,mt8183-gce
>>             - mediatek,mt8186-gce
>> @@ -29,6 +30,9 @@ properties:
>>         - items:
>>             - const: mediatek,mt6795-gce
>>             - const: mediatek,mt8173-gce
>> +      - items:
>> +          - const: mediatek,mt6893-gce
>> +          - const: mediatek,mt8195-gce
> 
> You shouldn't have with and without a fallback.
> 

OOOPS! Sorry, that wasn't intentional - I was meaning to add mt6893-gce to the
enum only, without that mt8195 fallback.

Will send a v2, thanks for pointing out!

Cheers,
Angelo

>>   
>>     "#mbox-cells":
>>       const: 2




