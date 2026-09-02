Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 164E0C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 12:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZePXJxfXIDFvhKYYoLzBZNdhyl64+xPx76X9iCv/PaA=; b=H0WkAahY45IZUBwIwbJtMY3cyh
	dgq8Ksl+7Zlw07YoJ/1hhiGvTzxFGTc20utXxOia3mvk87cdZ/wqHmkOQmjf9MRGh/lw9i/iJs0Kb
	XQzZ4FK72gizK/Kn74+rT8Upk/EQMyaNRgOud+17qytbxmV89r1TkCTvK+Szy1nIE7/piCdIQnB8g
	nq9+jpZInUuzrHVwhb44/LLBUL9fWvRG7T4zS32KkxN3k6TAsUMo68LkiBQ3kkfRik6dOA6T04sCd
	CwULi/Nci8MIP1Wt74WUlQU3NsZP6ws8aAIGe0zgf54T23DIge3n2gc8z+zWxL6TQAQ71Tc+3VP1X
	59OkuW+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1k1T-0000000Efdn-3nzj;
	Wed, 02 Sep 2026 12:24:59 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1k1R-0000000Efd4-1fGt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 12:24:58 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9393511CCAE;
	Wed, 02 Sep 2026 14:24:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1788351891;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=ZePXJxfXIDFvhKYYoLzBZNdhyl64+xPx76X9iCv/PaA=;
	b=K3iA5QWTIoQWZp5B+wIxIxE9Z9k7fOXIZm9e0lutmfbXuVdVu8LbQR21K39ZJAeoo1xrf4
	pfNz15JWcXYLuHUve3r5HeGBsJfOT5TDzoQzYxSZiKswkZ5YKVKTYlUZNkJf8wMsDkbJ6I
	+bsbwT01REInXBRerxRUCtyPnErs70LIWCH5NZw/skaBHtwrvLFKOFgcxsgVShMnf22y1I
	aiO2DOjga41F3nT3fN/5kmkbnb7IPrz5NvndVttiqzX43rsq1oddxK7kVapEWRkdtwT+i6
	wy9tAl/QlNkVgJm513K1K1B9JG2KOJ3ArsuBs2vRIdLcN6f9bRUVB34ZmAk6zg==
Message-ID: <42c3cb51-c8db-4edb-be10-92f2cba7c945@nabladev.com>
Date: Wed, 2 Sep 2026 14:24:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] dt-bindings: arm: stm32: Document
 st,stm32mp23/25-syscfg subnodes and cells
To: Conor Dooley <conor@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Rob Herring <robh@kernel.org>, Yannick Fertre <yannick.fertre@foss.st.com>,
 devicetree@vger.kernel.org, kernel@dh-electronics.com,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20260831231359.136475-1-marex@nabladev.com>
 <20260901-smolder-debug-e37fdd2b3d20@spud>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <20260901-smolder-debug-e37fdd2b3d20@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_052457_620937_EACC4450 
X-CRM114-Status: UNSURE (   9.54  )
X-CRM114-Notice: Please train this message.
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

On 9/1/26 8:11 PM, Conor Dooley wrote:

Hello Conor,

>> @@ -57,10 +68,17 @@ allOf:
>>     - if:
>>         properties:
>>           compatible:
>> -          const: st,stm32mp25-syscfg
>> +          contains:
>> +            enum:
>> +              - st,stm32mp23-syscfg
>> +              - st,stm32mp25-syscfg
>>       then:
>>         required:
>>           - "#clock-cells"
>> +        - "#address-cells"
>> +        - "#size-cells"
>> +        - phy@2400
>> +        - phy@2800
> 
> This looks good now, thanks.
> 
> I got hung up last time though and maybe didn't notice - in addition to
> requiring these things here, should we also not forbid them on other
> platforms that don't have them? IOW, adding "else: properties: foo: false".

I did add this, and reduced the pattern in patternProperties to match 
only on phy@2400 and phy@2800 so I can disable those too.

> With that, if appropriate,
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
I will send a V6 without this tag, please have a look one more time.

Thank you for your help !

