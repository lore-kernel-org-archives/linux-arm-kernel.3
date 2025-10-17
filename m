Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BDD0CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 06:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pmOERI3SUEXraCgPIeHw+QXcfM6eSSu/gHX94UGDCzg=; b=hiIXSIlAhp+5eeofEVoNpT1366
	6n9xl5ABpif/EtfvDCyCTo+UvsTMlfLBJ36ASJiSrbbRPYIa72j3Q2sx4skyZ+F6758GWlVoubZFD
	zsAhbBN5sZrQnLsFR8EMD9+qoniwSMbkapsdrXqnSD1XTMF+yfATBXuqRgRhMcvQMc7kE+K9WXv1/
	QnbTDFlOSi14jRFVerEkvMivZGAO9Q6v+/iB2URmWT+qrlB94bf6fkj5tOAuXShWHrdja6Q+YRvNn
	kAi99g1d/55ce2R9k5LZ+UuBoRrjBhMNpx8MpSQaigesjz7RQVJ5s1M479jbpCSLoUvYBR/ZFrptD
	IJpg9YZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9eBa-00000006p7v-2EHF;
	Fri, 17 Oct 2025 06:43:34 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9eBW-00000006p7X-3qd3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 06:43:33 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20251017064327euoutp0151f3dbaea441ec2fc368d1601e037d79~vNDsHY3Y63236332363euoutp01T
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Oct 2025 06:43:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20251017064327euoutp0151f3dbaea441ec2fc368d1601e037d79~vNDsHY3Y63236332363euoutp01T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1760683407;
	bh=pmOERI3SUEXraCgPIeHw+QXcfM6eSSu/gHX94UGDCzg=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=WokAg896tCCv63IRBiccsVar42fKcVYzFnOA+JFwG5K7FKWRIYNZZQonCiKxs0uq6
	 Q3HXOXddKG6MYJL9GkAUI+7PeTOk69m0xIFW1kjpd1kLduazEoiyVrEwE+7VhyrFrQ
	 iUy4xUJnQ63u9uz54QPWZkDuZ/oHClyNGxJIUWFU=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20251017064327eucas1p29f30c1de202c52dc09548aa9fc6f54b7~vNDrsbPeZ1312513125eucas1p2d;
	Fri, 17 Oct 2025 06:43:27 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20251017064324eusmtip201695dfb1cec04fbd125e4f2c643fd35~vNDpvJ8tS0730207302eusmtip2G;
	Fri, 17 Oct 2025 06:43:24 +0000 (GMT)
Message-ID: <1731abfc-c7e4-4ff0-a1b3-7d86c8025866@samsung.com>
Date: Fri, 17 Oct 2025 08:43:24 +0200
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v3 00/10] pmdomain: samsung: add supoort for Google
 GS101
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, Krzysztof
	Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Rob
	Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Krzysztof
	Kozlowski <krzk+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus
	<tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>,
	kernel-team@android.com, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	stable@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20251016-gs101-pd-v3-0-7b30797396e7@linaro.org>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251017064327eucas1p29f30c1de202c52dc09548aa9fc6f54b7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20251016155848eucas1p193debe70e38b1694bfb250d748f4aa14
X-EPHeader: CA
X-CMS-RootMailID: 20251016155848eucas1p193debe70e38b1694bfb250d748f4aa14
References: <CGME20251016155848eucas1p193debe70e38b1694bfb250d748f4aa14@eucas1p1.samsung.com>
	<20251016-gs101-pd-v3-0-7b30797396e7@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_234331_572413_DF06DF59 
X-CRM114-Status: GOOD (  20.01  )
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

On 16.10.2025 17:58, André Draszik wrote:
> This series adds support for the power domains on Google GS101. It's
> fairly similar to SoCs already supported by this driver, except that
> register acces does not work via plain ioremap() / readl() / writel().
> Instead, the regmap created by the PMU driver must be used (which uses
> Arm SMCC calls under the hood).
>
> The DT update to add the new required properties on gs101 will be
> posted separately.
>
> Signed-off-by: André Draszik <andre.draszik@linaro.org>

Works fine on existing Exynos based boards.

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

> ---
> Changes in v3:
> - use additionalProperties, not unevaluatedProperties in patch 2
> - fix path in $id in patch 2 (Rob)
> - drop comment around 'select' in patch 2 (Rob)
> - collect tags
> - Link to v2: https://lore.kernel.org/r/20251009-gs101-pd-v2-0-3f4a6db2af39@linaro.org
>
> Changes in v2:
> - Krzysztof:
>    - move google,gs101-pmu binding into separate file
>    - mark devm_kstrdup_const() patch as fix
>    - use bool for need_early_sync_state
>    - merge patches 8 and 10 from v1 series into one patch
> - collect tags
> - Link to v1: https://lore.kernel.org/r/20251006-gs101-pd-v1-0-f0cb0c01ea7b@linaro.org
>
> ---
> André Draszik (10):
>        dt-bindings: power: samsung: add google,gs101-pd
>        dt-bindings: soc: samsung: exynos-pmu: move gs101-pmu into separate binding
>        dt-bindings: soc: samsung: gs101-pmu: allow power domains as children
>        pmdomain: samsung: plug potential memleak during probe
>        pmdomain: samsung: convert to using regmap
>        pmdomain: samsung: convert to regmap_read_poll_timeout()
>        pmdomain: samsung: don't hardcode offset for registers to 0 and 4
>        pmdomain: samsung: selectively handle enforced sync_state
>        pmdomain: samsung: add support for google,gs101-pd
>        pmdomain: samsung: use dev_err() instead of pr_err()
>
>   .../devicetree/bindings/power/pd-samsung.yaml      |   1 +
>   .../bindings/soc/google/google,gs101-pmu.yaml      | 106 +++++++++++++++++
>   .../bindings/soc/samsung/exynos-pmu.yaml           |  20 ----
>   MAINTAINERS                                        |   1 +
>   drivers/pmdomain/samsung/exynos-pm-domains.c       | 126 +++++++++++++++------
>   5 files changed, 200 insertions(+), 54 deletions(-)
> ---
> base-commit: 58e817956925fdc12c61f1cb86915b82ae1603c1
> change-id: 20251001-gs101-pd-d4dc97d70a84

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


