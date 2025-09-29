Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6878ACAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 10:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6nj8UewcBAJ8EF2dEbOl7/uw/yCDjfbRR/lCqJQG8E8=; b=KEWqVCqwi/P/TFHX0OuwbYoXza
	xDwJq04T4fnSvR22Cq0g7HfWyz9bt/pA2C2qnUqHX2/5oDqDxJwlC90T1MkTFBBDZapRXROB5g5wK
	O4ASnfq5wypEYSixoffEKljWxD3G3fVhZy6t9mOgsw0Mqm0HaLS0b1ypUJKRD7L4tmaaalgDe/uAA
	vkraZV/OYcKgeU4bHPN0U1NPSQi38wOy27eRepm/a8RVg6rNx0D1qUoGjZjwDx1831eM1Szc5meFe
	Y5cMShZycgsItDp3ZduTCWe5AWfz5dIxVuIj4a2cMJtju+bLOf+vlgIi/aMWfLkiU1kv5hqCtbCvN
	7L8NT8oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Akl-000000025IO-0xaa;
	Mon, 29 Sep 2025 10:05:07 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Aki-000000025I0-3ew2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 10:05:06 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 24C92208D4;
	Mon, 29 Sep 2025 12:05:03 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tg-2Lw0uafqf; Mon, 29 Sep 2025 12:05:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1759140302; bh=RJmH0t/e9RqRoeOEExml5h6rWYvFYX1Evpup5hMd1Q0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Kx2dQB1+WZ4qnbocJoIEF5MigdG7ofBUuODkSjKGyV4p0GNTYm8pCuDkBTV2i3nrS
	 31Vngit30JYzaBJQ+KoQPUoBJKBcCjxhprEdwTxa+MtGF1sVml4kM3N3eLK5q/vooA
	 NO9+mQfeMBb2eWaghL0P/GqGj9voQBIFaOqX5AjLPJSbNAx5o0MzXodr4dUoTtUP2C
	 pJqKwqafdTNooBLD+QmTYFfXm6i69ekufk9Btv/bckOYwCCyYLTmx83RWODfqgMKw4
	 UUqph+FQejWWNMPfusXCNPX2nLgKQ86IqNStTJ+7BEsa08b/cpoAVfp9oZxmQFqv2n
	 dGT3F6maeFCzQ==
MIME-Version: 1.0
Date: Mon, 29 Sep 2025 10:05:01 +0000
From: Kaustabh Chakraborty <kauschluss@disroot.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, Alim
 Akhtar <alim.akhtar@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v3 0/6] Support for Exynos7870's display stack (DECON,
 MIPIPHY, DSIM, etc.)
In-Reply-To: <175911189634.2556697.2474466935066391775.robh@kernel.org>
References: <20250928-exynos7870-drm-dts-v3-0-bb7d8e570860@disroot.org>
 <175911189634.2556697.2474466935066391775.robh@kernel.org>
Message-ID: <32036b3916a944be9450e48b6be30dc0@disroot.org>
X-Sender: kauschluss@disroot.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_030505_180443_0BEC8B54 
X-CRM114-Status: GOOD (  27.20  )
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

