Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9341CCA1012
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 08:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GADIokt87C5TMAbKoKAcLktw4EFHYfOIdhMP3zcaO2k=; b=O59b9gvtu8Fx4DFykGGbsyTIZ1
	sUsV7v/GwMV3yTqvhltowOqOlDE1rGbkeMaFu72oIthtzAWp7+F2jvo0ic8KLrZd2+HNygs6BMfyZ
	AOftzTiFELTAzZEwvuWexTRpOtUR10/D0Kh3Sg8Ppi+1hw+LIYdLc/SOQ+EVR31eK+UnOyh2lJp+d
	c02WSAF2pKp2vd/KrnS2y1VQG1di7H1H4nXEFoWw0bRz5GPcDtZ+RnGXTYOIraI8WmziO0A8W3W60
	Va08Ugxu1UxKOyyLtx69oqzTLqwvwSnsabdnV8t4/PYYS3nLHPZW+97r6xOsa7ZztGQeJgz/QSF2V
	I9qsUZiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu5Xt-0000000AJU3-2ifM;
	Thu, 04 Sep 2025 08:42:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu4se-0000000A3Mi-0h3i
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 07:59:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 93FF5601A4;
	Thu,  4 Sep 2025 07:59:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC4AFC4CEF1;
	Thu,  4 Sep 2025 07:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756972779;
	bh=qr1V071kjlRjsRCmHcuB3ihXSJkt/phuzQie/Q1MiZg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ooXCt7hhW4NMrwAjO7gPOLnLZI7xsHoYmdJepFhj62ONTqa6O7U78jJlEolZJFTeb
	 SEaqRG9H2nu8UH4g1THcNbD90ssj//+E1fGFMVU1/zpzXwtGkbyMt9f30SKIKv0G+3
	 bwG/TLFdU2Ct5JbPvWJEqeuM2eTxyPbKmZdvtwAIvO3SipW7NbdHUt/Nmram6KmbmE
	 LRzJjXoNmF5C3/jukRpA66VKlkLRSGunAExp4E+Ny4nbRS1YgBbbtOGAmG2PcJNCtn
	 wmCQtPGXg32OMvsx1xv1Z7Qyf7rzpArlYodOGDNKfttA/xGG/0iszppNrFryEwsO8M
	 9Vew+ag+ROmfA==
Date: Thu, 4 Sep 2025 09:59:36 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shin Son <shin.son@samsung.com>
Cc: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, linux-pm@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: thermal: samsung: Add tmu-name and
 sensor-index-ranges properties
Message-ID: <20250904-chocolate-kangaroo-of-order-2cced3@kuoka>
References: <20250903073634.1898865-1-shin.son@samsung.com>
 <CGME20250903073653epcas2p4cb25058c97aab9a30c7e68ef5f10fb91@epcas2p4.samsung.com>
 <20250903073634.1898865-2-shin.son@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250903073634.1898865-2-shin.son@samsung.com>
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

On Wed, Sep 03, 2025 at 04:36:32PM +0900, Shin Son wrote:
> The exynosautov920 TMU requires per-sensor interrupt enablement
> for its critical trip points.
> Add a DT property to the Samsung thermal bindings
> to support this requirement:

That's pretty redundant sentence.
> 
> - **samsung,hw-sensor-indices**: Defines the sensors currently
>                                  mapped to the TMU hardware.
> 				 Indices not listed are absent or fused off

Don't write here any code, but concise prose dxescribing hardware.

If sensors are fused out, you certainly can read their status from efuse, no?

This is really vague description of hardware. I don't understand why you
are changing sensor-cells, why older variants of tmu gets now cells=1
(missing constraints?).

Why older variants also get that property for sensors? It does not make
sense there, because they have one-to-one mapping between TMU and
sensor.

> 
> Additionally, add myself to the bindings' maintainers list, as I plan
> to actively work on the exynosautov920 TMU support and handle further
> updates in this area.
> 
> Signed-off-by: Shin Son <shin.son@samsung.com>
> ---
>  .../bindings/thermal/samsung,exynos-thermal.yaml | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/thermal/samsung,exynos-thermal.yaml b/Documentation/devicetree/bindings/thermal/samsung,exynos-thermal.yaml
> index 29a08b0729ee..abd89902d33a 100644
> --- a/Documentation/devicetree/bindings/thermal/samsung,exynos-thermal.yaml
> +++ b/Documentation/devicetree/bindings/thermal/samsung,exynos-thermal.yaml
> @@ -8,6 +8,7 @@ title: Samsung Exynos SoC Thermal Management Unit (TMU)
>  
>  maintainers:
>    - Krzysztof Kozlowski <krzk@kernel.org>
> +  - Shin Son <shin.son@samsung.com>
>  
>  description: |
>    For multi-instance tmu each instance should have an alias correctly numbered
> @@ -27,6 +28,7 @@ properties:
>        - samsung,exynos5420-tmu-ext-triminfo
>        - samsung,exynos5433-tmu
>        - samsung,exynos7-tmu
> +      - samsung,exynosautov920-tmu
>  
>    clocks:
>      minItems: 1
> @@ -62,11 +64,22 @@ properties:
>      minItems: 1
>  
>    '#thermal-sensor-cells':
> -    const: 0
> +    enum:
> +      - 0
> +      - 1
>  
>    vtmu-supply:
>      description: The regulator node supplying voltage to TMU.
>  
> +  samsung,hw-sensor-indices:
> +    description: |

Drop |

> +      List of hardware sensor indices that are physically present and usable
> +      in this TMU instance. Indices not listed are either unmapped or unused.
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 1
> +    maxItems: 16
> +    uniqueItems: true

Best regards,
Krzysztof


