Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EFF3E88D80
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Apr 2026 11:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TMeKzHPn7dznbogO7bbxX7HR6eOUmNQ59OI5hoXrNvw=; b=YAXSlP32BbtM3haZufPc6iSOkc
	bpPLoqfJto+3ygjfART43DLC5l7cjUdbKj9e3AH9V96wBt25BI/kQ+BKrIlY4WYS2mFE70moJosRR
	O8xKNESypgGC93F0+heKHnZMAO6i1Y/Fa/PlWz8YoS0CTLwVKxhu7TL3loTwzBnMmz39FZdSHlfnX
	MwEW9N6fWEpf8w5Sa2Y2RnT0HrK/lICKWLJAWAJwA9uO05gMgTy0ss53HkMs0vTz5FnxzrhqZBJ9f
	0U/GdDR1TaSAP/rhZjEtJWo5kBM5J9J+c9ALEdvkiTG8vhKH+IfroWU7dUkp53ybOKA1/olwppuW/
	Vg4sdFZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8yuF-00000003Pcv-1QeU;
	Sat, 04 Apr 2026 11:11:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8yuD-00000003PcM-03y9;
	Sat, 04 Apr 2026 11:11:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 485AB4173C;
	Sat,  4 Apr 2026 11:11:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9871AC19423;
	Sat,  4 Apr 2026 11:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775301068;
	bh=yHCuDJkwIS+n8JF158AMxWIAXaCZeMqEE3mA4j4AL5I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aFxGe1ZKscIg6kLr3BtO9y4xldeH/JZv8w5vCRCdMkLCwhu7egG0hRTXaXDLg9SNE
	 N0W6e71HpHX1fvgQbqTe1av9cVe/qkZ+3oe+dTIa1xzR0R1I7dGg+bCsq8OtXdrrzE
	 NVN/3o+OY1cpIg8m8Rg4lsj4uMqcd7RwtQVCJN01nHFnM+CXri4ytnQvaJLij6RhRv
	 nXyK5COA1b7EFh9inQqoNOcrTHRsHr9tZ5LxhVQO0YLeM8MDLV6zF9O1Eeo27t5wFM
	 46WyimkjdwbONZTKCQ0OrSXhMqH8hGNYlMAnszrvWLki8ry06ROJiwPh0Fv4wTlrwt
	 6K+AEwVdacXTw==
Date: Sat, 4 Apr 2026 13:11:05 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Anushka Badhe <anushkabadhe@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: dt-bindings: rockchip: Convert rk3399-gru-sound to
 YAML
Message-ID: <20260404-masked-venomous-jackrabbit-b543ac@quoll>
References: <20260402055635.8798-1-anushkabadhe@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260402055635.8798-1-anushkabadhe@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260404_041109_074882_3A1E5E91 
X-CRM114-Status: GOOD (  11.13  )
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

On Thu, Apr 02, 2026 at 11:26:35AM +0530, Anushka Badhe wrote:
> Convert the rockchip,rk3399-gru-sound.txt DT binding to YAML Schema.

DT Schema, not YAML Schema.

Same in subject.

https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

...

> +---
> +$id: http://devicetree.org/schemas/sound/rockchip,rk3399-gru-sound.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ROCKCHIP with MAX98357A/RT5514/DA7219 codecs on GRU boards

Rockchip

> +
> +maintainers:
> +  - Heiko Stuebner <heiko@sntech.de>
> +
> +properties:
> +  compatible:
> +    const: rockchip,rk3399-gru-sound
> +
> +  rockchip,cpu:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array

Need to list items. See msm/gpu.yaml,
allwinner,sun4i-a10-display-engine.yaml and others.

And read the driver code to understand what is supposed to be here.


> +    description:
> +      The phandle of the Rockchip I2S controller that's connected to the codecs
> +
> +  rockchip,codec:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array

Same here.

> +    description: The phandle of the audio codecs

Best regards,
Krzysztof


