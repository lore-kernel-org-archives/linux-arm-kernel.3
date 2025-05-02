Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E3BEC3ABA3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 07:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cL9ry67avK5wUuwY5F0+hSYyw2J7HavbDREmpHF8mHQ=; b=Y+SXGT5VLb4ScXPzcSX6RxTIWR
	bwmxHcCGwdrMRsS3DZl3xuh582CMVGnFFZ8EpLGKyOJIoYnxwWVxxxUCHZC3CAMHg49o65mNAfQMV
	tjDSWEHkdp2U3dhKtIpwENZMsbUFKjJnV/PXoYPmxpLpH7B/fZOCr43jKAX1S7KxosLd0xnBHyjUs
	ANklep6IQ+dqZhLT/V3GznrEX2UwXYzqeJHHFNX0gIxGh7kL7X06Bvaqp7Fifno347wZ7qX3AYlT1
	AZx/gbD3QPFpRhTnbKcml6kolh8bSxbIqc3Uv8wMMqH1koAGCs084YFNJw+r8CEPXabHdIkGp0OwT
	8tCdKGNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAkRI-000000013JT-33Dd;
	Fri, 02 May 2025 07:04:04 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAkPL-0000000135W-1FJz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 07:02:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D7DEEA4B84F;
	Fri,  2 May 2025 06:56:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA19BC4CEE4;
	Fri,  2 May 2025 07:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746169322;
	bh=PqKFG0JGTq4eNIheoo3AmOMJYkd1B6YTqiR8CVnXhYk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mVzAz7NOcx1ADL3FUVTSgq3yUEZzwYx7NJwUzsmRXywuZZfgaqRVVnbjTYnCBWn/+
	 ozbIFqkDfjOl4d3Rl+/Pp3ome9P5BtNz48awS8Hj+qfRGFbCrGJ74DTNvSaNx1bZ2P
	 t00t1/SwcM+Ir/whEIsspwLv4L0IolBjsDtpE/RIvY27YsVbbAzRkzcR6Nb5Bjub0k
	 7ZVTqC2pJ+5WH2BD/BUAT4eKVKVMvUnrztaNJcMa3Azyezp5xJ69v5vl0bw93YrOZZ
	 f6q0IPkxDDt0w2bQefK1iHmui6miOEE9S7u8wb739OslNMv4OgZDdNoEZIwPp/8ADm
	 J4mmDCmDZ2d0Q==
Date: Fri, 2 May 2025 09:01:59 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/6] dt-bindings: mfd: add bindings for QIXIS CPLD
Message-ID: <20250502-meticulous-bulky-wildebeest-c1a8b6@kuoka>
References: <20250430153634.2971736-1-ioana.ciornei@nxp.com>
 <20250430153634.2971736-2-ioana.ciornei@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250430153634.2971736-2-ioana.ciornei@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_000203_464853_920F8188 
X-CRM114-Status: GOOD (  16.85  )
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

On Wed, Apr 30, 2025 at 06:36:29PM GMT, Ioana Ciornei wrote:
> This adds device tree bindings for the board management controller -
> QIXIS CPLD - found on some Layerscape based boards such as LX2160A-RDB,
> LX2160AQDS, LS1028AQDS etc.
> 
> Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
> ---
>  .../bindings/mfd/fsl,qixis-i2c.yaml           | 65 +++++++++++++++++++
>  1 file changed, 65 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/fsl,qixis-i2c.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mfd/fsl,qixis-i2c.yaml b/Documentation/devicetree/bindings/mfd/fsl,qixis-i2c.yaml
> new file mode 100644
> index 000000000000..562878050916
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/fsl,qixis-i2c.yaml

Filename matching compatible.

> @@ -0,0 +1,65 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/fsl,qixis-i2c.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP's QIXIS CPLD board management controller
> +
> +maintainers:
> +  - Ioana Ciornei <ioana.ciornei@nxp.com>
> +
> +description: |
> +  The board management controller found on some Layerscape boards contains
> +  different IP blocks like GPIO controllers, interrupt controllers, reg-muxes
> +  etc.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - fsl,lx2160a-qds-qixis-i2c
> +      - fsl,lx2162a-qds-qixis-i2c
> +      - fsl,ls1028a-qds-qixis-i2c

Keep alphabetical order.

What is actual device name? I2C? Is this an I2C controller or device?

> +
> +  reg:
> +    description:
> +      I2C device address.

This says device, so i2c in compatible is wrong.

Anyway drop description, redundant.


> +    maxItems: 1
> +
> +  "#address-cells":
> +    const: 1

Why?

> +
> +  "#size-cells":
> +    const: 0

Why? Drop cells.

> +
> +  mux-controller:
> +    $ref: /schemas/mux/reg-mux.yaml#
> +
> +required:
> +  - "#address-cells"
> +  - "#size-cells"
> +  - compatible
> +  - reg

Keep same order as in properties

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        qixis@66 {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

> +            compatible = "fsl,lx2160a-qds-qixis-i2c";
> +            reg = <0x66>;
> +            #address-cells = <1>;
> +            #size-cells = <0>;

So were do you use address/size cells?

Best regards,
Krzysztof


