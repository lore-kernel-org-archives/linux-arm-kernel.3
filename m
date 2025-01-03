Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7CADE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 23:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=faZdw9QUN5Er4QA38ABhp/ScZ0EqG9moW0hYjr/gpug=; b=bC/4eylcJaZt0ce1Jg0uRAWiNR
	BLsJk99S4IDMDdm8NF3oKDZjb5ou9qh0POR9N/c+vEVNppgla8FQhNYLsc0EjUnMWjUBPelzL9HPI
	OYZ+jxgBShg1WQj6vZcpH6GleOeJfuxuy84NFwmVYysS82q0yPbjSPRLAAIp2Z5iTZroEdX+vR1I7
	V7vuYUHyO+HQ5WAcKjWEWDgFaIj+HI2CWu6u3gHAlDj/+i81LYT+9iBvCIUMGXir4vLuVTW04V7jv
	fJQImshYzMauV3IKZDp0cXjTOMSVGw2LFm6xtHsnDKJyXIXzOXhkwZu7PJzJnZ7Bxitn1catkhNjy
	CkC/Ranw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTrXF-0000000EE6D-04fg;
	Fri, 03 Jan 2025 23:56:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTrVy-0000000EDyj-2prM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 23:55:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C66C81480;
	Fri,  3 Jan 2025 15:56:02 -0800 (PST)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ADEB73F59E;
	Fri,  3 Jan 2025 15:55:32 -0800 (PST)
Date: Fri, 3 Jan 2025 23:54:29 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Lukas Schmid <lukas.schmid@netcube.li>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Linus Walleij <linus.walleij@linaro.org>, Maxime Ripard
 <mripard@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: vendor-prefixes: Add NetCube
 Systems Austria name
Message-ID: <20250103235429.672f09fe@minigeek.lan>
In-Reply-To: <20250103204523.3779-2-lukas.schmid@netcube.li>
References: <20250103204523.3779-1-lukas.schmid@netcube.li>
	<20250103204523.3779-2-lukas.schmid@netcube.li>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_155538_770935_B8F1989B 
X-CRM114-Status: GOOD (  13.60  )
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

On Fri,  3 Jan 2025 20:45:17 +0000
Lukas Schmid <lukas.schmid@netcube.li> wrote:

> Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>

double Signed-off-by:

Also can please add a single line briefly saying what the company does
or produce, maybe add an URL?
In general some text in the body of the commit message is always
appreciated, even if it repeats the subject line (check the other
commits to that file).

Cheers,
Andre

> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index da01616802c7..a30ed9547098 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -1027,6 +1027,8 @@ patternProperties:
>      description: Neofidelity Inc.
>    "^neonode,.*":
>      description: Neonode Inc.
> +  "^netcube,.*":
> +    description: NetCube Systems Austria
>    "^netgear,.*":
>      description: NETGEAR
>    "^netlogic,.*":


