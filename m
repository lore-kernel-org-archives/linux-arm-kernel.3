Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0220D606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Oct 2026 18:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CYs6y+I9;
	dkim=pass (2048-bit key, unprotected) header.d=rendec.net header.i=@rendec.net header.a=rsa-sha256 header.s=default header.b=mdC2Daft
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vmV4lQnSO2Bn4fy60UoiGjkHhPKslPFl/aNWvs1arNc=; b=CYs6y+I9LzqMae9jy5IFRWKbCq
	/cweVa4BD2WdjQq5mR5E7sMJ+X1dw9dIxymhsGYBKbY9SOZtQH1Q70Jlafp15/2LtKMyCelUKr0Vs
	/b33fNGHZkX3eUgJk2qUv/kHWILpVg9ij57981Y0wGFRCc+klSE7IcoTLHGiVIvAkVy9HBq4PpTO+
	Z+n1o1PynLLY7MkbZ6GMn3ufw9QP/eMO2fDt5dWoJH813I816q4pCMz9j0KbDqhp5krb2CmbwViCz
	PapXMR8p9xfOSqYamiP0eX8BWedJ39eqv2K1U+cf+cGgcpC9Qsly7sa0lAWOuK0jed/rgnUJuSTKa
	0tTBY8jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKgM8-00000000QJT-3XW5;
	Sat, 24 Oct 2026 18:20:36 +0000
Received: from xs1.mindbit.ro ([80.86.107.70] helo=mail.mindbit.ro)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKgM5-00000000QJ7-2hiN
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Oct 2026 18:20:35 +0000
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id 857DED312F;
	Sat, 24 Oct 2026 21:20:30 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro 857DED312F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1792866031;
	bh=vmV4lQnSO2Bn4fy60UoiGjkHhPKslPFl/aNWvs1arNc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=mdC2DaftTNrer2AXTJTCUDU6YzhakrgTJAFmsuxReRsFJ/NheGYcsVZcGBkuE0rhG
	 17iNJe20ZnjstYVGCXSkI7NJGg0vSIKteqc9Z7NzeRfNysJgItFC1GhMC2eYiGsw7U
	 HPd7uCgdaFokVZuE8LGICwBzoNcNWg2w2JfGJg2wWd7SKKDaOcZ3oOcZt0phPOQHpl
	 TGa27OhsC2mpjjK4NorLvmEzxez4xX+khPzTH+x818zOyq/A9ewoQlZmP3XmarfrLf
	 IN3Sm7EqtlmA2wAQmNJgDchbRVPj3VzQK2inrbGhG194Hy5qnEX32S3X9RPrhDNRfk
	 BbKt+j8nxuFhQ==
Message-ID: <1a128eaffb2994591882308f67e0d7a0c4bcd4b1.camel@rendec.net>
Subject: Re: [PATCH 2/4] irqchip/alpine-msi: Drop redundant asm/msi.h include
From: Radu Rendec <radu@rendec.net>
To: Eliav Farber <farbere@amazon.com>, Thomas Gleixner <tglx@kernel.org>, 
 Antoine Tenart <atenart@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Sat, 24 Oct 2026 14:20:28 -0400
In-Reply-To: <20260923083703.38974-3-farbere@amazon.com>
References: <20260923083703.38974-1-farbere@amazon.com>
	 <20260923083703.38974-3-farbere@amazon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261024_112033_886427_83D9A084 
X-CRM114-Status: GOOD (  11.00  )
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
> The driver already includes <linux/msi.h>, which itself pulls in
> <asm/msi.h>, so the explicit arch include is redundant. Remove it;
> checkpatch also flags the direct use of the asm header in favour of
> the linux one. No functional change.
>=20
> Signed-off-by: Eliav Farber <farbere@amazon.com>
> ---
> =C2=A0drivers/irqchip/irq-alpine-msi.c | 1 -
> =C2=A01 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/irqchip/irq-alpine-msi.c b/drivers/irqchip/irq-alpin=
e-msi.c
> index 0d97abb85e16..20f1f7f7612b 100644
> --- a/drivers/irqchip/irq-alpine-msi.c
> +++ b/drivers/irqchip/irq-alpine-msi.c
> @@ -21,7 +21,6 @@
> =C2=A0#include <linux/slab.h>
> =C2=A0
> =C2=A0#include <asm/irq.h>
> -#include <asm/msi.h>
> =C2=A0
> =C2=A0/* MSIX message address format: local GIC target */
> =C2=A0#define ALPINE_MSIX_SPI_TARGET_CLUSTER0		BIT(16)

Reviewed-by: Radu Rendec <radu@rendec.net>

