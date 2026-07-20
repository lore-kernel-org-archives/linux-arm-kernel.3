Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C49DBC44529
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 20:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nZ063Cr5IysRq6HcyQ+1TKilKDDKztM/HVWJR8czcj4=; b=XKAIt5CCHRQ9Q0Ss7SHmmmR8wx
	9cbR31ljhvLd4Bvkme6S49NjzJeX5DQUZkoDnnztXvIHlyaDmjaHaW+msHtQ7y3vXrijpyE46A/uH
	QWEXqQs1jeQu1GauG5jLZ4DfpkTsz604NSwHlLjYsefd7wAbeuKFU/RwIh76Z5nx78//JbuJV4HEq
	WKrUye0+P4U807bI9a6o/Bv47N/zKH3USRc2/N1M4wEJyLKdKp4gGF9ps3uVSxh7GjxzccAZYy55B
	8TcXqFP+6iD58pHB59eeA9idsO88MS6cjDJzOauqsxrV3BhOal3WKAlOCAjXyMe8u06tVFxMF8lJ3
	/qayBq0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wluJJ-00000007pSd-0W1u;
	Mon, 20 Jul 2026 20:09:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wluJH-00000007pSH-2K63;
	Mon, 20 Jul 2026 20:09:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4FFF240BD2;
	Mon, 20 Jul 2026 20:09:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C09A1F000E9;
	Mon, 20 Jul 2026 20:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784578195;
	bh=nZ063Cr5IysRq6HcyQ+1TKilKDDKztM/HVWJR8czcj4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=KslcyemOTwbV2E03AeYY4oo1GtzemQCxDq2kWyHW1c1oRK99hV6KqC2lns6Ov6a58
	 Fcr5mtkfINO3B+o8cCONe5vwWLaQnAqmReXRJaDJUjvRazKEBmFEzkOAFquLzsTYjs
	 Bdp4dufOjnq4UFS3ZPVoFxyJTBcXGKcFoqKNVi7KYy3UXMFGalfWP6Uv2VGQgswxU5
	 G/4Ds7/zIjcNh+AOJiG8fWqIjNyw33AUUxBZz1T1xykDr3jgiazpbmWpDL8rQe1cfF
	 10DGG+vgUI0EDL5+EhUd9MOnQYIE4Dy5dhyfwo2Z0DkUk8xex0J92A83X3GigH/SK2
	 anXOcHOqsv+aQ==
Message-ID: <0b4984b4-8729-4125-b09d-8136ee79ac0f@kernel.org>
Date: Mon, 20 Jul 2026 22:09:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: power: Add MediaTek MT6858 power
 domain controller
To: Nikolai Burov <nikolai.burov+review@abscue.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Ulf Hansson <ulfh@kernel.org>, Matthias Brugger <mbrugger@suse.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-pm@vger.kernel.org, Nikolai Burov <nikolai.burov@jolla.com>
References: <20260715-mt6858-pmdomain-v2-0-6293e87fc093@jolla.com>
 <20260715-mt6858-pmdomain-v2-1-6293e87fc093@jolla.com>
 <20260720-vigorous-groovy-cassowary-9912d9@quoll>
 <db76f500-0db5-4c5f-b4cb-60818702787e@abscue.de>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <db76f500-0db5-4c5f-b4cb-60818702787e@abscue.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 20/07/2026 21:09, Nikolai Burov wrote:
> On 7/20/26 8:05 AM, Krzysztof Kozlowski wrote:
>> On Wed, Jul 15, 2026 at 04:54:05PM +0300, Nikolai Burov wrote:
>>> Add a new compatible and document bindings for the power domain
>>> controller of the MT6858 SoC.
>>>
>>> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>
>> To provide review, please open and read the entire file.
>>
>>> Signed-off-by: Nikolai Burov <nikolai.burov@jolla.com>
>>> ---
>>>  .../bindings/power/mediatek,power-controller.yaml  | 21 +++++++++++++++++++-
>>>  include/dt-bindings/power/mediatek,mt6858-power.h  | 23 ++++++++++++++++++++++
>>>  2 files changed, 43 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
>>> index 070c6e5666dc..d03e4a925163 100644
>>> --- a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
>>> +++ b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
>>> @@ -25,6 +25,7 @@ properties:
>>>      enum:
>>>        - mediatek,mt6735-power-controller
>>>        - mediatek,mt6795-power-controller
>>> +      - mediatek,mt6858-power-controller
>>>        - mediatek,mt6893-power-controller
>>>        - mediatek,mt8167-power-controller
>>>        - mediatek,mt8173-power-controller
>>> @@ -56,7 +57,7 @@ properties:
>>>        faults while enabling or disabling a power domain.
>>>        For example, this may hold phandles to INFRACFG and SMI.
>>>      minItems: 1
>>> -    maxItems: 3
>>> +    maxItems: 6
>>
>> And the rest? Why does this device have flexible number of access
>> controllers?
> 
> For mt6858, the "items" list I provided already overrides both minItems 
> and maxItems, so it has a fixed number (6) of access controllers.

Correct, somehow I missed that part of the diff for this file.

Best regards,
Krzysztof

