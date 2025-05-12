Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FD3BC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 14:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qyGlqeoaX018wK20EkYJAUZufA8oVkUeenZJQTWOTzk=; b=h+ogLYRoiiRmpREPugDO3JNV2a
	wnEj0jUIHNmYruhiKFHUINrP7Y1tOImtSgwzNH1NDYhcV8HXsiwQ151pXvRuMbCnHLgC0c6fQBqN/
	/E2xYv4tVlwMBY4Q4ICfgsgPXBc4laYtL+EYj+xDmAd1U6niZZfuo93bdHbzOIbJRv91en53Vjtmv
	BPtD98DT/5Oq5Es8KC/fPD1P4kNL7yK7ps/yGBNnRHVJ1TZgMUbHjIdeCCwN18HlPI8VJIeuvgDNf
	VHU2gFEJpNaE8TFD3naZcm7NwpIQ0xXmGGmw5FebVeB3bPm4jBeMTpKgDUidTZBnSyAmpftcyJoJ9
	6cDS9TsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEThh-00000009eVd-3MSy;
	Mon, 12 May 2025 14:00:25 +0000
Received: from mx1.emlix.com ([178.63.209.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uET19-00000009VSF-2XR9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 13:16:28 +0000
Received: from mailer.emlix.com (p5098be52.dip0.t-ipconnect.de [80.152.190.82])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.emlix.com (Postfix) with ESMTPS id 10ECB5FE9E;
	Mon, 12 May 2025 15:16:17 +0200 (CEST)
From: Rolf Eike Beer <eb@emlix.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 Bert Karwatzki <spasswolf@web.de>, Lu Baolu <baolu.lu@linux.intel.com>,
 Jerry Snitselaar <jsnitsel@redhat.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Tomasz Jeznach <tjeznach@rivosinc.com>, Nick Kossifidis <mick@ics.forth.gr>,
 Sebastien Boeuf <seb@rivosinc.com>, Palmer Dabbelt <palmer@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Robin Murphy <robin.murphy@arm.com>,
 linux-arm-kernel@lists.infradead.org, Jason Gunthorpe <jgg@ziepe.ca>,
 Kevin Tian <kevin.tian@intel.com>
Subject: [PATCHv3 0/6] make vendor specific subdirectory inclusion conditional
Date: Mon, 12 May 2025 15:07:27 +0200
Message-ID: <1926170.CQOukoFCf9@devpool92.emlix.com>
Organization: emlix GmbH
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart23936481.6Emhk5qWAg";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_061627_791687_42A75EC1 
X-CRM114-Status: UNSURE (   8.48  )
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

--nextPart23936481.6Emhk5qWAg
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Rolf Eike Beer <eb@emlix.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>
Date: Mon, 12 May 2025 15:07:27 +0200
Message-ID: <1926170.CQOukoFCf9@devpool92.emlix.com>
Organization: emlix GmbH
MIME-Version: 1.0

I found it strange that the vendor specific subdirectories were uncondition=
ally=20
added. Everything in these directories obviously depends on the specific Kc=
onfig=20
option. This series cleans this up by making the directory itself depend on=
=20
the respective option which looks more natural to me.

I must confess that I am too lazy to find a good solution for the "arm/"=20
directory, so I left it as is.

Regards,

Eike

=2D--
Changes in v3:
=2D added Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
=2D rebased on top of 2e9b2ee2ba403cbe270a8256b8794ef5ad19b38d

Changes in v2:
=2D clean up subdirectory Makefiles to use obj-y now
=2D add arm/arm-smmu-v3 and iommufd patches
=2D-=20
Rolf Eike Beer

emlix GmbH
Headquarters: Berliner Str. 12, 37073 G=C3=B6ttingen, Germany
Phone +49 (0)551 30664-0, e-mail info@emlix.com
District Court of G=C3=B6ttingen, Registry Number HR B 3160
Managing Directors: Heike Jordan, Dr. Uwe Kracke
VAT ID No. DE 205 198 055
Office Berlin: Panoramastr. 1, 10178 Berlin, Germany
Office Bonn: Bachstr. 6, 53115 Bonn, Germany
http://www.emlix.com

emlix - your embedded Linux partner
--nextPart23936481.6Emhk5qWAg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iLMEAAEIAB0WIQQ/Uctzh31xzAxFCLur5FH7Xu2t/AUCaCHyjwAKCRCr5FH7Xu2t
/NGvBACQ++ncU9h70pXINUzTwksmp8QYS7bw5uht6BV/o0aqHCaFisMsBu5xsT/N
Q6AEn+ablK7oufZX2TqX8jKVZlPoEZYW6SEebCOytttzFqk/EFtoCNvLO66wISBe
vPSrcpiktcbYyuPMd9/rsvKiEkvYwwrY/Hs4eYWkS+DU6ppKRA==
=7yC0
-----END PGP SIGNATURE-----

--nextPart23936481.6Emhk5qWAg--




