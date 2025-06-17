Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C77F8C71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 15:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EU6wYxxis5OVyKQeXPeKsMgd/+hFjCLFtAdHnU0fngg=; b=bRHhXUDyF4ceTmcp/O+Gfoq66y
	rrOfdalnlVy6KRfA6UlyEtrBO5aIUJ/lw050LRPaGIBdR4tmyyq3UkDZfXGLDJMTWBhtx5dI0CfMX
	vzsncjWPzy3hNIz97TE0r1mo0NoYmBm21GJNljoTQfCy2RvaqOVnBIBqEPv73hF6ebKxI0QQ10srk
	MPZsVqhNF0BPos9XovlAKdJtVR+Fk/bvFSYtf2nciBoq36Kbn2PFErgtAsLvFQcMJXvfbPIHuLebC
	1cgXXRvwHbte17YIDDw73fbvQC9MxZQW1AfiWeFeyZVldN+bejlbgvvPprlud53Q4VFKuJOEzf55i
	tz9Le/Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRXu5-00000007hMe-0Z9q;
	Tue, 17 Jun 2025 15:07:13 +0000
Received: from out-174.mta1.migadu.com ([2001:41d0:203:375::ae])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRX3G-00000007VDk-32XL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 14:12:40 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1750169555;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EU6wYxxis5OVyKQeXPeKsMgd/+hFjCLFtAdHnU0fngg=;
	b=csKXF/NLXzJ1s3RyHE5JxoPiKYUNxWkDu+UfyYwZ3JsUfASSP3vLk3Zsb6mNCI3RBcEF7w
	nhncl6wMcDAQSbqNOE0tAH/CrmjlrlE7J4robyP6OJajpgPPGjnpG7F2T26uMfR39Pd5/Z
	Rpk/XjD5wJHpJIS9avPxV1sIPR9SubcSzccGWeKvOFGRzskyqBy0ua51kmVZrB3yRzKkqO
	XTsBvHplABC7+GGbHWrBsSc3wuHflwWEFnZBciaKvapVA5QJ64cSs4UCqloJ8Bm9BYTxJI
	9iDDoRMPsupSFLiXbWzNPHvvU3PvaelbsXcGJ6i+5Xh6hJtuD9PjKxrMA/8xUQ==
Content-Type: multipart/signed;
 boundary=cdab7635ac7d132188f79799f8586cac554d0abe4ed63d598f1e12607abe;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Tue, 17 Jun 2025 16:12:23 +0200
Message-Id: <DAOVBOKLXLS2.S9MXDD29X68J@cknow.org>
Cc: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-phy@lists.infradead.org>
Subject: Re: [PATCH 2/5] dt-bindings: phy: rockchip-inno-csi-dphy: add
 rk3588 variant
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: <michael.riesch@collabora.com>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Heiko Stuebner" <heiko@sntech.de>, "Vinod Koul"
 <vkoul@kernel.org>, "Kishon Vijay Abraham I" <kishon@kernel.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, "Jagan Teki" <jagan@amarulasolutions.com>,
 "Sebastian Reichel" <sebastian.reichel@collabora.com>, "Collabora Kernel
 Team" <kernel@collabora.com>
References: <20250616-rk3588-csi-dphy-v1-0-84eb3b2a736c@collabora.com>
 <20250616-rk3588-csi-dphy-v1-2-84eb3b2a736c@collabora.com>
In-Reply-To: <20250616-rk3588-csi-dphy-v1-2-84eb3b2a736c@collabora.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_071239_395945_7EE4115A 
X-CRM114-Status: GOOD (  17.31  )
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

--cdab7635ac7d132188f79799f8586cac554d0abe4ed63d598f1e12607abe
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

I'm (unfortunately) not seeing any @rock-chips.com recipients ...

