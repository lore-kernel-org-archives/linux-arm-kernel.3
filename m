Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D4ECCD343F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 11:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:From:
	Message-ID:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AfTfcVwZA9O99rHbR4+W9iH5hWMD1L7D8MbNZXFOAmQ=; b=SgQ+AXsUoEzfTH3mnOhlpugHf1
	oerrSBAmCP2+OZEws2Qpf7ynCXhk+c4j/8y372AsfUydRwUpCXATRUOBfTBBy/FNMZ2TvFYEzkvz7
	PjIYLzpVgjcusXHmw3noODzwZBAmeGhZazZdeZ88xi804ddZVP1nYjx/HnEpw0fIJyh3ONHMICoHJ
	NWSlK6GcSh/2NAAI2T5crQ4G76GwHk4DMIBjJET8KyFFMwiSdcFUaqH81/lzld/0TnA1XgL1XdRN2
	qiM2uEBtRnQ+rQi4kVGVgV+3P/2EdVSlUWJVpt8+xQ4CBfb0Ye/dLvONRJPsViCwaYl6Ukj1wjPTd
	D/DTzYCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNqe3-00000008Anq-3MZY;
	Fri, 15 May 2026 11:23:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNqe3-00000008Ang-0xdo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 11:23:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 71B5B60008;
	Fri, 15 May 2026 11:23:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B346C2BCFB;
	Fri, 15 May 2026 11:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778844234;
	bh=RfvEIH27XbfkXelKur8wpmPTV9lL60amly3Ft8vOuPw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=XfRO/6lpxRvh1wj24HKBqCVJd20etFi1V7RGHbFcgIjUPDcvyiBkkSzRNDvfs6QCj
	 KdcpRrVOCwRiAjGC3XZwPafav7UbgN9eh+cxVeDIlH89sLlhxbWoodnhh9fUGgjizI
	 E2aWJObp/4Ch7nenpOLniSdcutNBkmZYdRD9tQwLiyyH3b2aCAg72L5/N26HiNdg/p
	 atrBeb5BnOwl7k6HNQVKoYO/XGoZqvtrmuCUvrEFmfZGDz9JsUikEn+15lE+CencMS
	 KT6KIsa2+OQaSTGbaZwN2qMxqnMEWy50JhhadD/x+lhTDoF9V7MGrDpekj+x276mPP
	 9MT0pJYVmvpLQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=goblin-girl.misterjones.org)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wNqdz-00000002fk3-0CJC;
	Fri, 15 May 2026 11:23:51 +0000
Date: Fri, 15 May 2026 12:23:50 +0100
Message-ID: <864ik8ykzd.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,	devicetree@vger.kernel.org,	Lorenzo Pieralisi
 <lpieralisi@kernel.org>,	Hanjun Guo <guohanjun@huawei.com>,	Catalin
 Marinas <catalin.marinas@arm.com>,	Will Deacon <will@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,	Mark Rutland
 <mark.rutland@arm.com>,	Daniel Lezcano <daniel.lezcano@kernel.org>,	Thomas
 Gleixner <tglx@kernel.org>,	Rob Herring <robh@kernel.org>,	Krzysztof
 Kozlowski <krzk+dt@kernel.org>,	Conor Dooley <conor+dt@kernel.org>,	Chen-Yu
 Tsai <wens@kernel.org>,	Jernej Skrabec <jernej.skrabec@gmail.com>,	Samuel
 Holland <samuel@sholland.org>,	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,	Ge Gordon
 <gordon.ge@bst.ai>,	BST Linux Kernel Upstream Group
 <bst-upstream@bstai.top>,	Jesper Nilsson <jesper.nilsson@axis.com>,	Lars
 Persson <lars.persson@axis.com>,	Alim Akhtar <alim.akhtar@samsung.com>,
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,	Pengutronix Kernel Team
 <kernel@pengutronix.de>,	Fabio Estevam <festevam@gmail.com>,	Dinh Nguyen
 <dinguyen@kernel.org>,	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Thierry Reding <thierry.reding@kernel.org>,	Jonathan Hunter
 <jonathanh@nvidia.com>,	Bjorn Andersson <andersson@kernel.org>,	Konrad
 Dybcio <konradybcio@kernel.org>,	Andreas =?UTF-8?B?RsOkcmJlcg==?=
 <afaerber@suse.de>,	Heiko Stuebner <heiko@sntech.de>,	Shawn Lin
 <shawn.lin@rock-chips.com>,	Orson Zhai <orsonzhai@gmail.com>,	Baolin Wang
 <baolin.wang@linux.alibaba.com>,	Michal Simek <michal.simek@amd.com>
