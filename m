Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C996E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 11:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dw69isme+h5fN9LUsDV0LpGiKs54emtiwSnh97sZlvo=; b=tkiYBpHzygBT2VTDxtng0gBXav
	EsUnAp7+/xz9E8f4G0VtYhVvCbjPZsngVa+J4aRfkTW6TTEGjf/99z8tNFyrggTEV55q7assWqUq9
	lLlU5B37Z1MxkpJGxtizkWhilKH+IxXNCrpXw8es6RL39voNlP8I9ecsUydRepmgRHY4t0fw6Mxw9
	AR99+pzWFIOXV2L4zNyf2Yr25EUyYaUL8IaNIAazILoTHoFSYCDgg/wn1dVecCNtkmLuFuShKD+r6
	984iSKnvozZOmhS2LgxJqs4eEwyMkOvCWGz+WOhzwmr3XRhYqLNe+DlgQoGcXznJmnXb2EGjRMUK7
	ncViR66A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPgYD-00000009tPX-0ubg;
	Mon, 23 Dec 2024 11:24:41 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPgQn-00000009sVF-1mF8;
	Mon, 23 Dec 2024 11:17:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1734952619;
	bh=laqXqjbXNVCN2aQXhhrcWZLKyRwelKrUGgDpruG3Mug=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IMYmZYDADmwJ+IUTzPIfuWh6evkdZFVcNVEAaygIH1+BXFhBoNjyt5VMvJK9a7kb4
	 LUx1bdJUN5J3Qm6steLrVxgFECnHFblqF0Ninx6V5QEODkBk1MWUEfEhszOeLCKQUD
	 IVUrEk+wJgfUGITaPWpnKOpGNG4qkxSTsjHNeUaUPiqQc9CHJNDABPKQWBn4ZZlU8G
	 pbLtGz9y8wZBVa7WRd1s6acHsIkM1ZojrMFwm/SG3xZ5t69TVFfflr+fv2Kp7yZjeb
	 JDSvPGQ+E5mNsC4XUopkuO2A3h+09QNAv7/unNFUH+cRTOW1tx4KN69SkBjsNzRGDy
	 6rQBhBLS1qOoQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 09D4517E362C;
	Mon, 23 Dec 2024 12:16:58 +0100 (CET)
Message-ID: <06377562-15f6-46c9-8a87-27cbfaa146b6@collabora.com>
Date: Mon, 23 Dec 2024 12:16:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: Set ethernet alias for mt8365-evk
To: Sjoerd Simons <sjoerd@collabora.com>, linux-mediatek@lists.infradead.org
Cc: kernel@collabora.com, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20241220095522.2026002-1-sjoerd@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241220095522.2026002-1-sjoerd@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_031701_647960_96AC1AA8 
X-CRM114-Status: GOOD (  13.30  )
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

Il 20/12/24 10:55, Sjoerd Simons ha scritto:
> Configure an the ethernet alias to match the ethernet controller (even
> if it's off by default). This allows e.g. u-boot to configure the mac
> address on boot properly
> 
> Signed-off-by: Sjoerd Simons <sjoerd@collabora.com>

Please update the commit title to read

arm64: dts: mediatek: mt8365-evk: Set ethernet alias

after which,
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Cheers,
Angelo

> ---
> 
>   arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> index 7d90112a7e27..44c61094c4d5 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> @@ -21,6 +21,7 @@ / {
>   
>   	aliases {
>   		serial0 = &uart0;
> +		ethernet = &ethernet;
>   	};
>   
>   	chosen {



