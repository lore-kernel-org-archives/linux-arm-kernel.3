Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF618C36008
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 06:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tfd5gJAdJrjQTh2OrhCGL/kruiS2MjDxWifTbmJbfLs=; b=fWZ2+p74vPfBZqVWmfYnUY5TFd
	kJEGkBAY07yBXw1Q6as6qhg/X9rAz06r88LbxwGigsznmW7tmfxesvV8X1uh1/Bsw6KfANV3oTuUV
	aZHcvuZLVpNzOwc9aNuuoMMy0VkYVoOA4ol3+nPNcwYAMtG8s0u8Ge0jurzhU5EqSVb9RwB0+1Bm/
	VLtl4tMZ7TEfkAN8yxxOLnemUYsqGNZ0M7XMaiOcUchE0RdvIJJPwV89rp2H189M3WiIADWbvGvxg
	upQYDcpwALCaq9TqG5yeGt4t6ftqHAttBVY73gt9/cF1Wft4LHB4J3fjzc/kBPpfert5+CL+3H3ad
	zDGDFlQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzUuY-000000024Pi-2MjW;
	Tue, 01 Apr 2025 06:15:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzUsj-000000024Dd-2k3T;
	Tue, 01 Apr 2025 06:13:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CE90944044;
	Tue,  1 Apr 2025 06:13:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42742C4CEE8;
	Tue,  1 Apr 2025 06:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743488033;
	bh=a/WBWaI1GRijiNVhX5FXEpnwkrIb9sOyftFgp32l9+0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jNymlsUa/smbZNP5cRJtDeGbNZjsIVNja4x7dB9r+sVZdWnd5hWwiKB9CRvQsFeJe
	 Zp2BVuP5TDBpX+8K4PJ6IlnjXD23NVrptNeVecJQtqHl8LIwNdlF4feRJHDEjq3G4J
	 4/fSDq6auzVqB8pY1se8oupuPSaxBsDNH6RT87HikgM9BDj+IqWlb21+hYu9KOh3sK
	 aIw+G163YeCtXjUrdu1LmKGBOQPOzNd7B5yxhmrM5zMnxgyiWorK7NYeR9a1D/XGcW
	 8djMi/ZIcjD3UPkdjNV+6dVMi3F4GPqjvzUYfcQD8lJIOZtC9PAn1r87ZIyrgtthxO
	 0pFvcrsHWlSUg==
Date: Tue, 1 Apr 2025 08:13:49 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctl: amlogic,pinctrl-a4: Add
 compatible string for A5
Message-ID: <20250401-meteoric-perfect-cuttlefish-abd62d@krzk-bin>
References: <20250401-a5-pinctrl-v2-0-a136c1058379@amlogic.com>
 <20250401-a5-pinctrl-v2-1-a136c1058379@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250401-a5-pinctrl-v2-1-a136c1058379@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_231353_712684_74146007 
X-CRM114-Status: GOOD (  13.73  )
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

On Tue, Apr 01, 2025 at 10:06:21AM +0800, Xianwei Zhao wrote:
> Amlogic A5 SoCs uses the same pintrl controller as A4 SoCs. There is
> no need for an extra compatible line in the driver, but add A5
> compatible line for documentation.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
> index 8eb50cad61d5..3bebccaf0c9f 100644
> --- a/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
> @@ -14,8 +14,12 @@ allOf:
>  
>  properties:
>    compatible:
> -    const: amlogic,pinctrl-a4
> -

Do not remove blank line.

Best regards,
Krzysztof


