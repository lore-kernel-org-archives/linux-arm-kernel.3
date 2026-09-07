Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A35A4C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 08:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C49HkmDVZ4lVjfKu187yKcJcfrFqGDQxUYYBb3LwzE4=; b=A/KFaSNbuIv72lNZQEHZ4qc90J
	05JlJkJlevh7gHCpKZ5CJTqi1KKJxwIGYzgcpZ6fFzO5UYDXInrEu99kD+VmUrUz1nL5lKXfp2jIT
	+3+JTGeCIlxq29n4J8IvUN5YHxbrjxqeNxur6o2x4ZhYT7iKbN1BUTyGoVbooG+YmUb8VQDOIjpmn
	BsqA1Zy4EwcQvnPpBbNn41kYM6yddEcecFhpS2xroZctxM13O26rLoOh66cpfTcoEjsuSXlWjIpMp
	xtm7vgCqQi5R2c45mC+A4DbbleuuS8pLtBzuV+LQMZ/wfOdN9bclBJq0j1z89rff3lpvkAN5NmfT0
	BnDXnptg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3UXB-00000006FIy-2QD0;
	Mon, 07 Sep 2026 08:16:57 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3UX5-00000006FGS-1I6x
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 08:16:56 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260907081643euoutp018f1b6ab2e1d798b2618aa7e9bec7f215~S__6IcXVb0125601256euoutp01E
	for <linux-arm-kernel@lists.infradead.org>; Mon,  7 Sep 2026 08:16:43 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260907081643euoutp018f1b6ab2e1d798b2618aa7e9bec7f215~S__6IcXVb0125601256euoutp01E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1788769003;
	bh=C49HkmDVZ4lVjfKu187yKcJcfrFqGDQxUYYBb3LwzE4=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=u7Q2s1heUqMda6W5XRBhcPx+MTlXcqrDqyl2qmNV0zWDSSmMKI2HWoP4uLN9hOlvP
	 XmXHSulGrzA4zdKuuUTjPC1zQMRUSzsgxpRcQp3nM6VrhekYpsbS0+5HfPckFaxkLm
	 fErxQpxeu4pXfP+9s405Gr40nX1gdcKu3786lkHw=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260907081643eucas1p20588c21e5a4fc629f9ebc1f8f15c3522~S__54h-yh1075210752eucas1p2o;
	Mon,  7 Sep 2026 08:16:43 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260907081643eusmtip2a290ef3efe626b53d73bbd7fd72e3e51~S__5ZfqCW0517005170eusmtip2N;
	Mon,  7 Sep 2026 08:16:43 +0000 (GMT)
Message-ID: <62afdbc4-f21a-477a-b0ab-de20c96b4b6d@samsung.com>
Date: Mon, 7 Sep 2026 10:16:42 +0200
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v2] ARM: dts: samsung: exynos4210-i9100: Enable RTS/CTS
 in Bluetooth node
To: Paul Cercueil <paul@crapouillou.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar
	<alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <1666390417d0d9b8f58a7bdad1b8ecb475ba0d4f.camel@crapouillou.net>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260907081643eucas1p20588c21e5a4fc629f9ebc1f8f15c3522
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260829101532eucas1p29f4e04d4dfd169377793c276221059a6
X-EPHeader: CA
X-CMS-RootMailID: 20260829101532eucas1p29f4e04d4dfd169377793c276221059a6
References: <CGME20260829101532eucas1p29f4e04d4dfd169377793c276221059a6@eucas1p2.samsung.com>
	<20260829101509.138284-1-paul@crapouillou.net>
	<6e319291-72b8-4a43-b953-8a9f0a6049c8@samsung.com>
	<1666390417d0d9b8f58a7bdad1b8ecb475ba0d4f.camel@crapouillou.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_011653_724888_108124C5 
X-CRM114-Status: GOOD (  16.99  )
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

On 03.09.2026 15:29, Paul Cercueil wrote:
> Le mercredi 02 septembre 2026 à 10:36 +0200, Marek Szyprowski a écrit :
>> On 29.08.2026 12:15, Paul Cercueil wrote:
>>> The BCM4330 is connected using CTS/RTS too, so add the 'uart-has-
>>> rtscts'
>>> property.
>>>
>>> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>> Indeed the CTS/RTS pins are used for BT on most of the ARM Exynos
>> boards,
>> as the "<&uartX_fctl>" property is assigned for pinctl-0. This is not
>> really
>> specific to i9100, so maybe this property should be added to other
>> dts?
> I can add it to all exynos4 boards that use the "uartX_fctl" property.
>
>
>> However I wonder if Samsung UART driver actually use this "uart-has-
>> rtscts"
>> DT property? A quick "git grep uart-has-rtscts drivers/tty" shows
>> nothing
>> related to Samsung Exynos...
> It looks like it does not. I still think the DT property should be here
> but I won't fight over this.
I also don't have strong opinion on this issue. Krzysztof: do You see
any benefit from adding this "uart-has-rtscts" property, just to describe
precisely the actual hardware, even if it won't be used by any driver?

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


