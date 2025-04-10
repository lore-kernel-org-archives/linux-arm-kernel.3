Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24950C369A8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 21:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FuqUY2AjiwNRmSThrEqZT0tZuc0ARhZGsnVyw4FvYAY=; b=rBVRmKks2J6Wsre0kvRvrOSCdf
	x5IBEhhRTq9ENOPqC4wmzOwNqJ19G4h40wSJ2RfVYeCYUiDFJzBgaz46/uyyN0dOSgWqdEB7XydyX
	fvc3J4p1Xf/P99o9vwH3Ugy/gT6jiu8SLUYnVqaNI4QYQUEYWzUrHvp05FcpuottXgHG0+YpJPc4h
	+OnBCt2JhzSDOzls0XujhuY/w/r0jQXokwtTLQS4uO8vT6ZEOULZMYajuaRUJGDTIWJPPG6iS2+tW
	L7x0HriYDkLkbLIGWqUx7Ccc4RO+7JiWInJkJpiHYmfBaBDDBq5uRQac7PfHWpdfmAZT2H9zh+AGb
	mP8iJwRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2zD1-0000000BspV-0rbs;
	Thu, 10 Apr 2025 21:13:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2zBF-0000000Bshk-0T4C;
	Thu, 10 Apr 2025 21:11:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E9E2149E77;
	Thu, 10 Apr 2025 21:11:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BF6DC4CEDD;
	Thu, 10 Apr 2025 21:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744319484;
	bh=owtnRJWwM8yKkJmYEoQiWQDaxSjXp0C7FQsxarVWC9g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rkEMYfFO8PkNupW9d53Fn+Gf8hLHqpXXnFBqrr4YHQ+uXfsfFycXhKSeCia8matlF
	 zQOaWWBWviVuR6W/FCo6YVIw254fwMVQCtqE+P+/irD5u3rZQI+mZVMybVzLXHD9z9
	 XGujbwykQyPlGuSVyfocqgCS49KLORfNgbm5G0ZHfF6fl/QuVxX5wFCOf7ikf7EAlX
	 /1x4xcxwEj6vTw+fhJWYX7qvgMchl9Ni102t6obZMqBa15ZPU0YRXq0nOgABs2AfuW
	 UDGi+qYxJVRN/ELF3KV4II6z0Fc7EHY8yhIHz8gcbLoMRxUSeWTAj+TEI5gP4wz+m8
	 Kp3eiepPvvPXA==
Date: Thu, 10 Apr 2025 16:11:23 -0500
From: Rob Herring <robh@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Kever Yang <kever.yang@rock-chips.com>,
	Frank Wang <frank.wang@rock-chips.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	kernel@collabora.com, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: phy: rockchip,inno-usb2phy: add port
 property
Message-ID: <20250410211123.GA1071510-robh@kernel.org>
References: <20250407-rk3576-sige5-usb-v1-0-67eec166f82f@collabora.com>
 <20250407-rk3576-sige5-usb-v1-1-67eec166f82f@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407-rk3576-sige5-usb-v1-1-67eec166f82f@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_141125_166780_1C18D6DB 
X-CRM114-Status: GOOD (  21.05  )
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

On Mon, Apr 07, 2025 at 08:09:14PM +0200, Nicolas Frattaroli wrote:
> USB connectors like to have OF graph connections to high-speed related
> nodes to do various things. In the case of the RK3576, we can make use
> of a port in the usb2 PHY to detect whether the OTG controller is
> connected to a type C port and apply some special behaviour accordingly.
> 
> The usefulness of having different bits of a fully functioning USB stack
> point to each other is more general though, and not constrained to
> RK3576 at all, even for this use-case.
> 
> Add a port property to the binding.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml b/Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml
> index 6a7ef556414cebad63c10de754778f84fd4486ee..3a662bfc353250a8ad9386ebb5575d1e84c1b5ba 100644
> --- a/Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml
> @@ -78,6 +78,11 @@ properties:
>        When set the driver will request its phandle as one companion-grf
>        for some special SoCs (e.g rv1108).
>  
> +  port:
> +    $ref: /schemas/graph.yaml#/properties/port
> +    description:
> +      A port node to link the PHY to a USB connector's "high-speed" port.

I don't think this is correct. The HS port of the connector goes to the 
controller. The controller has the link to the phy.

If the PHY is also what handles USB-C muxing or orientation switching, 
then it might have ports, but then it needs input and output ports.

Rob

