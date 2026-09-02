Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 972C4C61DFD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 08:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sh2rMx7cK5+XuDK7V8W5ht1k2uQ0fYdr83rbG25d8TQ=; b=VowgT0GbOiKkUH6G2AEuCCk/Y6
	FV2mXAlw2Lw2qvPH8OpujQEu98j35gaorS/hPaJ90bvxVN+ANewiCYl0Fm1xxsgE4v6jD3J6pXDOV
	ygth9pMgzyPkaHDNaZQluMihLUKC1hwqCDTsksuQ2AC96QCKMMJmVYSZ7IPLJWzMEc4ziTLyadaWP
	Q3K17dut+v/D8RvCBIeaaWVF3Wg8C6mldW9L33BrdM+oaC+UAo+bEMo3RgjfbKTpYoQvmUTAAt9nL
	sfuVi8VP7O32l48cnd8QoJP6/VUvSc/situPqwwG9l/PZaEQ1Eo1BGQ76UybdMea7r9Uz6C0Exabl
	A124NXIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1gSi-0000000E7CI-0R6g;
	Wed, 02 Sep 2026 08:36:52 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1gSe-0000000E7Bm-0gqJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 08:36:50 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260902083644euoutp01e5264018b502c4bd66fdf0ffbe52b412~RdB81p24n0793207932euoutp01e
	for <linux-arm-kernel@lists.infradead.org>; Wed,  2 Sep 2026 08:36:44 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260902083644euoutp01e5264018b502c4bd66fdf0ffbe52b412~RdB81p24n0793207932euoutp01e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1788338204;
	bh=Sh2rMx7cK5+XuDK7V8W5ht1k2uQ0fYdr83rbG25d8TQ=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=LgPDbMm9Pidk3GVqcL7oJwvugm3ixmfXh5yFyggtxj0I3XKHQ9s8PAB5lx7axrgpQ
	 tuNdWUK2BIrWhZCqzlu2DHoXkV1O90sAPfeJLlUiyMOwPI+N6+f+qEVYWv0hXUreLW
	 18b6qBMfQn+MHwM0cJJtlYZePteZQacFlT2hS0Qg=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260902083644eucas1p1fce4b2ee4029aef393c1ca7093a59136~RdB8rV5xn0650106501eucas1p1R;
	Wed,  2 Sep 2026 08:36:44 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260902083643eusmtip1a34544f9adf254c73b7d8f7d986b9998~RdB8DyUy50891008910eusmtip1s;
	Wed,  2 Sep 2026 08:36:43 +0000 (GMT)
Message-ID: <6e319291-72b8-4a43-b953-8a9f0a6049c8@samsung.com>
Date: Wed, 2 Sep 2026 10:36:43 +0200
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
In-Reply-To: <20260829101509.138284-1-paul@crapouillou.net>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260902083644eucas1p1fce4b2ee4029aef393c1ca7093a59136
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260829101532eucas1p29f4e04d4dfd169377793c276221059a6
X-EPHeader: CA
X-CMS-RootMailID: 20260829101532eucas1p29f4e04d4dfd169377793c276221059a6
References: <CGME20260829101532eucas1p29f4e04d4dfd169377793c276221059a6@eucas1p2.samsung.com>
	<20260829101509.138284-1-paul@crapouillou.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_013648_805101_AB516866 
X-CRM114-Status: GOOD (  20.84  )
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

On 29.08.2026 12:15, Paul Cercueil wrote:
> The BCM4330 is connected using CTS/RTS too, so add the 'uart-has-rtscts'
> property.
>
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>


Indeed the CTS/RTS pins are used for BT on most of the ARM Exynos boards,
as the "<&uartX_fctl>" property is assigned for pinctl-0. This is not really
specific to i9100, so maybe this property should be added to other dts?


However I wonder if Samsung UART driver actually use this "uart-has-rtscts"
DT property? A quick "git grep uart-has-rtscts drivers/tty" shows nothing
related to Samsung Exynos...


> ---
>
> Notes:
>     Changes:
>     
>     V1 was: "ARM: dts: samsung: exynos4210-i9100: Fix Bluetooth node"
>     
>     -v2: Drop max-speed property. It's only supposed to be used in some
>          cases, which don't apply here. As this was the "fix" for getting
>          Bluetooth to work on my device, which will be applied to the
>          driver instead, the Fixes: tag was removed.
>
>  arch/arm/boot/dts/samsung/exynos4210-i9100.dts | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/boot/dts/samsung/exynos4210-i9100.dts b/arch/arm/boot/dts/samsung/exynos4210-i9100.dts
> index 8a635bee59fa..95964be7daa8 100644
> --- a/arch/arm/boot/dts/samsung/exynos4210-i9100.dts
> +++ b/arch/arm/boot/dts/samsung/exynos4210-i9100.dts
> @@ -875,6 +875,7 @@ &serial_0 {
>  	status = "okay";
>  
>  	pinctrl-names = "default";
> +	uart-has-rtscts;
>  	pinctrl-0 = <&bt_en>, <&bt_res>, <&uart0_data>, <&uart0_fctl>;
>  
>  	bluetooth {

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


