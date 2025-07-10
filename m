Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E137C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 01:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u6/MA450py4tjg2eJ53Pnbhg941ft9mkWuJhZ+WS79s=; b=Ej8d9XPchpsJERe9oeF7kVCV1d
	uSBD9UIxtL6Gybr6JfzY6dvkZv6QMrBm3KypNnZBiE9z8bYWQww33KzJ3yaNMrpuEZ27+GBkoVNbi
	M2CGVBRDa//aM29x+211a2TZm9ZJQaCtRdJgsOZ/uKV+HVm0pofxpl7v0GtNbR305ILGVtU0w5hSs
	c8Cx1dx602dQNcCayva3OgPNNeJcTZ0CCGqHluNUFWTgnt9MK/nZNmjyQwUnxoyPjZWysozSPNNom
	dc4g3WyC/xlVSJpGeMtDEYm44UfMt6yPOmx2Q2p0/CFtyvn3YtQJGsZiZrSYyLNTCEzMTLV4Qamb5
	I8ztuOyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua2QB-0000000DQ5a-1EZC;
	Fri, 11 Jul 2025 01:19:27 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZzKg-0000000D7BH-0br6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 22:01:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 76628A5483E;
	Thu, 10 Jul 2025 22:01:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0E02C4CEE3;
	Thu, 10 Jul 2025 22:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752184893;
	bh=7aAzz1o5S+01R78QDUVFrJ+DlKfEpY+7TzVUQpp1E6I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WTOqF03sSwmZHeR156aYiCot5scR9c+CPH/640u/Iu3vF/A1U1a9FW0MQqOTs1LHD
	 e4+qzT+l1k3CsdL30DbRG7rxrJhmmdW/h9725uOokiuut1H3s1lR2XG+pFi27cKKvI
	 D65EEJx2RJC+cJuqDcgR+4UmhWdjQfqkjKGjC2ym0SSOLmoPGrDlXnyiV1MmgBvMZq
	 sLzdWZ/EjVI+Yufy9dSr4pkKec1LgA/7cqJqlMoMCsgYnGR0+Cw/I/ApJo5G7s96Qp
	 Ag1Q3zKCqN3Zr614m+Bj/05uy6PS3AqSiCXEC/wUGpbuBl5Yrx81XX6OH5TcpLmWRM
	 S2yOTOGZnymIA==
Date: Thu, 10 Jul 2025 17:01:32 -0500
From: Rob Herring <robh@kernel.org>
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Shawn Guo <shawnguo@kernel.org>, Michael Walle <mwalle@kernel.org>,
	Lee Jones <lee@kernel.org>, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 1/9] dt-bindings: gpio: add bindings for the QIXIS FPGA
 based GPIO controller
Message-ID: <20250710220132.GA4038128-robh@kernel.org>
References: <20250709112658.1987608-1-ioana.ciornei@nxp.com>
 <20250709112658.1987608-2-ioana.ciornei@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250709112658.1987608-2-ioana.ciornei@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_150134_254110_7627F344 
X-CRM114-Status: GOOD (  16.46  )
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

On Wed, Jul 09, 2025 at 02:26:50PM +0300, Ioana Ciornei wrote:
> Add a device tree binding for the QIXIS FPGA based GPIO controller.
> Depending on the board, the QIXIS FPGA exposes registers which act as a
> GPIO controller, each with 8 GPIO lines of fixed direction.
> 
> Since each QIXIS FPGA layout has its particularities, add a separate
> compatible string for each board/GPIO register combination supported.

This could be covered in my proposed trivial gpio schema[1].


> 
> Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
> ---
>  .../bindings/gpio/fsl,fpga-gpio.yaml          | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/fsl,fpga-gpio.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpio/fsl,fpga-gpio.yaml b/Documentation/devicetree/bindings/gpio/fsl,fpga-gpio.yaml
> new file mode 100644
> index 000000000000..dc7b6c0d9b40
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/fsl,fpga-gpio.yaml
> @@ -0,0 +1,44 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/fsl,fpga-gpio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: GPIO controller embedded in the NXP QIXIS FPGA
> +
> +maintainers:
> +  - Ioana Ciornei <ioana.ciornei@nxp.com>
> +
> +description: |
> +  This module is part of the QIXIS FPGA found on some Layerscape boards such as
> +  LX2160ARDB and LS1046AQDS. For more details see
> +  ../board/fsl,fpga-qixis-i2c.yaml.

Or this is simple enough, just add this as a child node in that schema.

Rob

[1] https://lore.kernel.org/all/20250701225355.2977294-1-robh@kernel.org/

