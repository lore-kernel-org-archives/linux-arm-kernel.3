Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB418606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Oct 2026 18:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=soihZQx9;
	dkim=pass (2048-bit key, unprotected) header.d=rendec.net header.i=@rendec.net header.a=rsa-sha256 header.s=default header.b=wXQnmlLl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=FpzwCxPPS9IwFBjAs06Z/W/Hx2bJLTKEYnKVn0uvtA0=; b=soihZQx9SWd+060aHFLlkxJxzf
	ad12VZO4KOhdrlWxiJ5al2s6kkv9BzIW/wlD68zcg8wd36dGzb2lOGtZl5f0esfQhaLJg48qZAexg
	z3w/GqZ8Tys/2thrgVEQL9mASylM5RjHDbIatYs+CHOEf88D1tXchnhDMQJLAATKtNMb1Xrzf24T8
	cMV62mM7v1cOIoBhIoXcmR9TT9lTFYkb+nvoKS2qic6oOxXDPVrVs3BJ8m9rqtexqlPg8AG/fdDP9
	XIMMORUsfwYUY+LxohQP3eb5KfiRWDOAwHJcfybXp56/nZfnVrbKx9Cv8pGmTaWKZCPjv23qeNxKf
	FMSs3GKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKg7a-00000000Pyr-2FZv;
	Sat, 24 Oct 2026 18:05:34 +0000
Received: from xs1.mindbit.ro ([80.86.107.70] helo=mail.mindbit.ro)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKg7W-00000000PyU-3erN
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Oct 2026 18:05:32 +0000
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id B6576D312F;
	Sat, 24 Oct 2026 21:05:22 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro B6576D312F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1792865123;
	bh=FpzwCxPPS9IwFBjAs06Z/W/Hx2bJLTKEYnKVn0uvtA0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=wXQnmlLltfKxte+M6I5nW33rVCJnzHb+5dVLwE2M1C1FkvLePr0ENj0Hon2ICcHZg
	 izGFUgkRtEZWtMsm/UshW9IzLyTEWBTy4aC+xECOxMnk7AVActsfZCJdTJTJoABVFw
	 VB2Bfu9o2T/o/6WmweDyOVf5t/udzrnPCYvT0tHNTBjhmovvE5uHM1RUQ6wuxoemXl
	 2IiiZw0EBFBlLnwRCY+mRFqfUNPCti/iRwjIie8n/yzdC0EF/gTet37RHRaFcGK558
	 xxDer5Y/jmqSs6ZqiKR2MAsEfx7iEnLxyzluyE8WE6YVkglT6ivechXJZl7DuR3hp6
	 tk5BI3KbmuyjA==
Message-ID: <3693b2aa2bba051b82406baac73e0e03921bad34.camel@rendec.net>
Subject: Re: [PATCH 1/4] irqchip/alpine-msi: Use SPDX-License-Identifier
From: Radu Rendec <radu@rendec.net>
To: Eliav Farber <farbere@amazon.com>, Thomas Gleixner <tglx@kernel.org>, 
 Antoine Tenart <atenart@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Sat, 24 Oct 2026 14:05:20 -0400
In-Reply-To: <20260923083703.38974-2-farbere@amazon.com>
References: <20260923083703.38974-1-farbere@amazon.com>
	 <20260923083703.38974-2-farbere@amazon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261024_110531_220427_83633EC8 
X-CRM114-Status: GOOD (  12.18  )
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
> Replace the free-form GPL v2 license boilerplate with the equivalent
> SPDX-License-Identifier tag, as preferred for new and updated files.
> No functional change.
>=20
> Signed-off-by: Eliav Farber <farbere@amazon.com>
> ---
> =C2=A0drivers/irqchip/irq-alpine-msi.c | 5 +----
> =C2=A01 file changed, 1 insertion(+), 4 deletions(-)
>=20
> diff --git a/drivers/irqchip/irq-alpine-msi.c b/drivers/irqchip/irq-alpin=
e-msi.c
> index 6764d64e7950..0d97abb85e16 100644
> --- a/drivers/irqchip/irq-alpine-msi.c
> +++ b/drivers/irqchip/irq-alpine-msi.c
> @@ -1,13 +1,10 @@
> +// SPDX-License-Identifier: GPL-2.0
> =C2=A0/*
> =C2=A0 * Annapurna Labs MSIX support services
> =C2=A0 *
> =C2=A0 * Copyright (C) 2016, Amazon.com, Inc. or its affiliates. All Righ=
ts Reserved.
> =C2=A0 *
> =C2=A0 * Antoine Tenart <antoine.tenart@free-electrons.com>
> - *
> - * This file is licensed under the terms of the GNU General Public
> - * License version 2. This program is licensed "as is" without any
> - * warranty of any kind, whether express or implied.
> =C2=A0 */
> =C2=A0
> =C2=A0#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt

Reviewed-by: Radu Rendec <radu@rendec.net>

