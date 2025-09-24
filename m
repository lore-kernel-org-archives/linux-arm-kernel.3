Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5335CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 11:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nwfkqMziB6gCJNcij5fnepcOp1KZIm6MW8qrBIKv5YI=; b=FGEAcG4fQTzXSRbdP06tFKtq1E
	x7BK9UFM5+FLBLrZgaL+eWFVNEoJFRgWlmK5XGpgqx7Ay+4elv3SAg6m/tp1xa+JgbuEhamlk1/wG
	9zEF4nioyDbl6qqcWdDmj5iKITZFmOFdpRjRdOOyYxaAOhMnCSt2m6XkOMQH1peTURerRqdtvAJdG
	8sY3g8GTUU1nUIqGjRfiRqrm4SFscQbhbuJ34AWr7rXe9cLH6Av5pAxJmzDynCNWC7fdJhmISfuCE
	fUeJsdtVsYjjg/vapPTEdFMuQL0YALgp7hZ2hbibtmf7k2E/5NnG2J+ofekyuRtsHC8JbEJWfNdot
	RthuvrAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Nhw-0000000GviX-0liG;
	Wed, 24 Sep 2025 11:30:48 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Nhs-0000000Gvgm-3VFZ;
	Wed, 24 Sep 2025 11:30:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1758713442;
	bh=zAejJcsR74t5qZJ7rjpWSVUmAm/GDBIrDrA/WIcoYEs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QuG46zSOaR9X4edxtW+pQ+3UH7B0FcrFvBxe7Vu2/CCarOOCmn5RvqMyETMNLE5Tj
	 sUYiZCLg71vRI1BbB6aTfIgCBvDQuP5NAbTCPKq2lGB0VN563Jyg+zLAlX3H03CdCi
	 EeGgtGZL4auDTismc2lxfaK9fjIMJWRm2+o1gjmUt/x4ka+NouSoBNnv3kdEIZ4DS3
	 qjGWGExCRy0SSX21dBZmYlHnq3+8J2IupiofzMjM/fQB2pAGZsRP5wMWone9L6h1uh
	 4V+IzMSqztrRXMwUCnlFA9+JsbWCqxcxyRHXiMWDxv0wsctZ72gfkq2KZZAl7Ylf41
	 kzxsin8p9aL9w==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A001C17E07EE;
	Wed, 24 Sep 2025 13:30:41 +0200 (CEST)
Message-ID: <4603e18e-e9c9-4f0e-9c0c-8cbad3567ea8@collabora.com>
Date: Wed, 24 Sep 2025 13:30:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/8] dt-bindings: power: Add MT8196 GPU frequency
 control binding
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, Chia-I Wu <olvaffe@gmail.com>,
 Chen-Yu Tsai <wenst@chromium.org>, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-hardening@vger.kernel.org, linux-pm@vger.kernel.org
References: <20250923-mt8196-gpufreq-v4-0-6cd63ade73d6@collabora.com>
 <20250923-mt8196-gpufreq-v4-2-6cd63ade73d6@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250923-mt8196-gpufreq-v4-2-6cd63ade73d6@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_043045_039751_4CBA3F04 
X-CRM114-Status: GOOD (  17.29  )
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

Il 23/09/25 13:39, Nicolas Frattaroli ha scritto:
> On the MT8196 and MT6991 SoCs, the GPU power and frequency is controlled
> by some integration logic, referred to as "MFlexGraphics" by MediaTek,
> which comes in the form of an embedded controller running
> special-purpose firmware.
> 
> This controller takes care of the regulators and PLL clock frequencies
> to squeeze the maximum amount of power out of the silicon.
> 
> Add a binding which models it as a power domain.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>   .../bindings/power/mediatek,mt8196-gpufreq.yaml    | 117 +++++++++++++++++++++
>   1 file changed, 117 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/power/mediatek,mt8196-gpufreq.yaml b/Documentation/devicetree/bindings/power/mediatek,mt8196-gpufreq.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..03721244a737ce0914a89cc0aedd88fa3b6b2038
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/power/mediatek,mt8196-gpufreq.yaml
> @@ -0,0 +1,117 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/power/mediatek,mt8196-gpufreq.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MFlexGraphics Power and Frequency Controller
> +
> +maintainers:
> +  - Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> +
> +description: |

This vertical bar is not needed. Please drop it.

Cheers,
Angelo

> +  A special-purpose embedded MCU to control power and frequency of GPU devices
> +  using MediaTek Flexible Graphics integration hardware.
> +

