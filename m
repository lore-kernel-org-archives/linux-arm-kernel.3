Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FFF8C54E90
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 21:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Mdb8Rmk8xcuGjdoywcAIQPmOTys5LdSBg1bNKgqALrc=; b=q7PhQLVAbm62CHQPMxaq2o7n8l
	3QroBP03rcjZhlzbBfJxLfjIJkHpWfyE6eARgVcfb+6loa0HI5LG2XWxUYIefSB+2lNqoRIEnr0BG
	rn9bRdJCF97ZibcVdUQjm8+GjwRGHtfQLscZNHI3a+/+Xwbvh25jvmtV63t6+z6XULSuVk5aQVmNA
	Vx0/vjoBiR2jHaYKwWHtHezCJ6lImS10swDxPIJA4dB9vZEpyVnbsX6Cax6Wl1pMz/jbSqz7+ngKc
	tdYDspjVWXbFo/gqgUejEHfhJm/PFwhkMH5KcgyQKqMv+As3DOcblrVm9Ey9Sx+mwY3Kp//zeEo0u
	sJIkuccg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHrHV-0000000Gt0M-1j3s;
	Wed, 21 May 2025 21:47:21 +0000
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHrFP-0000000GspE-3Brb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 21:45:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747863901;
	bh=Mdb8Rmk8xcuGjdoywcAIQPmOTys5LdSBg1bNKgqALrc=;
	h=Date:From:To:Cc:Subject:From;
	b=l45H/Hdkzf7n5DHXy82SD9bsn4D5RDExg3y4Z80dfge6AR1WePuPyhnVxAVJBXvTg
	 gcnFVgExGJ8plmioFr7LfrGH1Stpog1NtfPQHZoLEd4N+HyQbXrwmmguGSlI3p3xaf
	 Oak6OjYNUKwwVtqy0iz4NrXH3XBHUcrmFC/e/qwIX75G4Je6ywOuqpdjnnrroAAw5w
	 U2I4i+b9MoJnI7zbxhzWtwjzFObYAfRvXHOCg7l8yiWTcGYlRuOPC/KyjK7fO6QEGK
	 1bxAREyJ1l71ddeehg4ywHRn9O+lpWIxEvBQFPMa6RPK7lbZHAsbKo9Li7Gsz6bASR
	 NY9NEkSXj+HSQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4b2lMK1w03z4x8Z;
	Thu, 22 May 2025 07:45:01 +1000 (AEST)
Date: Thu, 22 May 2025 07:44:59 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Arnd Bergmann <arnd@arndb.de>, ARM
 <linux-arm-kernel@lists.infradead.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the arm-soc tree
Message-ID: <20250522074459.769185bf@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/o1HPX4j8TjdViW==7c6zhFH";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_144512_062206_6936A068 
X-CRM114-Status: UNSURE (   8.08  )
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

--Sig_/o1HPX4j8TjdViW==7c6zhFH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  24822c4b476c ("dt-bindings: clock: socfpga: convert to yaml")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/o1HPX4j8TjdViW==7c6zhFH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmguSVsACgkQAVBC80lX
0GxIdwf8CRHNFasknr+m8xh/thBjOffMpzQiMYd6RxXSRt7iUf9BmIbuMkjU9eZc
S1Xp+LDadU+4y5fhrDQdhbWqqqTWWSQde+ZA8L3p03drMqEyofPlYZGh0DxPybiH
KbW4vn9wdJqkseXBtdCg6lttfTf2swCUWetoXUK1geKCrOn2Uz5KcAM5RVCcz0Hi
U0sButMVh0n6bhuG9/EbtTP4Nltchumm8XJ01KH89BIMtaMkYamnj91PYd/tKjpQ
2IVDlj+47BuDv2PzUjNeBDFJHH4MAiosyjy56c+SjRk3i/I2hzFy4qa89kaoZ9NP
lHtdzsfCwyqMPIN+5ExJbuvEgsjL/A==
=a3ni
-----END PGP SIGNATURE-----

--Sig_/o1HPX4j8TjdViW==7c6zhFH--

