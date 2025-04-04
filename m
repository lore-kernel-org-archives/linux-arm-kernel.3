Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B151C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 11:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wSB36n18dbWq3JPZyqngRMYdYz9NgseK45CAN/9M+/k=; b=T7d5UyCJ6Z95kIpw6QFMz9fFbB
	/j23CWKlAJ+dkleBMqsBAtDn1njf4m1YI7luTvB9wicap1SZmQRkq68WTjNqHpFTsDhbtrQatVd0w
	ufGXV27ufayIJvpJTtfVhB4grDvIhCuYH42thTS9oNQHfmCHPM3cf23eWcW+E3NF4bY5evLyEbJ3c
	gMS0PsGrtYhO+8gi0vXjjIDUWupTHyANenNwq+DMANAdyvSyxQ0rTXMI3WPjFKM9sIJclOEYYRBYx
	rBBoyiZ9BVu0ur3kQBVpuSS9w+A1rLHijT2M8sHYw2Hz1XqVKYsKtPHFrfuCWiaoe41A8fJgA3HSt
	4XrsJYig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0fMg-0000000BZBe-3Ewp;
	Fri, 04 Apr 2025 11:37:38 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0fHQ-0000000BYOH-0RyL;
	Fri, 04 Apr 2025 11:32:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1743766330;
	bh=mKsqKGG/7YSKHNxFBBuOvn0Q62p5t5UmUS+Llf4Xv+o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nJwsmtKfCOFaRLtdheNLsrNXHau0c/Rn80fSu9DFp9dqh0mpVplJjf/RJDWsDppZj
	 K1nRgU79IM9C/BB+INNLF9qPLoZM7FIfqo2dV2MHBZUrapbHXtTlVoq7Ee9D1ZuTvA
	 8qMfMD5BzgJZ3gmloXl2Iny0cRXUy6qQFCGB+CGeaUn3O6T65csyfoVewC2Of83ZOo
	 DuOsYQX6Qzp1rE1hL6kbztBjhtqz9ZmJEip0zPfqu9MltVplyd30pOV4KbwFUoQRBU
	 iTCF9mpsJt0L86KQv1XekkmXzJkOvzzXy+fkz+jnQl6cJXvttX+etNTWbve4UriaIw
	 PY8YN9NjjTqAA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 17A6A17E0865;
	Fri,  4 Apr 2025 13:32:08 +0200 (CEST)
Message-ID: <2a12c4e7-7df7-49c7-8abe-1c5ee769cfcc@collabora.com>
Date: Fri, 4 Apr 2025 13:32:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/19] dt-bindings: arm/cpus: Add missing properties
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, zhouyanjie@wanyeetech.com,
 Conor Dooley <conor@kernel.org>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-mips@vger.kernel.org,
 imx@lists.linux.dev, linux-rockchip@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org
References: <20250403-dt-cpu-schema-v1-0-076be7171a85@kernel.org>
 <20250403-dt-cpu-schema-v1-17-076be7171a85@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250403-dt-cpu-schema-v1-17-076be7171a85@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_043212_302558_7F49CE28 
X-CRM114-Status: GOOD (  18.23  )
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

Il 04/04/25 04:59, Rob Herring (Arm) ha scritto:
> The Arm CPU schema is missing a number of properties already in use.
> This has gone unnoticed as extra properties have not been restricted.
> Add a missing reference to cpu.yaml, and add all the missing properties.
> 
> As "clock-latency" and "voltage-tolerance" are related to opp-v1, add
> those properties to the opp-v1.yaml schema.
> 
> With this, other properties can be prevented from creeping in with
> 'unevaluatedProperties: false'.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>   Documentation/devicetree/bindings/arm/cpus.yaml   | 46 ++++++++++++++++++++++-
>   Documentation/devicetree/bindings/opp/opp-v1.yaml | 16 ++++++++
>   2 files changed, 61 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
> index 3d2b6286efb8..6f74ebfd38df 100644
> --- a/Documentation/devicetree/bindings/arm/cpus.yaml
> +++ b/Documentation/devicetree/bindings/arm/cpus.yaml
> @@ -299,6 +299,16 @@ properties:
>   
>         where voltage is in V, frequency is in MHz.
>   
> +  interconnects:
> +    minItems: 1
> +    maxItems: 2
> +
> +  nvmem-cells:
> +    maxItems: 1
> +
> +  nvmem-cell-names:
> +    const: speed_grade
> +
>     performance-domains:
>       maxItems: 1
>   
> @@ -317,6 +327,31 @@ properties:
>         corresponding to the index of an SCMI performance domain provider, must be
>         "perf".
>   
> +  resets:
> +    maxItems: 1
> +
> +  arm-supply:
> +    deprecated: true
> +    description: Use 'cpu-supply' instead
> +
> +  cpu0-supply:
> +    deprecated: true
> +    description: Use 'cpu-supply' instead
> +
> +  mem-supply: true
> +
> +  proc-supply:
> +    deprecated: true
> +    description: Use 'cpu-supply' instead
> +
> +  sram-supply:
> +    deprecated: true
> +    description: Use 'mem-supply' instead
> +
> +  mediatek,cci:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: Link to Mediatek Cache Coherent Interconnect

s/Mediatek/MediaTek/g please :-)

Anyway:
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



