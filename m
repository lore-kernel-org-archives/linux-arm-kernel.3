Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 260E6C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 10:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zzBVsFabiWAnyMSq6V9b4qtBB3ya/HcLU8Bf8HeQ/JE=; b=eokqZvn51ADNhxHTExKr/grHl4
	r9wjsldySyFpBFHI0Jxof9ogd5PS5gGs7kxafEaXAsx8Y//rTCL4F+bO2d6aciqFyK9lp7+JXw7GV
	3Eny6Zk3RhZkl6K9SNDW3FiAp95iNp0Eu5xo0OLp0EAF5i+7GmWaVj61dLNa/7Y8IoQBYVnxK2lth
	ynzbN6ab+xSp2XnPSEM4Ga2lkYz6JO+iAAQfBsEXAwP81YpPnqC2V4Uq1+JJ/KQfrBGGRL8dufg64
	HoBNECGMULrkT6as904Z+EPMEF87sWtTYu7TbBoDgCRfO81hbzYT1WfpsMqohIrpdHJ9b0zo1+/mM
	r40Btwlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmVxI-0000000DBh5-3EkK;
	Mon, 24 Feb 2025 10:44:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmVvM-0000000DBUN-3C4g
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 10:42:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 14A231FCD;
	Mon, 24 Feb 2025 02:43:13 -0800 (PST)
Received: from [10.57.66.132] (unknown [10.57.66.132])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1EE393F673;
	Mon, 24 Feb 2025 02:42:53 -0800 (PST)
Message-ID: <a61a762a-3606-4421-b1fb-c8f7b2923fea@arm.com>
Date: Mon, 24 Feb 2025 10:42:52 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 04/10] dt-bindings: arm: Add Rainier compatibility
Content-Language: en-GB
To: Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Sudeep Holla <sudeep.holla@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Will Deacon <will@kernel.org>,
 Jessica Clarke <jrtc27@jrtc27.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250221180349.1413089-1-vincenzo.frascino@arm.com>
 <20250221180349.1413089-5-vincenzo.frascino@arm.com>
 <Z7jMLCd4i_jtpAA5@J2N7QTR9R3.cambridge.arm.com>
From: Vincenzo Frascino <vincenzo.frascino@arm.com>
In-Reply-To: <Z7jMLCd4i_jtpAA5@J2N7QTR9R3.cambridge.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_024256_864196_4AA45B4E 
X-CRM114-Status: GOOD (  13.26  )
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

Hello Mark,

On 21/02/2025 18:55, Mark Rutland wrote:
> On Fri, Feb 21, 2025 at 06:03:43PM +0000, Vincenzo Frascino wrote:
>> The Arm Morello System Development Platform uses Rainier CPUs.
>>
>> Add compatibility to Rainier.
> 
> Where's the TRM? Are there any known errata such that we might need to
> know the MIDR, etc?
> 

Please find the documents below:
- TRM [0]
- Erratum [1]

This series mainly focuses on basic DT functionalities, but I have plans to
continue with the enablement in future.

Thanks,
Vincenzo

[0] https://developer.arm.com/documentation/102278/latest/
[1] https://developer.arm.com/documentation/SDEN2275302/0000

> Mark.
> 
>>
>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Signed-off-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
>> ---
>>  Documentation/devicetree/bindings/arm/cpus.yaml | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
>> index 73dd73d2d4fa..2e666b2a4dcd 100644
>> --- a/Documentation/devicetree/bindings/arm/cpus.yaml
>> +++ b/Documentation/devicetree/bindings/arm/cpus.yaml
>> @@ -177,6 +177,7 @@ properties:
>>        - arm,neoverse-v2
>>        - arm,neoverse-v3
>>        - arm,neoverse-v3ae
>> +      - arm,rainier
>>        - brcm,brahma-b15
>>        - brcm,brahma-b53
>>        - brcm,vulcan
>> -- 
>> 2.43.0
>>

-- 
Regards,
Vincenzo


