Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1914C02193
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 18:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LRvnylkbD9Hhu5zFLkcfQhCX4iWcsliNK3RbD7GKZgA=; b=iQRieWLggVsbGKF/e8SF9OK6Fk
	kiabMqUXSlwAK/Wuka0gkd8kRAXj0RBPrdgwN+qzzm7UCY4GrqZbXYp9p6Qv2osiWdoHvLQA4ihdu
	9AmdiylBcyX18/6c9hjM7KRHwTXokeTLwsdkbuT/offP6si4zR1eXG4/molJDn1S1UKNellkk/zkS
	TyDZUk2VQ4To+oNaqBR157TI2DvCUA3iG8dtPPidFrPRupN9hWES26JJDakFbrVCRWI5I8BQi7Gi8
	w0fKZQakkG1JSZytvecbQxY2V+Gphl2BU/Xj0DvA9JkyfGT0HmTVUM3cyDO30BzRqm+wPrw/nqnEu
	wYFd/ghQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfNWO-00000001CIh-0GAq;
	Tue, 04 Feb 2025 18:19:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfNTH-00000001Bnr-1uU9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 18:16:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E39F75C5C7E;
	Tue,  4 Feb 2025 18:15:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64F21C4CEDF;
	Tue,  4 Feb 2025 18:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738692986;
	bh=dmGkjt2zNEiAgl6N9re2M4LE4xSbtASeqzfY0ChaYqQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b2rbyC2bZq476y9HKzgTYiM2Xc1LS8wT5IY0iDXZoAcPwDZPvoNEugkvA6mcOCNB8
	 RJ4fLX4BkO4ZhXkOnsLWZHSLB0yjPddBnC9mywKlMKda6THJ8ZdKfZi/oM++vwZVnL
	 VaWoSxz4foT3b68sy1qtAGjpHbIQ5SvKXVCF7DaTj/lse75FmzkkpeTvevyfIQUxE0
	 LNQ3hxtMUS+OBadhM+AAsSQlmOSexS0z5ykGzKQ+ryp1F2bdWVJVlS2+gZcfTr7Z+1
	 24MRpJZw0YgOCJh25zJ9zH0Ya2wtFhzIqaLkuDAX6wXjCcCN6jVaC7IUod/8hn8ZyK
	 5JoNKYf4VU/cQ==
Date: Tue, 4 Feb 2025 18:16:17 +0000
From: Conor Dooley <conor@kernel.org>
To: Basharath Hussain Khaja <basharath@couthit.com>
Subject: Re: [RFC v2 PATCH 01/10] dt-bindings: net: ti: Adds DUAL-EMAC mode
 support on PRU-ICSS2 for AM57xx SOCs
Message-ID: <20250204-mutilated-throwing-59cabf18f187@spud>
References: <20250124122353.1457174-1-basharath@couthit.com>
 <20250124122353.1457174-2-basharath@couthit.com>
 <20250124-reoccupy-music-3803c753f8af@spud>
 <504387436.449923.1738127812232.JavaMail.zimbra@couthit.local>
 <20250129-vowed-dingbat-cfb5c5b8ede4@spud>
 <2028988664.494856.1738585795471.JavaMail.zimbra@couthit.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="K8COnd4nDaIlA8yU"
Content-Disposition: inline
In-Reply-To: <2028988664.494856.1738585795471.JavaMail.zimbra@couthit.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_101627_583421_A3B5100A 
X-CRM114-Status: GOOD (  17.27  )
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
Cc: nm <nm@ti.com>, vigneshr <vigneshr@ti.com>, tony <tony@atomide.com>, edumazet <edumazet@google.com>, krishna <krishna@couthit.com>, pmohan <pmohan@couthit.com>, diogo ivo <diogo.ivo@siemens.com>, Rob Herring <robh@kernel.org>, javier carrasco cruz <javier.carrasco.cruz@gmail.com>, praneeth <praneeth@ti.com>, m-karicheri2 <m-karicheri2@ti.com>, jacob e keller <jacob.e.keller@intel.com>, kuba <kuba@kernel.org>, pabeni <pabeni@redhat.com>, devicetree <devicetree@vger.kernel.org>, conor+dt <conor+dt@kernel.org>, schnelle <schnelle@linux.ibm.com>, mohan <mohan@couthit.com>, richardcochran <richardcochran@gmail.com>, prajith <prajith@ti.com>, rogerq <rogerq@kernel.org>, ssantosh <ssantosh@kernel.org>, linux-omap <linux-omap@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, rogerq <rogerq@ti.com>, srk <srk@ti.com>, pratheesh <pratheesh@ti.com>, m-malladi <m-malladi@ti.com>, netdev <netdev@vger.kernel.org>, rdunlap <rdunlap@infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, danishanwar <danishanwar@ti.com>, afd <afd@ti.com>, andrew+netdev <andrew+netdev@lunn.ch>, parvathi <parvathi@couthit.com>, horms <horms@kernel.org>, krzk+dt <krzk+dt@kernel.org>, davem <davem@davemloft.net>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org


--K8COnd4nDaIlA8yU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 03, 2025 at 05:59:55PM +0530, Basharath Hussain Khaja wrote:
> >> >> +    $ref: /schemas/types.yaml#/definitions/phandle
> >> >> +    description:
> >> >> +      phandle to Enhanced Capture (eCAP) event for ICSS
> >> >=20
> >> > Why do you need phandles for these things, can they not be looked up=
 by
> >> > compatible? (e.g. multiple devices on one SoC).
> >> >=20
> >>=20
> >> ecap is another peripheral similar to IEP in ICSSM/ICSSG. We have crea=
ted a
> >> separate driver for possible reuse with ICSSG in future.
> >=20
> > That's not an answer to my question.
> >=20
>=20
> We can use compatible if we have only one instance of a peripheral in the=
 SOC.=20
> On the AM57x SOC we have two identical ICSS instances(ICSS1 and ICSS2). S=
o we=20
> use phandles to differentiate between the two instances. Currently this p=
atch=20
> series adds support for ICSS2 instance on the AM57x SOC. Support for ICSS=
1 instance=20
> will be added in subsequent patches.

Cool, that's an acceptance answer, thanks.

--K8COnd4nDaIlA8yU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ6JZcQAKCRB4tDGHoIJi
0gnAAQC1oGfhZbnFSM/mPgMlsOYSL9Jy1uxEojT2QLRGkF15CQEA9H2GXROw3Fk2
eXUwUknLlmzd/8uguMbvTucbVOMokgs=
=3zMy
-----END PGP SIGNATURE-----

--K8COnd4nDaIlA8yU--

