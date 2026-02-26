Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DE32FD461F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 06:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Subject:Message-ID:MIME-Version:To:Cc:Date:References:Content-Type:
	In-Reply-To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zqkIHaA7pn62FNksNMToTkxsGlzJhhwIoAGGjLcJ8gA=; b=FBOojos1Rs2IiqX+hyrSr2xTJx
	8p20k4yYRuCzbt8Qq9nVokY2+9Q9866oKDbvNHb4dEth1CCuR9ycDRrQwNGut+bd/dz4fRQ5anE/z
	xUDbEcyVy2HhhU29MSstncZmuK6qEzrP6JW7fyY1P9dtTg2fgepXFioO2yaAGYX90Z3hBAz3ZeOC9
	H2MxzACzBINsfE/c24XaIKT4n1KFC09wdfmSg4p7sMC0IB60hitMYNMNFXH+eT9lsuGGaMHjncbPA
	0vrVc7uuM9nbKW6+f+9BgydG1doz42JfSJiB3XWb/8IWYtzQBBEzj9vNjrZtl9BO6yGRBzlUqiWNm
	qxls3dUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvVFH-00000005WFk-2A5P;
	Thu, 26 Feb 2026 06:53:11 +0000
Received: from mail1.manjaro.org ([2a01:4f8:c010:b6e8::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvVFD-00000005WFM-1tqq;
	Thu, 26 Feb 2026 06:53:10 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPA id 5F27740979;
	Thu, 26 Feb 2026 07:53:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=dkim;
	t=1772088784; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zqkIHaA7pn62FNksNMToTkxsGlzJhhwIoAGGjLcJ8gA=;
	b=Zk9OF+IHov2lNMm1LlJpQ+E421rW6PaBKSB4aAECaZBi1QwJ6T0okGxcKplJeiAP8NGNQJ
	VoXNOevH4PJdmmtR/WYU56W7ZLTMwAWY2KdBuzXiMfZqxU/dMKmW2jQ6hR+ewn/i/djT3z
	rlTHafafFd2oZd9YJ/0HFuO/pPytIkgRqBnSYLV374ekzAEMcsL7fb5TclqA7dVu8eY77N
	ANfrBDofCZ+TKjC8+TuGu5hHEg/ITN0hOfx51y8m82+8tFmSLWsaUGesJIjzV9YeOMD5rh
	wbO4O3WNtTYKMl2KO8DAK+ZDPfo1IV3St04+ykiqCfInjJaWFPuUPPqASeu0Zg==
From: "Dragan Simic" <dsimic@manjaro.org>
In-Reply-To: <aZ_U0ASjuK2fZi5h@geday>
Content-Type: text/plain; charset="utf-8"
References: <8db835ffe384db63ee598a203751b298ad1cc267.1772057799.git.geraldogabriel@gmail.com>
 <20260226001229.GA3794668@bhelgaas>
 <aZ-RaBLVfEZA_FxU@geday>
 <e0aa10e5-ec0a-4d0d-6f71-6797286221cc@manjaro.org> <aZ_U0ASjuK2fZi5h@geday>
Date: Thu, 26 Feb 2026 07:52:59 +0100
Cc: "Bjorn Helgaas" <helgaas@kernel.org>, "Shawn Lin" <shawn.lin@rock-chips.com>, "Lorenzo Pieralisi" <lpieralisi@kernel.org>, =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, "Manivannan Sadhasivam" <mani@kernel.org>, "Rob Herring" <robh@kernel.org>, "Bjorn Helgaas" <bhelgaas@google.com>, "Heiko Stuebner" <heiko@sntech.de>, linux-rockchip@lists.infradead.org, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
To: "Geraldo Nascimento" <geraldogabriel@gmail.com>
MIME-Version: 1.0
Message-ID: <b760ec8f-b57e-a505-62ef-a8bbc9dd8aac@manjaro.org>
Subject: =?utf-8?q?Re=3A?= [PATCH v3 2/2] =?utf-8?q?PCI=3A?=
 =?utf-8?q?_rockchip-host=3A?= comment danger of =?utf-8?q?5=2E0?= GT/s 
 speed
User-Agent: SOGoMail 5.12.3
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: None
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_225308_948736_287965C6 
X-CRM114-Status: GOOD (  14.80  )
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

On Thursday, February 26, 2026 06:06 CET, Geraldo Nascimento <geraldoga=
briel@gmail.com> wrote:
> On Thu, Feb 26, 2026 at 05:52:58AM +0100, Dragan Simic wrote:
> > I agree about removing the effectively unused code block that handl=
es
> > the "link=5Fgen =3D=3D 2" case from pcie-rockchip-host.c, but then =
please
> > remove the PCIE=5FCLIENT=5FGEN=5FSEL=5F2 define from pcie-rockchip.=
h and its
> > single "link=5Fgen =3D=3D 2" use from pcie-rockchip.c as well.
>=20
> Good.
>=20
> There's also some code that needs to be dropped from the endpoint
> driver.

Oh indeed, there's a redundant code block that handles a "link=5Fgen =3D=
=3D 2"
case in function rockchip=5Fpcie=5Fep=5Flink=5Ftraining().  As a note, =
a similar
early check against "link=5Fgen =3D=3D 2" should be added there as well=
.

> > As part of that additional removal, an early check for "link=5Fgen =
=3D=3D 1"
> > should be added to function rockchip=5Fpcie=5Finit=5Fport() in pcie=
-rockchip.c,
> > because that will become the only "link=5Fgen" value it supports.
>=20
> What do you think, should the driver bail out completely if
> link=5Fgen !=3D 1 or just let it force 2.5 GT/s speed with a warning?
>=20
> I tend to go with the latter.

Actually, I'd go with the first option, i.e. bailing out early in funct=
ion
rockchip=5Fpcie=5Fhost=5Finit=5Fport() with an error message emitted, b=
ecause that
function isn't supposed to define the link parameters.  Thus, if it end=
s up
receiving wrong link parameters, the issue lies somewhere else and shou=
ld
be fixed at its origin.


