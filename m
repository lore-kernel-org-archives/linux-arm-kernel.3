Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72BD1CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 19:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s8S7WoXplidwr+xRKazA1U1HhKSkze41IbIqi3Q6zgM=; b=XHtQbMluubYRl44DqrOE0jfxkr
	oXq/w/pvuVmb11SiIZECEIeA3yqjuk3cVwSHcl2ssg3nuMCNR5dmpkPYr8n6OVIRGpOyFOjnTcklW
	YakW9rEij8cscN2Q5GP0JtouZMe2YoYp92zPGVI2oz7p1oUlpJVcko3ZX6+QOI1KHPk7mccBHOxHL
	Z+8bzR2M1N3tQJdQYMuurlbn+ewBHQTkd/v6/GhOmdgwEYMCrOjLYOO0luhwwSSJpSWy1XZshukAV
	Px0iruLG94ViNGihMbodG1EKkBs+LymVrf8bZEjmovo/J3h+q3Bqxad11RWpZGu6mDNBeOYVhey6d
	yGRW+NcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3fda-000000062Eu-1Eju;
	Tue, 30 Sep 2025 19:03:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3fdX-000000062EE-3T7r
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 19:03:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1FF1740613;
	Tue, 30 Sep 2025 19:03:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A76E7C4CEF0;
	Tue, 30 Sep 2025 19:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759259023;
	bh=AZxrLp8OOgE9Fe/5yxu0UAM2BjE+WoXMpwylLndNoAs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b11055aY0q7tL4OtPHKpm0Z90OeLlEWWY7RX5CphbCoLo55xB7BcJXhqc5SCJZ2k0
	 oOE+mBzvIt1JlQKTFch2VWr4pC7j9nKJv/XTryttWLkMnWcmrKE/zX8KXThMDD0jFl
	 C0uyxFKTtO0Z0/6W7StwaeTZ4jcu8p/HUQ3Oh7zN1Ya8flrIjRp3YQUMTHm+K3YgUH
	 7UDjC/biQ7okaPMbcFuUr+YACkTdSWmd9U9ntt35RI96uyLEvnC+4PXP4TnTUpQY85
	 XcSSNqE+u1HtPUrMfBUJBIyWScXyebAaJoqYdGr3ZAg33uRekTFUcVfpBJUd4h5XGT
	 tqatpK10Cs50w==
Date: Tue, 30 Sep 2025 20:03:38 +0100
From: Conor Dooley <conor@kernel.org>
To: Kamal Dasu <kamal.dasu@broadcom.com>
Cc: bcm-kernel-feedback-list@broadcom.com, andersson@kernel.org,
	baolin.wang@linux.alibaba.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, florian.fainelli@broadcom.com,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: hwlock:  Adding brcmstb-hwspinlock
 support
Message-ID: <20250930-slapstick-volatile-60ad540f4b66@spud>
References: <20250929200628.3699525-1-kamal.dasu@broadcom.com>
 <20250929200628.3699525-2-kamal.dasu@broadcom.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qr7aKkWVgBLL5FHz"
Content-Disposition: inline
In-Reply-To: <20250929200628.3699525-2-kamal.dasu@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_120343_907318_B153A48E 
X-CRM114-Status: GOOD (  17.63  )
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


--qr7aKkWVgBLL5FHz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 29, 2025 at 04:06:24PM -0400, Kamal Dasu wrote:
> Adding brcmstb-hwspinlock bindings.
>=20
> Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
> ---
>  .../hwlock/brcm,brcmstb-hwspinlock.yaml       | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwlock/brcm,brcmstb=
-hwspinlock.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwspin=
lock.yaml b/Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwspinloc=
k.yaml
> new file mode 100644
> index 000000000000..f45399b4fe0b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwspinlock.ya=
ml
> @@ -0,0 +1,36 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwlock/brcm,brcmstb-hwspinlock.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Broadcom settop Hardware Spinlock
> +
> +maintainers:
> +  - Kamal Dasu <kamal.dasu@broadcom.com>
> +
> +properties:
> +  compatible:
> +    const: brcm,brcmstb-hwspinlock

Is "brcmstb" actually the name of a single platform?
Looking at the "brcmstb" pci binding, it looks like there's a whole load
of different devices there and none use "brcmstb":
          - brcm,bcm2711-pcie # The Raspberry Pi 4
          - brcm,bcm2712-pcie # Raspberry Pi 5
          - brcm,bcm4908-pcie
          - brcm,bcm7211-pcie # Broadcom STB version of RPi4
          - brcm,bcm7216-pcie # Broadcom 7216 Arm
          - brcm,bcm7278-pcie # Broadcom 7278 Arm
          - brcm,bcm7425-pcie # Broadcom 7425 MIPs
          - brcm,bcm7435-pcie # Broadcom 7435 MIPs
          - brcm,bcm7445-pcie # Broadcom 7445 Arm
          - brcm,bcm7712-pcie # Broadcom STB sibling of Rpi 5

If "stb" means "set top box", it sounds like a catchall for disparate
devices, which isn't permitted.

> +
> +  "#hwlock-cells":
> +    const: 1
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#hwlock-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    hwlock@8404038 {
> +        compatible =3D "brcm,brcmstb-hwspinlock";
> +        reg =3D <0x8404038 0x40>;
> +        #hwlock-cells =3D <1>;
> +    };
> +
> --=20
> 2.34.1
>=20

--qr7aKkWVgBLL5FHz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaNwpigAKCRB4tDGHoIJi
0lbfAP95Hy2SdaNddoRFW3UDtB0xETS9YJ5HfnHUfOk5ef6lnAEA88VM90cdi5qa
/Ia7LkDYM2dUVq5+okzLrEoJCOtAHQs=
=WU4C
-----END PGP SIGNATURE-----

--qr7aKkWVgBLL5FHz--

