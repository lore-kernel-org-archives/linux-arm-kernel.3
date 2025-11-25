Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1C66CFD37A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 10:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2+9YBDXHqBUa2v1B4cTTMKj0S90+jF0fEG54YT9ATyI=; b=No1grvkigCulWMX7fiTvLghWfH
	j808zbo/0UFkVRJ6QD6VsjYJSkTPKxgr0XalIJ4zpEsIHEKYSTnTfLl055e+g8G9xeLKStVjPoOFL
	fLmPcGR7/VjTEttxLuMmmAQvR4cua4gu0k+GHONKyiRJpLh/QTHSNDWzF0gHo1cUZ0FFDfwX2bls2
	i3gU1sTwL76WZNKv9gNkWOYESNGXWtb5bgXbpNTvOLn9eXCKasFsx7c+n0neueKQDWTc3GhRSHRXK
	yIP1cnLddu0nRbqZdCEipAUBjIFIiZj26KSXh3KMBuhRDzQduyTHHga7V3G/TNw14DefzockctpzL
	p7tSpYKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNpyo-0000000D65a-2nlH;
	Tue, 25 Nov 2025 10:09:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNpyn-0000000D65D-45jz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 10:09:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1350F60007;
	Tue, 25 Nov 2025 10:08:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 398A2C4CEF1;
	Tue, 25 Nov 2025 10:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764065310;
	bh=u7nA8naH/Nk9T87dm41ugNF9Vzr3Lh/Iymt452RomTg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hRz+24KfBodAGNL8IFDfGJ0QkUudCNBdNY9ZNHQtdwYNAUSVaqgt/Tk52Xmj2/Aqq
	 bEmb0rGfzn1u2Zc0Z1gC/15v2TORcGcjDmHkkInQqm8DCsVVPYvwwK6WuE4gJlCh5z
	 Pi2tTNpuxdaHcoEs7+bxKTefAm8oQqC+djtd5qxcuIgmct2iff/pE+qDfDXvomGCir
	 gib0/xgHUjrSfREz/5TWiREiDlJOhAtDzM0FrRUuEfqsf4RqEtl2IDJFHBjA4apqGQ
	 QCsb798xUluwf1mNvgDqmCP9N5VPXTHgx3EbV+GySq8FXpIfxtZGz0ks9ZyxBj0EbS
	 7LGcLW1mMn/Iw==
Date: Tue, 25 Nov 2025 11:08:28 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	chrome-platform@lists.linux.dev, Julius Werner <jwerner@chromium.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: firmware: coreboot: Convert to YAML
Message-ID: <20251125-outgoing-boisterous-millipede-6dabaf@kuoka>
References: <20251125064851.3781993-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251125064851.3781993-1-wenst@chromium.org>
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

On Tue, Nov 25, 2025 at 02:48:49PM +0800, Chen-Yu Tsai wrote:
> Convert the existing text binding to YAML.
> 
> The description has been change to reflect the possibility of coreboot
> inserting the node itself.
> 
> The example has been modified to compile and pass validation without
> any errors. A comment was added to note what the firmware actually
> emits.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  .../devicetree/bindings/firmware/coreboot.txt | 33 ----------
>  .../bindings/firmware/coreboot.yaml           | 60 +++++++++++++++++++
>  2 files changed, 60 insertions(+), 33 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/firmware/coreboot.txt
>  create mode 100644 Documentation/devicetree/bindings/firmware/coreboot.yaml
> 
> diff --git a/Documentation/devicetree/bindings/firmware/coreboot.txt b/Documentation/devicetree/bindings/firmware/coreboot.txt
> deleted file mode 100644
> index 4c955703cea8..000000000000
> --- a/Documentation/devicetree/bindings/firmware/coreboot.txt
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -COREBOOT firmware information
> -
> -The device tree node to communicate the location of coreboot's memory-resident
> -bookkeeping structures to the kernel. Since coreboot itself cannot boot a
> -device-tree-based kernel (yet), this node needs to be inserted by a
> -second-stage bootloader (a coreboot "payload").
> -
> -Required properties:
> - - compatible: Should be "coreboot"
> - - reg: Address and length of the following two memory regions, in order:
> -	1.) The coreboot table. This is a list of variable-sized descriptors
> -	that contain various compile- and run-time generated firmware
> -	parameters. It is identified by the magic string "LBIO" in its first
> -	four bytes.
> -	See coreboot's src/commonlib/include/commonlib/coreboot_tables.h for
> -	details.
> -	2.) The CBMEM area. This is a downward-growing memory region used by
> -	coreboot to dynamically allocate data structures that remain resident.
> -	It may or may not include the coreboot table as one of its members. It
> -	is identified by a root node descriptor with the magic number
> -	0xc0389481 that resides in the topmost 8 bytes of the area.
> -	See coreboot's src/include/imd.h for details.
> -
> -Example:
> -	firmware {
> -		ranges;
> -
> -		coreboot {
> -			compatible = "coreboot";
> -			reg = <0xfdfea000 0x264>,
> -			      <0xfdfea000 0x16000>;
> -		}
> -	};
> diff --git a/Documentation/devicetree/bindings/firmware/coreboot.yaml b/Documentation/devicetree/bindings/firmware/coreboot.yaml
> new file mode 100644
> index 000000000000..568afd1abb92
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/firmware/coreboot.yaml
> @@ -0,0 +1,60 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/firmware/coreboot.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: COREBOOT firmware information

Coreboot

> +
> +maintainers:
> +  - Julius Werner <jwerner@chromium.org>
> +
> +description:
> +  The device tree node to communicate the location of coreboot's
> +  memory-resident bookkeeping structures to the kernel. Coreboot's
> +  FIT image payload can insert the node into the device tree. If a
> +  second-stage bootloader (a coreboot "payload") is used, then it
> +  is responsible for inserting the node.
> +
> +properties:
> +  compatible:
> +    const: coreboot

Blank line (it is always here, there is no example without, which makes
me wonder which file you took as starting point)

> +  reg:
> +    description: Address and length of the following two memory regions

Drop description, redundant.

> +    items:
> +      - description:
> +          The coreboot table. This is a list of variable-sized descriptors
> +          that contain various compile- and run-time generated firmware
> +          parameters. It is identified by the magic string "LBIO" in its first
> +          four bytes.
> +
> +          See coreboot's src/commonlib/include/commonlib/coreboot_tables.h for
> +          details.
> +      - description:
> +          The CBMEM area. This is a downward-growing memory region used by
> +          coreboot to dynamically allocate data structures that remain resident.
> +          It may or may not include the coreboot table as one of its members. It
> +          is identified by a root node descriptor with the magic number
> +          0xc0389481 that resides in the topmost 8 bytes of the area.
> +
> +          See coreboot's src/include/imd.h for details.
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    firmware {
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        ranges;
> +
> +        /* Firmware actually emits "coreboot" node without unit name */
> +        coreboot@fdfea000 {
> +            compatible = "coreboot";
> +            reg = <0xfdfea000 0x264>, <0xfdfea000 0x16000>;

That's the same address in both places, so the same one entry. You need
two distinctive addresses or binding needs changes to have only one item
as well.

Best regards,
Krzysztof


