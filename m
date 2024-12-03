Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1ADAD7833F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 09:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2mCf9wjgBsBu0qFgVacALYgb1LInVYDGOxSA0g2Mioc=; b=1QWdVCeb9VqSmHxxhriF0nNwD4
	CnXLr+WWSvRQfqea5FT/6IKoZBBRz283dnmEXPfSOn/2xekryIsUAhEhNRWa8EytmWhnhA13j8VBs
	/i0e06boJfe4Gtfk8BSs3r7aHxphxCYzJHxp7fmOhVja4O7z1l5iEZadx4hacve0ipCbQPMZlzDWW
	UtV/6CNbrzDUqvZu2QCquuE8ll0jz0eQOECuT3i67zVpcS5uLBPUIvuTFlRMu9vsgbqOoxUkdouaG
	f2wPb4tRBKPG9Oe+V40S/0xN/Xn911NMtTuXJxBLF7grrkCgVvwjo4aqxPAZDlqGHz8kLXKw6gFUA
	VWNSTWhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIPVK-00000008xfM-0lJe;
	Tue, 03 Dec 2024 09:47:38 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIPOb-00000008vxb-1WG5;
	Tue, 03 Dec 2024 09:40:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733218840;
	bh=D0B58GzI5QB13wGSjR1c1mA64LQkYZUYsyzm+is20bU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gvQfEjCUIjD4obQXutdbugoSXBHO0hMk0J1IGshlcbGz1nwg1vNRQwJqpVzYiuk48
	 K6OxQ5OqoLPJcIkmAI1D99cchvCkgAJ69IKGgkNDbt4uc9QFgN2tHwhVlOZ0Lj3VPP
	 PjPnU/l1HJF2MdCqMQfmVtBNN6RjkH7ZoFNx2nBz9Cw1CHMh2rkBTYmoFJHTWs+qU2
	 Aoc4Vgvqn8V/8lVtTFpbTeapbWE/UWTcne5gH5ohFkQMUPwj4yy97Bv979twiG+WvB
	 pqE5GOGIdKTO2FNRAfwX86JNR0S32OlQKpSPaJy1Fb+AH6+nXD9wdcvOCkMi0UqN++
	 9IW5uWjIMru7Q==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A3EEE17E35F0;
	Tue,  3 Dec 2024 10:40:39 +0100 (CET)
Message-ID: <d4ccb1fd-29a8-474d-9fb8-1cdc327b83c2@collabora.com>
Date: Tue, 3 Dec 2024 10:40:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/18] arm64: dts: mediatek: mt7988: add chosen node on
 bpi-r4
To: Frank Wunderlich <linux@fw-web.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Frank Wunderlich <frank-w@public-files.de>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20241202122602.30734-1-linux@fw-web.de>
 <20241202122602.30734-12-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241202122602.30734-12-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_014041_544077_8B4BFB47 
X-CRM114-Status: GOOD (  12.28  )
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

Il 02/12/24 13:25, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 

arm64: dts: mediatek: mt7988a-bpi-r4: Add default bootargs and UART stdout

> Add chosen node on Bananapi R4 board with stdout and default bootargs.

> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts
> index 9037f35857a9..1c2a806f6f6c 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts
> @@ -9,6 +9,11 @@ / {
>   	model = "Banana Pi BPI-R4";
>   	chassis-type = "embedded";
>   
> +	chosen {
> +		stdout-path = &serial0;
> +		bootargs = "console=ttyS0,115200n1";
> +	};
> +
>   	reg_1p8v: regulator-1p8v {
>   		compatible = "regulator-fixed";
>   		regulator-name = "fixed-1.8V";



