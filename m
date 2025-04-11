Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71111C369AE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 15:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xsb2AUZIjAWl0RyvhOUhriYvN8BcMbO+VWCctrPK8bE=; b=jGDnCZQN/cLhAVgFHi+n27ruwb
	2eKdi2KsY/cn++IigSLq48A4TIqrfFZohtDWWDsrW1L4L5sxh85oKd6FNU+gajJPc+MgvK8wc2FRr
	DlkJbgQNd3+EDu6IktQdl/7Xgb/d28HWOfKqLgTLktBpxNSf7qwv6xb8ffXmFDgAgQZj31uY3EEGw
	9LkltLjsk8XoafLa2E7teUIjHqKzxbDxYmdAqQ9oNhGC8nWi4HegMZNrPS9jItiC3PSqqqb9Q5F+f
	Gvt2HcYsSvfVOsojJlP0od1A+uqeYbmfS2O2VTyOqtZvqP3O5cEvhHVkNXs4DPIiapF+JjSXYF6Cp
	l4xW1UEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3GFv-0000000EEXw-3T6J;
	Fri, 11 Apr 2025 15:25:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3GAO-0000000EDti-2lNk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 15:19:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 15DDF44F95;
	Fri, 11 Apr 2025 15:19:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9645FC4CEE2;
	Fri, 11 Apr 2025 15:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744384779;
	bh=vK4hBPEXs8FNoXNcakuV1C4xG7hZYj/TGbBMPIdQDTE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V1keGl/Uu6TBpFoOv7sGSO8j/L1duKmpvUyzGeMphzNSVrghWWyrDGX+zZE4hFYrI
	 qsBkUXvqjDNgTPM3q+qyq4y/wUyPFHZHefZ3OGUEoYWjuQaogeP4XgN9N0swNfZ5gs
	 iFioleiJiVLOTzyRq0kZElX0DLCNLl8pIueakWNbdyxF6vmYshKksgDf/mUCZWPAbP
	 kOX7RpyJq5GgY3Cynd0/g5QaPCx+5W+MNMflhVp/rBPh0sFe7XEfqSnv6lF1mmk7h+
	 ZO4FyW0MUN4HFEK7RsMl9digzBtVetFiG2Bnkdot5sYR2aokSGfXdQoio7TkOmoy8Y
	 gQgf8z0uD5zkA==
Date: Fri, 11 Apr 2025 10:19:38 -0500
From: Rob Herring <robh@kernel.org>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li <Frank.li@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/6] dt-bindings: bus: document the IMX AIPSTZ bridge
Message-ID: <20250411151938.GA3265073-robh@kernel.org>
References: <20250408154236.49421-1-laurentiumihalcea111@gmail.com>
 <20250408154236.49421-2-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408154236.49421-2-laurentiumihalcea111@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_081940_737726_2FA92769 
X-CRM114-Status: GOOD (  16.00  )
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

On Tue, Apr 08, 2025 at 11:42:31AM -0400, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> 
> Add documentation for IMX AIPSTZ bridge.
> 
> Co-developed-by: Daniel Baluta <daniel.baluta@nxp.com>
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> ---
>  .../bindings/bus/fsl,imx8mp-aipstz.yaml       | 104 ++++++++++++++++++
>  1 file changed, 104 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml
> 
> diff --git a/Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml b/Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml
> new file mode 100644
> index 000000000000..3e2ada7fcdf9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml
> @@ -0,0 +1,104 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/bus/fsl,imx8mp-aipstz.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Secure AHB to IP Slave bus (AIPSTZ) bridge
> +
> +description:
> +  The secure AIPS bridge (AIPSTZ) acts as a bridge for AHB masters issuing
> +  transactions to IP Slave peripherals. Additionally, this module offers access
> +  control configurations meant to restrict which peripherals a master can
> +  access.
> +
> +maintainers:
> +  - Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> +
> +properties:
> +  compatible:
> +    const: fsl,imx8mp-aipstz
> +
> +  reg:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 1
> +
> +  "#access-controller-cells":
> +    const: 3
> +    description:
> +      First cell - consumer type (master or peripheral)
> +      Second cell - consumer ID
> +      Third cell - configuration value

Generally the ID would be first though providers can really define 
whatever they want.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

