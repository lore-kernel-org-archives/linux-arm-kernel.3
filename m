Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B08ECFD313
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 00:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jMTcAFISPU7usXreciXxBNWTEBUNdkLp1Da5jLDYWMA=; b=s7HzhXvLObMspD5nM4dXkZurzo
	5VVPMEC3U+7wklurVd9ltFjVnVKnMYWYdumQYFgj0kNLx9kuBXp5UD8zx8qpxPvTTMjTCTFV3pfml
	M4IB1gyQ5TOMq2hUHxVnmq19iLmSPx5IaEWeOu500tu/B4DQF6Kd9EP22SBJt8BXv9T0Bia6CiDnF
	w5k++Bs8T1yedLRhMCQzQYMGApWdnzFh8zfxk0co94W654kZg+lA+6Dch330SeBqiqMIenUzzp1rz
	GCl9uXDUIYBmWww8QFgvqWsq1LiEOdCX4DSfxZ8VGLkiK3VC6A7V8aInPhU7rIyYpFi+oENJeH7N0
	g02C8YdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNKcL-0000000ArMC-0yEA;
	Mon, 24 Nov 2025 00:39:45 +0000
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNKcE-0000000ArCZ-0tfE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 00:39:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1763944773;
	bh=jMTcAFISPU7usXreciXxBNWTEBUNdkLp1Da5jLDYWMA=;
	h=Date:From:To:Cc:Subject:From;
	b=NLJe3ySN1yWBJcXi5c5xzhuGNMSopaSMhlZpxjBRqPpVhk8UFvArCxh5DCNVWoe+X
	 8F3qW0/l44VkuHzDBN6LwPijrc+PaqD7dW3hrOBU72i2jiGCS7kwrjXeNzIwXi5WkS
	 mq2aElBFoB9GVytS8OXvaRlfwZWuOnsvHLRVaJdECq3pjT6+R3+0/MdirLrn1B2KzA
	 spj3o0mU6eVrgrUs4Os76n2dLZz5FRPs78JTrPOw8VGIB1wgaCamh1uBdo2zWIRVX8
	 Mytp1D1klNvjzoZiNj3hQaFr7TOdPiJT9fyWiM1bRd+xTm7vXNi6Fr+YRw+v/f9Ibj
	 271vV69fh82lQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dF6Qr39jzz4w9q;
	Mon, 24 Nov 2025 11:39:31 +1100 (AEDT)
Date: Mon, 24 Nov 2025 11:39:31 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Arnd Bergmann <arnd@arndb.de>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the arm-soc tree
Message-ID: <20251124113931.73a15189@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/tqI1rdLfkgIyZScRNZczUzR";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251123_163938_578682_FE179AB4 
X-CRM114-Status: UNSURE (   9.46  )
X-CRM114-Notice: Please train this message.
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

--Sig_/tqI1rdLfkgIyZScRNZczUzR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the arm64 tree as a different commit
(but the same patch):

  04392a1e8145 ("arm64: defconfig: Remove the redundant SCHED_MC/SCHED_SMT")

This is commit

  a086f211a3b1 ("arm64: defconfig: Remove the redundant SCHED_MC/SCHED_SMT")

in the arm64 tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/tqI1rdLfkgIyZScRNZczUzR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkjqUMACgkQAVBC80lX
0GyXwgf+L1ck01Cf7UeVQEzv7vYWXSHlq6PrUUoJRlBd2FiVWup/XlZMmvlxiXRW
wsArQB8nl6VbDJUySLfXWDHlZPAlut8NPI/zVEtnjIOXfsJFvyiXw5Ik5smOub04
Ptp07EwLEfqdDGW0t3i4CYgrRFtxCwIeEG5HQlxBsITblvDTMvoNxnbKZdxPSQ3E
rFvjOxYf+PHdHjy0TH/7RojOL+FBnnaX5By75KyqReIM/GXM0p0JXSMiV95yBLzI
UUbEthnb9rak38qTT3RAngqCSWhjTE5hqitJK8KF+MCtS68WGdFIjMwgXPoDI1Mb
fEN++EGi1DusbTq/k/m1NiFq/9BW6g==
=HLY8
-----END PGP SIGNATURE-----

--Sig_/tqI1rdLfkgIyZScRNZczUzR--

