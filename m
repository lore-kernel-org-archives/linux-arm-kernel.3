Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 019F8E6B252
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Nov 2024 10:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J8QvqmOHIn6cElpzaJLnamIDamsmWCm9KcZKhnhg1EI=; b=WBhLFn/mElsfW6+w62rsVNOX8X
	OaBbQlyb8vD4UL/x6JSOAdFejXrZ0FLjY+UmsyCZJac3FfIMGzIviPde2iIlswVbS9yrTiDvkLRGt
	+3WC4kcNYBYRez8+DWCxwpZzDPbTqmu1rUVeM34QoMqg8ZK3chJ/KsyVzRmkywiUrttlxjrutioMO
	+CpJ3Urh2eYmf+ATSSAaiDZE1DuKE74hgtPD0eJdi2hKHc316mnHxXrZMDDsFcLCQmT51t52lG7tA
	wjWtqQTWbnZMZZUhd1WsjY/n8oKBmdPUiInq+09l0hjLKNEtCBM6SO6b6DcY4mapuNa+IoED41cm2
	uBXVA0fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7Xvm-0000000BIBt-0cQD;
	Sun, 03 Nov 2024 10:34:02 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7Xu5-0000000BI0y-2F5w;
	Sun, 03 Nov 2024 10:32:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 57CA8A400AC;
	Sun,  3 Nov 2024 10:30:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ACEDC4CECD;
	Sun,  3 Nov 2024 10:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730629936;
	bh=iHupWsxzFRgV+Th+tOJmSIrQJ3vqK571Fe0TvhNqbZw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e+O3ivOWVfNk+A3vC6vQchJ/dGA01SFbXB6Bc8QCF1wC3o8Bj1iiAW7QT3LBU4clS
	 mI6q5Dp98RjwYh8zeA+Mjo49qTH6oCMOfvl2bubdUo96ShgwSUxewtZl9vfH1eneyl
	 jPh4HdEYrqLs1FJ+PxvA5s0HuKUfjeWFH76SFfg6uZSf5kOojD99vRvnGplxVgzTP4
	 GtaVpbwNbjVxKd9oBOeQSkC+1reN4P3UAlft6H/nXXfH3G6f0jeROuzx8vlAz6z3Fn
	 cdrzUMR2mwNLoojuVgq+pIq/wDtLx9HjnABIi0XtCcJsnvkzJD1bz38+tHTo3wCCP8
	 rJ9Gcb8kUJRyw==
Date: Sun, 3 Nov 2024 11:32:12 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	linux-actions@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] dt-bindings: power: actions,owl-sps: convert to YAML
Message-ID: <4cmyml3ng22wcohule4a6qwl2qyyblkbjydn7ceuxm4xu3jewa@wyd2ugtyfjf4>
References: <20241102221707.2857342-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241102221707.2857342-1-ivo.ivanov.ivanov1@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241103_023217_666094_B3755EFF 
X-CRM114-Status: GOOD (  14.84  )
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

On Sun, Nov 03, 2024 at 12:17:06AM +0200, Ivaylo Ivanov wrote:
> Convert the Actions Semi Owl Smart Power System (SPS) bindings to DT
> schema.
>=20
> Changes during conversion:
>  - Rename file to match compatible

Where?
Old file: actions,owl-sps
New file: actions,owl-sps


>  - Add a description
>=20
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---
>  .../bindings/power/actions,owl-sps.txt        | 21 --------
>  .../bindings/power/actions,owl-sps.yaml       | 50 +++++++++++++++++++
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 51 insertions(+), 22 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/power/actions,owl-s=
ps.txt
>  create mode 100644 Documentation/devicetree/bindings/power/actions,owl-s=
ps.yaml

=2E..

> +
> +maintainers:
> +  - Andreas F=C3=A4rber <afaerber@suse.de>
> +
> +description: |

Do not need '|' unless you need to preserve formatting.

> +  Actions Semi Owl SoCs feature a Smart Power System (SPS) that manages =
power
> +  domains to optimize power usage across various hardware blocks. Each p=
ower
> +  domain corresponds to a specific hardware block and is represented by =
a bit
> +  in the power control register and an acknowledgment bit, which is then
> +  translated into a corresponding voltage on a rail.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - actions,s500-sps
> +      - actions,s700-sps
> +      - actions,s900-sps
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#power-domain-cells":
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#power-domain-cells"
> +
> +additionalProperties: false

Blank line

With changes above:

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof


