Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8A55E7718F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 08:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hct1xrFAGY1j5bYTonI9/rUlehgyJGR8CekrAOnf+hY=; b=ZWHdAzMoDJi8MCvyXZ9xD3bx/m
	KM62wYE4OFl5wOfwC6e0przelyUxER2ao8TjBUxh1+9+icjj9OUb+OOk9a1+8AJk0qqwQL18hkARu
	/dtMGtrKMJpIyRy+Cj3MbKYe/VUuVdC14x23pw30PO000o3anWSFBSH76JOmY5R72FJGJGGLfUx3k
	FO2JJaIVCyjMXUJqOh3c9vtYs4fbriIoP4P5+BsXfRe+pjENpbeUNIqHJPgUJ4ybenCVD5CFIdK5M
	DnOzhRKlsIovnk+OocstuK8US33S08QngT0kaIe6J55L54nu8KRnfaNN2amADabGCsGavt4t3Unh2
	13UikC0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tR5ge-0000000HMpL-06Me;
	Fri, 27 Dec 2024 08:27:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tR5fR-0000000HMiL-3zDo;
	Fri, 27 Dec 2024 08:25:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A49EB5C5A49;
	Fri, 27 Dec 2024 08:25:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5452BC4CED0;
	Fri, 27 Dec 2024 08:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735287957;
	bh=kkic30YQ5TOo/SlO6pr1SQR1B+qz6Q+mjSYY2kIShSc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SBUIrJGgQbqqjn53lLUdo4Aacmg8K7pDiYaUlnE4TlAVywF6qPIRd+p2PfXu+HCXO
	 qeLSULeJUxuqum/mCiKLzfCCO9Abwtrlbgcer1t+Eq52WUmVh7FBc7B9GJQWSE3kfz
	 p9sZ6Ds1/tS6QVZU6vJJ3bWzARF7AbcdJugflc6cTXh/2CsM+vBqd8e4jhLj7OBp67
	 7BXyfLa5Cg6ILP3Kz5DSb83cR9XnPiXurrLXZnnEPpEkIY7m70Bi2x+uO4LtPVMJki
	 iu+1fHTUGBIF4bNf4+/0W/LKO0bP01LP+EjUMX2yYLKDp8dsdRI9WYgj7Co5OX92OX
	 rvDDckw//yiMQ==
Date: Fri, 27 Dec 2024 09:25:53 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kever Yang <kever.yang@rock-chips.com>
Cc: heiko@sntech.de, linux-rockchip@lists.infradead.org, 
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Elaine Zhang <zhangqing@rock-chips.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: add rk3562 cru bindings
Message-ID: <krrqtjllx6akrurefbtuhgxw6bwmkiro5rtvdexoevjyufm2uz@r5biw7kbttyr>
References: <20241224092310.3814460-1-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241224092310.3814460-1-kever.yang@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_002558_039110_9E73C96A 
X-CRM114-Status: UNSURE (   9.66  )
X-CRM114-Notice: Please train this message.
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

On Tue, Dec 24, 2024 at 05:23:08PM +0800, Kever Yang wrote:
> Document the device tree bindings of the rockchip rk3562 SoC
> clock and reset unit.
> 
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
> ---

A nit, subject: drop second/last, redundant "bindings". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18


s/rk3562/Rocchip RK3562/
or whatever your proper name is (and use proper capitalized parts of
products)

> +properties:
> +  compatible:
> +    const: rockchip,rk3562-cru
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#clock-cells":
> +    const: 1
> +
> +  "#reset-cells":
> +    const: 1
> +
> +  clocks:
> +    maxItems: 2


Why clocks are not required?

> +
> +  clock-names:
> +    items:
> +      - const: xin24m
> +      - const: xin32k
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#clock-cells"
> +  - "#reset-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    clock-controller@ff100000 {
> +      compatible = "rockchip,rk3562-cru";
> +      reg = <0xff100000 0x40000>;
> +      #clock-cells = <1>;
> +      #reset-cells = <1>;

Why clocks are not here?

Best regards,
Krzysztof


