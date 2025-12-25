Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EDDFE7AD41
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Dec 2025 08:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bXwihixJnLHyicZJYdUJaKd9nTtOlGiOfiQhSRCXDjE=; b=QamQl3pvZUC+LR5gx8+1HhGMbG
	bczsgqJM9dDN48PWsld3GoczbT9+CAdOxToIjS/WSdiIB4v/RIQR5FCP2eR1NwwtHTxixWtZCxP2b
	C/A+OMwWzJqC2KthOclOnqNn6BNcQW6Y2Jq4LxdgpREsC2qZsSlwHa6RZQf5FY2GOufCZ4v9xzvpe
	nCXe9LHMoJOePqO2Tn4NxmN6L2zE1utpAaN5X+HTCnueUVZ3gl95TUbDQgSLvWBPYKDqKS/U0diLI
	9OCK56WIlCngDS8JwxKtSnStt/x3iqXrtEj37eL9Mwbx4eNXQEumUU1VsZ2B9dn2ThyLAvUR5SV9L
	tnxjLykg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYhAE-00000000FJv-0tz9;
	Thu, 25 Dec 2025 08:57:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYhAC-00000000FJm-3Xzo;
	Thu, 25 Dec 2025 08:57:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 07B0D60010;
	Thu, 25 Dec 2025 08:57:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B75CCC4CEF1;
	Thu, 25 Dec 2025 08:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766653058;
	bh=JbAlLOSZ4lp2eqLIqN854RLD8F4hVgelu+B0u8PEklQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lnfOTwU4+apIYrQlSwNee5D+OFUc0kyNaJ05pnV9yb/rrNk++IRoErqOxaNYxdZEa
	 Ec47AbiAW7GQrAOPpJxhwUyFk3GwlFQEQRfhgssjeGhSVa6wLU6dwBw60W8FM84mVs
	 yC8zVz72FqK43BBWTQVtMlie6qtYNv26lZmyti6L1jM68UsNjdv8TR7S+FJAVtnMRU
	 J2NQ9Ww5JUohaY9eX0JlF3EXzJL3uDIU6lAvxuwzBAx5Jd67BAjgVB/99gI6165R20
	 zZg33ZqlOpxS9F+fIxawiBJlEPxthN07AQhbDtTL74uRxkodg76ILOdLMuqVRHNRnr
	 qrSppllPQyGpQ==
Date: Thu, 25 Dec 2025 09:57:34 +0100
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
Subject: Re: [PATCH 1/5] dt-bindings: Add Bao IPC shared memory driver binding
Message-ID: <20251225-translucent-radical-coot-d3f9ee@quoll>
References: <20251224135217.25350-1-joaopeixoto@osyx.tech>
 <20251224135217.25350-2-joaopeixoto@osyx.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251224135217.25350-2-joaopeixoto@osyx.tech>
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

On Wed, Dec 24, 2025 at 01:52:13PM +0000, joaopeixoto@osyx.tech wrote:
> From: Jo=C3=A3o Peixoto <joaopeixoto@osyx.tech>
>=20
> This patch adds a Device Tree binding for the Bao IPC shared memory
> device, which provides a standardized description of the hardware
> interface used for inter-VM communication in Bao-based systems.
>=20

All you emails bounced as spam, so you need tofix your email setup. I
found this only via lore.

> The binding documents the following properties:
>=20
>   - compatible: "bao,ipcshmem"
>   - reg: Memory region for the shared memory device
>   - id: Unique device identifier
>   - read-channel: [offset, size] for reading from the shared memory
>   - write-channel: [offset, size] for writing to the shared memory
>   - interrupts: Interrupts used by the device

Irrelevant. Drop.

>=20
> This enables kernel drivers and userspace tools to correctly
> instantiate and configure Bao IPC shared memory devices based
> on the DT description, facilitating efficient communication
> between VMs.
>=20

Irrelevant. Describe hardware.

> Signed-off-by: Jo=C3=A3o Peixoto <joaopeixoto@osyx.tech>
> ---
>  .../devicetree/bindings/bao/ipcshmem.yaml     | 99 +++++++++++++++++++
>  .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
>  2 files changed, 101 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/bao/ipcshmem.yaml


Filename matching compatible.
>=20
> diff --git a/Documentation/devicetree/bindings/bao/ipcshmem.yaml b/Docume=
ntation/devicetree/bindings/bao/ipcshmem.yaml
> new file mode 100644
> index 000000000000..398ac610c29f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/bao/ipcshmem.yaml
> @@ -0,0 +1,99 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/bao/ipcshmem.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Bao IPC Shared Memory Device
> +
> +maintainers:
> +  - Jos=C3=A9 Martins <jose@osyx.tech>
> +  - David Cerdeira <davidmcerdeira@osyx.tech>
> +  - Jo=C3=A3o Peixoto <joaopeixoto@osyx.tech>
> +
> +description: |
> +  Shared memory based communication device for Bao hypervisor guests.
> +  It allows the kernel to interface with guests running under
> +	the Bao hypervisor, providing a character device interface
> +	for exchanging data through dedicated shared-memory regions.
> +
> +properties:
> +  compatible:
> +    const: "bao,ipcshmem"
> +
> +  reg:
> +    description: |
> +      Memory resource for the shared memory device.
> +    maxItems: 4
> +    type: array
> +    items:
> +      type: integer


Don't send us LLM junk. Nothing here is even close to proper bindings,
which means:

1. You did not write it yourself, because it is impossible to come with
syntax like that (just does not exist),

2. Did not even bother to test it.


Best regards,
Krzysztof


