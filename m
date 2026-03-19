Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 689B31090247
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 15:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/SkmenYWfG03cyx26DQI0pNUhnOeHCO/bc9QSsDFeFI=; b=Z+C/1L99EwPIEhVPUHCxArAEAo
	qab4eCg5ucbIt2aBpcoIQnu+O5bg/Lgtu3d/7sVOKo32G148pIXx77Z4+/sV0GNJ+4gQ6UK9J5RX5
	ZimWzVpQFdk74PRT6Tqo3x6Nsr7b9D/HAQxWYEAEEF63t/3ue+EIAesI/bLa5s8oOZf/QymI3kU1y
	SyBUh5zCoaikz2Z4TDg/oaK9q2l7eR4XsQs/3B/LqFAfaTV/E1AACuOMVjxgxxFtYSQPjG6j//IyN
	SR/a3SDeuvXjO+Bk+vS5sohhOaiNj5bWaXLJltPMZQJFRpi+/sIzLcAp04I0GvueOy+0PHDpnene1
	QJ10SsGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Fky-0000000Azo7-25DZ;
	Thu, 19 Mar 2026 15:57:56 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Fkt-0000000Azl2-1moD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 15:57:55 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260319155748euoutp021cae6d9d7a23bc88801c982c7147536a~eSUYF7PN23029030290euoutp02_
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 15:57:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260319155748euoutp021cae6d9d7a23bc88801c982c7147536a~eSUYF7PN23029030290euoutp02_
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1773935868;
	bh=/SkmenYWfG03cyx26DQI0pNUhnOeHCO/bc9QSsDFeFI=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=a4hGFMUjZQrJxLGlAv0a6Xv+ed/hDSCUPEp52Q1Tvit5ZroQsw4ct7+vBiyJJ/Pxf
	 KU/6zpu34PEJZXyXo7ze3AsA/qQSBfgxu4byZA1hsdUe9fN02d9xE98rtFPe5YAzoL
	 5ax71jDAP2+NQbUl51yNA0aGombxO+2o/gEupCCM=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260319155748eucas1p2b5301f0df591382d4f9d11bd0154335a~eSUX0VwA80213702137eucas1p2V;
	Thu, 19 Mar 2026 15:57:48 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260319155746eusmtip21015fbb23aff1c944126bee28a18b8b0~eSUW1P7_r0967109671eusmtip2G;
	Thu, 19 Mar 2026 15:57:46 +0000 (GMT)
Message-ID: <4809918d-fdf1-48c0-bc10-fcf75837cb81@samsung.com>
Date: Thu, 19 Mar 2026 16:57:45 +0100
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v8 05/10] pmdomain: samsung: convert to using regmap
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, Ulf Hansson
	<ulf.hansson@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
	<alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Liam
	Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Peter
	Griffin <peter.griffin@linaro.org>, Tudor Ambarus
	<tudor.ambarus@linaro.org>, Juan Yescas <jyescas@google.com>, Will McVicker
	<willmcvicker@google.com>, kernel-team@android.com,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <ae31c62c940e99077d44e1935465dce7db0e4c06.camel@linaro.org>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260319155748eucas1p2b5301f0df591382d4f9d11bd0154335a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260319101424eucas1p2d5dca06240e8760046fb40507ffb3bba
X-EPHeader: CA
X-CMS-RootMailID: 20260319101424eucas1p2d5dca06240e8760046fb40507ffb3bba
References: <20260318-gs101-pd-v8-0-241523460b10@linaro.org>
	<20260318-gs101-pd-v8-5-241523460b10@linaro.org>
	<CGME20260319101424eucas1p2d5dca06240e8760046fb40507ffb3bba@eucas1p2.samsung.com>
	<CAPDyKFrprMSLOBMB_BHbi=j6UXV4dXBn-H8M1BsqDWNSCJwvuA@mail.gmail.com>
	<c5ba58fb-50f1-4067-a099-97169ea81f68@samsung.com>
	<ae31c62c940e99077d44e1935465dce7db0e4c06.camel@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_085751_761060_1E34FA93 
X-CRM114-Status: GOOD (  14.18  )
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

On 19.03.2026 12:58, André Draszik wrote:
> On Thu, 2026-03-19 at 11:29 +0100, Marek Szyprowski wrote:
>> On 19.03.2026 11:13, Ulf Hansson wrote:
>>> As a follow-up patch on top, please consider converting the open-coded
>>> polling loop above into a readx_poll_timeout_atomic().
>> This has been tried and it doesn't work in all cases required for power
>> domain driver:
>>
>> https://lore.kernel.org/all/5c19e4ef-c4fd-4bf5-88b3-46c86751b14e@samsung.com/
>>
>> Probably a comment about that could be added directly to this code to
>> avoid such conversion and breakage in the future.
> I am planning to revisit this in the future and am hoping that we can
> figure out what goes wrong when using regmap_read_poll_timeout().
>
> Hopefully such a comment would only be short-lived, so maybe not really
> worth it? I can add it, though, if you prefer.

Well, I think I've already pointed what goes wrong with 
regmap_read_poll_timeout() in the above mentioned thread. You would need 
to use regmap_read_poll_timeout_atomic() and modify it the same way as 
commit 7349a69cf312 did for read_poll_timeout_atomic().

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


