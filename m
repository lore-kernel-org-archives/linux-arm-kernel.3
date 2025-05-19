Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE16FC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 17:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=clyOHWY2IVfI9AZJ05BeTXpQUTL0uNha47hEQW+o2gA=; b=jScdLds3cpdVdTp5zdbgOmeK7Z
	8nBdevHypMHnxVJ0OdjomT/Uaj6WIJGzx0rcoTHIMaku7S6xa+qh3vIVKartvGh1Yc/eDxem0Cmym
	n061Jjhhq2aUqXTGDDekR+qr2/Lg6V70SMxsZ/NbqP67Ez9UYRncO8hIPQZaIb/3RsyzhBQ1dWc88
	Xp+Rh1fRcRdoQpxjGTP7fmcHd06ypclnfZ0g5Es9Vj2hRX/WeRNamVl4gz8Qk2dzcYR5rjS4K2vIQ
	dofSRlrMPdZWLpmJOH/49leisA3VbfD52byYvUC/z8yD1en8JBXdrb1zo+hoCtTR4Qh6yT1tRWZYj
	28wdZtIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH4YB-0000000A07j-3b3V;
	Mon, 19 May 2025 17:45:19 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH3u6-00000009u8j-0mRD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 17:03:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1747674232;
 bh=clyOHWY2IVfI9AZJ05BeTXpQUTL0uNha47hEQW+o2gA=;
 b=yti78IdkElfs+9nkTJhiaWNfDXAmFtgSxHPmDB8WZGFnk6O7MAqMqlgCR78SLG00G7uhH6Zja
 PVcw2Dt0J884HusntSndfmOOy8t1NViiBVEEKcrGVgtjfAYxEyy8fmd5JbKEJRZKthWpglPJ2XG
 Rr+m8i6uOo+hGK2e/RJFOkK/dehFqDC1xCt2eZs+IqgmKb72S1wHnpToWb/yqGeqSzbZm/oUdfx
 c3vLplWLqDUhbRWTfBp9nuLqzH/YEuxjHSOT3P3sE+3PuqVcqz6oHAOOD5V7VjZ4Hs2fcz6Lxoa
 r5NiYvUPJtqAugi26ZALYuUmHi1EvKMsRdau2+C3xZFA==
X-Forward-Email-ID: 682b646ef094abf9f55cc97f
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 1.0.3
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <2d0524a9-50ff-4b49-bee9-8158c4c5b88b@kwiboo.se>
Date: Mon, 19 May 2025 19:03:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/9] dt-bindings: mmc: sdhci-of-dwcmhsc: Allow use of a
 power-domain
To: Conor Dooley <conor@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Ulf Hansson <ulf.hansson@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
 Yao Zi <ziyao@disroot.org>, Chukun Pan <amadeus@jmu.edu.cn>,
 linux-rockchip@lists.infradead.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250518220707.669515-1-jonas@kwiboo.se>
 <20250518220707.669515-6-jonas@kwiboo.se>
 <20250519-caress-traps-f61f0c6067b4@spud>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20250519-caress-traps-f61f0c6067b4@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_100354_586012_6A3EDCBF 
X-CRM114-Status: GOOD (  14.46  )
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

Hi Conor,

On 2025-05-19 18:12, Conor Dooley wrote:
> On Sun, May 18, 2025 at 10:06:52PM +0000, Jonas Karlman wrote:
>> The commit 7e856617a1f3 ("dt-bindings: mmc: Add support for rk3576
>> eMMC") limited use of power-domains to Rockchip RK3576.
>>
>> Remove the power-domains: false to allow use of power-domains with more
>> controllers, e.g. with SDHCI on Rockchip RK3528.
> 
> Meanwhile, you're allowing it for all devices, even ones where it is not
> valid. I'm not keen on that.

All Rockchip variants technically belong to a power-domain, not just the
RK3576. E.g. for RK3588 a PD_NVM0 domain (not described in DT), for
RK3568 a VD_LOGIC ALIVE / BIU_SECURE_FLASH idle-only domain, and as
shown in this series for the RK3528 the PD_VPU idle-only domain.

Any suggestion on how to best allow describing these links?

Regards,
Jonas

> 
>>
>> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
>> ---
>>  Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml | 4 ----
>>  1 file changed, 4 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml b/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
>> index 5fb347167004..f882219a0a26 100644
>> --- a/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
>> +++ b/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
>> @@ -120,10 +120,6 @@ allOf:
>>        required:
>>          - power-domains
>>  
>> -    else:
>> -      properties:
>> -        power-domains: false
>> -
>>  unevaluatedProperties: false
>>  
>>  examples:
>> -- 
>> 2.49.0
>>


