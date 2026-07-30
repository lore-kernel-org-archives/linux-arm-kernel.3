Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E51D4C5516E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 19:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gXM2uHcZ0BT1egGODlahZ0/bg1Nmk6mpO/+jOkZRUvc=; b=lPrBkkWV6CF/W2C+Jo90m+XoS1
	n31niRt6b0wYTUmUQDZfFsbmfiGloFhTMx86BqPtQI8A+qkvxQCZoJEgLTzr9pm4eKmeK02nOHnAJ
	5oct4Qwn1cYowdv43w80111tTB82ot59olaKORebxITV1QjLahsfDHnnTBQxbegJTc9XBd16nxmDm
	zjO79/WbrvAlPy5Zcp704aMmKQH59E0pp5AMLwyLqPTITyCh+Fpu467Z2Xod/mF8kA2r4r91JkMUZ
	deTxYJQJlvSESrVE4uid0qqx9dD62jSLfpKk/iuxY5d5/Duv9lcq2pMGpTM6yYutR/wTaUJktri+x
	9qBgjHbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpWfT-0000000BGJ9-3LWO;
	Thu, 30 Jul 2026 19:43:47 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpWfQ-0000000BGIi-3rFe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 19:43:46 +0000
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 328BB41BB2;
	Thu, 30 Jul 2026 21:36:40 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g_CoqoGw_zcD; Thu, 30 Jul 2026 21:36:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1785440199; bh=gXM2uHcZ0BT1egGODlahZ0/bg1Nmk6mpO/+jOkZRUvc=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To;
	b=ZrqsjbP6oNBo2EBxfWyWs5H4giKy9svA+O8x+E7EMUNXlBo6K4IcN7qHwnU/fbejR
	 NZbObViE6bjWx/vPc7uzlUGGARmFxn9hHZDWbhKoPSBVRC0Go2nGFNlQJScG+nLAo2
	 t2v5Hg3ydTpR/iznzazl+0PscIaT2njJPkqkbh+spRWRjSwhZt8op029/H2mQKitNU
	 xOyjPnKZdCxdTfBxVW6KmQXbT5fmkLe9i10TzQAdbpQewro8WiYzHy76M2ZLVNJHU+
	 z5nOohZ5AltVf+AJyLRTTwLIZ/mQ4azNpAHZepguAIEVSbVgCCotiTPAmkhVyPbM9X
	 dtDVJwZZqoGPQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 31 Jul 2026 01:06:25 +0530
Message-Id: <DKC5Q1ZHLH2W.VZI09E6IC82D@disroot.org>
Cc: <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-samsung-soc@vger.kernel.org>
Subject: Re: [PATCH v2 2/3] iio: proximity: add driver for Sharp GP2AP070S
 proximity sensor
From: "Kaustabh Chakraborty" <kauschluss@disroot.org>
To: "Kaustabh Chakraborty" <kauschluss@disroot.org>, "Jonathan Cameron"
 <jic23@kernel.org>, "David Lechner" <dlechner@baylibre.com>,
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, "Andy Shevchenko"
 <andy@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Peter Griffin"
 <peter.griffin@linaro.org>, "Alim Akhtar" <alim.akhtar@samsung.com>
References: <20260731-gp2ap070s-v2-0-1bdfee07d5ea@disroot.org>
 <20260731-gp2ap070s-v2-2-1bdfee07d5ea@disroot.org>
In-Reply-To: <20260731-gp2ap070s-v2-2-1bdfee07d5ea@disroot.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_124345_092123_BACF52CF 
X-CRM114-Status: GOOD (  10.18  )
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

On 2026-07-31 01:01 +05:30, Kaustabh Chakraborty wrote:
> The GP2AP070S is a proximity sensor designed and manufactured by Sharp
> Corporation. This sensor is used in mobile devices, including, but not
> limited to - the Samsung Galaxy J6.
>
> The driver has been adopted from Samsung's downstream kernel
> implementation [1]. Due to the lack of public documentation about the
> schematics of this device. The downstream driver acts as the secondary
> source of information. Driver clarity has also been improved with the
> help of the GP2AP* drivers in iio/light.
>
> Link: https://github.com/Exynos7870/android_kernel_samsung_universal7870/=
blob/lineage-16.0/drivers/sensors/gp2ap070s.c [1]
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>

This is stale. I'm sending v3 right away.

