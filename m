Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07FC3C02181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 14:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fFPrC9r06/PWyscB76gzjPIUZx4sBcQlQRBii060cJQ=; b=AqLZ/av/MbtER8157qlHTOlFJ6
	3HqdztwPCqrz3Uy6WGRjBia9ohIo1xM8K1jeOALYz7C7wQUPubLgkSheVk40hv5bf060zykgoXEY0
	5HpY8FmH030FaMFeNsARS+t0DKGwWUm/OvCK4vZG1xAjjeQ4BESB+z791dz206V/FElxHw7RfLgu2
	9UEQ+2aKAoa6mGvJMqTn3Jqh5uAIuIcIH7tlYpfjLqhUJHKsKgL2ZQu8KTqxGkrgyR1i25MOOnZJO
	vJ4NXy4Q1jMfnHtjcBkKnqwte+JSvEtXlcPgk/oMnrb3Tuf/TL2yB13QrEeOpmvYHV2y+khvvvzsN
	hKMJYimQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbKUh-0000000EqFd-1Fea;
	Fri, 24 Jan 2025 14:17:11 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbKTM-0000000Eq68-43aC;
	Fri, 24 Jan 2025 14:15:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F2A85A41753;
	Fri, 24 Jan 2025 14:14:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC6B0C4CED2;
	Fri, 24 Jan 2025 14:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737728147;
	bh=soPtkMvGfDrdWopyWVbYN7KpKOoOPKfl+F5kiTig7zs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gFtSqpvzmHrdHm80XMV68CXcIxPljUr1f20q0q2YpYNK83Ywg3IftZBN7UDNF/UOR
	 +FWI5qygkzAHjV1PIpMCtofT8PCpsbILkCjOAJXPZH7lLlitO7tMEF8h3V0MC/0/eF
	 TnX1lhoN79BxySRC2OrZWr7Zuf2/ZvYUocQIFbipB+M2KEl+tivdIxglA4quRRRfqA
	 c/nUbpXVJ/FrY5OvgxUdgph1si5pPjZvpjiaMlqfkFpuNH4DbX/znoNaXLIus/NoYw
	 f0gaAge7/6c4FKLB+/FL/FLhY2o3zxj2xuzynSD1wZInPYMG10P9xi9NFq5SmrTvwA
	 h6ioPjo8ivtxQ==
Date: Fri, 24 Jan 2025 14:15:43 +0000
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Himanshu Chauhan <hchauhan@ventanamicro.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Xu Lu <luxu.kernel@bytedance.com>,
	Atish Patra <atishp@atishpatra.org>
Subject: Re: [PATCH v3 3/4] drivers: firmware: add riscv SSE support
Message-ID: <20250124-banker-unbeaten-aef71ed58867@spud>
References: <20241206163102.843505-1-cleger@rivosinc.com>
 <20241206163102.843505-4-cleger@rivosinc.com>
 <20250116-boxy-handoff-2f2790b5388e@spud>
 <ae912564-60b7-4733-ab46-15fbba16ed94@rivosinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XamweOyPAnAumXGM"
Content-Disposition: inline
In-Reply-To: <ae912564-60b7-4733-ab46-15fbba16ed94@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_061549_139589_BC8A63B7 
X-CRM114-Status: GOOD (  19.12  )
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


--XamweOyPAnAumXGM
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 23, 2025 at 11:52:35AM +0100, Cl=E9ment L=E9ger wrote:
> On 16/01/2025 14:58, Conor Dooley wrote:
> >> +static int sse_sbi_event_func(struct sse_event *event, unsigned long =
func)
> >> +{
> >> +	struct sbiret ret;
> >> +	u32 evt =3D event->evt;
> >> +
> >> +	ret =3D sbi_ecall(SBI_EXT_SSE, func, evt, 0, 0, 0, 0, 0);
> >> +	if (ret.error)
> >> +		pr_debug("Failed to execute func %lx, event %x, error %ld\n",
> >> +			 func, evt, ret.error);
> >=20
> > Why's this only at a debug level?
>=20
> That's only really meaningful for debugging, this error is often
> reported to the upper level and ends up to the final caller. I don't
> think we should be too verbose for such drivers, but rather propagate
> the error. If one wants to debug, then, just enable DEBUG.
>=20
> But that's only my opinion, if you'd prefer all pr_debug to be either
> removed or changed to pr_err(), I'll do it.

Nah, you can leave it as is, you know better than I about how helpful it
would be as an error.

> >> +int sse_event_enable(struct sse_event *event)
> >> +{
> >> +	int ret =3D 0;
> >> +	struct sse_per_cpu_evt cpu_evt;
> >> +
> >> +	scoped_guard(mutex, &sse_mutex) {
> >> +		cpus_read_lock();
> >> +		if (sse_event_is_global(event->evt)) {
> >> +			ret =3D sse_sbi_enable_event(event);
> >> +		} else {
> >> +			cpu_evt.event =3D event;
> >> +			atomic_set(&cpu_evt.error, 0);
> >> +			cpu_evt.func =3D SBI_SSE_EVENT_ENABLE;
> >> +			on_each_cpu(sse_event_per_cpu_func, &cpu_evt, 1);
> >> +			ret =3D atomic_read(&cpu_evt.error);
> >> +			if (ret) {
> >> +				cpu_evt.func =3D SBI_SSE_EVENT_DISABLE;
> >> +				on_each_cpu(sse_event_per_cpu_func, &cpu_evt,
> >> +					    1);
> >=20
> > nit: this should fit on one line, no?
>=20
> the trailing ; is above 80 characters. But if you are ok with 100 char,
> I can go for it.

The slight improvement in readability trumps the slight increase over 80
characters every time for me.

--XamweOyPAnAumXGM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ5OgjwAKCRB4tDGHoIJi
0p5GAQDZnWSnOCSQp/p2fbliKDTlb2bEcahggumucOiMHAdYKAEAkvFFM6s2Mzg6
9vqEwZXG5teg8SVEXu0WLfS7Vq7SLQA=
=gmiL
-----END PGP SIGNATURE-----

--XamweOyPAnAumXGM--

