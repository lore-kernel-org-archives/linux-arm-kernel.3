Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E28F1C79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 12:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pb+Cd5IgGea0eXdqyQvmcNckUrJaN5+ETzXKU1C6/Cw=; b=ruF5rFW/ZMp/fxIAEjqbQpDkfE
	zxa1vKySR+XKHYhTeX5llqJQPYJEXI0whzsKdVxEC7tFOaQxmczEHcoI4ucOC3YoYUVrwct43SKlv
	FpsBfRvYfBpkmP+Ke2DwGERGHE93LTLOle50faADK/yqSXN6DWVv1QceIf7rcERFjeXa65k1mC/xX
	jLXDF7HBQybuH5TeixGAQGpZkVeAppV+J4Mv1PYa7YJmyUfZhqGFz0u0MS8Y0QjEQVm9jLgUQM/sB
	rh//8asWKDYeuCGtlwT29S3TPK11oPbbuwb60mFX18wNbM2OkBK2ef/i0ONZr152tON01BMLJAeKn
	SsJTYxdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4H7D-0000000Be7K-218U;
	Wed, 09 Sep 2026 12:09:23 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4H7A-0000000Be6U-3Pke;
	Wed, 09 Sep 2026 12:09:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788955758;
	bh=16YZ5IC+HdCfW9Gv2q6DSRPBc4Oo6oiTFsl55l+7LW0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Dq/LWjKq9R7Sc7+ktwF2/dCAxf7uVwelpU4kJG7OWO8q/vs2qZE9yJsTGg3QG/A9D
	 iBcwmO17Jx7yt0fWIkI+mySR4HpnZT8xOpmNp22llHfXm8z8PcK2U6ZXPUEktcA4E+
	 Tv8uN+ELQCatigLdTx03hb3k8vipZiNKI6JlIxtg2FeWS4rG+hq6HPy++fspHDGK3v
	 WmC8bxF0SYlM3Xu1gAINU86Duj6xZIAocLqM8Votoavdn2KM7tG5q4gF1nTju/8LPq
	 GwZvAT1FqN5ilphJEQARtHCX/xyPhZaW2CtFmftDRmc/8FHPS9vaFrsS4aOBL4sKqN
	 oWY6U79N7Uzfg==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7D94917E0D02;
	Wed, 09 Sep 2026 14:09:18 +0200 (CEST)
Message-ID: <5d22e425-1299-4c81-94d1-6ff766432463@collabora.com>
Date: Wed, 9 Sep 2026 14:09:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] nvmem: mtk-efuse: mt6572 support
To: rva333@protonmail.com, Srinivas Kandagatla <srini@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Lala Lin <lala.lin@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20260909-6572-nvmem-v3-0-c0c441656431@protonmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260909-6572-nvmem-v3-0-c0c441656431@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_050921_031866_1B817C96 
X-CRM114-Status: GOOD (  16.93  )
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

On 9/9/26 12:48, Roman Vivchar via B4 Relay wrote:
> This patch series adds MediaTek mt6572 efuse support. Unlike newer SoCs,
> its efuse controller doesn't work properly with 8-bit reads, leading to
> invalid data with current mtk-efuse driver implementation.
> 

Series is

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Cheers,
Angelo


> This behavior can be observed with devmem (0x10009174 and 0x10009178 are
> thermal calibration cells):
> ~ # devmem 0x10009174 32
> 0x00CDD4CD
> ~ # devmem 0x10009178 32
> 0x0F76865D
> ~ # devmem 0x10009174 8
> 0xCD
> ~ # devmem 0x10009175 8
> 0x00
> ~ # devmem 0x10009176 8
> 0x00
> ~ # devmem 0x10009177 8
> 0x00
> ~ # devmem 0x10009178 8
> 0x5D
> ~ # devmem 0x10009179 8
> 0x00
> ~ # devmem 0x1000917a 8
> 0x00
> ~ # devmem 0x1000917b 8
> 0x00
> 
> Patch 1 adds dt-bindings compatible for the mt6572,
> Patch 2 adds platform data option to use aligned 32-bit reads instead
> of plain readb().
> Patch 3 adds platform data for mt6572 SoC.
> 
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>
> ---
> Changes in v3:
> - Pick up Rob's r-b tag for dt-bindings
> - Patch 2 and 3 unchanged, for some reason cover letter and patch 1 were
> missing on the web mirror...
> - Link to v2: https://patch.msgid.link/20260724-6572-nvmem-v2-0-e58d16a29621@protonmail.com
> 
> Changes in v2:
> - dt-bindings: make mediatek,mt6572-efuse standalone compatible
> - Driver: add 'mtk_reg_read_aligned' helper instead of modifying 'mtk_reg_read'
> - Link to v1: https://patch.msgid.link/20260715-6572-nvmem-v1-0-9c13be99d077@protonmail.com
> 
> ---
> Roman Vivchar (3):
>        dt-bindings: nvmem: mediatek: efuse: add mt6572
>        nvmem: mtk-efuse: add support for 32-bit aligned reads
>        nvmem: mtk-efuse: add mt6572 support
> 
>   .../devicetree/bindings/nvmem/mediatek,efuse.yaml  |  5 ++-
>   drivers/nvmem/mtk-efuse.c                          | 41 +++++++++++++++++++++-
>   2 files changed, 44 insertions(+), 2 deletions(-)
> ---
> base-commit: 8cd9520d35a6c38db6567e97dd93b1f11f185dc6
> change-id: 20260710-6572-nvmem-eb98c7a73351
> 
> Best regards,
> --
> Roman Vivchar <rva333@protonmail.com>

