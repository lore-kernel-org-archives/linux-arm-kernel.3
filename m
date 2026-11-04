Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8363606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 12:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZM5VVn5U;
	dkim=pass (2048-bit key, unprotected) header.d=rendec.net header.i=@rendec.net header.a=rsa-sha256 header.s=default header.b=SRoegsFy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SyLUHxyvOwp7GEPi1oveTrS8s1159q8UOp+3JAwxNqo=; b=ZM5VVn5UnKVRR2a3RiSvGASToZ
	/8j9+4GpbUosqMnX3wruqK+uD21o39pdnorohEFtmSQ/wbrfSPDPZzDLo/mVrKgw3ual4wsed9TXw
	XuB6oRMuTc1eWRniPVJRYQ2373jGfMH5vF96fZ0hAO1i42I6jQjwDkBqZtxbf9tmrxLrUAfiOo57T
	hXyRZBYrmyVf4vazR6D5lzMyiio4gXNzYSVh+5kyOq0fvs98tIn04Qng2l6b8cfhjl2PLzfuSfeMD
	dCGbt4DC/axZo6cM02ANbS6xWllUxQkNW1lh1QALdcPrqjO9XADKhj42dx/Naaa6avZ3ZNy2bPIPe
	nBQ+jiGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOZg6-00000005FEW-12FN;
	Wed, 04 Nov 2026 12:01:18 +0000
Received: from xs1.mindbit.ro ([80.86.107.70] helo=mail.mindbit.ro)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOZg4-00000005FC1-0oln
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 12:01:17 +0000
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id 987F9D3370;
	Wed,  4 Nov 2026 14:01:06 +0200 (EET)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro 987F9D3370
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1793793667;
	bh=SyLUHxyvOwp7GEPi1oveTrS8s1159q8UOp+3JAwxNqo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=SRoegsFy7GARTLsj/G5eA7HZiznBxbCinZyr2PhAzS4HnfIdX28L+eDYO+pa4G1bz
	 8F0BkCR2idJii81iNgELGPseKn8ZmlMuD1Lw/HMO/N9l1bMSKc8aMW9hZhPEyzBC9X
	 nySAqI6Ed+OUB217/UOb6+TPNhEYttefwPRmTwSrvAojP5i5sbEXuBBxzEMfhJCbkJ
	 Qd311iHqzBPzWMU6o7JM5fxuTaaoitXNRKerZv7rSEzhlZOqK0tRl7oBbQBjKbalwj
	 RxUQNuDbd3rUzX18RZsmdKr26LLd48Y79GoeWsJq6ewu7lM5aP0ckCxtV4e81GfgKZ
	 fFe8giPw0Wbcw==
Message-ID: <6cf5152f35e4e8fb66f51f79f5f39e2e3ae1aa7d.camel@rendec.net>
Subject: Re: [PATCH v2 4/5] irqchip/alpine-msi: Fix format and wording of
 the registration debug print
From: Radu Rendec <radu@rendec.net>
To: Eliav Farber <farbere@amazon.com>, Thomas Gleixner <tglx@kernel.org>, 
 Antoine Tenart <atenart@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Wed, 04 Nov 2026 07:01:04 -0500
In-Reply-To: <20261024193620.39999-5-farbere@amazon.com>
References: <20261024193620.39999-1-farbere@amazon.com>
	 <20261024193620.39999-5-farbere@amazon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_040116_535270_D7A7B6B6 
X-CRM114-Status: GOOD (  13.06  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, 2026-10-24 at 19:36 +0000, Eliav Farber wrote:
> The "Registering" debug message in alpine_msix_init() prints
> priv->num_spis and priv->spi_first, both u32, with %d. Use %u to match
> their type, and fix the "msixs" wording while at it. No functional
> change.
>=20
> Signed-off-by: Eliav Farber <farbere@amazon.com>
> ---
> v2: New patch (Radu).
>=20
> =C2=A0drivers/irqchip/irq-alpine-msi.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/irqchip/irq-alpine-msi.c b/drivers/irqchip/irq-alpin=
e-msi.c
> index 8155f63cfd29..fb84b6046193 100644
> --- a/drivers/irqchip/irq-alpine-msi.c
> +++ b/drivers/irqchip/irq-alpine-msi.c
> @@ -229,7 +229,7 @@ static int alpine_msix_init(struct device_node *node,=
 struct device_node *parent
> =C2=A0		return -ENOMEM;
> =C2=A0	priv->msi_map =3D msi_map;
> =C2=A0
> -	pr_debug("Registering %d msixs, starting at %d\n", priv->num_spis, priv=
->spi_first);
> +	pr_debug("Registering %u MSIs, starting at SPI %u\n", priv->num_spis, p=
riv->spi_first);
> =C2=A0
> =C2=A0	ret =3D alpine_msix_init_domains(priv, node);
> =C2=A0	if (ret)

Reviewed-by: Radu Rendec <radu@rendec.net>