Subject: Re: [PATCH v2 01/17] ACPI: GTDT: Account for GTDTv3 size when walking the platform timer descriptors
In-Reply-To: <20260515-prudent-vagabond-beetle-cad34b@sudeepholla>
References: <20260514150945.3917510-1-maz@kernel.org>
	<20260514150945.3917510-2-maz@kernel.org>
	<20260515-prudent-vagabond-beetle-cad34b@sudeepholla>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/30.1
 (aarch64-unknown-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: sudeep.holla@kernel.org, linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, lpieralisi@kernel.org, guohanjun@huawei.com, catalin.marinas@arm.com, will@kernel.org, rafael@kernel.org, mark.rutland@arm.com, daniel.lezcano@kernel.org, tglx@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org, neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, martin.blumenstingl@googlemail.com, gordon.ge@bst.ai, bst-upstream@bstai.top, jesper.nilsson@axis.com, lars.persson@axis.com, alim.akhtar@samsung.com, ivo.ivanov.ivanov1@gmail.com, Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, dinguyen@kernel.org, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, thierry.reding@kernel.org, jonathanh@nvidia.com, andersson@kernel.org, konradybcio@kernel.org, afaerber@suse.de, 
 heiko@sntech.de, shawn.lin@rock-chips.com, orsonzhai@gmail.com, baolin.wang@linux.alibaba.com, michal.simek@amd.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

On Fri, 15 May 2026 10:51:52 +0100,
Sudeep Holla <sudeep.holla@kernel.org> wrote:
>=20
> On Thu, May 14, 2026 at 04:09:29PM +0100, Marc Zyngier wrote:
> > Since ARMv8.1, the architecture has grown an EL2-private virtual
> > timer. This has been described in ACPI since ACPI v6.3 and revision
> > 3 of the GTDT table.
> >=20
> > An aditional structure was added in ACPICA, though in a rather
> > bizarre way, and merged in v5.1 as 8f5a14d053100 ("ACPICA: ACPI 6.3:
> > add GTDT Revision 3 support").
> >=20
> > Finally plug the table parsing in GTDT, and correct the parsing of
> > the platform timer subtables to account for the expanded size of
> > the base table.
> >=20
> > Suggested-by: Sudeep Holla <sudeep.holla@kernel.org>
> > Signed-off-by: Marc Zyngier <maz@kernel.org>
> > ---
> >  drivers/acpi/arm64/gtdt.c | 15 ++++++++++++++-
> >  1 file changed, 14 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/acpi/arm64/gtdt.c b/drivers/acpi/arm64/gtdt.c
> > index ffc867bac2d60..b9d9b8edf2df7 100644
> > --- a/drivers/acpi/arm64/gtdt.c
> > +++ b/drivers/acpi/arm64/gtdt.c
> > @@ -32,6 +32,12 @@ struct acpi_gtdt_descriptor {
> >  	struct acpi_table_gtdt *gtdt;
> >  	void *gtdt_end;
> >  	void *platform_timer;
> > +	bool v3;
> > +};
> > +
> > +struct gtdt_v3 {
> > +	struct acpi_table_gtdt	gtdt_v2;
> > +	struct acpi_gtdt_el2	el2_vtimer;
> >  };
> > =20
> >  static struct acpi_gtdt_descriptor acpi_gtdt_desc __initdata;
> > @@ -39,8 +45,14 @@ static struct acpi_gtdt_descriptor acpi_gtdt_desc __=
initdata;
> >  static __init bool platform_timer_valid(void *platform_timer)
> >  {
> >  	struct acpi_gtdt_header *gh =3D platform_timer;
> > +	void *platform_timer_begin;
> > +
> > +	if (acpi_gtdt_desc.v3)
> > +		platform_timer_begin =3D container_of(acpi_gtdt_desc.gtdt, struct gt=
dt_v3, gtdt_v2) + 1;
> > +	else
> > +		platform_timer_begin =3D acpi_gtdt_desc.gtdt + 1;
> >
> > -	return (platform_timer >=3D (void *)(acpi_gtdt_desc.gtdt + 1) &&
> > +	return (platform_timer >=3D platform_timer_begin &&
> >  		platform_timer < acpi_gtdt_desc.gtdt_end &&
> >  		gh->length !=3D 0 &&
> >  		platform_timer + gh->length <=3D acpi_gtdt_desc.gtdt_end);
> > @@ -169,6 +181,7 @@ int __init acpi_gtdt_init(struct acpi_table_header =
*table,
> >  	acpi_gtdt_desc.gtdt =3D gtdt;
> >  	acpi_gtdt_desc.gtdt_end =3D (void *)table + table->length;
> >  	acpi_gtdt_desc.platform_timer =3D NULL;
> > +	acpi_gtdt_desc.v3 =3D gtdt->header.revision >=3D 3 && gtdt->header.le=
ngth >=3D sizeof(struct gtdt_v3);
>=20
> Regarding Sashiko=E2=80=99s comment about the missing length validation f=
or GTDT v2, I
> realised that the current check could cause a malformed v3 table to be
> interpreted as v2 if its length does not match the expected v3
> length.

Yeah, that's overall dodgy. As much as I hate having to write a
validating parser for ACPI, we need to be prepared for the worst.

> It would be better to fail early and return an error rather than allow
> processing to continue with the table incorrectly interpreted as v2.

How about something like the hack below?

Thanks,

	M.

diff --git a/drivers/acpi/arm64/gtdt.c b/drivers/acpi/arm64/gtdt.c
index 12bc8875e95e2..ceec69609f038 100644
--- a/drivers/acpi/arm64/gtdt.c
+++ b/drivers/acpi/arm64/gtdt.c
@@ -202,7 +202,15 @@ int __init acpi_gtdt_init(struct acpi_table_header *ta=
ble,
 	acpi_gtdt_desc.gtdt =3D gtdt;
 	acpi_gtdt_desc.gtdt_end =3D (void *)table + table->length;
 	acpi_gtdt_desc.platform_timer =3D NULL;
-	acpi_gtdt_desc.v3 =3D gtdt->header.revision >=3D 3 && gtdt->header.length=
 >=3D sizeof(struct gtdt_v3);
+
+	if ((gtdt->header.revision >=3D 3 && gtdt->header.length < sizeof(struct =
gtdt_v3)) ||
+	    (gtdt->header.revision =3D=3D 2 && gtdt->header.length < sizeof(*gtdt=
))) {
+		pr_err(FW_BUG "GTDT with invalid size %d\n", gtdt->header.length);
+		return -EINVAL;
+	}
+
+	acpi_gtdt_desc.v3 =3D gtdt->header.revision >=3D 3;
+
 	if (platform_timer_count)
 		*platform_timer_count =3D 0;
=20

--=20
Without deviation from the norm, progress is not possible.

