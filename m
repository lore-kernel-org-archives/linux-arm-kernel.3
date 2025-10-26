Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90648CCF9E9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Oct 2025 21:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0WTldmL9oTMS6u4MKLJnlEn4AliGa2nMZ19oon4JIo0=; b=i3fUVb43/5MSQn2H4b/4R6gckL
	ROP0i77+d081TbWrCLBStLCV/ShVavSPc8TSgLBv0wZrSQltG1URafESFfI/ZBANKCF5NCRLk1SDH
	mZF8vVD3xqsWaPJ09gAOu79dBaxJ1qSt5sD2WIMAomP5dEOAMtpOpMf3AY3J/eoRG9A+nlxKsS9J0
	f7ZAf+m2eTEEnxvF7FaIeGB76+GAF0csSw+BPBCZ6Un/ni/vGtLhAbUpp6iSnn7SgFgIUxgSQ7+lT
	NXJnKSAFKjLX121pDgyuBwQkzNU92azAU8MyvcwbRd9OQ9nFbIJ6BFZ6RriboYp3wHlKr8kPB1ENt
	GRUrAe4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD7zD-0000000CkRM-0JPe;
	Sun, 26 Oct 2025 21:09:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD7zA-0000000CkR1-1dHa
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Oct 2025 21:09:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6613643C34;
	Sun, 26 Oct 2025 21:09:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0288BC4CEE7;
	Sun, 26 Oct 2025 21:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761512947;
	bh=PgGZkxx9eVXClCW73EbY+KTGYweRYJk4TsXoUCP0ekU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lUR1M4l/hP8HpiVUCzrPwKHQLA71phjUp7BimzWp+4GClN0UQGwSfzsd8fVfX8wRV
	 0KoytM0amuJJnfRidVHRhWF4gVgqbUjaYBkx0UgwbwhUxE7brFWpTs3cfPKaXZM/I8
	 n6dJKg1SqGyGQ0zzhY5F6uCksj42hmsX7iazM8feVgjyg6S9EWHkRQHbXDLxKUzJbJ
	 c3RU3rCDY8rckM0EqsfDfWfpuz1NJQluvNWhvQ0sPexN6jKfSq5Uibhp/z7R5ims10
	 /y4N93U9eb/LS2ZoU9sCmehKWKB0ja+59U53OG8NS5eVEGuiB3tGhyqAPKBeWVZ09p
	 VJDTdJX0SgnXw==
Date: Sun, 26 Oct 2025 16:09:05 -0500
From: Rob Herring <robh@kernel.org>
To: iuncuim <iuncuim@gmail.com>
Cc: Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Andre Przywara <andre.przywara@arm.com>, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/6] dt-bindings: thermal: sun8i: Add A523 THS0/1
 controllers
Message-ID: <20251026210905.GA2941518-robh@kernel.org>
References: <20251025043129.160454-1-iuncuim@gmail.com>
 <20251025043129.160454-2-iuncuim@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251025043129.160454-2-iuncuim@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_140908_450377_19180B73 
X-CRM114-Status: GOOD (  17.81  )
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

On Sat, Oct 25, 2025 at 12:31:24PM +0800, iuncuim wrote:
> From: Mikhail Kalashnikov <iuncuim@gmail.com>
> 
> Add a binding for D1/T113s thermal sensor controller. Add dt-bindings
> description of the thermal sensors in the A523 processor.
> The controllers require activation of the additional frequency of the
> associated gpadc controller, so a new clock property has been added.
> 
> The calibration data is split into two cells that are in different areas
> of nvmem. Both controllers require access to both memory cell, so a new
> property nvmem-cells has been added. To maintain backward compatibility,
> the name of the old cell remains the same and the new nvmem-cell-names is
> called calibration-second-part
> 
> Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
> ---
>  .../thermal/allwinner,sun8i-a83t-ths.yaml     | 56 ++++++++++++++++++-
>  1 file changed, 53 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml b/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
> index 3e61689f6..b2f750ef2 100644
> --- a/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
> +++ b/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
> @@ -24,18 +24,23 @@ properties:
>        - allwinner,sun50i-h5-ths
>        - allwinner,sun50i-h6-ths
>        - allwinner,sun50i-h616-ths
> +      - allwinner,sun55i-a523-ths0
> +      - allwinner,sun55i-a523-ths1
>  
>    clocks:
>      minItems: 1
>      items:
>        - description: Bus Clock
>        - description: Module Clock
> +      - description: GPADC Clock
>  
>    clock-names:
>      minItems: 1
> +    maxItems: 2

How can the max be both 2 and...

>      items:
>        - const: bus
>        - const: mod
> +      - const: gpadc

...3 entries?

