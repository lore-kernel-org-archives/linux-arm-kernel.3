Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5B86CCF9FE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 14:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Em94Y9EOG8JA9ASO/qexMXfp5Ee2gkkJnJYONvgfFDU=; b=fwstTnc8cVZ11peWyu3Y6yEfk/
	AwQpR0BEfeQ3TCz6pCIsY6EL/imK4gt3YLkkPEE+XnQxtouwFKmHeDjX3mutadTTZrlhYoZBAUi9g
	Un5xFPaPJdZcbl/EG44lfg30VokGMC0Ufk+jqtfbOedIhNlc3Oml7hf0DCqqCqPAGu4k4k33Yzwds
	0aJbRo8o7X1B9okBm4cUp8zK8Rckt2wywRooqHkQQQHqgQOrivJgyEiWoAx3lY2brDfhIeeHzr11E
	S5Nn4IDxzJ0X8N0B19Brjv0B40lmQPe32BfvbdJXvhzzUsZ9IJ/eHzJmwkMxpcUXF3IJnrB23F5w3
	N3FFao2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEpyg-00000006ECy-3KC1;
	Fri, 31 Oct 2025 14:19:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEpyf-00000006ECo-0fQK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 14:19:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3CF556021F;
	Fri, 31 Oct 2025 14:19:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED79CC4CEE7;
	Fri, 31 Oct 2025 14:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761920379;
	bh=wQRM2UW1sxJDdwZLeEi1RxmRJHRzAbI62WHDRiedhPY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lrAAjOSjBkZe4zpf5QmgKavPL9WvxlesH3gkZY9NRpwaO4Sl9vp7aZvQrv6mdt4Lz
	 C3dZ55WLMKRt4oz9fvAMstDv3HRyPTs6j5FomyPWf4v+AWGAvNBzn0s7+XKodUh8To
	 cmV/zX6HSwdqd0IfmkH6VUrrP9lPCDzHgDodV8J+tryGszK7q4cOZkgc30+D9MciKA
	 CIyLCquPo2IcDlXIgW3YYNU4+7XzGP2qM6qpB2yB3Z/x7JpLC/r6Uw5Kt1vP6FULgg
	 TrNO5OGGfVGTYGRZD6ktrdF4864r0FzSQx8DILLzbPa54mprix6cOzL3Bp4lO9jJTp
	 zTwuR+hBESN7g==
Date: Fri, 31 Oct 2025 14:19:34 +0000
From: Conor Dooley <conor@kernel.org>
To: adriana <adriana@arista.com>
Cc: ilias.apalodimas@linaro.org, ardb@kernel.org, trini@konsulko.com,
	robh@kernel.org, krzk@kernel.org, jdelvare@suse.com,
	frowand.list@gmail.com, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, vasilykh@arista.com,
	arm.ebbr-discuss@arm.com, boot-architecture@lists.linaro.org,
	linux-efi@vger.kernel.org, uefi-discuss@lists.uefi.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 0/1] DMI: Scan for DMI table from DTS info
Message-ID: <20251031-veteran-muskiness-657bce541e9b@spud>
References: <20251031101009.704759-1-adriana@arista.com>
 <20251031115917.713105-1-adriana@arista.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eRy3XHTEy/x7sBgO"
Content-Disposition: inline
In-Reply-To: <20251031115917.713105-1-adriana@arista.com>
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


--eRy3XHTEy/x7sBgO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 31, 2025 at 04:59:16AM -0700, adriana wrote:
> Some bootloaders like U-boot, particularly for the ARM architecture,
> provide SMBIOS/DMI tables at a specific memory address. However, these
> systems often do not boot using a full UEFI environment, which means the
> kernel's standard EFI DMI scanner cannot find these tables.
>=20
> This series adds support for the kernel to find these tables by
> reading the associated property from the Device Tree /chosen node. The
> bootloader can specify the physical addresses using the property
> "smbios3-entrypoint".
>=20
> This patch implements the driver logic in dmi_scan.c.
>=20
> Changes in v5:
>   - Removed linux,smbios3-entrypoint.yaml file and the first patch.
>   - Renamed property to "smbios3-entrypoint".

Please stop sending new versions as a reply to the old one.

>=20
> Changes in v4:
>   - Renamed linux,smbios3-table.yaml file, removed mention of ARM/ARM64
>     (Patch 1/2).
>   - Drop the second definition of dmi_scan_from_dt() and fold checking
>     for CONFIG_OF (Patch 2/2).
>   - Drop unnecessary goto on the success case (Patch 2/2).
>   - Replace magic number for entrypoint size with SMBIOS3_ENTRY_POINT_SIZE
>     definition (Patch 2/2).
>=20
> Changes in v3:
>   - Removed linux,smbios-table property, only keep the SMBIOSv3 property
>     (Patch 1/2).
>   - Search DT for linux,smbios3-table only, removed the code searching
>     for the previous property (Patch 2/2).
>=20
> Changes in v2:
>   - Add missing Device Tree binding documentation (Patch 1/2).
>   - Split the original patch into a 2-part series (binding + driver).
>   - (No functional changes to the driver code in patch 2/2).
>=20
> adriana (1):
>   drivers: firmware: dmi_scan: Add support for reading SMBIOS from DT
>=20
>  drivers/firmware/dmi_scan.c | 54 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 54 insertions(+)
>=20
> --=20
> 2.51.0
>=20
>=20

--eRy3XHTEy/x7sBgO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQTFcgAKCRB4tDGHoIJi
0rvgAP9JqlWc2Y8wCDOgMKeJ5vX8s68KGDcO0PP+uUxQcpFxHQD+KHg+AKxl8432
Ha3PPNXRFNREA2IRIHbbPY9749MaAw0=
=AvI9
-----END PGP SIGNATURE-----

--eRy3XHTEy/x7sBgO--

