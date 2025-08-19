Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96E27CA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 20:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=blJlX5yKLCaKXZywXIcdim/AF0QnBKGpUtXIn8K2aI4=; b=CqZck5i2RUTDph3a4rLiW/cQxb
	tup0ay7/nTn+bGYmr+SK1pnAYKxu9EiCya01lxz5YFutW2smnZ/1TjW4GP8sWEm4eSpPgctPDAhJT
	GGXlBnhmAOXo9WgXGXrIfLewTluw7zwS9gVCHzS+obybGQbcfeKGFMSzkVXjGgzYqXXDxRi2Afi35
	4krnnjNp5z3/Fhw42/H0rcCcIOHjU7qMyGTdc1KY4SH9Sg9Qq8MBFwK230vc+xJ0sjDrlTWZChj4p
	eEeT9v1C4uv6IvBVEbHd2hwLi//tm+HqE4077+dEZ7tyOt8oVcqMQxmixksb7jt5JmzCQ0t154mQ0
	fEnG0+cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoSei-0000000BVRc-1u8E;
	Tue, 19 Aug 2025 20:10:04 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoQUm-0000000BAO1-1MnE;
	Tue, 19 Aug 2025 17:51:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B8FC75C6529;
	Tue, 19 Aug 2025 17:51:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F371C4CEF1;
	Tue, 19 Aug 2025 17:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755625899;
	bh=hlxKC/fZYMkvDgRn/9jFc92mXbXWAaT06wWuJZbE8/0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ILkVPYJ4KIhl8B+ru/J4UZeLcxaZ6jbQ3RcrQnJ4bz2AS4WAaJu3t/+gwq5gi4hgx
	 MZxtXuAJoURTOmp2K6ad+vWRlBxvQkLOxaC5URqDiOFl8L7jiC99c6nWKgx7zXUm8I
	 VdZSG+tIdc4ZAaULGnoI3FjwSyaxRqVrZqhuqK+Qh6h+s3AZpwWicRiouf0am68YHK
	 NL5hCcHtFBY9rWe2gd0sAJu3UVyjR4FStMFVdesCcHwN1EK65XA82NLk+V2+Ui5dxO
	 z9vG3djSn23mLaiKi3nWo3ZMfboYKc2PkL/M35LHpbaA//2hmg1QVuh3+8dAlloIhd
	 SKTGaLxnCCV7Q==
Date: Tue, 19 Aug 2025 18:51:34 +0100
From: Conor Dooley <conor@kernel.org>
To: Xiandong Wang <xiandong.wang@mediatek.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Houlong Wei <houlong.wei@mediatek.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, sirius.wang@mediatek.com,
	vince-wl.liu@mediatek.com, jh.hsu@mediatek.com,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v2 1/4] dt-bindings: mailbox: add cmdq yaml for MT8189
Message-ID: <20250819-coliseum-unsheathe-0c12a58e65e0@spud>
References: <20250819015948.15450-1-xiandong.wang@mediatek.com>
 <20250819015948.15450-2-xiandong.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="o3mGP6X55tJdEsY6"
Content-Disposition: inline
In-Reply-To: <20250819015948.15450-2-xiandong.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_105140_403072_1E4BF8DC 
X-CRM114-Status: GOOD (  15.50  )
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


--o3mGP6X55tJdEsY6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 19, 2025 at 09:59:38AM +0800, Xiandong Wang wrote:
> Add compatible string to support cmdq for MT8189.

Is this even the right commit message or a copy-paste mistake?
That said, you're definitely not "adding cmdq yaml" as your
$subject says, just one compatible, so the wording there should match
what you have here (if cmdq is the correct name for this).
With that,
Acked-by: Conor Dooley <conor.dooley@microchip.com>

>=20
> Signed-off-by: Xiandong Wang <xiandong.wang@mediatek.com>
> ---
>  .../devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml        | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailb=
ox.yaml b/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.ya=
ml
> index 73d6db34d64a..f9718b90d36a 100644
> --- a/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
> @@ -23,6 +23,7 @@ properties:
>            - mediatek,mt8183-gce
>            - mediatek,mt8186-gce
>            - mediatek,mt8188-gce
> +          - mediatek,mt8189-gce
>            - mediatek,mt8192-gce
>            - mediatek,mt8195-gce
>            - mediatek,mt8196-gce
> --=20
> 2.46.0
>=20

--o3mGP6X55tJdEsY6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaKS5pQAKCRB4tDGHoIJi
0kOlAQDYgIAyIQ0B2sEimeK7s/YMdj7wbUWhc/DWFuzMTkKUtQEA74V+NzYV147J
wWB2i0+0VEqPoYtH78IoCJnkulM1KgI=
=6ubp
-----END PGP SIGNATURE-----

--o3mGP6X55tJdEsY6--

