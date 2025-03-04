Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A25C2C282D0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 09:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R+snd39l7/xN3s1Qo+DJbJs4nIckPPRnGYnDiiy8gDQ=; b=t8GAauW0aShLGTas8O+8fV4zn0
	KbCUU5Ettbb+BlhypDAMivbcCdwnBNQWetNapqlbkSdye5jgdG+UOcabNU/wHjL39vtYNdIIuBA9v
	KPofg7ycq63+Nd53rWu+76CmIkkizPa7oFLb2DliT2l41OsHAvieSnYdO48GiN3/HVLqPLvkmPcCu
	qNWCUrZVDxljJIo0gC4JyEr2jm4ncR/d8TuVicx2UqxUdHio1TqhQsg/897RidY5KeORXKbhPdtrj
	O2vBl8wrNNQ3sMGHHwllnu+5hutVXJOO+3/8so2CJeAOwuBN2oU5LrZg5SaUnkJEVdUgRdgPHaFUZ
	W5zIynxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpOzF-000000040wo-2LE2;
	Tue, 04 Mar 2025 09:54:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpOvs-00000003zub-07zz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 09:51:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6D93D5C4EAA;
	Tue,  4 Mar 2025 09:49:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89A97C4CEE5;
	Tue,  4 Mar 2025 09:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741081882;
	bh=3AC8YGVOMopiGMhE+q/wk3R/hqs4Zk918q6dZqSrKY8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TnukOhcELWDMHSi92I6AH2aVZA9crN168Hg83AUocvBIll0kQbw0l+fEnwj72lKJJ
	 b3l7qDO1A6XN/OiOYGlOzZkiN2L8wkfPQtFMYX7FP0ETLgIufnIpxVK12lRO60Vwbn
	 FOzW6bfq2OZ1q2lJp6qfDYvFRXw+uvRaFgOyophzj0eDVgP9G5AnvacAy8UsuVHExt
	 YNdPupAKT8/17iBibqkWQVI4pWS79b9nO0nT0WeEA0TTAQa0sx00gKJ8e6J+G+PRpW
	 sMsmCa7u4QWQ0Jo7HkcwyBjFYAzfI/zE5INB4pXxqNix5LhPtr98+WULFek4Pu9yPF
	 sXmvtFguS0miw==
Date: Tue, 4 Mar 2025 18:51:18 +0900
From: William Breathitt Gray <wbg@kernel.org>
To: Bence =?iso-8859-1?B?Q3Pza+Fz?= <csokas.bence@prolan.hu>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-iio@vger.kernel.org,
	Kamel Bouhara <kamel.bouhara@bootlin.com>
Subject: Re: [PATCH v6 1/3] include: uapi: counter: Add
 microchip-tcb-capture.h
Message-ID: <Z8bNFjh85p2jqK9C@ishi>
References: <20250227144023.64530-1-csokas.bence@prolan.hu>
 <20250227144023.64530-2-csokas.bence@prolan.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8INrE+XEHmoL1yAg"
Content-Disposition: inline
In-Reply-To: <20250227144023.64530-2-csokas.bence@prolan.hu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_015124_176164_E46A7FFB 
X-CRM114-Status: GOOD (  20.84  )
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


--8INrE+XEHmoL1yAg
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 27, 2025 at 03:40:18PM +0100, Bence Cs=F3k=E1s wrote:
> Add UAPI header for the microchip-tcb-capture.c driver.
> This header will hold the various event channels, component numbers etc.
> used by this driver.
>=20
> Signed-off-by: Bence Cs=F3k=E1s <csokas.bence@prolan.hu>

Oops, I almost missed this one! Make sure I'm included in the To field
for the next revision. ;-)

By the way, b4 is a nifty tool that can save you some work and help you
prep patch series for submission.[^1]

> +/*
> + * The driver defines the following components:
> + *
> + * Count 0
> + * \__  Synapse 0 -- Signal 0 (Channel A, i.e. TIOA)
> + * \__  Synapse 1 -- Signal 1 (Channel B, i.e. TIOB)
> + */
> +
> +enum counter_mchp_signals {
> +	COUNTER_MCHP_SIG_TIOA,
> +	COUNTER_MCHP_SIG_TIOB,
> +};

Are these meant to be used to identify the Signals in the
microchip-tcb-capture.c file. You should set the the counter_signal id
members to these enum constants then. However, this enum doesn't need to
be exposed to userspace in that case.

Or is the purpose of this to match the parent ID of the Signal when
you create Counter watches? That won't work safely the way you intend
because the Counter subsystem creates the userspace parent IDs
independent of the kernelspace counter_signal struct id member.

Right now the Counter subsystem just happens to create these parent IDs
sequentially from 0 because it was a simple way to implement it at the
time we introduced the feature. However, there is nothing that ensures
this will stay that way in the future, and in fact the design intention
was exactly to allow the possibility of a future change to this area of
code.

In other words, there's no gurantee the parent ID in userspace will
remain the same even between driver reloads. The intended way for
userspace to behave is to first identify the desired Signals at startup
based on their "name" sysfs attribute and then set Counter watches and
such accordingly thereafter as desired.

If that is the only purpose of enum counter_mchp_signals, then we can
omit this patch from the series and you won't need to send it in the
next revision.

William Breathitt Gray

[^1] https://b4.docs.kernel.org/en/latest/

--8INrE+XEHmoL1yAg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCZ8bNFgAKCRC1SFbKvhIj
K8vtAQDQtKdqNviMCtM14inLMV9gO9XK9+zhMyb3MGIEkiBZ6AEAmowtr8SAqf6v
JEe9IFPC1iVoe0A355hZA2t2H7E3LwE=
=Wees
-----END PGP SIGNATURE-----

--8INrE+XEHmoL1yAg--

