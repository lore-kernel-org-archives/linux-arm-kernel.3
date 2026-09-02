Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D4F9C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 12:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yRDozR9CA5cf4MGXA2Vmt/BC/L2ZUVuUBfpnwpPiwyo=; b=CHAjWfGCJ4PEfD4f5G6pVtxlB6
	LLA2lDpLYB7dJ9vy6QHKTXhqfCfXJdtWLF3EZmmCAiFa7QV9zHDWHQI0GDHrfS+sugdzSHXh4H3ru
	LGMbvekbkMszBDFChFK2O/ZXhqfT6B7eHPkmbjEfEI0WVtdj5lL0ZSQoInLoGA/OWQxtpD3yuRpfS
	WolcjrJkG6KCnjC2I58Sj0K9JvrKzMZdSdMs5OEWIWXAptGeO7ozAB6LhtRj5pqBXcCUbqNL0Kcnz
	FERF4o+WDuZEgKGv1w7ELcCrCxCysVupWOIykax3DNBkgOiP/19tfYywE3rQ6GKF6hYn7wwhwG4lI
	PtOQOhXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1jgW-0000000EcHb-24ID;
	Wed, 02 Sep 2026 12:03:20 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1jgU-0000000EcGc-1Chn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 12:03:19 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3AE31107AF4;
	Wed, 02 Sep 2026 14:02:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1788350584;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=yRDozR9CA5cf4MGXA2Vmt/BC/L2ZUVuUBfpnwpPiwyo=;
	b=gyEFGtjERqBwEL/tao6ohapRRXoTPIu00k14Jc+WAiivcGlbvP/MvMnaPZnResbCMxpPgv
	ScSzSFCilANDS7CGXlSCeajqbmQV1cEP3agJu1q7t1RWlatD9Hn7GvRo3buLPY2cUMAaZI
	E0SWnkCi6XmwrbdGmbhI+PwDHSq4iSzq/g8WOx+2zR6lou9zZymVrjPB3l+bFECjLfCeer
	xU94yNLvWYHsIk440NnxuX9PxYgjPRtQKPxzq4y9QyuwNfCeQM9I2d5vU7waFhzQ4MrMvb
	1dyPvawnbFr6VouFfEIC8/fVIDAEmhIR4B6rG3csNkenYTKkYZIZvZt312R4rA==
Message-ID: <88c63929-611e-44f8-b18a-360d173c8925@nabladev.com>
Date: Wed, 2 Sep 2026 14:02:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Linux-stm32] [PATCH v5 1/2] dt-bindings: arm: stm32: Document
 st, stm32mp23/25-syscfg subnodes and cells
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 linux-arm-kernel@lists.infradead.org
Cc: Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 devicetree@vger.kernel.org, kernel@dh-electronics.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>
References: <20260831231359.136475-1-marex@nabladev.com>
 <43ea0c7e-44f2-4ec0-ae82-ee60203c8842@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <43ea0c7e-44f2-4ec0-ae82-ee60203c8842@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_050318_542395_EFCFE906 
X-CRM114-Status: GOOD (  16.37  )
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

On 9/2/26 10:55 AM, Fabrice Gasnier wrote:

Hello Fabrice,

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
> Hi Marek,
> 
> Is just saw the discussing on V4 with Conor. That's mainly a thought:
> I'm not sure USB is required, e.g. mandatory for a product, even if not
> so likely (I don't know if this could exist out there).

I assume you have two use cases in mind:
A) A wall-mount HMI device with only display/touchscreen (No USB plug)
B) A RPi form evaluation kit with all kinds of plugs (Yes USB plug)
?

> Still, the nodes
> could be tweaked (deleted) in a board, to reduce dtb size in such case.
> I'd relax, e.g. let these 4 props as optional. Do you see any drawback ?
> That can also be relaxed later, if the case is seen.
DT is a hardware description. The PHY IP is not removed from the chip 
silicon only because the USB signals are not used on that specific 
product. Therefore, for device type:

A) without USB plug - no action is necessary, the PHYs are already 
disabled by default in SoC DTSI
B) with USB plug - board DT sets status = "okay" on the PHYs and 
controllers.

As for reducing the DT size, removing DT nodes for hardware that is 
present in the silicon negatively impacts the ability to apply DTOs 
outside of the kernel build process, so I would argue against 
preemptively removing any DT nodes from DTs to reduce size.

One exception is U-Boot, which adds additional generic bootph-* 
properties to a subset of DT nodes which should be available early on, 
and also contains a mechanism which reduces DT size for its U-Boot SPL 
which operates in severely size constrained environment. However, this 
is a special case, where removal of nodes from the DT is justified, 
because in that case, it is certain that those nodes would not and could 
not be used, and would only waste time.

On the contrary, the DTs that are used to boot Linux should be complete, 
because the user might enable an IP in there by setting status = "okay" 
after reaching U-Boot shell, and before booting Linux.

