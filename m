Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9D0606A334
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 11:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bX92Irrn;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ZTUj3rdm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=DNjdSl7ksOV1yWe4pcrgOgqAzi47y7DqGBV06ofjyH8=; b=bX92IrrneOgZZNRvmnfZA5PEJG
	hxTiouFiZ2bPTeaaz1/lvMbkuVxq1139yY7BtqNOUXqA8WIZaC+mSoOAY3zD7FrGSozujwgENgFcz
	A8ZXBjZqlRfXqKAvVjPK3LR1vD/b35r3NP3LWFhQCYh8w4doVIrLlNbG+CnPGYBA++votVLCEKmPB
	bU9wE4QB8HzB4UHv8/wE6ahTxDVhrHsUQNovi8MC0wfEd1wqdjFr54tM6+2QZtaRe+F8fsXrgeWJ4
	lGrwP6eG+fW9Y1hAAqf7EIj1Yus48RCv27vyf3LzX3/948lC7blYhS1z4qY8av4XxpFjdZG/ghfl0
	oxaR/sFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOD19-00000002GvR-29sI;
	Tue, 03 Nov 2026 11:49:31 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOD16-00000002GtS-24yr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 11:49:30 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id BFAA71A1427;
	Tue,  3 Nov 2026 11:49:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8C6146046C;
	Tue,  3 Nov 2026 11:49:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8995110328C5E;
	Tue,  3 Nov 2026 12:49:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793706566; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=DNjdSl7ksOV1yWe4pcrgOgqAzi47y7DqGBV06ofjyH8=;
	b=ZTUj3rdmGKpzrXaiM7tUT4VERo1mKsfCR7+hb0Z/3sDO1MVbQGugTbtDEFwF1IhVsCCF/r
	7zeraggGY8LwdT1WSDkYwF/FU/tJEdRG4QW9x7m6lRh6+SXbox49dRDj0p0cGQwCoSC/Rz
	zlADQG/3lgW6aI1r8G3iMLY+WFkWS9zBGf8iYZKMMlIGYzB2nvWSvdJ9g94UJ+XkIiqnGT
	xg3oG1QQnYR+0nsNJ/OmjWKEabMiM7tpR9U6EhmQ78NyangtjR+krGwgrxK/ekvXcVlFDI
	5dorHib4p/6zvUOD60XtfrlgQ91RoWHGKwz2d339Et8Ihl7X03st2n3e2pCy4A==
Message-ID: <902f7e15f881583e9069ae1376952964f7bdf96e.camel@bootlin.com>
Subject: Re: [PATCH] arm64: Kconfig: add CONFIG_CMDLINE_EXTEND
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland
	 <mark.rutland@arm.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Tue, 03 Nov 2026 12:49:21 +0100
In-Reply-To: <aunCuysle9uzTRI1@willie-the-truck>
References: <20261103084140.7689-1-paul.cercueil@bootlin.com>
	 <aunCuysle9uzTRI1@willie-the-truck>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_034928_746798_A8112583 
X-CRM114-Status: GOOD (  19.84  )
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

Hi Will,

Le mardi 03 novembre 2026 =C3=A0 11:17 +0000, Will Deacon a =C3=A9crit=C2=
=A0:
> On Tue, Nov 03, 2026 at 09:41:40AM +0100, Paul Cercueil wrote:
> > Other archs have it, and it is supported in arch-independent code, so I
> > see no reason why it is not provided on Aarch64. Add it there.
> >=20
> > Signed-off-by: Paul Cercueil <paul.cercueil@bootlin.com>
> > ---
> > =C2=A0arch/arm64/Kconfig | 6 ++++++
> > =C2=A01 file changed, 6 insertions(+)
> >=20
> > diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> > index 1075bc661833..f8542e532b50 100644
> > --- a/arch/arm64/Kconfig
> > +++ b/arch/arm64/Kconfig
> > @@ -2551,6 +2551,12 @@ config CMDLINE_FROM_BOOTLOADER
> > =C2=A0	=C2=A0 the boot loader doesn't provide any, the default kernel c=
ommand
> > =C2=A0	=C2=A0 string provided in CMDLINE will be used.
> > =C2=A0
> > +config CMDLINE_EXTEND
> > +	bool "Extend bootloader kernel arguments"
> > +	help
> > +	=C2=A0 The command-line arguments provided by the boot loader will be
> > +	=C2=A0 appended to the default kernel command string.
>=20
> We previously reverted this in cae118b6acc3 ("arm64: Drop support for
> CMDLINE_EXTEND") and I think that reasoning still applies. The thing
> that _has_ changed since then, is that I think bootconfig now has some
> support for early params, so that's really what people should be using
> here.

I didn't know about bootconfig, that looks like exactly what I need, thanks=
!

Cheers,
-Paul

