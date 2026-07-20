Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66147C44520
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 19:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4btInc59l/zVSR9tA9MgzSoFhT1e6g3u0GbEChOxhsM=; b=KslSYZsxDLy+j+w8gH7dwS6jOh
	ehDyL4Gpadqc9VwGunfxe1n7ww1nvB7roZIbQ7tnlfMwf2BUPluF+Ahm/QF79GPD1vlivI1eXQ7uD
	2lMMW2IzHJPz5jlZm36t1ZamoqpdBjUZvPZP6qC3UfHiKZ0C/HwEzH/4hlkXNJlEzXLky6gHBpIZO
	Hw0IekKIdBmuD7Oxiw9EnW/6g+uOetaXpg4S3gSdxaxICvycxiC2NEEdmfAtz9DvW3/hO8xDDRWei
	VPHG/G0yBsQ60wtvKiyABJCpK5aVzGxRc9ny8qGTUieXz5XlHjw+/8bAK56OTaIJs9rB5YlVOmpYU
	Kaj6cKYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wltNR-00000007j73-143I;
	Mon, 20 Jul 2026 19:10:09 +0000
Received: from abscue.de ([2a03:4000:63:bf5:4817:8eff:feeb:8ac7] helo=srv01.abscue.de)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wltNN-00000007j5I-3HLC;
	Mon, 20 Jul 2026 19:10:08 +0000
Message-ID: <db76f500-0db5-4c5f-b4cb-60818702787e@abscue.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=abscue.de; s=dkim;
	t=1784574589;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4btInc59l/zVSR9tA9MgzSoFhT1e6g3u0GbEChOxhsM=;
	b=nrGp+KFDtZK5cXMRQftZ9o1RD7uBJBYEEkvLa9ny5cg4VsDgBHNNG86pCox2hxlidSF7zf
	EyjOWtc46Vzhn6ZkkAhqI7EWv5p0Apjd/O3zl+rmvD8DaobdBh5Qk9XSUREW+NDjoT/Clp
	t8Emny+a+r2CevayhKk682KiqKmJZmaXVhktGFpZcQAt9QUftl5xRyxXEpicxbTtpxE7zQ
	3bhBo/NtlDXgfTgMd1GusTfwR2yxzM1WQPqkX6mrBZNxxzIakPMEVFTgIsAky1iAz122qd
	6TShAEZu73Wd9ZLfQ6aupzHmh2ogMq46HHqesM+3WHXYkvX8bSHYkp84Vh023A==
Date: Mon, 20 Jul 2026 21:09:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: power: Add MediaTek MT6858 power
 domain controller
To: Krzysztof Kozlowski <krzk@kernel.org>
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
Content-Language: en-US
From: Nikolai Burov <nikolai.burov+review@abscue.de>
In-Reply-To: <20260720-vigorous-groovy-cassowary-9912d9@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_121006_277084_AB5F6382 
X-CRM114-Status: GOOD (  21.52  )
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

On 7/20/26 8:05 AM, Krzysztof Kozlowski wrote:
> On Wed, Jul 15, 2026 at 04:54:05PM +0300, Nikolai Burov wrote:
>> Add a new compatible and document bindings for the power domain
>> controller of the MT6858 SoC.
>>
>> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> To provide review, please open and read the entire file.
> 
>> Signed-off-by: Nikolai Burov <nikolai.burov@jolla.com>
>> ---
>>  .../bindings/power/mediatek,power-controller.yaml  | 21 +++++++++++++++++++-
>>  include/dt-bindings/power/mediatek,mt6858-power.h  | 23 ++++++++++++++++++++++
>>  2 files changed, 43 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
>> index 070c6e5666dc..d03e4a925163 100644
>> --- a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
>> +++ b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
>> @@ -25,6 +25,7 @@ properties:
>>      enum:
>>        - mediatek,mt6735-power-controller
>>        - mediatek,mt6795-power-controller
>> +      - mediatek,mt6858-power-controller
>>        - mediatek,mt6893-power-controller
>>        - mediatek,mt8167-power-controller
>>        - mediatek,mt8173-power-controller
>> @@ -56,7 +57,7 @@ properties:
>>        faults while enabling or disabling a power domain.
>>        For example, this may hold phandles to INFRACFG and SMI.
>>      minItems: 1
>> -    maxItems: 3
>> +    maxItems: 6
> 
> And the rest? Why does this device have flexible number of access
> controllers?

For mt6858, the "items" list I provided already overrides both minItems 
and maxItems, so it has a fixed number (6) of access controllers.

The top-level constraints are intentionally broad so that the 
SoC-specific constraints below, which all have minItems == maxItems, 
don't contradict them. Those are missing for some SoCs, but isn't that 
an existing weakness in the bindings?

Looking at the driver, apparently those missing SoCs are the ones that 
only need infracfg. That's a single access controller. So they would 
never have 3 or 2 items, only 1. This is not specified in the bindings 
though.

If you mean that it can't stay like this, I could change the bindings to 
add such a constraint for the remaining SoCs, provided that this is 
allowed - theoretically it could break some hypothetical device trees 
with excess items in access-controllers.

Alternatively, I guess one solution would be to add a minItems: 1 and 
maxItems: 3 constraint for the remaining SoCs to keep their bindings 
unaffected, even though that seems wrong from a HW point of view. But 
I'm not sure if that is what you mean.


-- 
Best regards,
Nikolai

