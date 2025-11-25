Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE311D10366
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 22:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eksKHdOuLUxEaSCZSa3Yy26LV0Sk/VcK0aODv8ehgYo=; b=pyvDPKXFfuKGZ+eGEVjp07Idh4
	1/FkXhRVHpjny84RTN5foAiJBYNv5xuTEbdT6o4//gUBE9ebr7cDc0PJZ+8Lqup54nFj6JKhr2vu3
	PqUgOPehk/mfj7YItAW9iU0VCSw5r3o1P/8Jl8RPfY5/Z7Yu60232G7aNykRe8ZJlRYb3L6VDxCHY
	2rwbzD7/8joW/V+D3O5BdvtPMHT9i6robUHenwNnsK0x1FFeygw0O1byL0ft/HkTjzcl6+VMGcdKF
	tBP6kBJHbK2OVMrHC6un7gQbxHR1s/z9/jUGO/UdXf8UN8JoBndDeqir3HsKYXLGPyIk/Q6rcstWu
	b8ObTzvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO1mm-0000000E1Oe-2svU;
	Tue, 25 Nov 2025 22:45:24 +0000
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO1mj-0000000E1O4-0fqo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 22:45:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1764110715;
	bh=eksKHdOuLUxEaSCZSa3Yy26LV0Sk/VcK0aODv8ehgYo=;
	h=Date:From:To:Cc:Subject:From;
	b=kIHrQiZanUsmzChCYawVsUgciFwE5e/p1WqtnwXukSWhS4w2zSZ+O9bPkZK8m57yA
	 nuzu4dHKilgEhb/nKaJCekMjgaZigWa7zM7jgJvSdoaKlv+DnLj6y2ISJa0+/qzkJ5
	 HIokRsaItbWjPtzFRqq6/Yx/3tF+3n4Z4kDJzZUQOZOYdja7NAQh95sUHZKTsSC/T7
	 xVItKYouK3Fl3Fb6vRyPTHKPbfZY8AkIbXdkb48+iOvveHMtynxe44hf12BT+bbVqq
	 vhBrXC/w8Y5A20L8Kax7RWcwQ7j3o76cgsxnByLHp6b3kAtLwuKZctMGSeAKxAODjh
	 hlKdhHKgkz0xQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dGHp11Z6qz4w1g;
	Wed, 26 Nov 2025 09:45:13 +1100 (AEDT)
Date: Wed, 26 Nov 2025 09:45:11 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul@pwsan.com>,
 Arnd Bergmann <arnd@arndb.de>
Cc: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, Drew Fustini
 <dfustini@oss.tenstorrent.com>, Himanshu Chauhan
 <hchauhan@ventanamicro.com>, Lukas Bulwahn <lukas.bulwahn@redhat.com>, Paul
 Walmsley <pjw@kernel.org>, ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the risc-v tree with the arm-soc tree
Message-ID: <20251126094511.07bdf834@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.XwE.T2DMYxV6T2GESnyxjg";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_144521_610019_35F73156 
X-CRM114-Status: GOOD (  16.12  )
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

--Sig_/.XwE.T2DMYxV6T2GESnyxjg
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the risc-v tree got a conflict in:

  MAINTAINERS

between commit:

  4de28f1edcfb ("dt-bindings: riscv: Add Tenstorrent Blackhole compatible")

from the arm-soc tree and commits:

  e0ce62cfe3a9 ("drivers: firmware: add riscv SSE support")
  832fd6c2e55c ("MAINTAINERS: refer to intended files in RISC-V SSE DRIVER")

from the risc-v tree.

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
index aacd4a754dab,6fa1048c248a..000000000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -22247,15 -22195,14 +22254,23 @@@ F:	arch/riscv/boot/dts/spacemit
  N:	spacemit
  K:	spacemit
 =20
+ RISC-V SSE DRIVER
+ M:	Cl=C3=A9ment L=C3=A9ger <cleger@rivosinc.com>
+ R:	Himanshu Chauhan <himanshu@thechauhan.dev>
+ L:	linux-riscv@lists.infradead.org
+ S:	Maintained
+ F:	drivers/firmware/riscv/riscv_sbi_sse.c
+ F:	include/linux/riscv_sbi_sse.h
+=20
 +RISC-V TENSTORRENT SoC SUPPORT
 +M:	Drew Fustini <dfustini@oss.tenstorrent.com>
 +M:	Joel Stanley <jms@oss.tenstorrent.com>
 +L:	linux-riscv@lists.infradead.org
 +S:	Maintained
 +T:	git https://github.com/tenstorrent/linux.git
 +F:	Documentation/devicetree/bindings/riscv/tenstorrent.yaml
 +F:	arch/riscv/boot/dts/tenstorrent/
 +
  RISC-V THEAD SoC SUPPORT
  M:	Drew Fustini <fustini@kernel.org>
  M:	Guo Ren <guoren@kernel.org>

--Sig_/.XwE.T2DMYxV6T2GESnyxjg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkmMXcACgkQAVBC80lX
0GzpGQgAhK/qILso2Esrem1e40pmdu5h8IUjXCSlwm9rK5r73iC7GVdk1g5LPZBR
NBRKPeF/eLkMGEIP/mb2pqa0ibSs/ST+41cLJl5OA7FMgWkBPLBfq+lXRKrArsft
t8QcF1zSQkhN0tRJ5IkWFpcac/i05mw33nQx8u60ee6gK6Wc2MyqxiG5icw47lfH
DLy5kNfs28CcQDdtm1xTtvp3AZfXVHgYaESvA4T0bC7niKSiqKMaKrDO3PH3N/G1
He6nu3KV63skp2uHbNnqmjhkMfOLKWEvNseCix9tZO90jjV2PLZFAsLVRDIQxrwa
wdXTxX/IQ7hs0UUiqnUAJFDppfvSiA==
=+TU5
-----END PGP SIGNATURE-----

--Sig_/.XwE.T2DMYxV6T2GESnyxjg--

