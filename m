Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54320C0219E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 08:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L69y/uzAaMPM5p5myJ1q89zBjOxQLTWguXE7u71IFmc=; b=ZAjKgvPqrhKdIKUG8tqSoH8dKx
	9omTRN3fVkaYFEbuDa4952PEN1uw62cSFrShgOCNxdmaVH5gPU1GVVSOPHCHR2BZCa8/Vbcp4QfsY
	SLF30HEBWpwV9gCd9my0M76ekK7uN2U4B2ZtOvJs7ZSAjU0o/mBS6KOaet6pFum3FOvzDIl1iH367
	LE0gvcIgAQEq3hfsr7g/jljZf9SbTXP6ygtkrL54VKMXaDKl4EneQNVhMMiL93dvC+x/AS8hLbr6A
	ru/hyaQWDLmv6zLb7Jr5MqW8HKr1zT7X4XVCV0vNwSC0EaCxhbWrpJ46nbODK4MRVETRzPryUmURx
	7YJtDXvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thlir-000000030YW-3geU;
	Tue, 11 Feb 2025 08:34:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thlgH-000000030CH-14R1;
	Tue, 11 Feb 2025 08:31:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EA68D5C0450;
	Tue, 11 Feb 2025 08:31:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9A9EC4CEE4;
	Tue, 11 Feb 2025 08:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739262704;
	bh=dl4uLU/iQ9rF6gTfpw7fZJVHUwDfPTBp/2QbqtbcdMU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uW3bFcrkqwYvblTFtITmlt7YgN6TQjfuDtO7NcfQLqANFXCSeoow4sAmntrkPX7iy
	 Kqzx2sAfCnjHst5aKcYZCH29j82/TGmS8xCwf6VIsY5pDdbq8rq5Z/kd/RC1MFVYqh
	 3GrkNQpVhidgSRHGM3JolbQXqbQ/ETWnnZD97MrnQAyimp5UoLE4J6yl+RqeYo/Tet
	 bZf4vDyqkRSaLS4kfDjUMqk8fjgwSBEybDGo5Ax6PiY5ssufmGoKmUtwFicoV0VQvF
	 yjbqmU0Vd6S3Iif/zW6nFW0tlSJpjUxETSKuwmbX84fhas40cyonZArnEJLF/DfhC6
	 0N7iwWY7Cy4CA==
Date: Tue, 11 Feb 2025 09:31:40 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Boris Brezillon <boris.brezillon@collabora.com>, 
	Steven Price <steven.price@arm.com>, kernel@collabora.com, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 3/3] arm64: dts: mediatek: mt8370: Enable gpu support
Message-ID: <20250211-nice-boar-of-abracadabra-f696ec@krzk-bin>
References: <20250207-mt8370-enable-gpu-v3-0-75e9b902f9c1@collabora.com>
 <20250207-mt8370-enable-gpu-v3-3-75e9b902f9c1@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250207-mt8370-enable-gpu-v3-3-75e9b902f9c1@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_003145_351039_B15803D6 
X-CRM114-Status: GOOD (  17.99  )
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

On Fri, Feb 07, 2025 at 04:18:32PM +0100, Louis-Alexis Eyraud wrote:
> Add a new gpu node in mt8370.dtsi to enable support for the
> ARM Mali G57 MC2 GPU (Valhall-JM) found on the MT8370 SoC, using the
> Panfrost driver.
> 
> On a Mediatek Genio 510 EVK board, the panfrost driver probed with the
> following message:
> ```
> panfrost 13000000.gpu: clock rate = 390000000
> panfrost 13000000.gpu: mali-g57 id 0x9093 major 0x0 minor 0x0 status 0x0
> panfrost 13000000.gpu: features: 00000000,000019f7, issues: 00000003,
>    80000400
> panfrost 13000000.gpu: Features: L2:0x08130206 Shader:0x00000000
>    Tiler:0x00000809 Mem:0x1 MMU:0x00002830 AS:0xff JS:0x7
> panfrost 13000000.gpu: shader_present=0x5 l2_present=0x1
> [drm] Initialized panfrost 1.3.0 for 13000000.gpu on minor 0
> ```
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8370.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8370.dtsi b/arch/arm64/boot/dts/mediatek/mt8370.dtsi
> index cf1a3759451ff899ce9e63e5a00f192fb483f6e5..2f27f7e7ab813b97f869297ae360f69854e966e1 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8370.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8370.dtsi
> @@ -59,6 +59,15 @@ &cpu_little3_cooling_map0 {
>  				<&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
>  };
>  
> +&gpu {
> +	compatible = "mediatek,mt8370-mali", "arm,mali-valhall-jm";

It's up to platform maintainers, but IMHO this is discouraged practice.
If you ever need to override compatible, this means the node is not
really shared between this and base SoC (base DTSI).

Best regards,
Krzysztof


