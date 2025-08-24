Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C327CA0EFC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Aug 2025 10:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jupBRNGbZTH5sfVvjiXo6IJQ04ioAEEK5nIOYwjl318=; b=dmm5B0fKS8+dwuYry30ipd0LBf
	dyezMahSWNVBXyejH8a8eMxBXrZ5+zevtTn/xcUGI2U0j1vbNvSEWoQDEJg10leUlRbyg9cvLadhD
	/b4QhtnXTif5kCAaG23hCYwlDiIo/XGmvH/rej0O3SoGm8Tzdf+DBQ3daaA/4jZX3k+nQMRDMGMYZ
	8WEdHqPFuxqAvlke3j5zn6vtvoKxJ3iZ5DNrws3wZkCmMMLEPsf7oLQ3ahgbZAOJJVEYEtBe5eYrA
	OHd/l2Jp3xFuX3gT7wVRk6Gb/GLPvuE2qiIEp0u6+/YL9n4FRzwn18APtGsSz3o4JocFGpNMW1Cv2
	mVQbUM1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uq7xA-000000060ZX-1wkz;
	Sun, 24 Aug 2025 10:28:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uq7uX-000000060LL-1LlT
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 Aug 2025 10:25:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A4F725C5592;
	Sun, 24 Aug 2025 10:25:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F31DEC4CEEB;
	Sun, 24 Aug 2025 10:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756031116;
	bh=QFKBLC8hv3oESZsf2kTb8bpZ3+ypUZIq2+WqHmKO6T4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TqRQ6bU0b+S52MoDMNJZpeS9sWTKmJJaN4/b34nGTkBSXR/XTjCzQqf/vuNlRqXR9
	 5wZzHdz4b2gY5R691UcOk2Hk9mr0wRaboljiDMCp1Ftfo4IgzZXmmBglFgvJMbn0Pl
	 RdSrXmu3Tj66ag35pBV2iF2hsAvzrbyQG7vBMRk1vv4Rs8LD+5MaRB9tL8y/6T5WgV
	 5mBy50+9d3h94W30onx/wWvp9vSshjiTC6Gf0zUonhBx2sTpil5678/VL2enwNqA8S
	 jL9Oos5DFGDSsGeUNtpZzHaiJzx8p+Zw48Dz8gW6Yj6pylD7a+HRBMpA7//HRBeY61
	 J8lU0WJ1i+d6w==
Message-ID: <a8dcbaa1-3145-4d25-b8c5-a6e9c9bc05fd@kernel.org>
Date: Sun, 24 Aug 2025 12:25:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] Support for Exynos7870's display stack (DECON,
 MIPIPHY, DSIM, etc.)
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250627-exynos7870-drm-dts-v2-0-d4a59207390d@disroot.org>
 <3f4f28cf-417b-4f12-8a3d-c1f70f6871c4@kernel.org>
 <45fc52d9988d1bf17eca392364c63193@disroot.org>
 <2bfa6c0b-1f23-4d57-b618-688ed8dc7fae@kernel.org>
 <afd9e6c8095df785fa7f39265111e357@disroot.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <afd9e6c8095df785fa7f39265111e357@disroot.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_032517_441967_6248FE62 
X-CRM114-Status: GOOD (  15.05  )
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

On 18/08/2025 19:08, Kaustabh Chakraborty wrote:
> On 2025-08-18 06:32, Krzysztof Kozlowski wrote:
>> On 17/08/2025 16:49, Kaustabh Chakraborty wrote:
>>> On 2025-08-13 07:58, Krzysztof Kozlowski wrote:
>>>> On 26/06/2025 22:13, Kaustabh Chakraborty wrote:
>>>>> This series implements changes in the SoC subsystem, which includes
>>>>> devicetree additions. It depends on all sub-series listed below:
>>>>> (Legend: [R]eviewed, [A]ccepted)
>>>>>
>>>>> exynosdrm-decon            -
>>>>> https://lore.kernel.org/r/20250627-exynosdrm-decon-v3-0-5b456f88cfea@disroot.org
>>>>> exynos7870-mipi-phy        A
>>>>> https://lore.kernel.org/r/20250612-exynos7870-mipi-phy-v1-0-3fff0b62d9d3@disroot.org
>>>>> exynos7870-mipi-phy-fix    -
>>>>> https://lore.kernel.org/r/20250627-exynos7870-mipi-phy-fix-v1-0-2eefab8b50df@disroot.org
>>>>> exynos7870-dsim            -
>>>>> https://lore.kernel.org/r/20250627-exynos7870-dsim-v2-0-1433b67378d3@disroot.org
>>>>> panel-samsung-s6e8aa5x01   -
>>>>> https://lore.kernel.org/r/20250625-panel-samsung-s6e8aa5x01-v3-0-9a1494fe6c50@disroot.org
>>>>> panel-synaptics-tddi       -
>>>>> https://lore.kernel.org/r/20250625-panel-synaptics-tddi-v2-0-7a62ab1d13c7@disroot.org
>>>>>
>>>>> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
>>>>
>>>> What is the status of the bindings from dependencies? I think they 
>>>> were
>>>> not accepted.
>>>
>>> Except panel-synaptics-tddi, all have been accepted. A lot of them
>>> haven't hit next though. I'm waiting for that to send the next 
>>> revision.
>>
>> What does it mean - accepted but not hit next? If it is accepted, it
>> must be visible in next. Which maintainer's tree are not in the next?
> 
> drm-exynos [1] branches haven't been rebased to v6.17-rc1. This should
> include all some DECON and all DSIM patches.
> 
> Although [2] has been accepted, I don't see the commit in [3] anymore.

I don't understand this. How can you find a commit via web interface?
You should be having linux-next and there you can go through the history
to check if commit is there or not.

> But, there's [4] which mentions my panel patches, but then I don't see
> them in next (there should be a panel-samsung-s6e8aa5x01-ams561ra01.c
> in [5]).

so that's the problem to solve.

I'll drop the patchset from my queue. I think you got here some other
comments as well, so I will be expecting v3 anyway.


Best regards,
Krzysztof

