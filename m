Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E18A4CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 17:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rVwWy8hBYpr8k9SaYLVc8ac400cEh85pTezpi9vBXoI=; b=rsLgOV7GkLCztWt3HMYErNHSNP
	6MxDBRj9P+GeQ4zTee92UzieJUZI8Li1phMQhiWUWa6fpiUxbapf8Pf4ME4Djm3BH446c8nh7vQeR
	3//f9l8vtgA1hZMFZKJt1hN4EMf0lA/x4Uu4h2zr2v6V3BkirVYqCDEiTCNUKd2X3gFjFaU5EF16T
	AuPUxlfscxTJveX5PA2t883LMqcpmWupQx8sWbqmK7+e21s393qaI1gNwsxi5whnrlyFME/OT4yFG
	hKYBf4zRknvJAlg9eZCH5q6gagdtK+ktxgxyIdIBysYXXHxdN3wkRjXgjwmgg8U9NaynF7KXMD81b
	2FHjrGoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo3pm-00000008EMr-0Uqm;
	Mon, 18 Aug 2025 17:39:50 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo3LP-0000000864F-0Jbd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 17:08:28 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 8080C22F8E;
	Mon, 18 Aug 2025 19:08:22 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pMVZN71AsQAe; Mon, 18 Aug 2025 19:08:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1755536900; bh=rPMW5veYC6Pqzzt/IvNOl92DEwVRpPy8WEfW0ZS5F5I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Hi2iBBvuuvtwAY05hT4157aaA2jyJ96dwAODLyT5zFIyFINe4HwlkjPicA27h7aLr
	 b/xBfuwcShAv0mY46xn9qj46G1rQVVU5cIXJFiwcbGRInMrNAj0+t1UHSTLYPNcTDo
	 o3VqZFGrdiUQClNIVMgxYzBYGv1FVJeRdl0PKItGIL73lnFYSr97RXquqQ8u1HdMVh
	 RFIWDcMrX0mPWr7AX9XvP8xcytDOjs1OCSot0047gjM4/hm4Gv/8dxM0NCoM8CO8RX
	 ++TSWDpuoJ0ciwrtxmSag0OkUDlfbiMODVDxob+QHzlh2mvoLb/zEQJYZA7cji8MWK
	 UHs1kllj/r0CA==
MIME-Version: 1.0
Date: Mon, 18 Aug 2025 17:08:20 +0000
From: Kaustabh Chakraborty <kauschluss@disroot.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/6] Support for Exynos7870's display stack (DECON,
 MIPIPHY, DSIM, etc.)
In-Reply-To: <2bfa6c0b-1f23-4d57-b618-688ed8dc7fae@kernel.org>
References: <20250627-exynos7870-drm-dts-v2-0-d4a59207390d@disroot.org>
 <3f4f28cf-417b-4f12-8a3d-c1f70f6871c4@kernel.org>
 <45fc52d9988d1bf17eca392364c63193@disroot.org>
 <2bfa6c0b-1f23-4d57-b618-688ed8dc7fae@kernel.org>
Message-ID: <afd9e6c8095df785fa7f39265111e357@disroot.org>
X-Sender: kauschluss@disroot.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_100827_526527_9210EEDB 
X-CRM114-Status: GOOD (  13.32  )
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

On 2025-08-18 06:32, Krzysztof Kozlowski wrote:
> On 17/08/2025 16:49, Kaustabh Chakraborty wrote:
>> On 2025-08-13 07:58, Krzysztof Kozlowski wrote:
>>> On 26/06/2025 22:13, Kaustabh Chakraborty wrote:
>>>> This series implements changes in the SoC subsystem, which includes
>>>> devicetree additions. It depends on all sub-series listed below:
>>>> (Legend: [R]eviewed, [A]ccepted)
>>>> 
>>>> exynosdrm-decon            -
>>>> https://lore.kernel.org/r/20250627-exynosdrm-decon-v3-0-5b456f88cfea@disroot.org
>>>> exynos7870-mipi-phy        A
>>>> https://lore.kernel.org/r/20250612-exynos7870-mipi-phy-v1-0-3fff0b62d9d3@disroot.org
>>>> exynos7870-mipi-phy-fix    -
>>>> https://lore.kernel.org/r/20250627-exynos7870-mipi-phy-fix-v1-0-2eefab8b50df@disroot.org
>>>> exynos7870-dsim            -
>>>> https://lore.kernel.org/r/20250627-exynos7870-dsim-v2-0-1433b67378d3@disroot.org
>>>> panel-samsung-s6e8aa5x01   -
>>>> https://lore.kernel.org/r/20250625-panel-samsung-s6e8aa5x01-v3-0-9a1494fe6c50@disroot.org
>>>> panel-synaptics-tddi       -
>>>> https://lore.kernel.org/r/20250625-panel-synaptics-tddi-v2-0-7a62ab1d13c7@disroot.org
>>>> 
>>>> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
>>> 
>>> What is the status of the bindings from dependencies? I think they 
>>> were
>>> not accepted.
>> 
>> Except panel-synaptics-tddi, all have been accepted. A lot of them
>> haven't hit next though. I'm waiting for that to send the next 
>> revision.
> 
> What does it mean - accepted but not hit next? If it is accepted, it
> must be visible in next. Which maintainer's tree are not in the next?

drm-exynos [1] branches haven't been rebased to v6.17-rc1. This should
include all some DECON and all DSIM patches.

Although [2] has been accepted, I don't see the commit in [3] anymore.
But, there's [4] which mentions my panel patches, but then I don't see
them in next (there should be a panel-samsung-s6e8aa5x01-ams561ra01.c
in [5]).

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git/
[2] 
https://lore.kernel.org/all/175432157792.3671011.1104200917154441096.b4-ty@linaro.org
[3] 
https://gitlab.freedesktop.org/drm/misc/kernel/-/commits/drm-misc-next?ref_type=heads
[4] https://lore.kernel.org/all/20250814072454.GA18104@linux.fritz.box
[5] 
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/gpu/drm/panel?h=next-20250818

> 
> 
> Best regards,
> Krzysztof

