Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B2A7CD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 20:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2G34fnGmkmRCuga2v0nSyRziiDYtvnbdhLlcoW44ug4=; b=nG8GRC5E9W8bTMsA1L0ikDMPWY
	9jVWFIUjqLJlischJBOw+EaeFB2f/T/iZieww0Cpt1PIANS6gbR1kY/sg+Cgd8WgpyhWpPmboMOJk
	ANL3YwzIol1jqbnYiNub8tZ6quSCTKeUCjRFcpUaZih9wrdmOCIznXL8v3yNCmKleQnmqgdsX3EU9
	/EUqVid0c/GvmU7bpoRp/IhljcVZxKdzNeHy0QVeeETrBmf6LH0jQ9nyR8Amx4l3yoiATTz/XOjoJ
	ihaF526kshtP29U5QADdTrkyppX5rQ0u2Wb+kyZ/J+Yy/epDWSsv5+JjHeIW+cXOyA17VSK1/pYEL
	c2VHYK/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wShkF-00000006NKl-3WQq;
	Thu, 28 May 2026 20:54:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wShkE-00000006NKf-3FOq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 20:54:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BF1556020A;
	Thu, 28 May 2026 20:54:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBCD21F000E9;
	Thu, 28 May 2026 20:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780001661;
	bh=2G34fnGmkmRCuga2v0nSyRziiDYtvnbdhLlcoW44ug4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iz09SeYN4Iyo7/d0Y1asGiSqpFxJ6DEuwVmbPBLu6rS1g2/p4TvnaIf8kN+OYOAvS
	 HxaUYHZCEY15IiiybTkFbaMPI/i0fs9omYnI38tKrgaaAMH0mq4Hy2+VOXdgBC0MzP
	 DwmVmhNPgjebG5WvTVnZFwwfWMMIFKWjRySLEdmIjBUaOQZZ+mP2rNQmQuzDEEv+9Y
	 Q0TTiF2cEETZe3NQLYtFJGabAMrGGmHDBz8rVGxbUAokYWUJTqbOYd67FLeCgIjTNO
	 bBs923GW+GF7FmKeoxIQzND+9Q47wkcDyqeTlNYiLArjUDHkMf2cTsIcekHnzSwH5U
	 hhu8W3ZJI2Qcg==
Date: Thu, 28 May 2026 22:54:19 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc: Mark Rutland <mark.rutland@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 1/4] firmware: psci: switch SYSTEM_OFF to sys-off handler
 API
Message-ID: <ahirc5aAH3dwDawe@orome>
References: <20260514-smaug-poweroff-v1-0-30f9a4688966@tecnico.ulisboa.pt>
 <20260514-smaug-poweroff-v1-1-30f9a4688966@tecnico.ulisboa.pt>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nzilneadabmojjrh"
Content-Disposition: inline
In-Reply-To: <20260514-smaug-poweroff-v1-1-30f9a4688966@tecnico.ulisboa.pt>
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


--nzilneadabmojjrh
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/4] firmware: psci: switch SYSTEM_OFF to sys-off handler
 API
MIME-Version: 1.0

On Thu, May 14, 2026 at 04:47:19PM +0200, Diogo Ivo wrote:
> Replace the legacy pm_power_off hook with the generic sys-off
> handler infrastructure.
>=20
> Convert psci_sys_poweroff() to the sys-off callback prototype and
> register it through register_sys_off_handler() with firmware
> priority. This removes the direct dependency on pm_power_off and
> drops the now-unused <linux/pm.h> include.
>=20
> This aligns the PSCI poweroff path with the modern system-off
> framework used by other firmware and platform drivers.
>=20
> Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
> ---
>  drivers/firmware/psci/psci.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)

Reviewed-by: Thierry Reding <treding@nvidia.com>

--nzilneadabmojjrh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmoYq3oACgkQ3SOs138+
s6EvIQ/+NSPLjpH1GzS6NNKI/4+bRuT5u2FFyygNCKfSSaR9Px7pHu8aO1Hi9vFr
CKqWer/BMr6/hRqVTNO7TTV49hZL2l8wx0koB/j8OjXph2KrDTEFug6ExD5zUld7
rzNgPkHWOZF7DwwJfdBuUgon+THoxNeoEU590foaoGhl8xZQ0WMcsuRKj4w1p3UZ
Ma5NEmgtBecUfZfttyiaUnbvF8b6nD5fp1aVC6AhMzkr4PUGDjSMytv54cVkOrZy
mWvpq1hW7kW21cuki+jCNxgIykuwQmm/XOkxqGibhZTwi+B8c0nQxFH2slPkX4rM
4Xt+vZrOKyOvqS7PStE5+4u61koGJs2Cc8pocqIMjfNvIS/Vea2lHD+gvO9IwWa6
PHZKr2+UYFt3YTwCD5dJuoUaMtBo+GEv9KDMC0FD928gg7vBr+dya7cD27XO2iGS
d0JqnT/1OkLZy1s7EA9KuWdU5/h5gvMPlcWAur2tSavXEO3IxjzJDJYmW1H+4xil
TRxSzzJMGxlAPxJQNnQDzqixLaeDqwVRws+gxH6RJyJoGBbPPFGm7UTu2+7zKBDb
F0hRL8bI8ZYq06Zn0F1J3kIrWlUO/CHXWugomWD/6IuCVM6fVQC5UmhaQtTqUbXH
gSZ3ocRT1zcTmO5V4rx+Djg/ZhfjKv3j/tJVGSYPuAv15BluSOU=
=7W3h
-----END PGP SIGNATURE-----

--nzilneadabmojjrh--

