Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A8DBC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 09:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Subject:To:MIME-Version:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aSekE6dvDeDQvelifwwcLmL8oUBRYHW/qRvmMWTd8K4=; b=pfSq71ttDfkLwRvx7Rb4BIkTao
	mG9S25MteWv0grtQ1BvSpnmcmlSZFIZHrumKEX2gtAoyHqLR63VVEwdGq3FXQOZR6vYbVvVEUBBL+
	YQgnasAU+wXRoic5I1vtOwSeT+/NppAetxCxoTgT74cyK++dEVXPhBGzPhRTD0FCI9HrbMwu6XlIN
	1d75eFCsru3z93KzzQUqrPFjv8ZzxeSfCAjftAnqNVvYp8yXroFenn9TDvtQnbcSA0Bvu/3a5B9xO
	193ATO13zT5Cw9B8oZ7uxqf1qA6/+538zTYkvFoeI5s/ckZmuwmAx9rgjAt7W2jY8yjfK+XGBXQpv
	o2aGahtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh1rw-0000000Eb31-0SWa;
	Tue, 07 Jul 2026 09:13:32 +0000
Received: from canpmsgout06.his.huawei.com ([113.46.200.221])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh1rt-0000000Eb1v-3fhm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 09:13:31 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=aSekE6dvDeDQvelifwwcLmL8oUBRYHW/qRvmMWTd8K4=;
	b=CetOCQdFLf5hS4eNAV/98ZiKXKBd981ByPNc+SE0+7EnCqcIoMxOCf+ylYODrZsr3R99Z1g4d
	kElsizsa7U4jMmAbcNN0jgCHoSp5JaUzW2lxSxoqqXllw4GggXlO3G8Y/J0+lLYqQSoITA/WkYH
	UqYQ3jb3MWaf7YU5KG4ex0g=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4gvZzH2CTBzRhRF;
	Tue,  7 Jul 2026 17:04:11 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 6CCA440561;
	Tue,  7 Jul 2026 17:13:23 +0800 (CST)
Received: from kwepemq100003.china.huawei.com (7.202.195.72) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 7 Jul 2026 17:13:23 +0800
Received: from [10.67.113.213] (10.67.113.213) by
 kwepemq100003.china.huawei.com (7.202.195.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 7 Jul 2026 17:13:22 +0800
Message-ID: <6A4CC332.3000906@hisilicon.com>
Date: Tue, 7 Jul 2026 17:13:22 +0800
From: Wei Xu <xuwei5@hisilicon.com>
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<xuwei5@hisilicon.com>
Subject: Re: [PATCH] arm64: dts: hisilicon: Correct indentation
References: <20260706093500.273922-2-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260706093500.273922-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.113.213]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemq100003.china.huawei.com (7.202.195.72)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_021330_090131_78C12D02 
X-CRM114-Status: GOOD (  10.08  )
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

Hi Krzysztof,

On 2026/7/6 17:35, Krzysztof Kozlowski wrote:
> Correct spaces or mix of tabs+spaces into proper tab-indented lines.
> No functional impact (same DTB).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/hisilicon/hip05.dtsi | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/hisilicon/hip05.dtsi b/arch/arm64/boot/dts/hisilicon/hip05.dtsi
> index d0912ca5f237..2d376b3d30dd 100644
> --- a/arch/arm64/boot/dts/hisilicon/hip05.dtsi
> +++ b/arch/arm64/boot/dts/hisilicon/hip05.dtsi
> @@ -236,13 +236,13 @@ cluster3_l2: l2-cache3 {
>  
>  	gic: interrupt-controller@8d000000 {
>  		compatible = "arm,gic-v3";
> -                #interrupt-cells = <3>;
> -                #address-cells = <2>;
> -                #size-cells = <2>;
> -                ranges;
> -                interrupt-controller;
> -                #redistributor-regions = <1>;
> -                redistributor-stride = <0x0 0x30000>;
> +		#interrupt-cells = <3>;
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +		interrupt-controller;
> +		#redistributor-regions = <1>;
> +		redistributor-stride = <0x0 0x30000>;
>  		reg = <0x0 0x8d000000 0 0x10000>,	/* GICD */
>  		      <0x0 0x8d100000 0 0x300000>,	/* GICR */
>  		      <0x0 0xfe000000 0 0x10000>,	/* GICC */
> 

Applied to the HiSilicon arm64 dt tree.
Thanks!

Best Regards,
Wei

