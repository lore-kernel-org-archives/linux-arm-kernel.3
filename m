Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89BCEC54F4C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 12:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4CcJVu2HdCBodSbf+UYAAHPLgckCVCAk6z1RWhwvCPA=; b=RbNhdjseNVw4HHhqVbxDPbjB5f
	B/Gsq/7zAVEXOhoiPjcAfkQE88JsVoPo/YOBIOZ5mXcA6Xd0PSQRsF4GuHcqExa4dkAdpjjqeiLvq
	XV6uecuu/lcYZaQ34dBhd8jvpz+0Susfs2IBw4A3oO/QqMOBzPf/8zkr9VzcuoLvKOtyw7p6L+KvJ
	tf7cQV3md2eZC+gIIrGWmIjo7tkIHxlPljkaF56StLUMzXh/YGJMyiLowsxiFhJ0suT22JWzmGWuQ
	vCIsLZH0pvBbntPhEKUZKn7Vrh7Jq5sJYuu1+09uMij0VUseDhCkrE4kDH8BA55ON8B6hacR+HVEy
	t7YWtcmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wogrg-00000005EVo-2mf2;
	Tue, 28 Jul 2026 12:24:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wogre-00000005EVT-3Fmt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 12:24:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2DA7240344;
	Tue, 28 Jul 2026 12:24:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51F6B1F000E9;
	Tue, 28 Jul 2026 12:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785241494;
	bh=4CcJVu2HdCBodSbf+UYAAHPLgckCVCAk6z1RWhwvCPA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=lW5Ox6TynyS1zZbYlvpYlxo3hjcEY3zLDeJ+k2NqEQ5ub6Y0ym1PCqvx0LV8uYlGG
	 YSg67AQ30dmNYsNQIyErdCfVJWSq/TVkZ/VWTgLvOd63S0L86PAOVWAYWtDgfbkSoQ
	 1bs3t/585rA3pQnAMk30OeBU6yOvFagKWn/pYJBwBpgg9ycSTKLUqcuEDQqcWO/gc0
	 XpuqrI5TNQ18k9VQRBwT/u/OSRi6pXp+uBQzb/WDryUjOw3zo+p+d6lV+zB9uhaIH1
	 /oD9fGt19zuUhONvLuiluTMUYJtvdl78t57Or88Yf4LTtxj7n0utc3r3gooSqJichB
	 FJV7aO+yzE+oA==
Message-ID: <0c948180-3112-4e92-b752-0015c55fb26c@kernel.org>
Date: Tue, 28 Jul 2026 14:24:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/13] arm64: dts: exynos8855: add cmu_top & cmu_peric
 clock DT nodes
To: Alim Akhtar <alim.akhtar@samsung.com>, "'raghav.s'"
 <raghav.s@samsung.com>, s.nawrocki@samsung.com, cw00.choi@samsung.com,
 peter.griffin@linaro.org, mturquette@baylibre.com, sboyd@kernel.org,
 bmasney@redhat.com, robh@kernel.org, conor+dt@kernel.org
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, hajun.sung@samsung.com, is.gandhi@samsung.com,
 ts.amit@samsung.com, pokala.reddy@samsung.com
References: <20260728121111.2077860-1-raghav.s@samsung.com>
 <CGME20260728115256epcas5p38cbcfe68218d08301d237705388e6e62@epcas5p3.samsung.com>
 <20260728121111.2077860-5-raghav.s@samsung.com>
 <8582d4f9-1a78-4f47-bab9-c52393dffbd1@kernel.org>
 <079201dd1e8b$eca22680$c5e67380$@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <079201dd1e8b$eca22680$c5e67380$@samsung.com>
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

On 28/07/2026 14:23, Alim Akhtar wrote:
> Hi Krzysztof,
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzk@kernel.org>
>> Sent: Tuesday, July 28, 2026 5:30 PM
>> To: raghav.s <raghav.s@samsung.com>; s.nawrocki@samsung.com;
>> cw00.choi@samsung.com; peter.griffin@linaro.org;
>> alim.akhtar@samsung.com; mturquette@baylibre.com; sboyd@kernel.org;
>> bmasney@redhat.com; robh@kernel.org; conor+dt@kernel.org
>> Cc: linux-samsung-soc@vger.kernel.org; linux-clk@vger.kernel.org;
>> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
>> kernel@vger.kernel.org; hajun.sung@samsung.com;
>> is.gandhi@samsung.com; ts.amit@samsung.com;
>> pokala.reddy@samsung.com
>> Subject: Re: [PATCH 04/13] arm64: dts: exynos8855: add cmu_top &
>> cmu_peric clock DT nodes
>>
>> On 28/07/2026 14:11, raghav.s wrote:
>>> Add required dt node for cmu_top & cmu_peric block
>>>
>>> Signed-off-by: raghav.s <raghav.s@samsung.com>
>>> ---
>>>  arch/arm64/boot/dts/exynos/exynos8855.dtsi | 24
>>> ++++++++++++++++++++++
>>>  1 file changed, 24 insertions(+)
>>
>> Please organize your patches in reasonable order. DTS is never in the middle,
>> see submitting patches (both documents) and maintainer-soc profile.
>>
> The thought was to add clks block wise and hence we see DTS coming in between but for the other blocks. 
> e.g. patch-2 and 3 adds binding and driver for TOP and PERIC and this patch-4 adds DTS. 
> And patch-5 and 6 adds binding and driver for PERIS and patch-7 adds DTS and so on.
> 
> Cover-letter should have explained this. 
> 
> Are you suggesting to re-order all the binding first followed by all blocks driver and then add a single DTS for all clock controller? 
> 
> Does current approach helps in review? 

If you ask this, you did not read the docs.

Best regards,
Krzysztof

