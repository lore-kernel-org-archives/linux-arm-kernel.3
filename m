Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E325CA601E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 15:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p1YiuwOkmVmw2TR3U6ofYFBJqolf1+GepxpnmmNdj0A=; b=3lzZfFNF7Kbe4BpmErS8g/WEFZ
	cWAh10wCMX6bRXAMu1RU7oCbcLC7EFksAdHWYTZxD7ltfnFRHojrKAxyOhVRuNf9hogDzdOXIQa+B
	riEy/U26GxBdT2E2LZG3ctqFwBOVSFjZRurZ3G2JWT+Nid/t4E9CdYGRFlfhu/T8bdcXfIIqa39Qj
	3KD1A9ruTA39zNEmX0ftdblqaxldZqt4Vk8FlwQSLBXRh/94j0ehkzeGwVXvuQdYWIK9yc50gbFC6
	1rvr//NaxZBm7tHe+gh41eMStS27T+GUIW3oGSZ/qaEr80NeIv1os5iRT2ZHH5KoBoEozJGCg/FBW
	1e3s81JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFCbg-00000006XcI-3hcy;
	Fri, 09 Oct 2026 15:34:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFCbS-00000006Xau-1Ag3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 15:33:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3029960098;
	Fri,  9 Oct 2026 15:33:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FE511F000FF;
	Fri,  9 Oct 2026 15:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791560024;
	bh=p1YiuwOkmVmw2TR3U6ofYFBJqolf1+GepxpnmmNdj0A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Wgd4EbRqsKHfqf2MAhNBuTTEeIXUShu+oxcLKEnC2crXixpIzqHuTgQiTwgLVKv6/
	 Ny3pr4tzUQ8YyI89eFmpOZoWsWzdFzsevTbT1NVLuecAaQkhCGIdvPXP1sjbg5Vloe
	 tql/dCSczJQnpSEdoqaVDfeEPqH9yg75ybcheoi9AaLzduQIn7/HR8eCl5lIZWC1a3
	 Ua3BOsLawZl1KcEQ+WmESuvpIty+HbtpsFhsRvB3DXO6LiLgfU10rz6EHE/plIPj4u
	 y8v3sHjrf6rC3Gqm5r52nFF4aKz3pChx/dw1md25cKkM1FMQ9FEroVu8EHuLHf/B4d
	 TT4Xyarrgdn6A==
Date: Fri, 9 Oct 2026 16:33:34 +0100
From: Conor Dooley <conor@kernel.org>
To: Golla Nagendra <nagendra.golla@amd.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Kedareswara rao Appana <appana.durga.rao@xilinx.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Harini Katakam <harini.katakam@amd.com>,
	Shyam Pandey <radhey.shyam.pandey@amd.com>,
	dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, git@amd.com,
	Jay Buddhabhatti <jay.buddhabhatti@amd.com>
Subject: Re: [PATCH v4 4/6] dt-bindings: dma: xlnx,zynqmp-dma: Add Versal Net
 compatible support
Message-ID: <20261009-adf9c30d2d6f7a25bb1dc041@squawk>
References: <20261009-adma-pm-fix-and-per-channel-reset-v4-0-55f5fe409c55@amd.com>
 <20261009-adma-pm-fix-and-per-channel-reset-v4-4-55f5fe409c55@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="N9GlTL/oEVtyOx8o"
Content-Disposition: inline
In-Reply-To: <20261009-adma-pm-fix-and-per-channel-reset-v4-4-55f5fe409c55@amd.com>
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

