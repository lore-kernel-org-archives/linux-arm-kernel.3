Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F31D3D489A3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 13:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nkxj4CnhfibyYIaplRq8z8HcxuXlDBpkzGct6lz15Eg=; b=xG03tY1CTNXj1/
	NM21yArUj/FWLDgReOdVbch2UAyYpVN0MI8+PqSHA/OFVk4RaK4B95Nz7xAEWjBCPGY2pbATIBXka
	EPSrWrB4p9+EbwyIKFwQxfCjUpV+PPNwDAPzadedKos6aqRGCf8GMPYnefGx5VC/fr1J5gugPoPG9
	jaDokCKECd+4BqrlG4X7Jeup9/9ebH8KadmOVA/ly8SxbizzNr8q+jIHsEueN1Y2CstWsxaTaME5R
	h8iI9PEtEAu+IbW5agkWdju7dH1YcU0ay0G3AN8HvaOpFtlu9EBYzjm6kTuevQLG3D2HPpgHmCg75
	Omov2M/diq+yH3udrglQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgk2b-0000000ECb1-0l1B;
	Fri, 16 Jan 2026 13:39:05 +0000
Received: from mout.gmx.net ([212.227.15.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgk2Y-0000000ECa6-1o4A;
	Fri, 16 Jan 2026 13:39:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1768570725; x=1769175525; i=frank-w@public-files.de;
	bh=nkxj4CnhfibyYIaplRq8z8HcxuXlDBpkzGct6lz15Eg=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Reply-To:Subject:
	 To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=WKZ3eRka21miv4+FoPlXLrnVxlj7IZ8WsQwcMXH/2X6BvRUQPwqMIEGaZs/9eu5e
	 hk6WkfQyxD2DuuaZ6W5YQ4llHtAh+9cnwyJ/SEf0v/mg7LDvZvK8zhts3TvDy+Iwx
	 +gYp/qAGRmm8DzXGZvZu+rvHN2GBNHI6/2rspPJ1Yy0Ty0O80unm3z3hKLqNNj0Rm
	 INMicBUKwLgpulxEoKO4BdhFXtZghSs/FBP1SxxPch2fmUGtG7W7BuC5jO6Ej4GRX
	 r/VrKSEFvYZbHxbgDcLYQuDDuZ4OjmnOtE4UlV9pKsxEIKGXs2zGGrYWhjJ0x7mWJ
	 0kO+aT4J8pmBr3OfrQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.21] ([80.245.79.4]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mof9P-1w9gvk1V5F-00in95; Fri, 16
 Jan 2026 14:38:45 +0100
Message-ID: <1665fa1f-67da-4688-89db-d864b5bb0509@public-files.de>
Date: Fri, 16 Jan 2026 14:38:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt7988a-bpi-r4pro: fix model string
To: Frank Wunderlich <linux@fw-web.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20251215074609.4100-1-linux@fw-web.de>
Content-Language: en-US
From: Frank Wunderlich <frank-w@public-files.de>
In-Reply-To: <20251215074609.4100-1-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:diTDF+fdPJ8g2eQfP9/aS4XjFntW/VDmKb7YPaU06ywmi9yMjtA
 Lh18+lF0rfQFK5HY+45hjHkjbq8P9gGyhOHe/KYlTyN+mzBMhRE8piBnaKIapd3dCSDaYBy
 GNMWTK+dhyqoOxibw/FxGRyGe2Y73ZFvGVdicpzeG1snBtJo099mIlLMTIbkBrf3W+6URXL
 kNoKkv73yIJNuvEo9u4Jg==
UI-OutboundReport: notjunk:1;M01:P0:+c25jWzXG8A=;+BZykk5bSNPATxq/0BDAQ+6c1YM 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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_053902_820077_527EA642 
X-CRM114-Status: GOOD (  13.33  )
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
Reply-To: frank-w@public-files.de
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,

just a gentle ping

regards Frank

Am 15.12.25 um 08:46 schrieb Frank Wunderlich:
> From: Frank Wunderlich <frank-w@public-files.de>
>
> Fix incorrect model string in Devicetree for BPI-R4-Pro.
>
> Fixes: f397471a6a8c ("arm64: dts: mediatek: mt7988: Add devicetree for B=
ananaPi R4 Pro")
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-4e.dts | 2 +-
>   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dts | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-4e=
.dts b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-4e.dts
> index c7ea6e88c4f4..621d01e3cd89 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-4e.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-4e.dts
> @@ -9,7 +9,7 @@
>   #include "mt7988a-bananapi-bpi-r4-pro.dtsi"
>  =20
>   / {
> -	model =3D "Bananapi BPI-R4";
> +	model =3D "Bananapi BPI-R4 Pro 4E";
>   	compatible =3D "bananapi,bpi-r4-pro-4e",
>   		     "bananapi,bpi-r4-pro",
>   		     "mediatek,mt7988a";
> diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x=
.dts b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dts
> index c9a0e69e9dd5..bb15bfa5e6ae 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dts
> @@ -9,7 +9,7 @@
>   #include "mt7988a-bananapi-bpi-r4-pro.dtsi"
>  =20
>   / {
> -	model =3D "Bananapi BPI-R4";
> +	model =3D "Bananapi BPI-R4 Pro 8X";
>   	compatible =3D "bananapi,bpi-r4-pro-8x",
>   		     "bananapi,bpi-r4-pro",
>   		     "mediatek,mt7988a";


