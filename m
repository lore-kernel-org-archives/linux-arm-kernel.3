Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B08EC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 13:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kkk/FgdftM2MhGRlmFyqTkvBZSFZ3iHMrGj8aazN+qc=; b=dsa1uZDS0Ovs7R10f6oNR2e/lQ
	HHUTcswDozjk3Oj9VwZpDQPhSt+sFsO7wRH1lgAwyPggDlcb6KLtw9z6aUKsWBFeYBt+Yo6mnj+i4
	Ft10ERy5dg/oqG2cag30geechufBOvCPOm2C01QSLvCPm9Rc9TLMdadtVQCdwwozFc92xqz0q17WN
	myZHdFOajD1Hun0sh2v9PuEix89aezSyPBVtUYkPW0Mx4JV5bKyXm4lYTKwY9D/qzTOrD5BQjcKzV
	iG0bArr3/wgyYPGt4GR7aWvt5UcYspN0gr7g7mD1p4931EVmuo7fkcU2fqKKCuw+EVn5sjIZaRQcY
	eHsgE0fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmuit-0000000HJsW-1ry3;
	Tue, 25 Feb 2025 13:11:43 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmuPb-0000000HGGU-1qnB;
	Tue, 25 Feb 2025 12:51:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1740487905;
	bh=qAdn74AM2lDhY895TRkOgxqgadKZ6yY5aB9zQuiKRWk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=N3fqnP1A91Pwh/37qfY91FmNkzrXy1pFCEdedry+ney7WVFo04hjr6aWUaGs3qnue
	 Ozh+Z3hBpBUMxwnyDIiFI1qkr07tovoRo7FLKtW75no3QTXg9GAzUdHk2XjDMxlNdh
	 nmTXT4uYlTp8VwYOWfRMbpHo1bfRpp4kSJVeHghKwgnlMYTfDX1CySUI5zoZoXsg7B
	 qqKnQSyYB8FsxyZJhWYKed9/8XJS2tmRfAzaSH5Th8xUj7rKyyaky2mULAivfbCmod
	 BPJTiiViwNyF0b2xIHQwTqrqYmXs3gKvG/5930W2YNttnTg7vgfyDRE0yqbFix+k3W
	 sm8GqTcEZnZqg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CE45717E09E7;
	Tue, 25 Feb 2025 13:51:44 +0100 (CET)
Message-ID: <ec6c3ade-cb08-46cf-b8e0-bcc64d3f7d78@collabora.com>
Date: Tue, 25 Feb 2025 13:51:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: airoha: en7581: Enable spi controller for
 EN7581 evaluation board
To: Lorenzo Bianconi <lorenzo@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org
References: <20250225-en7581-snfi-probe-fix-v1-1-77e4769574e4@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250225-en7581-snfi-probe-fix-v1-1-77e4769574e4@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_045147_631828_1EFD3290 
X-CRM114-Status: GOOD (  13.68  )
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

Il 25/02/25 13:47, Lorenzo Bianconi ha scritto:
> Enable spi controller used for snand memory device for EN7581 SoC
> evaluation board.
> 

Please clarify the commit title:

arm64: dts: airoha: en7581: Enable spi nand controller for EN7581 EVB

After which...
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Cheers,
Angelo

> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>   arch/arm64/boot/dts/airoha/en7581-evb.dts | 4 ++++
>   arch/arm64/boot/dts/airoha/en7581.dtsi    | 2 +-
>   2 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/airoha/en7581-evb.dts b/arch/arm64/boot/dts/airoha/en7581-evb.dts
> index d53b72d18242e3cee8b37c7b1b719d662fd6db8d..cc69f698c27b804953b1bb671e128d4401744bf5 100644
> --- a/arch/arm64/boot/dts/airoha/en7581-evb.dts
> +++ b/arch/arm64/boot/dts/airoha/en7581-evb.dts
> @@ -25,6 +25,10 @@ memory@80000000 {
>   	};
>   };
>   
> +&snfi {
> +	status = "okay";
> +};
> +
>   &spi_nand {
>   	partitions {
>   		compatible = "fixed-partitions";
> diff --git a/arch/arm64/boot/dts/airoha/en7581.dtsi b/arch/arm64/boot/dts/airoha/en7581.dtsi
> index 26b13694091735da7af977e42f8f546d7d5cb078..49c061d38d7860b3b416610723791a7a91edcb69 100644
> --- a/arch/arm64/boot/dts/airoha/en7581.dtsi
> +++ b/arch/arm64/boot/dts/airoha/en7581.dtsi
> @@ -150,7 +150,7 @@ gic: interrupt-controller@9000000 {
>   			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
>   		};
>   
> -		spi@1fa10000 {
> +		snfi: spi@1fa10000 {
>   			compatible = "airoha,en7581-snand";
>   			reg = <0x0 0x1fa10000 0x0 0x140>,
>   			      <0x0 0x1fa11000 0x0 0x160>;
> 
> ---
> base-commit: 0092294492fafe79a537915e486576a3d69c9a7c
> change-id: 20250225-en7581-snfi-probe-fix-c325bedded9e
> 
> Best regards,