On 2025-09-29 02:14, Rob Herring (Arm) wrote:
> On Sun, 28 Sep 2025 23:26:34 +0530, Kaustabh Chakraborty wrote:
>> Exynos7870 has a IP subsystem in its architecture dedicated to display
>> management. Notably, this block includes the Display Enhancement
>> Controller (DECON), and the DSI Master (DSIM).
>> 
>> The following series and its sub-series implement all components for a
>> functioning display pipeline. All vital information which helped 
>> shaping
>> up the patches have been retrieved from Exynos7870 vendor kernel 
>> sources
>> as provided by Samsung.
>> 
>> Testing has been done on all three devices available upstream, i.e.
>> Samsung Galaxy J7 Prime (samsung-on7xelte), Samsung Galaxy A2 Core
>> (samsung-a2corelte), and Samsung Galaxy J6 (samsung-j6lte). 
>> Regrettably,
>> I've only been able to test the functionality on video mode, as none 
>> of
>> the devices have panels working in command mode.
>> 
>> This series implements changes in the SoC subsystem, which includes
>> devicetree additions. It depends on all sub-series listed below:
>> (Legend: [R]eviewed, [A]ccepted)
>> 
>> exynos-sysmmu-resv-regions A 
>> https://lore.kernel.org/r/20250712-exynos-sysmmu-resv-regions-v1-1-e79681fcab1a@disroot.org
>> exynos7870-mipi-phy        A 
>> https://lore.kernel.org/r/20250612-exynos7870-mipi-phy-v1-0-3fff0b62d9d3@disroot.org
>> exynos7870-mipi-phy-fix    A 
>> https://lore.kernel.org/r/20250710-exynos7870-mipi-phy-fix-v2-1-5cf50d69c9d7@disroot.org
>> exynos7870-dsim            A 
>> https://lore.kernel.org/r/20250706-exynos7870-dsim-v3-0-9879fb9a644d@disroot.org
>> exynosdrm-decon            A 
>> https://lore.kernel.org/r/20250706-exynosdrm-decon-v4-0-735fd215f4b3@disroot.org
>> panel-samsung-s6e8aa5x01   A 
>> https://lore.kernel.org/r/20250721-panel-samsung-s6e8aa5x01-v5-0-1a315aba530b@disroot.org
>> panel-synaptics-tddi       - 
>> https://lore.kernel.org/r/20250625-panel-synaptics-tddi-v2-0-7a62ab1d13c7@disroot.org
>> 
>> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
>> ---
>> Changes in v3:
>> - fixed minor issues with devicetree in regards to compliance
>> - added memory-region to framebuffer region for decon device
>> - added related patchset to list: exynos-sysmmu-resv-regions
>> - replaced exynos7870-pmu with exynos7-pmu compatible to the list
>>   allowing a MIPI PHY subnode (krzk)
>> - updated compatible string and dt node for j6lte's panel
>> - reorder properties: ${x}, followed by ${x}-names (krzk)
>> - Link to v2: 
>> https://lore.kernel.org/r/20250627-exynos7870-drm-dts-v2-0-d4a59207390d@disroot.org
>> 
>> Changes in v2:
>> - modified compatible hierarchy to use non-deprecated syntax (krzk)
>> - fixed subject prefixes of [v1 2/5], [v1 3/5], [v1 4/5], [v1 5/5] 
>> (krzk)
>> - removed simplefb nodes instead of disabling it (krzk)
>> - added dt-bindings patch to allow mipi-phy node under PMU
>> - changed clock names of dsim node
>> - Link to v1: 
>> https://lore.kernel.org/r/20250612-exynos7870-drm-dts-v1-0-88c0779af6cb@disroot.org
>> 
>> ---
>> Kaustabh Chakraborty (6):
>>       dt-bindings: samsung: exynos-sysreg: add exynos7870 sysregs
>>       dt-bindings: soc: samsung: exynos-pmu: allow mipi-phy subnode 
>> for Exynos7 PMU
>>       arm64: dts: exynos7870: add DSI support
>>       arm64: dts: exynos7870-on7xelte: enable display panel support
>>       arm64: dts: exynos7870-a2corelte: enable display panel support
>>       arm64: dts: exynos7870-j6lte: enable display panel support
>> 
>>  .../bindings/soc/samsung/exynos-pmu.yaml           |  1 +
>>  .../soc/samsung/samsung,exynos-sysreg.yaml         |  2 +
>>  .../arm64/boot/dts/exynos/exynos7870-a2corelte.dts | 57 
>> +++++++++++----
>>  arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts    | 38 ++++++----
>>  arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts | 57 
>> +++++++++++----
>>  arch/arm64/boot/dts/exynos/exynos7870.dtsi         | 84 
>> ++++++++++++++++++++++
>>  6 files changed, 197 insertions(+), 42 deletions(-)
>> ---
>> base-commit: 262858079afde6d367ce3db183c74d8a43a0e83f
>> change-id: 20250523-exynos7870-drm-dts-87ccab731ba9
>> 
>> Best regards,
>> --
>> Kaustabh Chakraborty <kauschluss@disroot.org>
>> 
>> 
>> 
> 
> 
> My bot found new DTB warnings on the .dts files added or changed in 
> this
> series.
> 
> Some warnings may be from an existing SoC .dtsi. Or perhaps the 
> warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to 
> reply
> unless the platform maintainer has comments.
> 
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
> 
>   pip3 install dtschema --upgrade
> 
> 
> This patch series was applied (using b4) to base:
>  Base: using specified base-commit 
> 262858079afde6d367ce3db183c74d8a43a0e83f
> 
> If this is not the correct base, please add 'base-commit' tag
> (or use b4 which does this automatically)
> 
> New warnings running 'make CHECK_DTBS=y for 
> arch/arm64/boot/dts/exynos/' for 
> 20250928-exynos7870-drm-dts-v3-0-bb7d8e570860@disroot.org:
> 
> arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dtb: 
> /soc@0/dsi@14800000/panel@0: failed to match any schema with 
> compatible: ['syna,td4300-panel']
> arch/arm64/boot/dts/exynos/exynos7870-a2corelte.dtb: 
> /soc@0/dsi@14800000/panel@0: failed to match any schema with 
> compatible: ['syna,td4101-panel']

Note: This affects patches 4/6 and 5/6, rest should be mergeable.

