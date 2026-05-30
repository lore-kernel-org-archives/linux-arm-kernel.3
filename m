Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E5EECD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 May 2026 11:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SHRa6UjIjIDOALcWPJeJhsJlvcKElI4XI1iQ+YZgaB8=; b=rmw/jvKKwHj+Z4BWS0LemCuJ0B
	MBgLiufbMxuG5eiPBaiPLYQXYbCcpnXuNiwhpyt++ikpKUwNNa/85NeiBe2TmYFftzUeekY7lxdJh
	zQAeCREhTdNiJSCKCWoquU102LFcxe/20Wc/G6o2CoIL0Auw011wj8iITGLrzfTWMidXoQsRa3BS3
	BDwm9BUPVf7DcAvHeyR4TuTqVkR7XMzk/i9R9D4N84IlC3rxuWSEFPwVcjFuoeC8cCe5BTBezfuUv
	VMXhpxpoY4h9mGmN+CCj976Jpm8RHbn4ThMQyQLPsSUOpC0bwq0RLflj8i/cHxzSTypU1yXwoiHUQ
	1O25Pdeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTI3G-00000008h0Z-3WPh;
	Sat, 30 May 2026 11:40:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTI3F-00000008h0J-3NfO
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 May 2026 11:40:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2D733600B0;
	Sat, 30 May 2026 11:40:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50E0D1F00893;
	Sat, 30 May 2026 11:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780141224;
	bh=SHRa6UjIjIDOALcWPJeJhsJlvcKElI4XI1iQ+YZgaB8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=R+J31+TibFmUARYT9O5enYAFt6RbASfiRNsiz8tkpC2j5k2KCR8rt+lLFj7TTM4Do
	 rNFtR0eWsW8lz31Nc+sc6wEBhfaFcnk47eFUYBlEPGP46buZceYUR5ofYDr3LBvIOs
	 6a2HoHdsYP5M+DwO5QuBpl3N5tk7STH6vBrzhTxtgFvmcrq6XSu7FNU0YDZdoj0uZ8
	 h86HWfIQPf6KUmgMqhhva5HBuMbIOan8x5dgEvd/1KCFclu5HqCqsRsypGcwQcBOOJ
	 Le8V/qXbEMh+36XkAQAgf6+Qf92J/DVPE0rE04r/X3X6t4SGWsZVyvnZL+lXChLOu9
	 Aju4R6HiO7q2g==
Date: Sat, 30 May 2026 13:40:22 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Abraham I <kishon@kernel.org>, Roger Quadros <rogerq@kernel.org>, 
	Devarsh Thakkar <devarsht@ti.com>, Swamil Jain <s-jain1@ti.com>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/6] dt-bindings: soc: ti: ti,j721e-system-controller:
 Relax the bindings
Message-ID: <20260530-kind-asparagus-vicugna-b710fb@quoll>
References: <20260528-ti-main-conf-v1-0-a54ac5c8d081@ideasonboard.com>
 <20260528-ti-main-conf-v1-4-a54ac5c8d081@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260528-ti-main-conf-v1-4-a54ac5c8d081@ideasonboard.com>
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

On Thu, May 28, 2026 at 03:53:45PM +0300, Tomi Valkeinen wrote:
> The ti,j721e-system-controller binding specifies a specific schema for
> each child node. For example, any clock node under the system controller
> node must be a ti,am654-serdes-ctrl.
> 
> To be able to use the same system-controller binding for more SoCs,
> relax the bindings by making both clock-controller and clock accept any

NAK, you cannot relax bindings.

> kind of child node.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  .../devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml      | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml b/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
> index f3bd0be3b279..56712ebdd01b 100644
> --- a/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
> +++ b/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
> @@ -53,9 +53,8 @@ patternProperties:
>  
>    "^clock-controller@[0-9a-f]+$":
>      type: object
> -    $ref: /schemas/clock/ti,am654-ehrpwm-tbclk.yaml#

No, child nodes cannot be generic (see also writing bindings). You must
have $ref or use the compatible style.

Best regards,
Krzysztof


