Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCFD5C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 03:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=piLhSl9xbxhGuA9PKqA38eEpjthF9cVZD+Z8+JAT6z4=; b=id5naJRXL48jgrRXSsk3q1xnY/
	ta2r87XS3+2KDztaGdpBEWgpDM1lVmW8mcSwZSUETGbJ3ho58vWeW4yMibd4W7ZucXGe7mxyEnec/
	wMjgwPK9VqJYMtUgkcYJkatjn8nr8Fu/nrwivm4sb0b+kCEtHC07ldwSQvtN6Gpe2rS/Kc/as7seM
	F13AQFNmXWNbZ7m51QThqkZq19IGziM2ZeWFVamV+DOKwCJ1TwweMQShYeSGaRAw3PloIdz/3PEjL
	9ZjrOSKrEjnfGBfcj1E9ZwUhkSbSglPCxxkQJl1aSeIKie4ijTF4ouq+wmuZYuZjEavt8Up2DpE5s
	qeavhehA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wePXc-0000000Fl5a-172W;
	Tue, 30 Jun 2026 03:53:44 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wePXX-0000000Fl4G-1U94
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 03:53:43 +0000
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20260630035329epoutp02571d216d0836769c5155f8761a53874f~9v4Xduyaa3239032390epoutp02S
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 03:53:29 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20260630035329epoutp02571d216d0836769c5155f8761a53874f~9v4Xduyaa3239032390epoutp02S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1782791609;
	bh=piLhSl9xbxhGuA9PKqA38eEpjthF9cVZD+Z8+JAT6z4=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=bW7CwIwVa6VqDmtwk5H12vzp18ProctCyU2cjzm4CglhYIehHv81hTMXrFT1gUw8J
	 1CrSlEaNwokfpJl5lZoHy9e2NydaoSeJTOFoWhv251dorMkD/KyjylGV2+tdnb2VnX
	 BYdJ9hho2PBoAvJNqiERdwLhuMFcOLnqgF1aSp8g=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20260630035328epcas5p20b91cf93730893d57a8304742eb23b88~9v4Waurrl0440104401epcas5p28;
	Tue, 30 Jun 2026 03:53:28 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.89]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4gq8Pz0H02z6B9m7; Tue, 30 Jun
	2026 03:53:27 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20260630035326epcas5p232c12f841f9ed8fa8fe81e8aa7eb45bb~9v4U1d5RT0440104401epcas5p20;
	Tue, 30 Jun 2026 03:53:26 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20260630035324epsmtip178af641e049abbee3867634497dbd7e8~9v4SqM4BV2049720497epsmtip1_;
	Tue, 30 Jun 2026 03:53:23 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Peter Griffin'" <peter.griffin@linaro.org>, "'Denzeel Oliva'"
	<wachiturroxd150@gmail.com>
Cc: "'Krzysztof Kozlowski'" <krzk@kernel.org>, "'Sylwester Nawrocki'"
	<s.nawrocki@samsung.com>, "'Chanwoo Choi'" <cw00.choi@samsung.com>,
	"'Michael Turquette'" <mturquette@baylibre.com>, "'Stephen Boyd'"
	<sboyd@kernel.org>, "'Brian Masney'" <bmasney@redhat.com>, "'Rob	Herring'"
	<robh@kernel.org>, "'Conor Dooley'" <conor+dt@kernel.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
In-Reply-To: <CADrjBPpNQd6WgwVo-a3Mz74d1EptPm9D9BisLEmoFRsdUb3izw@mail.gmail.com>
Subject: RE: [PATCH v3 3/3] clk: samsung: exynos990: Fix PERIS gate clock
 parents
Date: Tue, 30 Jun 2026 09:23:21 +0530
Message-ID: <0f1e01dd0844$01190c40$034b24c0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQEx4sfAWwy4gnk+MuXqAo8FFpNhngGTah19AjUYwH4DLBf1wbd1Fhhg
Content-Language: en-us
X-CMS-MailID: 20260630035326epcas5p232c12f841f9ed8fa8fe81e8aa7eb45bb
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260629123246epcas5p2aab9da9ef417274bb0b70f74c386f7b4
References: <20260613-exynos990-peris-fix-v3-v3-0-2b230db78ae4@gmail.com>
	<20260613-exynos990-peris-fix-v3-v3-3-2b230db78ae4@gmail.com>
	<CGME20260629123246epcas5p2aab9da9ef417274bb0b70f74c386f7b4@epcas5p2.samsung.com>
	<CADrjBPpNQd6WgwVo-a3Mz74d1EptPm9D9BisLEmoFRsdUb3izw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_205340_057699_84C73A77 
X-CRM114-Status: GOOD (  16.25  )
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



> -----Original Message-----
> From: Peter Griffin <peter.griffin=40linaro.org>
> Sent: Monday, June 29, 2026 6:02 PM
> To: Denzeel Oliva <wachiturroxd150=40gmail.com>
> Cc: Krzysztof Kozlowski <krzk=40kernel.org>; Sylwester Nawrocki
> <s.nawrocki=40samsung.com>; Chanwoo Choi <cw00.choi=40samsung.com>;
> Alim Akhtar <alim.akhtar=40samsung.com>; Michael Turquette
> <mturquette=40baylibre.com>; Stephen Boyd <sboyd=40kernel.org>; Brian
> Masney <bmasney=40redhat.com>; Rob Herring <robh=40kernel.org>; Conor
> Dooley <conor+dt=40kernel.org>; linux-samsung-soc=40vger.kernel.org; linu=
x-
> clk=40vger.kernel.org; devicetree=40vger.kernel.org; linux-arm-
> kernel=40lists.infradead.org; linux-kernel=40vger.kernel.org
> Subject: Re: =5BPATCH v3 3/3=5D clk: samsung: exynos990: Fix PERIS gate c=
lock
> parents
>=20
> Hi Krysztof & Denzeel,
>=20
> On Sat, 13 Jun 2026 at 13:36, Denzeel Oliva <wachiturroxd150=40gmail.com>
> wrote:
> >
> > Correct eight PERIS gate clock parents to match the hardware clock
> > tree and reorder the GIC mux parents so mout_peris_bus_user is the
> > default source.
> >
> > Signed-off-by: Denzeel Oliva <wachiturroxd150=40gmail.com>
> > ---
>=20
> Reviewed-by: Peter Griffin <peter.griffin=40linaro.org>
>=20
> =40Krysztof: I was thinking, maybe we should establish a new rule/best
> practice for Samsung clock upstream submissions whereby patch
> contributors should link to the downstream cal-if code for the SoC after =
the --
> - line. That would make reviewing the patches' correctness a bit easier, =
as the
> downstream cal-if code would be readily available to the reviewer.
>=20
We can leave this choice to the reviewer if they want to refer to downstrea=
m cal-if code.

Regards
Alim

> regards,
>=20
> Peter
>=20


