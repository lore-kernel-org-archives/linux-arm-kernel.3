Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D908D606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Oct 2026 18:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yGYGnJ+H;
	dkim=pass (2048-bit key, unprotected) header.d=rendec.net header.i=@rendec.net header.a=rsa-sha256 header.s=default header.b=0XNQpWoH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=oh6C1/O5rxMMHP4wiGW+MPKKTijulKksxlsF5+eFQm4=; b=yGYGnJ+HLbbvyCgUpLToWN4S1o
	2lw8C3pHME9zwJFIH0uOVl4v+4bgOtWbFJjXVGoS9QHJB0qJKvtdzDFAFlyXcTFOpnasVe15ANJEA
	uvq+Ytfk+oRhob0fj2GyBTLxb6bPMe++fyFPGLytuWrqIRNlhjF32voBxtnRVss7BtO3Q+JbM7Vjc
	aUtZekgAPd0u8hNy+dD1CuJutnnEvX5+RD/A1PNpcy4qm6ycNOCkpKBirjSNHNa1D5SB+uLRaOUkq
	Pvqj6A+pAiW6poYBXW9fpHNtytbcE2ZavI6PqklnCs91dFdQBOzeSBUUfAacJV8QIaS3YtXQzs0D6
	ZNQKx/0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKgNI-00000000QRO-0MZ7;
	Sat, 24 Oct 2026 18:21:48 +0000
Received: from xs1.mindbit.ro ([80.86.107.70] helo=mail.mindbit.ro)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKgNF-00000000QQe-0c2E
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Oct 2026 18:21:46 +0000
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id 67538D312F;
	Sat, 24 Oct 2026 21:21:42 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro 67538D312F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1792866103;
	bh=oh6C1/O5rxMMHP4wiGW+MPKKTijulKksxlsF5+eFQm4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=0XNQpWoH+Z1V7u3r5AmTmoW7IAQsVwScshRDYjQAb/vYovvkSQUcQBauCxyAodhTz
	 /Qg6U1W8kqG7iU5HPR+8xgo3My/7MttpJ6AK1U2M7F7cZSvpNKf4CMU4E1D2uLCksh
	 9LCd9yeNO7dcMLx8I/Nn1IVrJTFZSj3Ape/89S19+tXqgolCiuQ5dKIvqUdMIvaYsf
	 BWG+EE692W9stUxlzYT6hcOZTTI7IJDHtNoACxzw3jhLFYmgj3GlXeX5NvfhSui0Xu
	 2vb6T+cgoexsgzFYknBNZAugAAziIMH0xKbrmbQel2DB1TlhtOjVX3rRLGgirfbiPR
	 FUx/RMgGuN1Ig==
Message-ID: <58dc82246c85146bba0967df1177c87ede7eabb7.camel@rendec.net>
Subject: Re: [PATCH 3/4] irqchip/alpine-msi: Add missing space after comma
 in GENMASK_ULL
From: Radu Rendec <radu@rendec.net>
To: Eliav Farber <farbere@amazon.com>, Thomas Gleixner <tglx@kernel.org>, 
 Antoine Tenart <atenart@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Sat, 24 Oct 2026 14:21:41 -0400
In-Reply-To: <20260923083703.38974-4-farbere@amazon.com>
References: <20260923083703.38974-1-farbere@amazon.com>
	 <20260923083703.38974-4-farbere@amazon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261024_112145_359701_21BA46CA 
X-CRM114-Status: GOOD (  12.45  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 2026-09-23 at 08:37 +0000, Eliav Farber wrote:
> Fix the coding-style issue reported by checkpatch:
>=20
> =C2=A0 ERROR: space required after that ',' (ctx:VxV)
>=20
> No functional change.
>=20
> Signed-off-by: Eliav Farber <farbere@amazon.com>
> ---
> =C2=A0drivers/irqchip/irq-alpine-msi.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/irqchip/irq-alpine-msi.c b/drivers/irqchip/irq-alpin=
e-msi.c
> index 20f1f7f7612b..8155f63cfd29 100644
> --- a/drivers/irqchip/irq-alpine-msi.c
> +++ b/drivers/irqchip/irq-alpine-msi.c
> @@ -210,7 +210,7 @@ static int alpine_msix_init(struct device_node *node,=
 struct device_node *parent
> =C2=A0	 * To select the primary GIC as the target GIC, bits [18:17] must =
be set
> =C2=A0	 * to 0x0. In this case, bit 16 (SPI_TARGET_CLUSTER0) must be set.
> =C2=A0	 */
> -	priv->addr =3D res.start & GENMASK_ULL(63,20);
> +	priv->addr =3D res.start & GENMASK_ULL(63, 20);
> =C2=A0	priv->addr |=3D ALPINE_MSIX_SPI_TARGET_CLUSTER0;
> =C2=A0
> =C2=A0	if (of_property_read_u32(node, "al,msi-base-spi", &priv->spi_first=
)) {

Reviewed-by: Radu Rendec <radu@rendec.net>

