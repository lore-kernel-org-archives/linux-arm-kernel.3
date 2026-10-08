Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86BB1CA6007
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 10:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zcBgO7M7iFusjizHcLgntvUHRDYyFs7rgcLKJri+rIg=; b=MLyfUO7K8cf6Ch6Nhkwm1Twq2D
	01rQwWFtm2/Wi3ueH+e+41X0J90JLI2bZlPTUab1RizTBJuUsSlYbBEMcjN5KPMgbR9P6/uwInTGW
	bWGbC+mV9hynDiCxbV0+LOoVzw/y4ukBRJPnrMsQZrk3A95aVGldKb94Mo81B4KIk1k5TgcokRnE4
	NJpxdXeil6RBJZbkfOxnPvJ2QkjMAAkAHLkgPWFdqE9iVBBDC+iRB4o2IifD2J4In8yvpqJRctjbe
	+g9Gkiaozmb/uHTs61TkOvlY4jlY3PrDSDbnSav+33k5ccdePFzF9SwkUI2zkXQN2a4Q7EyYTA9TN
	pRXvuq4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xElGN-000000045al-10b4;
	Thu, 08 Oct 2026 10:22:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xElGM-000000045aQ-0Mfd;
	Thu, 08 Oct 2026 10:22:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2EB0D601EF;
	Thu,  8 Oct 2026 10:22:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81F011F000FF;
	Thu,  8 Oct 2026 10:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791454928;
	bh=zcBgO7M7iFusjizHcLgntvUHRDYyFs7rgcLKJri+rIg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HwmmiUTeqkyPniyQMst6veFAYjUsBDORMT+O2yz+vcrMdFulGoby6M+Jn853WThCl
	 +loLatS+xwCLFuwLUmUEme9EKIfZxK1sFAwU6kI3WZse92LrNb1+S95BAiB3JL3445
	 4wSdTLH3451TNlj8n/CkktM8KKzV+Rk08oxYBKszB7l2W8V7AbiB4zeu2GdnCcjY4t
	 boWeL+/r+Ac5lxoMOQ6ftDzb2uw+o29a80n2hSm9abUAHJrlZLmzWxFeE/JMoanv77
	 Zr9hcbEWp6zThLmrOGHQTFdzl7cNmRFjnrVeI5OsQJbUngGoFbQbAhvdTm4ByyCmPP
	 PEgOisFZ2PPqQ==
Date: Thu, 8 Oct 2026 11:22:02 +0100
From: Conor Dooley <conor@kernel.org>
To: Eric Lin <eric.lin@sifive.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Atish Patra <atishp@rivosinc.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Nick Hu <nick.hu@sifive.com>
Subject: Re: [PATCH RFC] dt-bindings: perf: riscv,pmu: Add
 interrupts-extended property
Message-ID: <20261008-e035806a0c080bb90eafb6a7@squawk>
References: <20260702-pmu-dt-property-v1-1-a7a7737afb72@sifive.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/raQ3rw6hrl6QXeP"
Content-Disposition: inline
In-Reply-To: <20260702-pmu-dt-property-v1-1-a7a7737afb72@sifive.com>
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

--/raQ3rw6hrl6QXeP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 02, 2026 at 05:04:31PM +0800, Eric Lin wrote:
> The interrupts-extended property is used to specify the connection
> between the PMU counter overflow interrupt and the corresponding CPU
> local interrupt controller (riscv,cpu-intc).
>=20
> This property also allows the software to associate a PMU node with a
> specific CPU. To support future heterogeneous systems, where different
> CPUs may support different PMU events, this property allows the driver
> to identify the correct PMU capabilities for each hart.
>=20
> Reviewed-by: Nick Hu <nick.hu@sifive.com>
> Signed-off-by: Eric Lin <eric.lin@sifive.com>

This has been sitting for ages, I was kinda waiting to see if there'd be
some feedback from the relevant maintainers (riscv pmu). Was there a
series sent to opensbi or elsewhere to implement support for these
devices?

Thanks,
Conor.

> ---
>  Documentation/devicetree/bindings/perf/riscv,pmu.yaml | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/perf/riscv,pmu.yaml b/Docu=
mentation/devicetree/bindings/perf/riscv,pmu.yaml
> index d01c677ad3c7..13aceb3d42b9 100644
> --- a/Documentation/devicetree/bindings/perf/riscv,pmu.yaml
> +++ b/Documentation/devicetree/bindings/perf/riscv,pmu.yaml
> @@ -34,6 +34,13 @@ properties:
>    compatible:
>      const: riscv,pmu
> =20
> +  interrupts-extended:
> +    minItems: 1
> +    maxItems: 4095
> +    description:
> +      Specifies the interrupt-parent and local interrupt index for each =
CPU's
> +      PMU counter overflow. Each item points to a riscv,cpu-intc node.
> +
>    riscv,event-to-mhpmevent:
>      $ref: /schemas/types.yaml#/definitions/uint32-matrix
>      description:
> @@ -101,6 +108,7 @@ examples:
>    - |
>      pmu {
>          compatible =3D "riscv,pmu";
> +        interrupts-extended =3D <&cpu0_intc 13>;
>          riscv,event-to-mhpmevent =3D <0x0000B 0x0000 0x0001>;
>          riscv,event-to-mhpmcounters =3D <0x00001 0x00001 0x00000001>,
>                                        <0x00002 0x00002 0x00000004>,
> @@ -127,6 +135,9 @@ examples:
>       */
>      pmu {
>            compatible =3D "riscv,pmu";
> +          interrupts-extended =3D <&cpu0_intc 13>,
> +                                <&cpu1_intc 13>,<&cpu2_intc 13>,
> +                                <&cpu3_intc 13>,<&cpu4_intc 13>;
>            riscv,event-to-mhpmevent =3D
>                /* SBI_PMU_HW_CACHE_REFERENCES -> Instruction or Data cach=
e/ITIM busy */
>                <0x00003 0x00000000 0x1801>,
>=20
> ---
> base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
> change-id: 20260701-pmu-dt-property-ff12b35fe0fc
>=20
> Best regards,
> -- =20
> Eric Lin <eric.lin@sifive.com>
>=20

--/raQ3rw6hrl6QXeP
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCasduygAKCRB4tDGHoIJi
0rTpAQCQBgIIAbycQG39wCoLhMgLP+QD29TJPYRX1zlb8UX3VAEAq/PUFA8BUofL
VOpanF6KbviEiyHpZWrSYJGm0egv2QU=
=QRvW
-----END PGP SIGNATURE-----

--/raQ3rw6hrl6QXeP--

