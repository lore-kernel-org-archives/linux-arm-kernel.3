Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41F6BC61DC4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 18:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BLqeMPBBFLZB2XtBVAVDJSZch4XELRlb7qugskkfcMg=; b=g0HOYnw0S5N5rrEDcRIHUzu1pN
	75hu6COr4Hz3OptirbYDVub2ZzzSSgBTvXJmFm1neyNb1QKgb7dzSJWzdLTTvx508xT399qnjl14m
	vrbSoALuDo2GIehwvcsVCP7H1febHjzu2/FpZ7IwCYozwTeyqyuvq+/VCDRymZni3h6lyf9+X2ZzM
	wt6dfG6LZMeB7t0Vi2sDPtpnYeGQDy8PLF5AfaDZEXl86ElnVWXiPrQBmc6PB6GVRBNxzA90q6dd5
	esY7MarLkp6YaSt0KBpUekshrOlVSsrfepW2c3I+iJB7ABlfH1Sd1BoI/YOxwMo5e0iasA6vVac7Y
	rszyGr9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzecV-00000004ZvV-0lod;
	Thu, 27 Aug 2026 18:14:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzecU-00000004Zv7-0rBq;
	Thu, 27 Aug 2026 18:14:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3233D600D9;
	Thu, 27 Aug 2026 18:14:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2219B1F000E9;
	Thu, 27 Aug 2026 18:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787854472;
	bh=BLqeMPBBFLZB2XtBVAVDJSZch4XELRlb7qugskkfcMg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Vt4ggbUetYUKJ27EewJQTpgv3qkZTj9ozDFcDv8WygJ3eSNDoxxMV8fBzZLHs9PnA
	 xxxnvaoZsrRyYqFAX4UZZ7TYobmBeZx/FTo05GSUCcrTcQLPNZ4Q7bH2F5eXgDrWRw
	 EcaiZurE6opfx44t9QE5Rqn8848DD59WBL5kcMohlgZX5u+Aug4DF2lxQveaKOL0dc
	 hxzUv8KwTUFyeWOo0IlkU+1ivw7s8z/EI6UmxNB1uUjkZsvnFefYrGbZttRPQN3kTb
	 iYuXAjqHBj7mSV8h8Zz3m6/VaOOFGxNvypQ+ewn9m3+dCXKfZn19mHLfXQGCUTk2+X
	 9S9YOem41Zxmw==
Date: Thu, 27 Aug 2026 19:14:28 +0100
From: Mark Brown <broonie@kernel.org>
To: Bill Roberts <bill.roberts@foss.arm.com>
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	linux-arm-kernel@lists.infradead.org,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	linux-hardening@vger.kernel.org, linux-api@vger.kernel.org,
	dave.hansen@linux.intel.com, rick.p.edgecombe@intel.com,
	debug@rivosinc.com
Subject: Re: Shadow Stack Locking Semantics between arch's
Message-ID: <d20ccb74-69ed-45d7-a810-846904873588@sirena.org.uk>
References: <a1946d93-370e-4ca9-85d6-60b4a20ffd47@arm.com>
 <3bb672e0-7bc3-434f-904e-aa00394dd01f@foss.arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Yf0EwlbjDAgbC5GQ"
Content-Disposition: inline
In-Reply-To: <3bb672e0-7bc3-434f-904e-aa00394dd01f@foss.arm.com>
X-Cookie: Exercise caution in your daily affairs.
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


--Yf0EwlbjDAgbC5GQ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 12:52:28PM -0500, Bill Roberts wrote:

> I have noticed some semantic differences between the arches. Given this
> example of current thread state, current thread locking state and the
> new features requested, as shown below:

> unsigned long locked =3D 0x2; // Kernel Task State -> LOCK WRITE
> unsigned long cur_val =3D 0x3; // Kernel Task State -> WRITE and SHADOWST=
ACK
> ENABLED
> unsigned long new_val =3D 0x0; // Userspace Feature Change via syscall ->
> DISABLE

> | x86-64 | risc-v | arm64 |
> | ---------- | -------- | --------- |
> | Works=A0 | Fails=A0 | Fails=A0 =A0 =A0|

I would not have expected that combination to work at all with the
prctl() (as opposed to arch_prctl()) interface TBH, if you've locked
write on you shouldn't be able to disable it.  The reason that works on
x86 at the minute is that for x86 you can only change one bit at a time
so the new value when disabling is effectively 0x2, not 0x0.

> I am proposing and have questions over the following:
> 1. What should the behavior be if you had write locked and disable the
> shadow stack?
> =A0 - I can argue both ways here, -EPERM or success. I think I and most a=
rches
> lead to failure.

Given that RISC-V doesn't support control of writes it's moot there
at the minute, and x86 currently uses arch_prctl() so will need an
additional API, it seems the path of least resistance is to allow it.
This also avoids locking writes (or pushes, for arm64) on effectively
also locking enable which seems neater.

> 2. riscv should check that the low bit is set in locking not just that its
> 0, it should be 1

I think for ABI compatibility RISC-V will have to continue accepting 0
as being equivalent to locking PR_SHADOW_STACK_ENABLE (or everything,
but it only supports that one bit right now).

> 3. riscv should return -EPERM vs -EINVAL

If you mean for arch_lock_shadow_stack_status() I think -EINVAL is a
sensible error code when the system or task does not support shadow
stacks, I'm not sure we should return -EPERM at all.  On arm64 we
support locking any bit, not just the ones that we currently know about.
This is for future proofing, userspace can lock unknown flags.

> If we can all agree on item 1, that locked bits check can be refactored a=
nd
> shared in one of
> two ways:
> 1. within prctl itself, before the arch hook is called, we would need
> helpers per-arch to extract the thread features and lock bits
> 2. as a helper where folks just pass the unsigned long of the bits to get
> the result

For me option 1 seems a bit nicer, and moves more of the implementation
into generic code which is something we should really be doing in
general with the shadow stack support - there's a lot of cross arch
duplication at the minute.  It has been on my list to look at this
repitition at some point, it had been held up by the clone3() stuff but
that seems to have died a death for now.

--Yf0EwlbjDAgbC5GQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqQfoMACgkQJNaLcl1U
h9CgJQf/RXCfxOLBrpvqx7CGBBJ+UQyh71H64Yy4Tt40trYCcoJLxK6joixB/sT7
g0fKTvETGH7NCIr9NJqTGfvOyZ7Bf4gL2ZL79NU5zTtmWdwB21cDG7tmvoXw2mUw
9SMS62c1y4XEpniYBz7nYA24TgB4ZkpL0J8tOPGVkol0Gjf7ZTnd80JrsdWiYbNY
pFjWClV4iJ/MEwq0Q7dsrRY/3399co/0ZlRMp2LeLEKGce4gGKgmBAJlSv1wQ/lw
qhofehL0NPsqRgdVjXpdoUuRwZ9/odMAZav8deL4wvZJiEtppw7em8wuTszq8NxZ
Ct5MM4+/dYaw4Oh2ftBDOMgYjAL/lA==
=a0+n
-----END PGP SIGNATURE-----

--Yf0EwlbjDAgbC5GQ--

