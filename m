Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8112AF01804
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 08:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L6TdC5k1p5GaJSEaLydqyl5p2fBDov4BzMHVRDTC1ww=; b=jtPIGQVIgaVYIbewKqVlzaKIHO
	28iz4FXevYvibp02TjDWBN+Ht0xRlB05PWT2GHOvNsrfvzMy5cj7omZpchWZ6emNEbtkw5otqZkxs
	+9cyptI4OQx+rOzbBlB8iJTk5PgkCdv6/v+uB2g41k9vFxFVNgt3p1FnLdtmDcYFfw0wjwCFhGhXP
	JI0eswF7DvQdFHgoxBWBPs9Cc+5UBQOGLpAgwyVYdN5ZTZj70ulpDARF4wHsm3sT/IEywHIrnvt45
	OBEem8DRRMXg9MIbkveEvDiuKOu6I97fKj+GQgGAdNOTRrBKV+sXA215j4OW+ot3qzye5Xjh0GrJr
	+ddKRMsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyQIZ-00000003Ezl-3LmA;
	Fri, 06 Mar 2026 08:12:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyQIW-00000003EzB-3GKA;
	Fri, 06 Mar 2026 08:12:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BD7F740255;
	Fri,  6 Mar 2026 08:12:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15C86C4CEF7;
	Fri,  6 Mar 2026 08:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772784755;
	bh=h+z249gV6PAJH9owWYSdR8qaCEpXc1fgT56hlLiF91g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P/MtQQK35+UL1G4MEUOMiP/QhBn6qCoG3+kg/aoqkPqouo2jWMblRH/6EOGkkbYFB
	 qdR3LE7bD2m0x6N/IjNNV05sB4U9aACZi0azgBxYIaPgNpRSHbeYJpSJLZdOIM29tl
	 t+4vnDaYJmATS0YHs8zKjM2wIHqv/aqKTPkcFMwMGiVF37DKcGyyfwbKDeBvn94Rpy
	 wtw9d7Lhs7/cOjx9iHwkfFNpXyyTewj7qTiQYDSGpXnB3g01YZa8evSzIDQR6VNu2w
	 uY3OHPQWnRNQ7d1HveUYrcvaXnztZg+6vjXhgiQMN1lXzgCoP61/p8mXGhN/QpAH0J
	 KHenjzGkj7y1g==
Date: Fri, 6 Mar 2026 09:12:33 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jian Hu <jian.hu@amlogic.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Stephen Boyd <sboyd@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, robh+dt <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, 
	linux-amlogic <linux-amlogic@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Ronald Claveau <linux-kernel-dev@aliel.fr>
Subject: Re: [PATCH 2/3] dt-bindings: clock: amlogic: t7: Add missing mpll3
 parent clock
Message-ID: <20260306-monumental-nuthatch-from-avalon-bf108b@quoll>
References: <20260305074328.639993-1-jian.hu@amlogic.com>
 <20260305074328.639993-3-jian.hu@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260305074328.639993-3-jian.hu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_001236_835336_B1430850 
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

On Thu, Mar 05, 2026 at 03:43:26PM +0800, Jian Hu wrote:
> The mpll3 clock is a valid parent clock for sd_emmc and mipi_isp on
> the Amlogic T7 SoC, but was missing from t7-peripherals-clkc.yaml.
> Add it to enable proper clock parent configuration for these peripherals.
> 
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> ---
>  .../bindings/clock/amlogic,t7-peripherals-clkc.yaml       | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/amlogic,t7-peripherals-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,t7-peripherals-clkc.yaml
> index 55bb73707d58..27cc1f331587 100644
> --- a/Documentation/devicetree/bindings/clock/amlogic,t7-peripherals-clkc.yaml
> +++ b/Documentation/devicetree/bindings/clock/amlogic,t7-peripherals-clkc.yaml
> @@ -24,7 +24,7 @@ properties:
>      const: 1
>  
>    clocks:
> -    minItems: 14
> +    minItems: 15
>      items:
>        - description: input oscillator
>        - description: input sys clk
> @@ -40,12 +40,13 @@ properties:
>        - description: input gp1 pll
>        - description: input mpll1
>        - description: input mpll2
> +      - description: input mpll3

Nah, ABI break. You add it to the end of the list or provide arguments
on ABI impact.

Best regards,
Krzysztof


