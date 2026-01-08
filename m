Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0154CD232C6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 23:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RyYtSDC6RHkSyrak2oPVwMQVLbFEJmjm7vSuUv3gaDA=; b=gAw4rdKtNKpNU3NZN1deiNkddP
	8YAwXr5XeF18YUjq/Ps/anWb6oec6hNZTVVSB9wGeNiUuv0TaogRC/bz1tyBAW5OLqO3562jwmqwa
	kD+rWkcFpfQtiZ6bagqPaJqVEQ74vXx7D31TeeVHxQrXPtp3urvS5ncB6N8qyd1n9H0zHdZWqCe0v
	u/EZJ/e+N1Ah32d0Ovveq8NkK/cdHrlzcPFnaEj5ZNdLCn6bbCrQBu3D/7kmcPqtfMOO+tu23SaLa
	kVPDaMyavOd1OEf9ijpoHpOem69Zw59TAcUcAaasda5rUp4ywLNHekx6J4gvAidRX8P5GA2F/ra1B
	lteQUuYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdzgV-000000010Qk-0fUp;
	Thu, 08 Jan 2026 23:44:55 +0000
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdzgR-000000010QD-2SEB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 23:44:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1767915879;
	bh=RyYtSDC6RHkSyrak2oPVwMQVLbFEJmjm7vSuUv3gaDA=;
	h=Date:From:To:Cc:Subject:From;
	b=GCJF4s4/RkTeG6fWZl6ud/g5CXq6fFP3Lu8PyZ8gjp/7zPBTWTnEp/jTfae8ddfMt
	 VHmy09zoQTqSXl+HZC0GupuZgcpQeblqm3eoDhfkQywkaLTZPoRqCY7DRu7F3ldYia
	 zNbx6V6NbCVUeWkUEDzfwHdSE+VsLT75aIrjGPmqDUxXfP9bFmDb4qqk8WjxVXj1C6
	 AAcwbwKLudHQNV8gOrrGhv98kJbzw0gYb1v6YbpJ6FxUytdRbeC3XjR5JTtj0AG3IX
	 JUxxrdFI9QZoSL45Txa/d1Q95xt4E0wWBjU5NRg41kturfjzbVWOQE4sgao1/u/P4r
	 KrQiow+5ew8aQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dnM2F75Yfz4w2R;
	Fri, 09 Jan 2026 10:44:37 +1100 (AEDT)
Date: Fri, 9 Jan 2026 10:44:37 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Florian Fainelli <f.fainelli@gmail.com>, Arnd Bergmann <arnd@arndb.de>
Cc: ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the broadcom tree
Message-ID: <20260109104437.4ca61ef7@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/iAsqL4cd.EGiWYUT2.Evpuc";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_154451_795728_F8BD6F8A 
X-CRM114-Status: UNSURE (   8.60  )
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

--Sig_/iAsqL4cd.EGiWYUT2.Evpuc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the arm-soc tree as different commits
(but the same patches):

  87a6c3c03d46 ("arm64: dts: broadcom: bcm2712: Add watchdog DT node")
  05f790b3d235 ("arm64: dts: broadcom: bcm2712: Enable RNG")

These are commits

  37c3a91e9730 ("arm64: dts: broadcom: bcm2712: Add watchdog DT node")
  dff552ac9cda ("arm64: dts: broadcom: bcm2712: Enable RNG")

in the arm-soc tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/iAsqL4cd.EGiWYUT2.Evpuc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmlgQWUACgkQAVBC80lX
0GwjZAf+LApzNAszgrYoGqMAqrxKbF+1tCHS4kniFFya2JX3FapheMrkzBJdAmQ5
eFLnmI3Qv2Wu2O924JCiM1oWxQ0a2G9F7oEzJewWItkPNleNV6ilB6L4GCMxqSEI
QGa1GuSXijPOg5mMueDrhW7KSk+MCJnNWcP45SncUGMeWICZ3LvTp7MT1KnQ7bU6
n8YeMR6mTQKil/HZvL3UX/y2w5/XfYrOc2XtZBBOqVURb+Mu1JxwVHrc3gKiJeHL
eSJ0NSuDdKrpfe2tTpEUY4pgbur06qqhDVYXqC4dpyDSHIzWJBSAsCsBfB35l/Fz
dewoVKYegNDogILAcjkIywF+pnxSHQ==
=uGm/
-----END PGP SIGNATURE-----

--Sig_/iAsqL4cd.EGiWYUT2.Evpuc--

