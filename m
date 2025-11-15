Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 954D8CEB2C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Nov 2025 10:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Subject:Message-ID:MIME-Version:To:Cc:Date:References:Content-Type:
	In-Reply-To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z8ENjA1O7KsiohjnVwrpnU2+8wRrzBEXFU0FKDVm6Vs=; b=F0aXcBZURMVoUx7SNf/DVO7gsu
	wm+UgENYLzhRVsTNZLuSUyisouO5iNvdr25ZPFMX9eqkORdjF5wRvRHWOyy1erZQ6EUgEVqNc+IKM
	wnLrSh0J9CBPKN7UrZilmw5eO2exW9dJtEfKVGruh4x0DTwcmTr2JY0s1TlajXseN2kjCN0ojNrnb
	O8LKPssnv7SFkSJsP9QfBjBX5kCEY7RKw9uXTjR0oIMEo3iNB5aSbMldE4CpUPZx/JrvYhh1zmdBB
	55x0zBeOB0N6J9WGTQ1ayDYY2cDptwNABK5EVmSNbEtyFxhtBT6j0oXxlmOgQxO/onG0A4GHj5bko
	C//seeuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKD60-0000000DgOx-2ulc;
	Sat, 15 Nov 2025 10:01:33 +0000
Received: from mail1.manjaro.org ([142.132.176.110])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKD5y-0000000DgOR-3Rbk;
	Sat, 15 Nov 2025 10:01:28 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPA id EE6F040FDD;
	Sat, 15 Nov 2025 11:01:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=dkim;
	t=1763200883; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Z8ENjA1O7KsiohjnVwrpnU2+8wRrzBEXFU0FKDVm6Vs=;
	b=hegVytWfQX3nP/0CyzpqP7bgtbxhgrhc/nnXYmahru2+e65IfcdZ7lDUJ/Dpn6KnIVYtQC
	z1BZ3sf5qmY/ipJEFBiYcE0WO89reg2fyGeg+4vIjUa4krObEcZg5cnQZtIxVujq1oEwlB
	4LqCbXm0lE1Jugf4jhRCpxNcUJpcFDENBBduvKJSbfb3HrAseumPP/4mlByaqRGvXisxMH
	Vf73esieTh727fByzOtgII2VdPFPvBZ9buAeqA4IesUx+wfisGQBcaaqnTbPw2wWgk4ixG
	RkOTWnoPNa61s3p8uERWKgliME7y/PRPc/n5Nkmy1S0vnhXYz2yl5HPF1uyJAQ==
From: "Dragan Simic" <dsimic@manjaro.org>
In-Reply-To: <aRhNIcGcQKp2ylqN@geday>
Content-Type: text/plain; charset="utf-8"
References: <cover.1763197368.git.geraldogabriel@gmail.com>
 <b04ed0deb42c914847dd28233010f9573d6b5902.1763197368.git.geraldogabriel@gmail.com>
 <c8a6d165-2cdd-cd0d-4bed-95dfa5ff30d2@manjaro.org> <aRhNIcGcQKp2ylqN@geday>
Date: Sat, 15 Nov 2025 11:01:21 +0100
Cc: linux-rockchip@lists.infradead.org, "Shawn Lin" <shawn.lin@rock-chips.com>, "Lorenzo Pieralisi" <lpieralisi@kernel.org>, =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, "Manivannan Sadhasivam" <mani@kernel.org>, "Rob Herring" <robh@kernel.org>, "Bjorn Helgaas" <bhelgaas@google.com>, "Heiko Stuebner" <heiko@sntech.de>, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Johan Jonker" <jbx6244@gmail.com>
To: "Geraldo Nascimento" <geraldogabriel@gmail.com>
MIME-Version: 1.0
Message-ID: <85d1543b-ea91-5f0f-59d6-e00fcf720938@manjaro.org>
Subject: =?utf-8?q?Re=3A?= [PATCH 2/3] =?utf-8?q?PCI=3A?=
 =?utf-8?q?_rockchip-host=3A?= comment danger of =?utf-8?q?5=2E0?= GT/s 
 speed
User-Agent: SOGoMail 5.12.3
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: None
X-Rspamd-Fuzzy: 83c865715b7113a59b93546ee6a88838d4bbcab70d4a53f23333084f29fd2604053233ae0ec2379f12cfaacb3af815deb6e782a9b018734885047e902d4f57c0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251115_020127_049552_EBBEE117 
X-CRM114-Status: GOOD (  18.29  )
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

On Saturday, November 15, 2025 10:51 CET, Geraldo Nascimento <geraldoga=
briel@gmail.com> wrote:
> On Sat, Nov 15, 2025 at 10:30:49AM +0100, Dragan Simic wrote:
> > On Saturday, November 15, 2025 10:10 CET, Geraldo Nascimento <geral=
dogabriel@gmail.com> wrote:
> > > According to Rockchip sources, there is grave danger in enabling =
5.0
> > > GT/s speed for this core. Add a comment documenting that danger a=
nd
> > > discouraging end-users from forcing higher speed through DT chang=
es.
> > >=20
> > > Link: https://lore.kernel.org/all/ffd05070-9879-4468-94e3-b88968b=
4c21b@rock-chips.com/
> > > Reported-by: Shawn Lin <shawn.lin@rock-chips.com>
> > > Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
> > > ---
> > >  drivers/pci/controller/pcie-rockchip-host.c | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > >=20
> > > diff --git a/drivers/pci/controller/pcie-rockchip-host.c b/driver=
s/pci/controller/pcie-rockchip-host.c
> > > index ee1822ca01db..7e6ff76466b7 100644
> > > --- a/drivers/pci/controller/pcie-rockchip-host.c
> > > +++ b/drivers/pci/controller/pcie-rockchip-host.c
> > > @@ -332,6 +332,11 @@ static int rockchip=5Fpcie=5Fhost=5Finit=5Fp=
ort(struct rockchip=5Fpcie *rockchip)
> > >  		/*
> > >  		 * Enable retrain for gen2. This should be configured only aft=
er
> > >  		 * gen1 finished.
> > > +		 *
> > > +		 * According to Rockchip this path is dangerous and may lead t=
o
> > > +		 * catastrophic failure. Even if the odds are small, users are
> > > +		 * still discouraged to engage the corresponding DT option.
> > > +		 *
> > >  		 */
> > >  		status =3D rockchip=5Fpcie=5Fread(rockchip, PCIE=5FRC=5FCONFIG=
=5FCR + PCI=5FEXP=5FLNKCTL2);
> > >  		status &=3D ~PCI=5FEXP=5FLNKCTL2=5FTLS;
> >=20
> > Looking good to me, thanks for this patch!  There's no need
> > to emit warnings here, because they'd be emitted already in
> > the rockchip=5Fpcie=5Fparse=5Fdt() function.
> >=20
> > Please feel free to include
> >=20
> > Reviewed-by: Dragan Simic <dsimic@manjaro.org>
> >
>=20
> I disagree, I think the comment stands.
>=20
> Even if we reduce to one line, ex:
>=20
> + May cause damage

Ah, perhaps I wasn't clear enough, so let me clarify a bit.  The
comment you added is fine, I just referred to no need for emitting
a warning at that point, because it would be emitted already.