On Tue Jun 17, 2025 at 10:54 AM CEST, Michael Riesch via B4 Relay wrote:
> From: Michael Riesch <michael.riesch@collabora.com>
>
> The Rockchip RK3588 variant of the CSI-2 DPHY features two reset lines.
> Add the variant and allow for the additional reset.
>
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> ---
>  .../bindings/phy/rockchip-inno-csi-dphy.yaml       | 60 ++++++++++++++++=
++++--
>  1 file changed, 55 insertions(+), 5 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy=
.yaml b/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
> index 5ac994b3c0aa..6755738b13ee 100644
> --- a/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
> +++ b/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
> @@ -21,6 +21,7 @@ properties:
>        - rockchip,rk3326-csi-dphy
>        - rockchip,rk3368-csi-dphy
>        - rockchip,rk3568-csi-dphy
> +      - rockchip,rk3588-csi-dphy
> =20
>    reg:
>      maxItems: 1
> @@ -39,18 +40,49 @@ properties:
>      maxItems: 1
> =20
>    resets:
> -    items:
> -      - description: exclusive PHY reset line
> +    minItems: 1
> +    maxItems: 2
> =20
>    reset-names:
> -    items:
> -      - const: apb
> +    minItems: 1
> +    maxItems: 2
> =20
>    rockchip,grf:
>      $ref: /schemas/types.yaml#/definitions/phandle
>      description:
>        Some additional phy settings are access through GRF regs.
> =20
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - rockchip,px30-csi-dphy
> +              - rockchip,rk1808-csi-dphy
> +              - rockchip,rk3326-csi-dphy
> +              - rockchip,rk3368-csi-dphy
> +              - rockchip,rk3568-csi-dphy
> +    then:
> +      properties:
> +        resets:
> +          items:
> +            - description: exclusive PHY reset line
> +
> +        reset-names:
> +          items:
> +            - const: apb
> +
> +      required:
> +        - reset-names
> +    else:
> +      properties:
> +        resets:
> +          minItems: 2
> +
> +        reset-names:
> +          minItems: 2
> +
>  required:
>    - compatible
>    - reg
> @@ -59,7 +91,6 @@ required:
>    - '#phy-cells'
>    - power-domains
>    - resets
> -  - reset-names
>    - rockchip,grf
> =20
>  additionalProperties: false
> @@ -78,3 +109,22 @@ examples:
>          reset-names =3D "apb";
>          rockchip,grf =3D <&grf>;
>      };
> +  - |
> +    #include <dt-bindings/clock/rockchip,rk3588-cru.h>
> +    #include <dt-bindings/reset/rockchip,rk3588-cru.h>
> +
> +    soc {
> +        #address-cells =3D <2>;
> +        #size-cells =3D <2>;
> +
> +        csi_dphy0: phy@fedc0000 {
> +            compatible =3D "rockchip,rk3588-csi-dphy";
> +            reg =3D <0x0 0xfedc0000 0x0 0x8000>;
> +            clocks =3D <&cru PCLK_CSIPHY0>;
> +            clock-names =3D "pclk";
> +            #phy-cells =3D <0>;
> +            resets =3D <&cru SRST_CSIPHY0>, <&cru SRST_P_CSIPHY0>;
> +            rockchip,grf =3D <&csidphy0_grf>;
> +            status =3D "disabled";
> +        };
> +    };

... which could hopefully tell us what the value is/should be for the
*required* 'power-domains' property, which is missing in this example.
IOW: the binding example is invalid according to its own binding.
(btw: you can drop the 'csi_dphy0' label)

And hopefully also for rk3568 so we can add it to rk356x-base.dtsi and
you can add it in patch 5 where it's also missing.

Grepping for "csi-dphy" in arch/arm*/boot/dts/rockchip returns:
- px30.dtsi
- rk356x-base.dtsi

With this patch set applied, we'd have a 3rd result: rk3588-base.dtsi

For all the listed compatibles, it's only actually defined in px30.dtsi.

Cheers (and sorry),
  Diederik

--cdab7635ac7d132188f79799f8586cac554d0abe4ed63d598f1e12607abe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCaFF3zAAKCRDXblvOeH7b
bhpEAPwJIALkzS4QIOY/nXMwYzCnZR2In2099ChPU4fsvOLbagEAnx8/aQHAXAqa
LU1To43ksWlQApoJuHYhWu28pXyU/wo=
=w/02
-----END PGP SIGNATURE-----

--cdab7635ac7d132188f79799f8586cac554d0abe4ed63d598f1e12607abe--

