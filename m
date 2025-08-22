Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A69F8CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 12:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SUPKwcrp0reXiSKUgT5auCGtm07mRfGdSB7agYUReDM=; b=cuRGrwjjCnYH54lCUFqaL8IpWL
	TX7aAIZdrbB59MAQNcUiKJrWlWg63p2NbbbC4acxu7JWoNyHJAaQ5f8F24j2/4aHmd9VjLvrOletW
	YsQ3IEOMRfSqMC1wfIRmqLDxQnB5af/Fo69jmGdEfUgA/1KyK4h3P4snKV0GATw9bxCPZnsTtisu4
	//vtOgg0pUfBTBCiTECk4Om2Ni15WvugSa4BvSvYadVO5b55Sr5RGwc9Z93qxnpGjxRm96CYXFaFT
	KHrobwn2KYOXNQ0UwwpbC9sDbCy6vS7wVOg+sTvG1MVvU+e0zGjEtg1MUGUcbmfXhcnmCbXYlQGuW
	+gq/ukeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upQyq-00000002VIc-0vjJ;
	Fri, 22 Aug 2025 12:34:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upLjK-00000001l66-2ngG;
	Fri, 22 Aug 2025 06:58:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AFC475C47C8;
	Fri, 22 Aug 2025 06:58:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE274C4CEF1;
	Fri, 22 Aug 2025 06:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755845909;
	bh=T2OOvaetRekViwpWZDX1ZK/yH7uyIW3shMywUpOOlxM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nRruwPa2J+pVfV2fgXy+iNSSeEj3+I56tBkOlfhAw4BACVn6qcdcQEzG5//OtJ4Tg
	 exq+PYjVN2n06OBZHvd0Clj/ECkEmb8E2EdVMbh78/fI8Lr4nm/OYjDP1IyrfQfukK
	 RRO8Yek0juZs/UKK6wzNy3tdzhePNbh5if4+g1BqKvF6ajNBe3KJ5517zyzXTlFgEj
	 dCR2ti76UGr6CRn15LzOuK1dcjFGDO7Khs9AwdeoLRWoc42X1CTH/CznCMBA+UkgkZ
	 pc3DdnOLM/rAPDD78UnsuWnaq0VwTQIA/Bac84RCKDjkH1RBr4xGXq0IGt1Mn4yoU9
	 1YYYrxd4Rt63w==
Date: Fri, 22 Aug 2025 08:58:25 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next 2/3] net: airoha: Add airoha_ppe_dev struct
 definition
Message-ID: <aKgVEYMftYgdynxw@lore-rh-laptop>
References: <20250819-airoha-en7581-wlan-rx-offload-v1-0-71a097e0e2a1@kernel.org>
 <20250819-airoha-en7581-wlan-rx-offload-v1-2-71a097e0e2a1@kernel.org>
 <20250821183453.4136c5d3@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bI5eS4cqrdc40bK1"
Content-Disposition: inline
In-Reply-To: <20250821183453.4136c5d3@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_235830_750661_38B0FD33 
X-CRM114-Status: GOOD (  13.27  )
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


--bI5eS4cqrdc40bK1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Tue, 19 Aug 2025 14:21:07 +0200 Lorenzo Bianconi wrote:
> > +	pdev =3D of_find_device_by_node(np);
> > +
>=20
> did you mean to put the of_node_put() here?
>=20
> > +	if (!pdev) {
> > +		dev_err(dev, "cannot find device node %s\n", np->name);
> > +		of_node_put(np);
> > +		return ERR_PTR(-ENODEV);
> > +	}
> > +	of_node_put(np);

I moved the of_node_put() here (and in the if branch) in order to fix a sim=
ilar
issue fixed by Alok for airoha_npu.

commit 3cd582e7d0787506990ef0180405eb6224fa90a6
Author: Alok Tiwari <alok.a.tiwari@oracle.com>
Date:   Tue Jul 15 07:30:58 2025 -0700

    net: airoha: fix potential use-after-free in airoha_npu_get()

Regards,
Lorenzo

> > +
> > +	if (!try_module_get(THIS_MODULE)) {
> > +		dev_err(dev, "failed to get the device driver module\n");
> > +		goto error_pdev_put;
> > +	}

--bI5eS4cqrdc40bK1
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaKgVDgAKCRA6cBh0uS2t
rGuBAP9Voa1N8BTwWGerU5BZPH3ybdyhYo91i0eFxtZOcrg97wD+MxvDDaf3M3+D
IBzTULPBlvRpUoww5fFHGXXfxPTS/wU=
=caXj
-----END PGP SIGNATURE-----

--bI5eS4cqrdc40bK1--

