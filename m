Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6290DEDEBE0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 18:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K7z4AgjEgnAJZJjJaaybKMzYPCEanLRwsp5Y8DouBt4=; b=FFgShh7EVTsPx2GyxshzYNXUKn
	LZmmDghOa7laJze0qXw5tBz6uh0ueEmg5sQDbGgdZHCP1ecIRjx1EjUW5BPVD8WuI4MBfRHwk55LE
	kfKZEADzqWgDkSAbRP1+HflBhcxT2h0Q4CPooh8iuBJPatkZ12ZEg5rQrIICadZdncktLsgzekTDk
	YadCwM7Qt+lDFrsqAbVo/XsIhE6xu8BRBh/e52D9GiUZHLiyzZ2ou3AIrqkXB6byKZhX98WqTbHwP
	CJB/Uc0YZI35URwLi6Sf4bpmvyvqjyk1Q0JlfKraqnO6Cgxv/Yw1q6pmb5uChCO70Z1YjIGKrCRY2
	npGXdd/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxUXN-0000000FiFf-2tJF;
	Tue, 03 Mar 2026 18:32:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxUXL-0000000FiFD-35N8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 18:32:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2950D4427D;
	Tue,  3 Mar 2026 18:32:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2016EC116C6;
	Tue,  3 Mar 2026 18:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772562723;
	bh=ZmKyMq4ADrasqI2lkdiyTeu8Psuh11dcPps98qA+PnM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lZ0lxt0IdSLzMJeYGLMIB+LL1sGB1g/curyOSbGkTc0wqGWVLT9HnlkfVBet1fUe+
	 pH0ap0VnfOA31koxcOrdROMOO/xNQuDPz3Tm+X012HOteaMTx3TM37td3DUH6ma/sL
	 l7JogpGP97gJuYZauST3U7mUfqlCi6iFPqPfAK/XyIVciE8ec0PVgrVMt+c53uONA1
	 vecDR9H1Wild5mYXeWzxZ2ueSzSXoCtvLjsjiWD0/0cqNveIl4CpewehyRrsN+18A2
	 k5LCJcH4ThpXouhZGMyOB/Wy5oUOMZZ7KxBwSsmV62x2J6Exrt1/Y4ZNPR3qX+KBQb
	 JtlAfuW8Atong==
Date: Tue, 3 Mar 2026 18:31:56 +0000
From: Conor Dooley <conor@kernel.org>
To: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Subject: Re: [PATCH 2/6] dt-bindings: remoteproc: k3-r5f: Add
 memory-region-names
Message-ID: <20260303-hesitate-preoccupy-5e311cbd3e58@spud>
References: <20260303-topic-am62a-ioddr-dt-v6-19-v1-0-12fe72bb40d2@baylibre.com>
 <20260303-topic-am62a-ioddr-dt-v6-19-v1-2-12fe72bb40d2@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+OYMOED35FJFDZBl"
Content-Disposition: inline
In-Reply-To: <20260303-topic-am62a-ioddr-dt-v6-19-v1-2-12fe72bb40d2@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_103203_825226_A094838B 
X-CRM114-Status: GOOD (  16.23  )
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
Cc: Nishanth Menon <nm@ti.com>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>, Mathieu Poirier <mathieu.poirier@linaro.org>, Dhruva Gole <d-gole@ti.com>, Akashdeep Kaur <a-kaur@ti.com>, Kevin Hilman <khilman@baylibre.com>, Bjorn Andersson <andersson@kernel.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Kendall Willis <k-willis@ti.com>, devicetree@vger.kernel.org, Vishal Mahaveer <vishalm@ti.com>, Sebin Francis <sebin.francis@ti.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Tero Kristo <kristo@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org


--+OYMOED35FJFDZBl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 03, 2026 at 04:13:00PM +0100, Markus Schneider-Pargmann (TI) wr=
ote:
> Add names to the memory-region-names for easier idenfitication of memory
> regions.
>=20
> Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
> ---
>  .../bindings/remoteproc/ti,k3-r5f-rproc.yaml          | 19 +++++++++++++=
++++++
>  1 file changed, 19 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc=
=2Eyaml b/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
> index 6aadc61e20f9f4c27f5b9c87ab2025a02776c5de..76ef23afe8c9f7f155dfec7fc=
abc7c60b8b286c6 100644
> --- a/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
> @@ -182,6 +182,25 @@ patternProperties:
>            - description: DM RM/PM trace and firmware code/data
>          additionalItems: true
> =20
> +      memory-region-names:
> +        description: |
> +          Optional names for the memory regions specified in the memory-=
region

Is this really optional? Shouldn't it be made mandatory so that it is
easy to tell the difference between the two configurations?

> +          property.
> +        oneOf:
> +          - description: Basic configuration with DMA and firmware regio=
ns
> +            items:
> +              - const: dma
> +              - const: firmware
> +
> +          - description: Extended LPM configuration with split memory re=
gions
> +            items:
> +              - const: dma
> +              - const: ipc
> +              - const: lpm-stub
> +              - const: lpm-metadata
> +              - const: lpm-context
> +              - const: dm-firmware
> +
>  # Optional properties:
>  # --------------------
>  # The following properties are optional properties for each of the R5F c=
ores:
>=20
> --=20
> 2.51.0
>=20

--+OYMOED35FJFDZBl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaacpHAAKCRB4tDGHoIJi
0laKAP9oKTEoRXXenJkKNLBcMNLjx8QsUPsIZlj0xLTizBp/aAEAx9MnW55ZypwO
bQwbGKTP/kAouMyKyaoH3YXIeX1e8wQ=
=ZpAf
-----END PGP SIGNATURE-----

--+OYMOED35FJFDZBl--

