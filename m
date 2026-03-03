Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BA63EC0460
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 09:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IJNlv8R6cZKXjL4l+PbkPgdf1L56XfT5lWaXnTIbLbg=; b=yN7eLYiLHGE1WqVMBnaB4IOOnL
	mClsQqExNiIheZ1JOb2sDgRwhkKaeb/Mdql0+S+5xFBQw2JPb6VzTHcXKRC/uuKNBt71XddCd1o/u
	/2bksMjWBbR5q+2jC2gSATiadOMdcN5nq+hwH7tR98Uf3EggmsLgPztYNyxSgPEpofFRoyuA2ujOn
	/YMfPR+g/5lR0ACGJu+x6skxFxyPrn1YDKGrj1xJFzjNak5ZFeg0i7U5LkwPFIXUZsTl98cIteR2r
	77NYjGvhBqA1qrc15o6ywaOMMFVAbOa8zvsZmpgLr/gjB5VZ+K0C43/Rjrw7nK/IV0tmj4Oafk2qs
	sK+7pX8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxLeC-0000000EpsK-1oH0;
	Tue, 03 Mar 2026 09:02:32 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxLe6-0000000EpqD-22Jf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 09:02:31 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260303090219euoutp0153d4e710984271d6c0654fc7a37df1b7~ZSVDHwfNZ1841618416euoutp01i
	for <linux-arm-kernel@lists.infradead.org>; Tue,  3 Mar 2026 09:02:19 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260303090219euoutp0153d4e710984271d6c0654fc7a37df1b7~ZSVDHwfNZ1841618416euoutp01i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1772528539;
	bh=IJNlv8R6cZKXjL4l+PbkPgdf1L56XfT5lWaXnTIbLbg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=axM3jgiPiarTcnfNPfN00RCJmZPnJsMecJ+ZtsDwfEMzuXp/5QSgcarEoZMiOA5w/
	 2NYj2nteNHTYxJzp/ClSoCzs6eF4IxxhPBLRH5c8GeEOovXOHViSxe6U3eRxZlTEPQ
	 5+DBdOGL8bt27U+09haJ2YrzwocvTXVAP106F4HQ=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260303090219eucas1p1711b5b0f0e8ae56bc421ad8f6e5bf365~ZSVCoyKyt2751827518eucas1p1V;
	Tue,  3 Mar 2026 09:02:19 +0000 (GMT)
Received: from AMDC4515.digital.local (unknown [106.120.51.28]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260303090218eusmtip1b7cadd576d57e165c9f1292f8d94b5a8~ZSVB_eFnx1199911999eusmtip1c;
	Tue,  3 Mar 2026 09:02:18 +0000 (GMT)
From: Mateusz Majewski <m.majewski2@samsung.com>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Mateusz Majewski <m.majewski2@samsung.com>,
	linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Bartlomiej Zolnierkiewicz
	<bzolnier@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, "Rafael J.
 Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, Rob
	Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Alim Akhtar
	<alim.akhtar@samsung.com>, Sam Protsenko <semen.protsenko@linaro.org>, Anand
	Moon <linux.amoon@gmail.com>, Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v4 0/7] Add initial Exynos850 support to the thermal
 driver
Date: Tue,  3 Mar 2026 10:02:09 +0100
Message-ID: <20260303090211.673143-1-m.majewski2@samsung.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <DGIAUIFPUHN8.35B5MNEUK1JW5@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260303090219eucas1p1711b5b0f0e8ae56bc421ad8f6e5bf365
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260303090219eucas1p1711b5b0f0e8ae56bc421ad8f6e5bf365
X-EPHeader: CA
X-CMS-RootMailID: 20260303090219eucas1p1711b5b0f0e8ae56bc421ad8f6e5bf365
References: <CGME20260303090219eucas1p1711b5b0f0e8ae56bc421ad8f6e5bf365@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_010227_881548_5B838754 
X-CRM114-Status: GOOD (  19.64  )
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

Hello and sorry for missing your mail, thankfully Marek pointed it out
to me.

> I applied the whole series locally, it applies fine on 6.19 but I didn't
> check linux-next; and tested it on Exynos850 E850-96 board with the
> following DT node:
> 
> tmuctrl_0: tmu@10070000 {
>     compatible = "samsung,exynos850-tmu";
>     reg = <0x10070000 0x800>;
>     interrupts = <GIC_SPI 226 IRQ_TYPE_LEVEL_HIGH>;
>     clocks = <&cmu_peri CLK_GOUT_BUSIF_TMU_PCLK>;
>     clock-names = "tmu_apbif";
>     #thermal-sensor-cells = <0>;
> };
> 
> and thermal zones as you mentioned way back. It works just fine.
> Temp goes up to 48 C with a loaded CPUs and settles at 36-37C when idle.
> 
> So for the whole series:
> Tested-by: Alexey Klimov <alexey.klimov@linaro.org>

Thank you!

> However, do you have plans to update it or re-submit?
> Or any other plans working on it?

Honestly not sure. If any other patches are merged that conflict with
this series, I definitely can resolve the commits (for now it applies
just fine to next-20260227, though I haven't compiled the result yet).
Correct me if I am wrong, but I don't recall anything to be done in this
series otherwise. If there is interest in this series, I can retest this
on the other boards and re-submit this later this week.

Kind regards,
Mateusz Majewski

