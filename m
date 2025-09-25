Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41B2ACAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 07:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Content-Transfer-Encoding:To:From:Cc:Subject:Message-Id:Date:Content-Type:
	Reply-To:MIME-Version:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6tvrlYM4ypm3uCxKvO5/nP2owYKh8tc18s60KyVYn0M=; b=TY6Ex5Cys8JkK+PZOw/GyJYFaX
	LaImk2/XpTkIJZAttRI5dQlify9rQ2VWFstUIC+anTgSnwQ51ASx6NRGTlwoNQRRL2PKQy4PnBVAH
	SyCr4bfCxc7/58rUrY+bK4weIOGzyjtUd7O38CdDJk9kfLHKiWPU2YwCtPoY90FSAlJQ+NrgaTiJd
	dSNNyzZaJNzZCW0ddPNZLoRLrHBpqfyg0G99ZtjwFZuKcgLM+BJzCnWHJIKFsYfFYwoebiLCxqdQU
	/dhDAEPS9+0xDo8PC09AAV6GF/hcVxkTJnFIan6kMkkdnwM44hj3sJZccib0pgA+n8nftCnc3jPFG
	7yf46lfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1gPV-00000006iNo-0dSG;
	Thu, 25 Sep 2025 07:29:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1gPS-00000006iLx-2vQn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 07:28:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D290A40212;
	Thu, 25 Sep 2025 07:28:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 375AEC4CEF0;
	Thu, 25 Sep 2025 07:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758785337;
	bh=E5H22ljejFV7OF7GmWz23BkhezFyc+iVSQv0Pyu/jqI=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=qpR4FUbuRe+vO4qghhExmZIfSTpFhRiJnGnNyZsW967PX6XSYQkAoLyuYENEpquWI
	 HN7e+8SFMSoArAk9VV5oRKuLSNMMpgdlRvwCNt7S+kQ8ZTGEAtZgoFGmt0BSVopW8A
	 gfn+i7uCp4wZxpP5u519ZPHZdkwont1gxBSSAA1DVIlK6salhnGcXj2bwmWHVKcf9B
	 A6xPQmzDsDEVkYWbAiLOpJl8XpETbWlCnq0iI+dom6ZgWljwwCS8mK37QVLWB9JbHZ
	 4qauHkQ0AYwguWYn0aerkZSGTjlt8AkTutFazB32t0uTpPBfXW40vugdLKAki5ggqH
	 aZgucfXSNl0IQ==
Content-Type: multipart/signed;
 boundary=0afea6db4dd96f53b68f9fad7bcae6c16f16bfb407d755022db670fb382c;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Thu, 25 Sep 2025 09:28:53 +0200
Message-Id: <DD1PD807DBY9.2FY81JFZ6EDAE@kernel.org>
Subject: Re: [PATCH v2 0/7] Initial Kontron SMARC-sAM67 support
Cc: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
 <linux-watchdog@vger.kernel.org>, "Andrew Davis" <afd@ti.com>, "Nishanth
 Menon" <nm@ti.com>, "Vignesh Raghavendra" <vigneshr@ti.com>, "Tero Kristo"
 <kristo@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Jean Delvare"
 <jdelvare@suse.com>, "Guenter Roeck" <linux@roeck-us.net>, "Michael Walle"
 <mwalle@kernel.org>, "Srinivas Kandagatla" <srini@kernel.org>, "Wim Van
 Sebroeck" <wim@linux-watchdog.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Lee Jones" <lee@kernel.org>
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.16.0
References: <20250912120745.2295115-1-mwalle@kernel.org>
In-Reply-To: <20250912120745.2295115-1-mwalle@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_002858_776502_1853B661 
X-CRM114-Status: GOOD (  20.05  )
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

--0afea6db4dd96f53b68f9fad7bcae6c16f16bfb407d755022db670fb382c
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Lee,

On Fri Sep 12, 2025 at 2:07 PM CEST, Michael Walle wrote:
> Now that the PMIC support is there, we can finally, upstream the
> support for this board. Besides the usual device tree, this
> patchset contains the support for the on-board house keeping MCU. It
> make extensive reuse of the drivers for the former SMARC-sAL28
> board. Besides different hwmon sensors, all the dt binding patches
> will just add a board specific compatible (in addition to the old
> sl28 compatible) to make any future board specific quirks possible.
>
> I'm aware that there is a patch [1] which moves the sl28cpld MFD
> schema to a different directory. Once that patch is merged, I'll
> repost this series. But I already want to get some early feedback.
>
> v2:
>  - dropped patches which were already picked up
>  - new patch "dt-bindings: mfd: tps6594: allow gpio-line-names"
>  - separate driver for the hwmon, add missing hwmon documentation,
>    thanks Guenter
>  - split the DT as suggested by the SoC maintainers
>  - add missing copyright and license to the overlays, thanks Andrew
>
> Michael Walle (7):
>   dt-bindings: arm: ti: Add Kontron SMARC-sAM67 module
>   dt-bindings: mfd: tps6594: allow gpio-line-names
>   arm64: dts: ti: Add support for Kontron SMARC-sAM67
>   dt-bindings: hwmon: sl28cpld: add sa67mcu compatible
>   dt-bindings: watchdog: add SMARC-sAM67 support
>   hwmon: add SMARC-sAM67 support
>   arm64: dts: ti: sa67: add on-board management controller node

Would you take these two patches
    dt-bindings: mfd: tps6594: allow gpio-line-names
    dt-bindings: watchdog: add SMARC-sAM67 support

through the MFD tree this cycle? If they make it in, there wouldn't
be any more dependencies for the next cycle for the actual device
tree.

Thanks,
-michael

--0afea6db4dd96f53b68f9fad7bcae6c16f16bfb407d755022db670fb382c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaNTvNRIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/iMSgF/U/Hnym3/BbU5iWgqn4kuJE5mIgjGrqH+
xebvDaMtckOeHjdqxGIg7wAV1v5PZLsUAYCYJPNo/zXnrrWdXLOY+md/sOocOPZr
/NGu1VF2dlgbKARDg+JXcIGreW3wYK3JzV0=
=kccx
-----END PGP SIGNATURE-----

--0afea6db4dd96f53b68f9fad7bcae6c16f16bfb407d755022db670fb382c--

