Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8530CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 12:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qSnds/EOg7L746Y8nkQXIh4LVhTtDw7d3MtsrX3fuKQ=; b=HDN7UJF71VFktSCZyWK2EGAwd9
	5zqVP2JEp5m0lfGuRvmiAvmSLWBfT1BDXV8BZ+qGeTfX8t3/4yQDHP4j40oZEcX+I6ODyFu+PkdRa
	gT2hxt2UXg3v3Ohzk9NScI8ad3VWfSyhjfxes4vFRqnSIxB2PGw3wZ8eXW94tiKOMsQGGLi265KS9
	8BKSr953mmF4QErUIABG1+fozLNtswITpRkHFYhhsex1GNT9Gw+ciZq99o25kKxTPkiMhNLrmIyLC
	SdEI6DgSmxBILuZDPipXCsD3zbkmscnWftAppLjH1Vnr8g0YIHoGhuL+nPjUbkD+vMYhxC/1/gkHK
	EIAlrAgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyr2M-0000000BFe1-3bod;
	Wed, 17 Sep 2025 12:13:26 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyr2K-0000000BFc2-2XIJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 12:13:26 +0000
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250917121320epoutp043df6ab18d407e85ad44ea20f8611508c~mENJzupUY2519825198epoutp04J
	for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 12:13:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250917121320epoutp043df6ab18d407e85ad44ea20f8611508c~mENJzupUY2519825198epoutp04J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1758111200;
	bh=qSnds/EOg7L746Y8nkQXIh4LVhTtDw7d3MtsrX3fuKQ=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=UPwF2a5S4GqksDYK+QuouRSyFSbpyDFKESV+RgbpH9IEMV/QibYLcyntjWKl27MmU
	 S3MRj5CLDdrpy7t5JmqCb9DYPikSmLCFkc15Aa88ZrL0mKRpNQgFUkFqx7cc1xatXB
	 mVq+uSMmiSZFfiMVuHeqVA1Wxa1FnG68JeQUsaFA=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250917121319epcas5p25c498ccd9ea2a74ee9706993b994168e~mENI-E74b0556205562epcas5p2A;
	Wed, 17 Sep 2025 12:13:19 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.86]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4cRd2k5S3Rz3hhT3; Wed, 17 Sep
	2025 12:13:18 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250917121317epcas5p487667022e0a7bbdc5c73914faad97d52~mENHFzn9V0908209082epcas5p4L;
	Wed, 17 Sep 2025 12:13:17 +0000 (GMT)
Received: from FDSFTE196 (unknown [107.116.189.214]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250917121313epsmtip119c1f773089a96736001c687a7a229c4~mENC35rJG2521825218epsmtip1H;
	Wed, 17 Sep 2025 12:13:12 +0000 (GMT)
From: "Inbaraj E" <inbaraj.e@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>
Cc: <rmfrfs@gmail.com>, <laurent.pinchart@ideasonboard.com>,
	<martink@posteo.de>, <kernel@puri.sm>, <mchehab@kernel.org>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<shawnguo@kernel.org>, <s.hauer@pengutronix.de>, <kernel@pengutronix.de>,
	<festevam@gmail.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-samsung-soc@vger.kernel.org>, <pankaj.dubey@samsung.com>,
	<ravi.patel@samsung.com>, <shradha.t@samsung.com>
In-Reply-To: <20250901-rousing-orange-crab-c05fdf@kuoka>
Subject: RE: [PATCH v3 2/7] dt-bindings: media: fsd: Add CSIS video capture
 interface
Date: Wed, 17 Sep 2025 17:43:10 +0530
Message-ID: <025001dc27cc$72be7b90$583b72b0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIBSJFzUA8Lz5NCh/Whmc1GwVh24gLl1U6/AmrqmSQCCHSfRbQSPXgQ
Content-Language: en-in
X-CMS-MailID: 20250917121317epcas5p487667022e0a7bbdc5c73914faad97d52
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250828085930epcas5p1719c7db08074bf1540dc85b71736a6c5
References: <20250828085911.81266-1-inbaraj.e@samsung.com>
	<CGME20250828085930epcas5p1719c7db08074bf1540dc85b71736a6c5@epcas5p1.samsung.com>
	<20250828085911.81266-3-inbaraj.e@samsung.com>
	<20250901-rousing-orange-crab-c05fdf@kuoka>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_051324_953842_8AE102CF 
X-CRM114-Status: UNSURE (   9.79  )
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

Hi Krzysztof,

Thanks for the review.

> > +title: Tesla FSD SoC MIPI CSI-2 video capture interface(Bridge device)=
.
>=20
> Drop final full stop. Also missing space before (

Will take care in next patchset.

>=20
>=20
> > +
> > +maintainers:
> > +  - Inbaraj E <inbaraj.e=40samsung.com>
> > +
> > +description:
> > +  The Tesla FSD CSIS has an internal video capture interface to
> > +capture
> > +
> > +examples:
> > +  - =7C
> > +    =23include <dt-bindings/clock/fsd-clk.h>
> > +    =23include <dt-bindings/interrupt-controller/arm-gic.h>
> > +
> > +    csis0: csis=4012641000 =7B
>=20
> Incorrect unit address.

Thanks for pointing out.
Unit address is correct. Address in reg is wrong here I'll fix in next patc=
hset.

>=20
> > +        compatible =3D =22tesla,fsd-csis-media=22;
> > +        reg =3D <0x12661000 0x44c>;
>=20
>=20

Regards,
Inbaraj E



