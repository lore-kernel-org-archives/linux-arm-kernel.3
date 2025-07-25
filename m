Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 330F3C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 01:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ojy7Z+lLR7hRwVZk2Cp+j+5hEpXq9Z226hOQ2PKKQnI=; b=nSarRa39Vf+hg0xpphJxYZkn8n
	hIcFFmsomXlnueshkQ9GigUZOzXIjicd1NgpJGe/fWLxuPwjlx0JxedS606tbxxlhl7/SNrib7sF+
	L+Y37j76qGhaPXEFMM5dUHe5jgoJE44qnwrnpXhDFuemYc+7vED5W1MF9X6GEsXHADiAbmbadGm6O
	FdWXlr+5/ObIf9D7cT77Cy5jKISuWT76eUUS9gBxXvXMmvv1PQ/ZCmqME8MUSoVouHPtfmBnxTR4B
	eXC62GFftcU4YNfzDqQQQeXhv7t7BtbhPqxobUNdrZuCrJ2SIpt9+FfgZLhcBf2w0varZMf0wm0Ip
	3IyDTfLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf7Iy-00000008pVE-0jsi;
	Fri, 25 Jul 2025 01:33:00 +0000
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf7GV-00000008pNw-09xS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 01:30:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1753406844;
	bh=ojy7Z+lLR7hRwVZk2Cp+j+5hEpXq9Z226hOQ2PKKQnI=;
	h=Date:From:To:Cc:Subject:From;
	b=qxfEcgXsdFsBF0v7jGYim8I4EA0sNe/0Covn16ifBQ44k8y5KW0wHdSSrP1TXhAq7
	 mCATG/wQQWX30KfHKo/ZjVCOLX+noVrfpAlZB91XCEx8CqaaJL0SdJPf4wqYFg53hG
	 tKev5U0HRu23MfK8cMswYuP7Tl91WOU5VRxokWSycU0xABO23SvUHk2mKSwzQcBMp5
	 RoEev8xlvn8Qc3qVRKRnT8MWu8cZ6rovjNxrgEcAZRBiqoQ70WIGqSKUm3Xg1mg7zn
	 y7dSISl8XSupWHjRNC75gdftg6qy9fI3P67Gk+qp35xA/kun+QtAnbD+bpckYCzatm
	 ohL8yxw9aKzCw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bp9GL2CXlz4x11;
	Fri, 25 Jul 2025 11:27:22 +1000 (AEST)
Date: Fri, 25 Jul 2025 11:30:20 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Sasha Finkelstein
 <fnkl.kernel@gmail.com>, Sven Peter <sven@kernel.org>, ARM
 <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the mfd tree with the arm-soc tree
Message-ID: <20250725113020.231954a2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/PPCg68xsEkplZTfNiQDEJpY";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_183027_221984_AD7C2CF9 
X-CRM114-Status: GOOD (  15.84  )
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

--Sig_/PPCg68xsEkplZTfNiQDEJpY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the mfd tree got a conflict in:

  MAINTAINERS

between commit:

  f8c667edaf80 ("dt-bindings: gpu: Add Apple SoC GPU")

from the arm-soc tree and commit:

  0f0a7bd04e7e ("dt-bindings: gpio: Add Apple Mac SMC GPIO block")

from the mfd tree.

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
index ca33ecd9b449,0f84051ef044..000000000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -2331,7 -2332,7 +2332,8 @@@ F:	Documentation/devicetree/bindings/ar
  F:	Documentation/devicetree/bindings/clock/apple,nco.yaml
  F:	Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml
  F:	Documentation/devicetree/bindings/dma/apple,admac.yaml
+ F:	Documentation/devicetree/bindings/gpio/apple,smc-gpio.yaml
 +F:	Documentation/devicetree/bindings/gpu/apple,agx.yaml
  F:	Documentation/devicetree/bindings/i2c/apple,i2c.yaml
  F:	Documentation/devicetree/bindings/input/touchscreen/apple,z2-multitouc=
h.yaml
  F:	Documentation/devicetree/bindings/interrupt-controller/apple,*

--Sig_/PPCg68xsEkplZTfNiQDEJpY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiC3iwACgkQAVBC80lX
0Gyvdgf+IN5a6/6DPly7cbfpvieMMJOVMQZm3b3EEQDTS+HrXJElsRVzJdLpeHet
l+ehTgzmbsylb7NeyD4VgWYYlvccRy9rtRfIV5s77CacR23FP12mZSm1qlwO6H0w
VCIxD0SWK8yYoWFnfHYgxpcNmNO5iZagiwwbERYSDAKbY/+Z8arE/FPT892d3VPo
cqtXQvxKahvJmPPwEdyGrMy68XzBqhvRCdmVD9pyFKa7EPJBnmmzxUcGlLiO1vJt
tr+HxvzhlHtGXqREzgH96UCfw7sGAU+40HVo9QP1iQoyZZI6yZAxrjojlS538sjD
YGkrC1+olDSPVXF5MBLTim6aP9RKjg==
=IOB1
-----END PGP SIGNATURE-----

--Sig_/PPCg68xsEkplZTfNiQDEJpY--

