Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B89DCE7AD42
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Dec 2025 08:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ry8P1twIqNVLxMbsKHIj30vXi/br9lbZ5zciWlICuM8=; b=GjH99WWrkE2hArmYCBImdAUSTH
	qO4TLthbYaTdHauvl9CLy/62m6/thdkAUFV4J73I3Uk4KJK2spSOqL8A2vAnBxLB7M8bmdcvZF5aG
	T9GSF5jGmmyslqonYI+h2iDihBl65zWu0imMNGDRUX5y5xLTxq9PAeuZF2QPjfwqoYfv7CL8bSyJ1
	lhNCLqJz3IQjRV+UUuyyHBfJoxobtaB2qsuVUb09dd4vBlRJYwpUiwtAnpDeuLJLC/VhCRTUyi9rC
	eFJw3QvTIpKlBWl75CkPdwBUiB/2ANvG35RmhgtLFufqiL3B/XLXMssNg9G7nN4vX/uIb68HjrvqH
	5MKCmQrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYhBQ-00000000FWG-0OBE;
	Thu, 25 Dec 2025 08:58:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYhBN-00000000FVg-2NGM;
	Thu, 25 Dec 2025 08:58:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2D5CE4368D;
	Thu, 25 Dec 2025 08:58:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C857C4CEF1;
	Thu, 25 Dec 2025 08:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766653132;
	bh=/A+yXLh20ez+7i2+8SVOqk3ST9vTqSm2NSu9yEp1zd0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P+V87cK7bn9U79Nf0tAGfZtyUU2140czUzXeGJE360fE7oeh6bd5wMGmqdgrabXyJ
	 R6Z6Ulpatmeh6LKAtKpLURsgpfUUzK5oRG6cU2xPYbnsKA/Tx6JHFg0OTp7NDVYHox
	 Frb3L8IJ7KT7ehj9sbtAWuIGh3+7RQ5vwlQ0e9GRDy7HmBdkm3r/buf5VZSdZZPJJe
	 sXI7Ti7aKe/HoAZBfRT3/PzIVfGacfFjggYBVQhydk7iyOzLqHKJZYBZojYstMH6DX
	 Z4pBE1F2watS2QaCZ7ZeDq7yEMPqFs+0v7cXoL9DgUjnAoL99STy3VqXtwiT2a5X1M
	 V/JGXSpM34cFA==
Date: Thu, 25 Dec 2025 09:58:48 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: joaopeixoto@osyx.tech
Cc: linux-kernel@vger.kernel.org, ajd@linux.ibm.com, alex@ghiti.fr, 
	aou@eecs.berkeley.edu, bagasdotme@gmail.com, catalin.marinas@arm.com, 
	conor+dt@kernel.org, corbet@lwn.net, dan.j.williams@intel.com, 
	davidmcerdeira@osyx.tech, devicetree@vger.kernel.org, dev@kael-k.io, 
	gregkh@linuxfoundation.org, haren@linux.ibm.com, heiko@sntech.de, jose@osyx.tech, 
	kever.yang@rock-chips.com, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux@armlinux.org.uk, linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	maddy@linux.ibm.com, mani@kernel.org, nathan@kernel.org, neil.armstrong@linaro.org, 
	palmer@dabbelt.com, pjw@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	robh@kernel.org, will@kernel.org
Subject: Re: [PATCH 3/5] dt-bindings: Add Bao I/O dispatcher driver binding
Message-ID: <20251225-modest-faithful-mouflon-1c7d63@quoll>
References: <20251224135217.25350-1-joaopeixoto@osyx.tech>
 <20251224135217.25350-4-joaopeixoto@osyx.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251224135217.25350-4-joaopeixoto@osyx.tech>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251225_005853_663131_4F767D75 
X-CRM114-Status: GOOD (  17.82  )
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

On Wed, Dec 24, 2025 at 01:52:15PM +0000, joaopeixoto@osyx.tech wrote:
> From: Jo=C3=A3o Peixoto <joaopeixoto@osyx.tech>
>=20
> This patch adds a Device Tree binding for the Bao I/O Dispatcher kernel
> module, which can be loaded into backend VMs. The I/O Dispatcher
> provides the bridge between the Bao hypervisor Remote I/O system and the
> frontend device model in userspace, offering a unified API to support
> various VirtIO backends.
>=20
> The dispatcher handles hypercalls to the Bao hypervisor, IRQ/eventfd
> forwarding, and provides a character device interface for frontend
> devices, enabling efficient communication between the hypervisor and
> userspace device models.
>=20
> The binding documents the following properties:
>   - compatible: "bao,io-dispatcher"
>   - reg: Memory regions for the dispatcher (multiple VirtIO devices)
>   - interrupts: Interrupts used by the devices
>   - interrupt-parent: Parent interrupt controller
>=20
> This enables kernel drivers to correctly instantiate and configure Bao
> I/O Dispatcher modules based on the DT description.
>=20
> Signed-off-by: Jo=C3=A3o Peixoto <joaopeixoto@osyx.tech>
> ---
>  .../bindings/bao/io-dispatcher.yaml           | 67 +++++++++++++++++++
>  1 file changed, 67 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/bao/io-dispatcher.y=
aml
>=20
> diff --git a/Documentation/devicetree/bindings/bao/io-dispatcher.yaml b/D=
ocumentation/devicetree/bindings/bao/io-dispatcher.yaml
> new file mode 100644
> index 000000000000..7795f55d3ff9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/bao/io-dispatcher.yaml
> @@ -0,0 +1,67 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/bao/io-dispatcher.yaml#"

You did not even bother to test it.

> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Bao I/O Dispatcher Device
> +
> +maintainers:
> +  - Jo=C3=A3o Peixoto <joaopeixoto@osyx.tech>
> +  - Jos=C3=A9 Martins <jose@osyx.tech>
> +  - David Cerdeira <davidmcerdeira@osyx.tech>
> +
> +description: |
> +  I/O Dispatcher device for Bao hypervisor guests. Handles multiple Virt=
IO
> +  backend devices and their interrupts.
> +
> +properties:
> +  compatible:
> +    const: "bao,io-dispatcher"
> +    description: Device compatible string.
> +
> +  reg:
> +    description: |
> +      Memory regions for each VirtIO backend device.
> +    maxItems: 20
> +    type: array
> +    items:
> +      type: integer

Don't send us LLM junk. You cannot come with such syntax, it does
not exist. Sending such LLM output is disregard to our time.

NAK


Best regards,
Krzysztof


