Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43876CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 15:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qx6B1KYdz37mYKbT7SYwn7w/SpfU9sWlTYjgITZwR/A=; b=4ETjiFPy6qd3MVo2cP5+1N/Az+
	NWovD6pEj98BicA9DTv1Nm1EZnaz72GynJMjIuv2fvW/xx4ZAXxkwl5pOUW3JNus/zFyXSRNGa2eJ
	Bjk8nvJ5M3GJMa2or8SSrHHDaQGQI5W4WfbAiSgs3C80/yK+wqc4N/KHLe62maaO7EPs2Ex/D08JA
	YguAYkGDEevVZhAUU9q9x7Pb3jla+aHIKty0r+naAK8PBWNlhQlx5xWxMvaUAJQwzrNpeqZKBbAIg
	ZYJOFcWtxqEoRv7AfzvLYyGiBPHW0kIa5AZuMsT3Xr9TzrzMfYyUv3ShB5BT1Jr10b1WmJlxvw/4D
	GRAb1FWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKHwW-0000000GhNp-1GaY;
	Tue, 05 May 2026 15:44:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKHwT-0000000GhN6-191B;
	Tue, 05 May 2026 15:44:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 73CB744301;
	Tue,  5 May 2026 15:44:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F875C4DDFD;
	Tue,  5 May 2026 15:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777995852;
	bh=bCfTXkwP7yBiyRfwzj60VulBmDVM9WEMccCuTjm8a+s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZItYsX404FwWlF0T8mi9a5gwpg1xS41MfCS9MNaiGaB2WjaQsjD3dfU6iyll1hJV1
	 iE3Y0c/oCc/l/ZdDFpvgdQiVc7ZvSPMCRVaN8snLZQWqfShFEOQvkkQtjcMiOuWdzd
	 N/NG3vthwJ2EAX2ZqVXUjIe4AHv9HVNKY5VoAFPh0JSEz8sceIzornRjw151FFfXHh
	 WOH15wrp6LvGmPgcB+XS/l2acxvKxxTcq/8GZM7xfwPqFor+XCNn9KSDjLVOnE8q4q
	 BjzoDFMCTNtn52QKhSo4KtP+uADnPkFo9mwz8YuFKyFoRAshHQiFgF570WPgEEE2az
	 0qgmDcLEIIvZg==
Date: Tue, 5 May 2026 10:44:10 -0500
From: Rob Herring <robh@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Frank Wang <frank.wang@rock-chips.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Yan <andy.yan@rock-chips.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Yubing Zhang <yubing.zhang@rock-chips.com>,
	Alexey Charkov <alchark@gmail.com>, linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@collabora.com, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 01/16] dt-bindings: phy: rockchip-usbdp: add improved
 ports scheme
Message-ID: <20260505154410.GA2973821-robh@kernel.org>
References: <20260428-rockchip-usbdp-cleanup-v4-0-7775671ece22@collabora.com>
 <20260428-rockchip-usbdp-cleanup-v4-1-7775671ece22@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428-rockchip-usbdp-cleanup-v4-1-7775671ece22@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_084413_351047_3580305E 
X-CRM114-Status: GOOD (  20.87  )
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

On Tue, Apr 28, 2026 at 06:13:40PM +0200, Sebastian Reichel wrote:
> Currently the Rockchip USBDP PHY is missing a documented port scheme.
> Meanwhile upstream RK3588 DTS files are a bit messy and use different
> port schemes. The upstream USBDP PHY Linux kernel driver does not yet
> parse the ports at all and thus does not create any implicit ABI either.
> 
> But with the current mess it is not possible to properly support USB-C
> DP AltMode. Thus this introduces a proper port scheme following roughly
> the ports design of the Qualcomm QMP USB4-USB3-DP PHY controller binding
> with a slight difference that there is an additional port for the
> USB-C SBU port as the Rockchip USB-DP PHY also contains the SBU mux.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Missing my tag.

> ---
>  .../bindings/phy/phy-rockchip-usbdp.yaml           | 23 ++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/phy-rockchip-usbdp.yaml b/Documentation/devicetree/bindings/phy/phy-rockchip-usbdp.yaml
> index 8b7059d5b182..f728acf057e4 100644
> --- a/Documentation/devicetree/bindings/phy/phy-rockchip-usbdp.yaml
> +++ b/Documentation/devicetree/bindings/phy/phy-rockchip-usbdp.yaml
> @@ -114,6 +114,29 @@ properties:
>        A port node to link the PHY to a TypeC controller for the purpose of
>        handling orientation switching.
>  
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          Output endpoint of the PHY for USB (or DP when configured into 4 lane
> +          mode), which should point to the superspeed port of a USB connector.
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Incoming endpoint from the USB controller
> +
> +      port@2:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Incoming endpoint from the DisplayPort controller
> +
> +      port@3:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          Output endpoint of the PHY for DP, which should either point to the
> +          SBU port of a USB-C connector or a DisplayPort connector input port.
> +
>  required:
>    - compatible
>    - reg
> 
> -- 
> 2.53.0
> 

