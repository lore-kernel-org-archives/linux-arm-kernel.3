Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E3CBC02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 20:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6tjHxuQ2YHaxMitie8b6b7W8gOP9Wj7XAt8/u32LjIo=; b=KQgW4CRt5Ab6pYHXL+QN5wSq2P
	rkAD/K1SCnGP1KD1RTH8Kn5tIqeBVpFQK61ZBPt6RghyQ9N55bahx6cM5pTvieyNpm/5UYQbH7qBE
	W8UkkqCmggZOBRaxcQdgrXvVlV0T/EAyeiotDZmLCa+nQMXzUvARCOX7JYAbYY5xc5uVbSPGPTDy2
	VybX3Ybk5DUNFLQQZ5nlg/KKBBW3G8365KYEiN9wEudST98/jTmlsJZRd7L5pzYS1G90V6U3DH3Ic
	ayeO2AHVCExi9m4syFt8Qqrgb5nj8rPi3rocuL3ziHUNQrhpO86l6tbK/cmomLAV/+lhpPQiT4XJh
	ZfMdFpPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYWNy-0000000G0Ve-26GB;
	Thu, 16 Jan 2025 20:22:38 +0000
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYWLh-0000000Fzvq-4Bct
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 20:20:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1737058809;
	bh=6tjHxuQ2YHaxMitie8b6b7W8gOP9Wj7XAt8/u32LjIo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=EnEmHPu/iXHsnQJikvJcLxNlaXu5kZkuXhW6bqBeWQUrvrflytNsizaW9jvwHYGIT
	 goNSg25olH4yeT+NVKh7Bpvp4AxDsr4t7jRyy6v8PevfZ5sYl+nGoaGeh6pM9EDKEF
	 uuN6GpZhtV3De9cB0Ok6onUKz/XyGA8XL2ccAw7wdSxvnHUYXvFVJ7ocSWdUQRcdev
	 HOyyB7vRsJIFCfO6C3DMhoOq1fNvT+cllduvLEAOJ5cPF0lsqy6leIXso7JALAaw0U
	 wAuEhZmG9OGckoXszAgd4ZPd7BOIVsSl94Ot7sRLP0JcoXBMyNrBpBUNq8zPQBUh6F
	 xkWOK7UaNwXXQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YYvP50J1Yz4xVD;
	Fri, 17 Jan 2025 07:20:09 +1100 (AEDT)
Date: Fri, 17 Jan 2025 07:20:15 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Bjorn Andersson <andersson@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the qcom tree
Message-ID: <20250117072015.77bf3589@canb.auug.org.au>
In-Reply-To: <20250106064548.0a2b62c3@canb.auug.org.au>
References: <20250106064548.0a2b62c3@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/tJStpSSM6JR=p9/XBw.Kq60";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_122018_193320_53573C09 
X-CRM114-Status: GOOD (  10.64  )
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

--Sig_/tJStpSSM6JR=p9/XBw.Kq60
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 6 Jan 2025 06:45:48 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Commit
>=20
>   3d0d8c8989d3 ("arm64: dts: qcom: qcs8300: Add watchdog node")
>=20
> is missing a Signed-off-by from its committer.

This commit is now in the arm-soc tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/tJStpSSM6JR=p9/XBw.Kq60
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeJaf8ACgkQAVBC80lX
0GzI7Qf9Eh7g+aSEYJ86BRIkguucoPgGOtopJcNJxDNA4rRdhK7QLu+4lL3+Qibx
VPcnCUWb6X7fEWQJI5gX9XosNBX+eNuIraSFVTmY4LayUaOZRC4UuFNQGuOmKsON
7ON5UaA1RU3ffLhLJjz5KsHnZeiNdIYC9e/AuDHUFlQfbjf3MgbcGByULHJxg5X9
mSUdve7zLjtI1quE1KgkX+q6LhiDbPkA1n5BuROxBeNOTr8h8I7xEyc8Js0/PzTL
Sj858AKvAH5jDZatfW511E62Dszn8RPjCahQN/QVtUnaaiToEPgztCNDRwo2ytk8
a6+nevJiDsva8pJZeAOPZOCukpP1tg==
=Gsaw
-----END PGP SIGNATURE-----

--Sig_/tJStpSSM6JR=p9/XBw.Kq60--

