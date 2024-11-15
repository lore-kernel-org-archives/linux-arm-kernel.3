Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF101D68BCD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 17:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iuhpSOo3poiqDeYhSIliF4mUNwdgl04K/87vHJizz58=; b=AyUmUZzal5JqDS1RybhrV2dWMR
	Q8WtbAAG4sn4dUMKjCCSJgefDGBbwqtjkh1FL9qR2toX0J8bvNBBZZWiXznFl/P12vijOUgBoP2Ik
	w4SzNd+kviNNRX7ylojg/eTk31rVw3IZVIn3sbKztxccbnQOFmLGHhjlyCYDlpcuA9wiShstekEc3
	s0vk9JsQ8vygnWEvvo/5ZK9Snhw9quRYcypef+DDRIFUNo+QVnd+Wy3bGENdHoRezkmp28pDoJAHe
	/LaLdQc1WTeUj9+Gk1dUlRY8k1wiGAgrNZV4xAMY8R+2ktOBRL+V0iYlxIMCGt9f7s3WMPiTUQwYU
	ja40d9aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBzgV-00000003SzM-0Ljy;
	Fri, 15 Nov 2024 17:00:39 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tByYc-00000003Ec6-0xfx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 15:48:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3E7E3A42A42;
	Fri, 15 Nov 2024 15:46:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F09EC4CECF;
	Fri, 15 Nov 2024 15:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731685704;
	bh=yJBJacWoFtin2ILARdZFHntD7M8KX+J8rKrtFyI7gig=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bNCC9KXeCYEyFjc1jOpURFLAlq4jzhYz1v84iBROiCAJFSkPWBZHaVYTTFrrhxLUN
	 D6S1uoFV8e2hHDOITGx6Ca9yG6YiiJBpnmfSxO3AGLZ+vfzKB5m/0+W6nLS5ayuUQ4
	 MfQ5iraMHd57W27D7IEDSaOT98UzHE28GGPTLRDjCm1zdw7kkXCb+B+3/JuvzPVLjN
	 xQmimdJoUkqjYnz0lI5Tt7bBefRp59Cz5JXXa+/ohxVU68D8ysHoFVNc+dMuFesbqL
	 IOnBXOsVGSpUgHKIBgEKMyem9fIVvqRI0RPqPSv7vLEsNTkAFK4+zfdQqY2Pq4kJBb
	 iO2TaemFUCVog==
Date: Fri, 15 Nov 2024 09:48:22 -0600
From: Rob Herring <robh@kernel.org>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: nm@ti.com, vigneshr@ti.com, kristo@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	srk@ti.com
Subject: Re: [PATCH 1/2] arm64: dts: ti: k3-pinctrl: Introduce deep sleep
 macros
Message-ID: <20241115154822.GA2954187-robh@kernel.org>
References: <20241112115650.988943-1-s-vadapalli@ti.com>
 <20241112115650.988943-2-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112115650.988943-2-s-vadapalli@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_074826_332471_DA06A185 
X-CRM114-Status: GOOD (  14.74  )
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

On Tue, Nov 12, 2024 at 05:26:49PM +0530, Siddharth Vadapalli wrote:
> The behavior of pins in deep sleep mode can be configured by programming
> the corresponding bits in the respective Pad Configuration register. Add
> macros to support this.
> 
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> ---
>  arch/arm64/boot/dts/ti/k3-pinctrl.h | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-pinctrl.h b/arch/arm64/boot/dts/ti/k3-pinctrl.h
> index 22b8d73cfd32..cac7cccc1112 100644
> --- a/arch/arm64/boot/dts/ti/k3-pinctrl.h
> +++ b/arch/arm64/boot/dts/ti/k3-pinctrl.h
> @@ -12,6 +12,12 @@
>  #define PULLTYPESEL_SHIFT	(17)
>  #define RXACTIVE_SHIFT		(18)
>  #define DEBOUNCE_SHIFT		(11)
> +#define FORCE_DS_EN_SHIFT	(15)
> +#define DS_EN_SHIFT		(24)
> +#define DS_OUT_DIS_SHIFT	(25)
> +#define DS_OUT_VAL_SHIFT	(26)
> +#define DS_PULLUD_EN_SHIFT	(27)
> +#define DS_PULLTYPE_SEL_SHIFT	(28)
>  
>  #define PULL_DISABLE		(1 << PULLUDEN_SHIFT)
>  #define PULL_ENABLE		(0 << PULLUDEN_SHIFT)
> @@ -38,6 +44,19 @@
>  #define PIN_DEBOUNCE_CONF5	(5 << DEBOUNCE_SHIFT)
>  #define PIN_DEBOUNCE_CONF6	(6 << DEBOUNCE_SHIFT)
>  
> +#define PIN_DS_FORCE_DISABLE		(0 << FORCE_DS_EN_SHIFT)
> +#define PIN_DS_FORCE_ENABLE		(1 << FORCE_DS_EN_SHIFT)
> +#define PIN_DS_IO_OVERRIDE_DISABLE	(0 << DS_IO_OVERRIDE_EN_SHIFT)
> +#define PIN_DS_IO_OVERRIDE_ENABLE	(1 << DS_IO_OVERRIDE_EN_SHIFT)
> +#define PIN_DS_OUT_ENABLE		(0 << DS_OUT_DIS_SHIFT)
> +#define PIN_DS_OUT_DISABLE		(1 << DS_OUT_DIS_SHIFT)
> +#define PIN_DS_OUT_VALUE_ZERO		(0 << DS_OUT_VAL_SHIFT)
> +#define PIN_DS_OUT_VALUE_ONE		(1 << DS_OUT_VAL_SHIFT)
> +#define PIN_DS_PULLUD_ENABLE		(0 << DS_PULLUD_EN_SHIFT)
> +#define PIN_DS_PULLUD_DISABLE		(1 << DS_PULLUD_EN_SHIFT)
> +#define PIN_DS_PULL_DOWN		(0 << DS_PULLTYPE_SEL_SHIFT)
> +#define PIN_DS_PULL_UP			(1 << DS_PULLTYPE_SEL_SHIFT)

Are you going to go add the 0 defines to all the existing cases? If you 
do, it's a lot of pointless churn. If you don't, then it is inconsistent 
when they do get used. I would drop them all.

Rob

