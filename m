Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECD95C54E71
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 02:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lVRHaQ6XE1w3gYaKM7tq0RnLKSJmxtnmat2fqFD1SWA=; b=YGREbXG4qfMoCspnPdcabkCyQU
	GmcArNFvkFxSGHu0MWRPTGXNxINm20JZhjR7usM4XnlZT2izLqYvT7uW0I5Jgy6jmHo2QJ4Plz7r2
	NTFJ6JklUUuY7+XH57/PBtTWYTrBcUMxyNwtwy22rp5s1UQ46B0++3Lf0pmnBVTi1d3/USUPCaN+I
	Ups+e+uyGGm1P1uOAvA11Yt5eJD2FgXEy5YEd8aRe3dy61FbHq3THlgtU/XM1H4ksOWXeqJ9pHUBP
	tUjyOHSat2gO3XUzbEcIi7aZSGXKh0aYOk2IGDrJg6ya3PvxrhfVvUNUNeT6XfHlCKpaCnlY45M7A
	Rw69Y0PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHvX8-0000000HG52-3G8X;
	Thu, 22 May 2025 02:19:46 +0000
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHvUv-0000000HFq5-3cRV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 02:17:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747880247;
	bh=lVRHaQ6XE1w3gYaKM7tq0RnLKSJmxtnmat2fqFD1SWA=;
	h=Date:From:To:Cc:Subject:From;
	b=QXUmmB2XWeQ6P8EIdCcMbkSiVZ65Pfh7kiFRbPOA53D8pIfjvdGMD8o4m5+6++L61
	 mXLuH+5S9f/x10JsGOMlOpR/qsZ2Pf7WvFEsHZR5SRS9nEcujc064YYK7g2bqGh20X
	 WfzfQ3NJzJoNrm/nfqY5MdPYafmGzQLcYh2wy68X0V0kWlgshSOmczsqI3nlW72HY1
	 FGKuy96tEpl6DdtoZTY+ZLElGvc3yi/0u/+6t4GKl4Aov4/kW0uv6aNDtBhioHvvHU
	 xOd9RYAiEG5AFsD1IlbDeHClB6EZcoz8CUQpMlin3l6BrvV804S6XIq9ykITj+Qaa5
	 rZz5XOD4R4l8g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4b2sPg3vFqz4xD9;
	Thu, 22 May 2025 12:17:27 +1000 (AEST)
Date: Thu, 22 May 2025 12:17:26 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andi Shyti <andi.shyti@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Alexey Charkov <alchark@gmail.com>, Andi Shyti <andi@smida.it>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, ARM
 <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the i2c-host tree with the arm-soc tree
Message-ID: <20250522121726.0a4350fc@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gABvDSz61vTa7_NFTstHl5E";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_191730_171376_83B1D9F8 
X-CRM114-Status: GOOD (  15.34  )
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

--Sig_/gABvDSz61vTa7_NFTstHl5E
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the i2c-host tree got a conflict in:

  MAINTAINERS

between commit:

  47cbd5d8693d ("ARM: vt8500: MAINTAINERS: Include vt8500 soc driver in mai=
ntainers entry")

from the arm-soc tree and commit:

  3887d3f64260 ("dt-bindings: i2c: i2c-wmt: Convert to YAML")

from the i2c-host tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc MAINTAINERS
index 3ca100bf2c02,bc13b87e85c0..000000000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -3435,8 -3434,7 +3435,8 @@@ M:	Alexey Charkov <alchark@gmail.com
  M:	Krzysztof Kozlowski <krzk@kernel.org>
  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
  S:	Odd Fixes
 +F:	Documentation/devicetree/bindings/hwinfo/via,vt8500-scc-id.yaml
- F:	Documentation/devicetree/bindings/i2c/i2c-wmt.txt
+ F:	Documentation/devicetree/bindings/i2c/wm,wm8505-i2c.yaml
  F:	arch/arm/boot/dts/vt8500/
  F:	arch/arm/mach-vt8500/
  F:	drivers/clocksource/timer-vt8500.c

--Sig_/gABvDSz61vTa7_NFTstHl5E
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmguiTYACgkQAVBC80lX
0GxcSQf5AVj6pKtp7El2+p8J6aena1evSsaeXwc8DmwmSczjfyF+yY1VNvOUgZBb
MBoDs18CxrWjsRRGKew9V3LLyDNey5CgJVeRkGfN+C2bezzTmwU5McJeOCzEXL/1
U92o/Zo+h1G8ZuWkhXlEX64js68XJa6Mn4lcwhCJ6h/svsrVQWMT1qBUuZgpcK5U
sBQL2HODi5ubMCp9SCMxw/2ZYuk49bvSG0YtG68yUzeYj67/ClBpzcDqEMiR2xkK
VPBHfP5hEOMdFIDIHcMhjbSveDuvQ8fO4ygeOz17V16tCyupsLuNylnhwDdmbP/u
hwqC+uA1KwCCe35Bb/btPagwet2ieQ==
=2A8b
-----END PGP SIGNATURE-----

--Sig_/gABvDSz61vTa7_NFTstHl5E--

