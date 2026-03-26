Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4F5210A62CF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 14:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sd5CrJRmZwzpMhtpbT4HwlwbsmGVJ8z3h4cXeRheuog=; b=C9Mz2RSzQ2kwISZ86d7inHlxFF
	XMS6pEr1xH4islunHFtch9qsNICk+fndsXR8zq7unwZ3SFh1K3aRJ0K3eID9Iqa5QyOKaQGT44ktY
	diS5vaLAGZXSFPqn0YQUNz4bzlJcjBAtbB8aPl34xYICEXLCvCxky0KEmhyRIAxOSo0SHK7nUPGri
	Lc0hbiBMxkIckUHTPD39m/+2dVAbNGAY6UqYqbbJ+Oki39S6kh3BP11w4VJ5U8tNQpv85aiaY2noG
	E43atB1zKXfhZSlWF2aYG1vMaknx91JCDcsMPYFOUMLkoC1Q6qgWwGL8wq979aBdqyDx/2+NjfL5n
	31li88Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5lJD-00000005bei-16lq;
	Thu, 26 Mar 2026 14:03:39 +0000
Received: from courrier.aliel.fr ([2a01:4f9:c011:1c83::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5lJ6-00000005beB-1B9E;
	Thu, 26 Mar 2026 14:03:37 +0000
Message-ID: <4a04d4bd-969e-4804-b938-cda8c0a626b6@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1774533805;
	bh=dkjZs7WKD/WSTNflqzehy3i+/gd5KrtTWk6FaK4d2QU=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=ZLSd5s8BdQiW9ocJjlKnLqH32gFxNFAOO5OIbBvOxlv1Zk3WFgq+EpGIoDQ21dKd1
	 sPWfR7l2Eph+/s0n9YTDOJvIxR2QnkybNVD0aRjrD7Jhj+bMXAeg6M8Xb8igIPeq9C
	 lrMZsbUdJOmdU9lpoRZ674Lx9vmrUslRFJ45td1I=
Date: Thu, 26 Mar 2026 15:03:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Subject: Re: [PATCH v5 8/9] dt-bindings: net: wireless: brcm: Add compatible
 for bcm43752
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-wireless@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Johannes Berg <johannes@sipsolutions.net>, van Spriel <arend@broadcom.com>
References: <20260326-add-emmc-t7-vim4-v5-0-d3f182b48e9d@aliel.fr>
 <20260326-add-emmc-t7-vim4-v5-8-d3f182b48e9d@aliel.fr>
 <9bc23f1e-1cf3-43d1-935a-c4738d576c29@linaro.org>
Content-Language: en-US
In-Reply-To: <9bc23f1e-1cf3-43d1-935a-c4738d576c29@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_070332_787226_9DD19C45 
X-CRM114-Status: UNSURE (   9.23  )
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

On 3/26/26 1:55 PM, Neil Armstrong wrote:
> On 3/26/26 10:59, Ronald Claveau wrote:
>> Add bcm43752 compatible with its bcm4329 compatible fallback.
>>
>> Acked-by: Conor Dooley <conor.dooley@microchip.com>
>> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
>> ---
>>   Documentation/devicetree/bindings/net/wireless/brcm,bcm4329-
>> fmac.yaml | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/net/wireless/
>> brcm,bcm4329-fmac.yaml b/Documentation/devicetree/bindings/net/
>> wireless/brcm,bcm4329-fmac.yaml
>> index 3be7576787644..81fd3e37452a6 100644
>> --- a/Documentation/devicetree/bindings/net/wireless/brcm,bcm4329-
>> fmac.yaml
>> +++ b/Documentation/devicetree/bindings/net/wireless/brcm,bcm4329-
>> fmac.yaml
>> @@ -42,6 +42,7 @@ properties:
>>                 - brcm,bcm4356-fmac
>>                 - brcm,bcm4359-fmac
>>                 - brcm,bcm4366-fmac
>> +              - brcm,bcm43752-fmac
>>                 - cypress,cyw4373-fmac
>>                 - cypress,cyw43012-fmac
>>                 - infineon,cyw43439-fmac
>>
> 
> I'll apply all the other DT patches, please send this one alone with the
> [PATCH net-next] prefix so it gets picked by the wireless/net people.
> 
> Thanks,
> Neil

I'm on it, thank you.

-- 
Best regards,
Ronald

