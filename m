Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87B61C369D7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 06:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tiD+q2iLPecaXdqBIUQA6kHgOTtsV3xRVQmtbqKQgbw=; b=cpGfrhKZ+JXBpS9jN3t7+JqfVO
	1C1GF/aKracIYOin74ydh/MCTKMs0eo0868a0FhsosgL/3M7C01+9v82vQz8kWaurRHJyyEuGVhiw
	9Kz6y+Yn2hWxFbwgjmjGYAVCqL+Entp04sDVCIeuN1WBj16w6tkNaDy4jVxPuQNaT3Kf82wj6fiX8
	ZzaNZhV8/szFgw16D7f/ZeRNYc3ZU2IA8/NEd+Jw54K7LMHF15qE+IKezpcTX1sbiJS1DqHW/lRxe
	KmuxjGP36pljALsMCWRirD68C0PXumBWZAa473on1/vwGG2uO7sOHYYT+NW8kD82HBpETqZ+rop8/
	LfFNWRcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u77Fs-00000005zSR-17RK;
	Tue, 22 Apr 2025 06:37:16 +0000
Received: from mx1.emlix.com ([178.63.209.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u77Dy-00000005z3a-2xWH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 06:35:21 +0000
Received: from mailer.emlix.com (p5098be52.dip0.t-ipconnect.de [80.152.190.82])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.emlix.com (Postfix) with ESMTPS id 195285F86B;
	Tue, 22 Apr 2025 08:35:14 +0200 (CEST)
From: Rolf Eike Beer <eb@emlix.com>
To: Joerg Roedel <joro@8bytes.org>
Cc: Will Deacon <will@kernel.org>, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, Bert Karwatzki <spasswolf@web.de>,
 Lu Baolu <baolu.lu@linux.intel.com>, Jerry Snitselaar <jsnitsel@redhat.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Tomasz Jeznach <tjeznach@rivosinc.com>, Nick Kossifidis <mick@ics.forth.gr>,
 Sebastien Boeuf <seb@rivosinc.com>, Palmer Dabbelt <palmer@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Robin Murphy <robin.murphy@arm.com>,
 linux-arm-kernel@lists.infradead.org, Jason Gunthorpe <jgg@ziepe.ca>,
 Kevin Tian <kevin.tian@intel.com>
Subject: Re: [PATCHv2 0/6] make vendor specific subdirectory inclusion conditional
Date: Tue, 22 Apr 2025 08:35:08 +0200
Message-ID: <2779144.mvXUDI8C0e@devpool92.emlix.com>
Organization: emlix GmbH
In-Reply-To: <aAERFUJj_6NuxAv3@8bytes.org>
References: <12652899.O9o76ZdvQC@devpool47.emlix.com> <aAERFUJj_6NuxAv3@8bytes.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart12651545.O9o76ZdvQC";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_233518_884645_5BA36363 
X-CRM114-Status: GOOD (  11.90  )
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

--nextPart12651545.O9o76ZdvQC
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Rolf Eike Beer <eb@emlix.com>
To: Joerg Roedel <joro@8bytes.org>
Date: Tue, 22 Apr 2025 08:35:08 +0200
Message-ID: <2779144.mvXUDI8C0e@devpool92.emlix.com>
Organization: emlix GmbH
In-Reply-To: <aAERFUJj_6NuxAv3@8bytes.org>
MIME-Version: 1.0

On Donnerstag, 17. April 2025 16:32:53 Mitteleurop=C3=A4ische Sommerzeit Jo=
erg=20
Roedel wrote:
> On Thu, Mar 20, 2025 at 10:01:45AM +0100, Rolf Eike Beer wrote:
> > Changes in v2:
> > - clean up subdirectory Makefiles to use obj-y now
> > - add arm/arm-smmu-v3 and iommufd patches
>=20
> This conflicts with the core branch, can you please rebase once I pushed
> the updated tree?

Sure.
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
--nextPart12651545.O9o76ZdvQC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iLMEAAEIAB0WIQQ/Uctzh31xzAxFCLur5FH7Xu2t/AUCaAc4nAAKCRCr5FH7Xu2t
/Ho+A/98h1tQPHZhbsX2KdIBKcFTRVlxRJvscAWNQs5Bko1+iniOMO2sfq6HClPQ
7VC+G41TiMT5lg6jPBJqNlM8AXmA/dt85cmYSP0YuW+JRaE5aHfprhlJwjy7/o99
Yy23Gp0kOkRaa2sm/N32llKyzxpn14YxBKPR3GZm1c5IQhbsng==
=8mcp
-----END PGP SIGNATURE-----

--nextPart12651545.O9o76ZdvQC--




