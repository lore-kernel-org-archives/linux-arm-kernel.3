Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC62BD37E39
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 14:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bGtZwo1cLdftMoCNQowPmY03xs2aB6km1wDfI8yo0ag=; b=N84Z2R9SGip91F/YXPa/9BRg0I
	qzqsSFAsc9/SijQEHjfmfiMqyfDuAc7QDnJDEsdrIOgdExYKO1fL06w0i7g5ekvfYWRs29bgEgZC8
	NU46GfzjZl+hKUc7iq6oBWghfhmxlKMpeQO7I6aN5Vl8WrxJsE4MG0cpAPYqvqEyjnMBzVFai7f+P
	JWkQgLjSOp7tH2bZ1PNoThJmsq6GJPnPQRJfjtpRrWZfMah+4QpFOhEHTwi7onPOBK7PtsOOJYjWw
	ny2Nk1hAUc7a3waz62w8GBCaFkJMxgcJe5aOZCgCU9HwvljMZc0uLLrln2o9Pq4wXe1QGKGGPK1Ky
	2lPeJJKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg1fr-00000009U8v-2wV9;
	Wed, 14 Jan 2026 14:16:39 +0000
Received: from mail.alien8.de ([65.109.113.108])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg1fn-00000009U4h-3ggI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 14:16:38 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 628C540E0194;
	Wed, 14 Jan 2026 14:16:17 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=fail (4096-bit key)
	reason="fail (body has been altered)" header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id U9i6nnOD5eUv; Wed, 14 Jan 2026 14:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1768400172; bh=VRoSE/2YTwFhEpBBl9wXpY8ydPU6I1xxtgwmqqKape0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=htk+x4Natx08his9bWPcyT1eRR2E8mDo6r0Ufv6M7oX9I1xf/5nuKcRZPOt5JxFil
	 0DvrlAz0d2fonr1AfsbmuosW50C8y8AmnD9ABkAVcz/irfYQKSMHS3Y9ltalVds6wU
	 DTuRZk1RmrxFdRMrSl+9eeEWHB+qnXrGlJIW18D40BH0Xy6VF5Du6dcAqHL/QItIOG
	 RhFxknDK9aKTwPtwPZsc81Qo0JEgFJCxA1h/UwnEh/jQkCQG/L+NJn8fXYLTBuk/W4
	 1VKxEB5pqHN7dp5Cq1iwvaQ+uh/YYx/6aGXFad82Mh4WYRT2IpNSty94gOwXqUgk88
	 iKFWzxUOws2xTDEzs8v7XzGbqOe+Rd6ucImcyNSW4ZQGj+KdtHAiOrbA+YGgScbR2t
	 QRL7tKqgCCIA+X48lHwrFW3P4rqDumjugBJINl8I0z+W59xVpbdlcDhJ7sg2om9sb/
	 Vg8KkN7bmGqZdrjoBMYFo9BhQESYLdHsRAMR4uvUmD7lK3Qrl/6CiaGP0QSHTxCdwJ
	 ql6xe/rslfuUVQk11RN3dRitXJxteJ/bvPvKYj3QndGFsiI8Z/9qcxMUg+EWW7qpZX
	 VtDCCiOy6v1ID7knmO7TX5qxIvsynDRvzdk0cPpkA4nPPz7chJwTdXHX3AZ2hHoj8I
	 Smbu6S3Z1aBrY+pY/st1NB+g=
Received: from zn.tnic (pd953023b.dip0.t-ipconnect.de [217.83.2.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id 5C64E40E0280;
	Wed, 14 Jan 2026 14:15:58 +0000 (UTC)
Date: Wed, 14 Jan 2026 15:15:51 +0100
From: Borislav Petkov <bp@alien8.de>
To: Ahmed Tiba <ahmed.tiba@arm.com>
Cc: linux-acpi@vger.kernel.org, devicetree@vger.kernel.org,
	tony.luck@intel.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, catalin.marinas@arm.com, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, rafael@kernel.org,
	linux-doc@vger.kernel.org, Dmitry.Lamerov@arm.com,
	Michael.Zhao2@arm.com
Subject: Re: [PATCH 00/12] ras: share firmware-first estatus handling
Message-ID: <20260114141551.GKaWelF-Gsvzr71LUs@fat_crate.local>
References: <20251221013534.GAaUdO5vWqMWAdbWbd@renoirsky.local>
 <20251229115440.2734800-1-ahmed.tiba@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251229115440.2734800-1-ahmed.tiba@arm.com>
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_061636_129392_893E7CCE 
X-CRM114-Status: GOOD (  13.63  )
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

On Mon, Dec 29, 2025 at 11:54:36AM +0000, Ahmed Tiba wrote:
> By =E2=80=9Cerror status=E2=80=9D I=E2=80=99m referring to the UEFI CPE=
R Generic Error Status block,
> which is the standard firmware-produced error payload that Linux alread=
y

Standard, schmandard - a bunch of fw crap.

That's UEFI's understanding of a common platform error record, no?

So why is this a generic estatus and not part of CPER-something?

You're calling something "estatus" which sounds like a generic thing but =
it is
simply a subset of functionality you need to make it work on ARM without
ACPI and have packaged whatever you need under the name "estatus".

Why does this thing need to be called an "estatus core"?

I'd expect to see a compilation unit which contains shared functionality,=
 gets
linked to your stuff and that's it. No "fanfares", no CONFIG symbols, no
nothing.

> consumes via GHES on ACPI systems. I=E2=80=99m not introducing a new er=
ror model
> here; the intent is to reuse the existing CPER decoding and handling on=
ce
> that payload exists.

So why aren't you doing only that? Why are you doing all that extra stuff=
?

> The practical use case is firmware-first RAS platforms that emit CPER
> records but do not use ACPI/APEI GHES for discovery or notification. To=
day,
> those platforms either have to duplicate CPER parsing logic or miss out=
 on
> the common Linux RAS handling (standard logging, memory failure flow,
> vendor notification paths). As a result, the full firmware-first RAS
> pipeline effectively only works when CPER arrives through GHES.

Yah, got it.

But see above.

Please do not "over-design" this into a separate thing but simply carve o=
ut
the functionality and share it. And leave it where it belongs
- drivers/firmware/efi/ is not the right place as this isn't really EFI. =
This
is a piece of APEI/GHES crap you need.

Later, when there's need to make it more sophisticated, then we can talk
again.

Thx.

--=20
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