--N9GlTL/oEVtyOx8o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 09, 2026 at 09:30:13AM +0530, Golla Nagendra wrote:
> From: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
>=20
> Introduce a new compatible string amd,versal-net-dma-1.0 for Versal Net
> ZDMA. The new compatible requires xlnx,zynqmp-dma-1.0 as a fallback.
>=20
> Add a reset property to describe the per-channel reset line exposed
> on Versal Gen2 and Versal Net. Mark the resets property as required
> for both Versal Gen2 and Versal Net, and not applicable for other
> platforms.
>=20
> Note that making resets required for Versal Gen2 and Versal Net results
> in an ABI break, but this is unavoidable. While the driver works in many
> scenarios when no other firmware has used the DMA prior to Linux boot,
> there is no guarantee the channel is left in a clean state. In observed
> error scenarios, a reset is necessary before Linux can reconfigure the IP
> after previous use by other firmware components. Due to configuration
> differences or the DMA being left in a bad state, DMA functionality fails
> when sequential software components use the channel (e.g., firmware before
> Linux boot). The channel can only be cleanly re-configured after a
> per-channel reset, making it essential. This ABI break is only applied
> to Versal Gen2 and Versal Net where the per-channel reset capability is
> available.
>=20
> Signed-off-by: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
> Co-developed-by: Golla Nagendra <nagendra.golla@amd.com>
> Signed-off-by: Golla Nagendra <nagendra.golla@amd.com>
> ---
>  .../bindings/dma/xilinx/xlnx,zynqmp-dma-1.0.yaml   | 34 ++++++++++++++++=
+-----
>  1 file changed, 27 insertions(+), 7 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/dma/xilinx/xlnx,zynqmp-dma=
-1.0.yaml b/Documentation/devicetree/bindings/dma/xilinx/xlnx,zynqmp-dma-1.=
0.yaml
> index 2da86037ad79..ff8c9a0e5559 100644
> --- a/Documentation/devicetree/bindings/dma/xilinx/xlnx,zynqmp-dma-1.0.ya=
ml
> +++ b/Documentation/devicetree/bindings/dma/xilinx/xlnx,zynqmp-dma-1.0.ya=
ml
> @@ -16,17 +16,17 @@ maintainers:
>    - Harini Katakam <harini.katakam@amd.com>
>    - Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
> =20
> -allOf:
> -  - $ref: ../dma-controller.yaml#
> -
>  properties:
>    "#dma-cells":
>      const: 1
> =20
>    compatible:
> -    enum:
> -      - amd,versal2-dma-1.0
> -      - xlnx,zynqmp-dma-1.0

This used to be an enum, so please preserve it as one.

> +    oneOf:
> +      - const: amd,versal2-dma-1.0
> +      - const: xlnx,zynqmp-dma-1.0
> +      - items:
> +          - const: amd,versal-net-dma-1.0
> +          - const: xlnx,zynqmp-dma-1.0
> =20
>    reg:
>      description: memory map for gdma/adma module access
> @@ -59,6 +59,9 @@ properties:
>    power-domains:
>      maxItems: 1
> =20
> +  resets:
> +    maxItems: 1
> +
>    dma-coherent: true
> =20
>  required:
> @@ -70,13 +73,29 @@ required:
>    - clock-names
>    - xlnx,bus-width
> =20
> +allOf:
> +  - $ref: ../dma-controller.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - amd,versal2-dma-1.0
> +              - amd,versal-net-dma-1.0
> +    then:
> +      required:
> +        - resets

The change here for versal2 is an ABI break (new required property) and
needs to be split out into a standalone patch. The new support can go on
top.
pw-bot: changes-requested

Thanks,
Conor.

> +    else:
> +      properties:
> +        resets: false
> +
>  additionalProperties: false
> =20
>  examples:
>    - |
> =20
>      fpd_dma_chan1: dma-controller@fd500000 {
> -      compatible =3D "xlnx,zynqmp-dma-1.0";
> +      compatible =3D "amd,versal-net-dma-1.0", "xlnx,zynqmp-dma-1.0";
>        reg =3D <0xfd500000 0x1000>;
>        interrupt-parent =3D <&gic>;
>        interrupts =3D <0 117 0x4>;
> @@ -84,5 +103,6 @@ examples:
>        clock-names =3D "clk_main", "clk_apb";
>        clocks =3D <&zynqmp_clk 19>, <&zynqmp_clk 31>;
>        xlnx,bus-width =3D <128>;
> +      resets =3D <&reset 0>;
>        dma-coherent;
>      };
>=20
> --=20
> 2.43.7
>=20

--N9GlTL/oEVtyOx8o
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaskJTgAKCRB4tDGHoIJi
0nYQAQDoViJPC2UPwMN0oUIk0GyH01JuNpqn1aqCxqop8YyWBQD+I+ulv/qRdx5e
yIcfLs5EJM8GnSliJPXOA0nAJDWMKQc=
=cwYt
-----END PGP SIGNATURE-----

--N9GlTL/oEVtyOx8o--

