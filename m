Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58A22D3B7EA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 11:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zyYqc6EVLqMdQdA4NqMFP5gkkbcjZzok7bdWE+/PYSs=; b=IGUqcDWqf1/2frIIb71FipIH5T
	NEMVPKEDisqpkeMne64hJG5j8jdHjqeXS8L7fG2Eb0xCe/qvuSQRNWZb7nK7msaqKutwb13X12qFH
	ee7sdXnrUgO3Tc7sSKhcwCfMhHQBtJkH0r/asIBQ1nh9pj4t7Pr/DcyWdnxJoMuW2XTpZaM9nVeMd
	Vg2KNuVufUJCmPuHkt2jDdzMcuyji/BWdJ+JN3Nni+FN18lKigNZePGrao9y5znchS4/Ts4JxMdRv
	y57Un9e2e8g9Oco0Cw3RAkRV2GcGf91pEL9tbWNL+kZnsAq+MB6eM8NUIEEoFu1ToKP11vrmnz8Oi
	LhkOGxWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSw6Y-0000000ECSu-2ATI;
	Tue, 09 Dec 2025 11:42:06 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSw6V-0000000ECSR-36gH;
	Tue, 09 Dec 2025 11:42:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1765280520;
	bh=ep5IfAaQVSnxSjOjbmiAB1Wa6uj/sQhIhJIlgN8V8lI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EH+4I56C5F+j5hNVNyetkQm8BeAOytmZozTHsF7ne2YFXLr0uJNmiD4+jEHHw1qFG
	 qHqj2ArpfQX/+nWqYqE+shroqNBtWk3Bq/8uX9uijOurEEcrpjypqE3V09tv+EcxWM
	 2B69DqrSP2c+xSJ75sr3EFpDrw+4JeYjjMdEoH+7Zeq10msGfue+KR/hb27saQsBOe
	 ngqvWD0qyJIUKSPapoQzqbzMJCRMqRXQznWVRcpaoWfhWIgOvM5G7hREAMAHHBJ3XH
	 QdwibqamzqFeCOvk+s/dqMkmwcfFTDijNn/rmUClHTJ+Yd3H6L+e7JsqwCUfpWNKMr
	 YE3fFQw3i6mqQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A7DC217E06C3;
	Tue,  9 Dec 2025 12:41:59 +0100 (CET)
Message-ID: <0d03ed27-418b-4564-bf8d-739b253b2213@collabora.com>
Date: Tue, 9 Dec 2025 12:41:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: Apply mt8395-radxa DT overlay at
 build time
To: Frank Wunderlich <linux@fw-web.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 Frank Wunderlich <frank-w@public-files.de>
References: <20251205215940.19287-1-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251205215940.19287-1-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_034203_949876_93DCFBA0 
X-CRM114-Status: GOOD (  16.60  )
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

Il 05/12/25 22:59, Frank Wunderlich ha scritto:
> From: "Rob Herring (Arm)" <robh@kernel.org>
> 
> It's a requirement that DT overlays be applied at build time in order to
> validate them as overlays are not validated on their own.
> 
> Add missing target for mt8395-radxa hd panel overlay.
> 
> Fixes: 4c8ff61199a7 ("arm64: dts: mediatek: mt8395-radxa-nio-12l: Add Radxa 8 HD panel")
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Acked-by: AngeloGioacchino Del Regno <angelogiaocchino.delregno@collabora.com>

> ---
> This will show a warning [1] in upcoming 6.19.
> 
> Note that if it is desired that the combined .dtb is not installed, then
> the combined .dtb should be added to 'dtb-' variable instead.
> ---
> extracted missing part from [2] with updated commit title/description
> after my bananapi series [3] to solve all warnings. Added Fixes-tag to
> make sure it lands in 6.19.
> 
> [1] https://lore.kernel.org/all/20251114222759.4181152-1-robh@kernel.org/
> [2] https://patchwork.kernel.org/project/linux-mediatek/patch/20251117211306.725678-1-robh@kernel.org/
> [3] https://patchwork.kernel.org/project/linux-mediatek/cover/20251119175124.48947-1-linux@fw-web.de/
> ---
>   arch/arm64/boot/dts/mediatek/Makefile | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
> index cac8f4c6d76f..3f76d9ce9879 100644
> --- a/arch/arm64/boot/dts/mediatek/Makefile
> +++ b/arch/arm64/boot/dts/mediatek/Makefile
> @@ -166,6 +166,8 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8390-grinn-genio-700-sbc.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8395-kontron-3-5-sbc-i1200.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8395-radxa-nio-12l.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8395-radxa-nio-12l-8-hd-panel.dtbo
> +mt8395-radxa-nio-12l-8-hd-panel-dtbs := mt8395-radxa-nio-12l.dtb mt8395-radxa-nio-12l-8-hd-panel.dtbo
> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt8395-radxa-nio-12l-8-hd-panel.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8516-pumpkin.dtb
>   
>   # Device tree overlays support


