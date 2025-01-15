Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A062C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 23:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PWwbiMBvDkXBwegeV2Eg+Gv/y8zGnbE04ATb5NSR/cE=; b=5FfU9LOlCe1EkNMrvbcSpGAeYP
	XdOVd4qJNLFVBOr+hvhVbq57zSmUBoBS3szReBwZmC1+e4P3pQx7HItN+YHSyK3B9xOKzviXI9fpq
	hWuqsu3suyKqHlpXTTvhpEzbPbDGVRRpmsxEYWd4fiiv8IuMQ7MAJxl08M4b7bD4LMhGXAMgjJ7yK
	lYSCcjdB0rcLGMsjL1UbeOQfM1qB6/yByiXQAXJQOzCrkHmg3UzAKclX68qfhIG3obe472uHEEfsp
	3QUWjPW4dhjvs8n1FcidzszIJJvSLeyD8HMqTLGljbBPOr/uIyw2VHFHG4BogM7evbWLQf0jBJt83
	zuFDrqEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYCjb-0000000DLIS-1Z2R;
	Wed, 15 Jan 2025 23:23:39 +0000
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYCiI-0000000DKzK-25qc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 23:22:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736983322;
	bh=PWwbiMBvDkXBwegeV2Eg+Gv/y8zGnbE04ATb5NSR/cE=;
	h=Date:From:To:Cc:Subject:From;
	b=PgVGDPUJkVxIMbBu5k+ZEWpQMo4aAvyFMaV4o2uqeaBOPFAL8WmvI/G4bo5oKCq2a
	 Tq6K+vNRJCAsfjbwr1//ZMYcMZfvenF5oeYytr7Y9qeaM6gdi9eCCPcw7MzScZqtDE
	 Y17JK7oZS6CbepEoQCMFhlUYUm5vW0S4snWCZXEaZQeFs4ix5N2xXvMjsvhze+r85q
	 ROlppy+WJ9gdQVH6Hlu8dtCJWWdW1yFaUUITj9jrvkAjQpVZmS55707+PqKMhf0qed
	 ZC6qecTGrv356Bef5shvu32SOeOr+DLX/Eao32DJlWMDMKNMoks+z+BSKkGlKcFU/u
	 FkcMweQFYnB4Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YYMTP2PCJz4wcl;
	Thu, 16 Jan 2025 10:22:00 +1100 (AEDT)
Date: Thu, 16 Jan 2025 10:21:49 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Philipp Zabel <p.zabel@pengutronix.de>, Arnd Bergmann <arnd@arndb.de>
Cc: ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the reset-fixes tree
Message-ID: <20250116102149.0b0feb88@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/C.PfM.EaT+k9g/6xtglaZ3B";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_152218_801831_216100E2 
X-CRM114-Status: UNSURE (   9.20  )
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

--Sig_/C.PfM.EaT+k9g/6xtglaZ3B
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the arm-soc-fixes tree as a different
commit (but the same patch):

  055884c45d5f ("reset: rzg2l-usbphy-ctrl: Assign proper of node to the all=
ocated device")

This is commit

  1f8af9712413 ("reset: rzg2l-usbphy-ctrl: Assign proper of node to the all=
ocated device")

in the arm-soc-fixes tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/C.PfM.EaT+k9g/6xtglaZ3B
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeIQw0ACgkQAVBC80lX
0GyXSAf9Fq9c622mulz6lj6m3+w028dMOhYiEzY0NG/b0d2Oep7AqZwXgZVy40Ij
9l0y5hsQyLkAmr3gTWrI3g3k8cGfPSPMFmbO+XzVluP+1ySYaSU1OLrt6ErOMmR2
duPp/9VQ53HW/Mh+JElWRrX9hp2RPgaXfHQTTsLXlVgFH+h3Me6/4w1lbtgc4n4U
cH+XU03rqFT/Zgh8Q+sJLEuliHXR/1+52ifRIkH6dirvBTj1K9t2tbHUMN1cbgML
TxkqmAd1GuPLt5b9azUJ5oHFqr+TAIPWkjAOID2Ppo1xTD+YMkaF33/vjm0NE026
6CMNPO/i90cuiC7t2DCBUNeX12d9zA==
=hTkW
-----END PGP SIGNATURE-----

--Sig_/C.PfM.EaT+k9g/6xtglaZ3B--

