Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB091CD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 16:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tGKU8E+SUvJHoFiynwbHI2BeXeAL0j7cya1Wau7I4vQ=; b=QiNYWSR947lTKnPBJu/4obUG39
	BnBPeLrdek+LA/dybsqhYj4baSQC9eKM0L5XxFp6g7wBVaCf9e5naa6jAEwKZ3cFrtuv1IzJHORrJ
	d+6wXLO4f2B9M06/enHFAQbuULr2q3tYNUxqMqbUsAEAtf8A3MMHRztwpzXBrHnXFE4SoCFZmBlMM
	YKcLmxfEEbhsmTYnZ4mdkjBOK6Sf/BWiZOlI0/tyeZSsKr/pCM/2DIVqnOB+gLHq9wLmLFIKnnCWh
	FK0p2MLD1t9HYHxyXwxBtHL73SxTfBeg3Lv4vgVaLI5kCGKZHxC4X2nAkPuikF/FlBX2So/2bpFeE
	KK7s7p1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRutM-00000002YPV-3Yut;
	Tue, 26 May 2026 16:44:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRutM-00000002YOw-0JiR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 16:44:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E7B5D600AB;
	Tue, 26 May 2026 16:44:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D31F91F00A3A;
	Tue, 26 May 2026 16:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779813870;
	bh=tGKU8E+SUvJHoFiynwbHI2BeXeAL0j7cya1Wau7I4vQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BRNH7TLlYQBShbQSHMOmVM58UlZR617G8hnceQvbPzM8LgjFt+ZtxH06U5GRlDccv
	 a6u+j5PeABhEeZrqvERhD9pApZJdpfB+U67MfjD5bliB13lhizEtAcWEsQZnMxad41
	 pLPM1tIuVXvbCU/xub2EPnu19ZdK1eGEC3xTkAbxJgJXlEfOiLrUK1HourKgrlFPk1
	 oilQzIyhebvuEiBULoQAY9+wx1INCK9Bf0QHRTjDYPk/RHo7Sg/iE6ebMYwhdqCZ45
	 GObU37/JLZkfF/3GMsilDE/oKrwheYXps/eyzH9uVhiIxIhLhn0Di8ni2mU9u4+9sD
	 TgYgKpCI687UA==
Date: Tue, 26 May 2026 17:44:26 +0100
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	catalin.marinas@arm.com, james.morse@arm.com, maz@kernel.org,
	oupton@kernel.org, tabba@google.com, will@kernel.org
Subject: Re: [PATCH 12/18] arm64: fpsimd: Move fpsimd save/restore inline
Message-ID: <0f666889-fabe-4cdd-9fd2-d87808329dbd@sirena.org.uk>
References: <20260521132556.584676-1-mark.rutland@arm.com>
 <20260521132556.584676-13-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7dYZlBhPFm19SJYP"
Content-Disposition: inline
In-Reply-To: <20260521132556.584676-13-mark.rutland@arm.com>
X-Cookie: You are fairminded, just and loving.
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


--7dYZlBhPFm19SJYP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 21, 2026 at 02:25:50PM +0100, Mark Rutland wrote:

> Note that I've used the SVE sequence for restoring FPCR, which uses an
> unconditional write to FPCR. The plain FPSIMD assembly sequence used a
> conditional write to FPCR since 2014 in commit:

>   5959e25729a5 ("arm64: fpsimd: avoid restoring fpcr if the contents haven't change")

> ... but this was not followed for the SVE assembly implemented in 2017
> in commit:

>   1fc5dce78ad1 ("arm64/sve: Low-level SVE architectural state manipulation functions")

> ... so I've assumed that this doesn't actually matter in practice, and
> I've erred in favour of the simpler sequence.

As I said on the earlier patch I'm a bit nervous about assuming this
doesn't matter for anyone without verifying (though I wouldn't be
surprised if that turned out to be the case) but that's internal to that
patch and this is obviously a great improvement so:

Reviewed-by: Mark Brown <broonie@kernel.org>

--7dYZlBhPFm19SJYP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoVzekACgkQJNaLcl1U
h9Cwrgf8DnZ9/uZEoEiYdQkF4oioTz4ZcjgBjg8SV66A43aX0D5mulOMtJOq6uK4
t+GxjGuwQhsDrMbrpMpaUgPILKHZAqaGgSuGePev8+vjWF032sOUxinxbRsVtsLm
IEm8MSeyDiqENEINUgF2m1FZbf/HMkIq1HXUrFQEka0zq1/FzvSuesuHLvqemSTo
0xDKqeFqqkitUNOZrMMW3MVzlWCbu06bE8VrUJ/CjA3WfED4YbPLEuCpjrutr7A/
LgRb3q99zzoq2ZQcnSxhwMRTO97AtJGNWSJdwBmNJWTsF55NVCq/mwKlnLcZw0Tm
6u4Z5hAcYaffWWMGyGs6N/QvU5N1jw==
=TR2n
-----END PGP SIGNATURE-----

--7dYZlBhPFm19SJYP--

