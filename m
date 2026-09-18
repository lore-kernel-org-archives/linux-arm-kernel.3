Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0625C982D8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 16:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p/afdDpUjxDvfFW6cnI4C09DF82vIDcSPuyrBSmUfI8=; b=akGBufMQDVvIYLoaMi+NdZlmEE
	JG07y8Lo07KcwZwR5G1CaU3dRBnRxxoLK9XvRjA2YK5JnB5nYg0iC6du5i4d6LdRErJjGtZV81pZg
	Q+h5BiCLZj7nmSSuaCDHLLE81fuZZlg9OJIhPi/y85T3xkhU2VZHJQSK+Qmd+yesWbAV/qmNKCAKi
	AAPlTUBbF9xfLw5L1KOp3PFslSg6XCsZSKZ7osVaEkHIs6ROnsZJn+M6fSk2VG7jXto7ozdh8g0Rj
	OMBW6EKJ4Oc3s6haW7AKMjaBRfNdVxgBH/WKwCTtnM6UUd/KcDcI2F9f1/wFjOz3P5rp9hek6eQUv
	jT3JtbGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7biG-0000000F4SU-1gPE;
	Fri, 18 Sep 2026 16:45:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7biE-0000000F4Rv-1uvH;
	Fri, 18 Sep 2026 16:45:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 920E9601EF;
	Fri, 18 Sep 2026 16:45:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BD441F000FF;
	Fri, 18 Sep 2026 16:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789749921;
	bh=p/afdDpUjxDvfFW6cnI4C09DF82vIDcSPuyrBSmUfI8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=m0ZxH+mQR/Uf05x4/48ROHKNATIza8gPxVi9lr/10jZq9xCYRtDE/fWPiXpPDIptg
	 NEwjz9dqpcwCeEqhaOsJleFsQGsJNGJEUZfhpuL5wpWm9JBoHt0mUR4OVdjyWmjCbG
	 dzzdxEP3OyCH2hiqgVHf/fcLd/xNuh6plVyoSkSOn56fTM+nkksaoa12NoOPvvm+mP
	 lvhPZOcyBajJLlVgdxPBw3CN9YfXVWn4+S6njb/t25DJZgpd7o0eLiSlBsVpTNbPmr
	 3RvoEByxqiK8FJ8YFKt909e9VmG4CpOs2Mj/K4vtODVKrThWr7KcCSooCUMeNdMFtV
	 SRRp9VjR6oPdQ==
Date: Fri, 18 Sep 2026 11:45:19 -0500
From: Rob Herring <robh@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH 3/7] dt-bindings: devfreq: event: rockchip,dfi: add rk3576
Message-ID: <20260918164519.GA435751-robh@kernel.org>
References: <20260917-b4-rockchip-dfi-rk3576-support-v1-0-a5752a29f7bd@collabora.com>
 <20260917-b4-rockchip-dfi-rk3576-support-v1-3-a5752a29f7bd@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-b4-rockchip-dfi-rk3576-support-v1-3-a5752a29f7bd@collabora.com>
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

On Thu, Sep 17, 2026 at 04:04:09PM +0200, Sebastian Reichel wrote:
> From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> 
> The RK3576 has DFI hardware for monitoring the DDR's bandwidth much
> like other rockchip SoCs do. Unlike the RK3588 however, it only has two
> memory channels, so only two per-channel pclks for DFI.
> 
> Add a compatible for this SoC's variant, and add it to the conditionals
> at the bottom of the bindings file.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  .../bindings/devfreq/event/rockchip,dfi.yaml       | 23 ++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/devfreq/event/rockchip,dfi.yaml b/Documentation/devicetree/bindings/devfreq/event/rockchip,dfi.yaml
> index d6e06a9bea19..964f1827496a 100644
> --- a/Documentation/devicetree/bindings/devfreq/event/rockchip,dfi.yaml
> +++ b/Documentation/devicetree/bindings/devfreq/event/rockchip,dfi.yaml
> @@ -14,6 +14,7 @@ properties:
>      enum:
>        - rockchip,rk3399-dfi
>        - rockchip,rk3568-dfi
> +      - rockchip,rk3576-dfi
>        - rockchip,rk3588-dfi
>  
>    clocks:
> @@ -68,6 +69,28 @@ allOf:
>          - clocks
>          - clock-names
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - rockchip,rk3576-dfi
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description:
> +                clock driving the DDR monitoring logic for memory channel 0
> +            - description:
> +                clock driving the DDR monitoring logic for memory channel 1
> +        clock-names:
> +          items:
> +            - const: pclk_ddr_mon_ch0
> +            - const: pclk_ddr_mon_ch1

Names are already defined at the top-level, just:

minItems: 2
maxItems: 2

(On clocks too)

Rob

