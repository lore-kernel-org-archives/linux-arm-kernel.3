Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79985C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 May 2025 14:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TpkpA5EeSInxjE8lS4gz7EvkM2XzXGOavlgw33JgEDs=; b=kczF0UUGts3785senPX1VjGIyx
	KqGcOOYwMckQ+q8fBBjJjVPdl37tPBldouKAyiQeEQFaTGA9NuilirrXxGbbc7IjSRodUiDguqSR4
	yEiB6HLMFQNaFM/R9NZt1iTQju45cbvsPiPqVdNeDGbEJ/qw4hP0frXRjtlildxINfPVTdbZBV9jn
	NoqlnbJ+eBSBmnHUbvVkLqc6+myIpV3RzHm9F2KZXWiFuuotTtq7HcweW2Yjqx0N1ZbZRycQV8ib5
	GISPyhhSZ6h8OsnuVPPHlzaDJiZ5vEZCTywKVvowsJHGuw/ml4zxap9XGpL3HXRCTZB/HgvkgfxmP
	ahSUxKAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGI9y-00000005nYF-0I11;
	Sat, 17 May 2025 14:05:06 +0000
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGI7x-00000005nPr-3B61
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 May 2025 14:03:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1747490576; bh=GuOGpFxQOypXeXtTZiCIfNiDHN4HvXpvL8eGxDkgXbw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CzriSmSPG0+aVPkm08mfXYwS7WtU/E/nXPmu4vKcHg3l69pGuy7vHg9C0od/aKcnK
	 PApkNv1OrViMJfDpe4MQVFCiG/z+hy/BXFPj0T4DTi2MMNSqb6zE8Jy+5Ho4DXvW3T
	 e2O8PO0kjqSpbHB9r57kpk+nTGfi4u5kkpGql0tZ9RSQDuLfrTBoluExfNC3s1fNTo
	 F2ftvu/WvckFbG65vAk/sfHiLxfNK/iGZraFFkaMgNyijzgWQlpbKK8PUIS4R+Uq5w
	 uM0jK2Hr+4F7lJtjoXWAewdgsmgEu0eAQKD/YiWX8cI05aSS4XooUADYUPMRLxAxvs
	 d5kdj6BqeVPCA==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 034073BAD92;
	Sat, 17 May 2025 14:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1747490575; bh=GuOGpFxQOypXeXtTZiCIfNiDHN4HvXpvL8eGxDkgXbw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PHge0Z+IlGRFEtcMJZIK9qRLN/KW4I3ajwSbWCIJgFUD5b9HK8Wue9I3s8wOsMx8s
	 UOSjUdXVAue/OYIvIvjlBhRvUqr5leo5WQZ9bSBcTqdFEt9uHH05J185uaz2Hf4WIP
	 cjpXCFepowDQojHrsRlvfKSag84Y6JRdnc1D4O8dSUUiRe254Mmohtd30VqWovv2PP
	 UMA53O6ENbI57+WxuUXLQUFrGt+CzfTHs7xG6Okwu5MDfu023/h9hakPcKtVi0Exa/
	 b6BrmTvfaG82yLk/8nLgttf0crO8oQ/3SwbxZIb2dS7zrOcLkXoCHTjZ4JXgna61DE
	 XklApRkcWctoA==
Message-ID: <97db26c1-6d03-48ce-a1d3-cb5c7c604cf2@mleia.com>
Date: Sat, 17 May 2025 17:02:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: lpc32xx: Add #pwm-cells property to the two SoC
 PWMs
Content-Language: ru-RU
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Arnd Bergmann <arnd@arndb.de>
Cc: Purva Yeshi <purvayeshi550@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
References: <20250403104915.251303-2-u.kleine-koenig@baylibre.com>
 <hbz3gikjqwuqmexzrxis43gmxcviiryihi7pdp3btdb3sopqi4@mssyr62bunxk>
 <ss6jqmpz55wz3sb27kg7mu555qowf5enu3fe32zlxgqeix7odi@zhs3ns4euljf>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <ss6jqmpz55wz3sb27kg7mu555qowf5enu3fe32zlxgqeix7odi@zhs3ns4euljf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20250517_140256_037668_6E11B1C6 
X-CRM114-Status: GOOD (  14.53  )
/bin/ln: failed to access 'reaver_cache/texts/20250517_140256_037668_6E11B1C6': No such file or directory
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250517_140256_037668_6E11B1C6 
X-CRM114-Status: GOOD (  17.00  )
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

Hi Uwe,

On 5/16/25 12:53, Uwe Kleine-König wrote:
> Hello,
> 
> [adding Arnd to To:]
> 
> On Thu, Apr 24, 2025 at 05:05:29PM +0200, Uwe Kleine-König wrote:
>> On Thu, Apr 03, 2025 at 12:49:14PM +0200, Uwe Kleine-König wrote:
>>> If these PWMs are to be used, a #pwm-cells property is necessary. The
>>> right location for that is in the SoC's dtsi file to not make
>>> machine.dts files repeat the value for each usage. Currently the
>>> machines based on nxp/lpc/lpc32xx.dtsi don't make use of the PWMs, so
>>> there are no properties to drop there.
>>>
>>> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
>>
>> I wonder if this patch is still on someone's radar. I didn't hear
>> anything back and it's not in next.
> 
> This is still the status quo.
> 
> There is a patch in next touching arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
> applied by Arnd. So maybe the problem that my patch wasn't picked up is
> that Arnd wasn't aware?

I've just started the process of getting my kernel.org account this
week to be able to send ARM LPC32xx/LPC18xx pull requests.

Right at the moment it's better to rely on Arnd's and other ARM
maintainers to include the correspondent patches, and for what it's
worth let me give my tags to your change.

Sorry for such the inconvenince and delay, I believe it'll be better,
and thank you very much for the change.

--
Best wishes,
Vladimir

