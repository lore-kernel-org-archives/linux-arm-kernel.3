Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07781C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 08:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0reunzXmmAlNC6QmWf9sB2B+ZpS4HPPFDGCNxxmhsL4=; b=x8HyysZcIH3Csr5a7u1ULuExJT
	siGGGdmFkee0UXCuLb+iPsbx2dGr/VLaUk0rCp07SIRal6XdbgBFE4qYZIof2956FuEYWguDNdaBO
	4nfbe3w69YBoXl5ekWAh4eU919OOqzLnc+LDiyq2SIrXMo5eNki4Qf1ykHifWMM53crgdABAiz3Og
	XY5eKDmYu6Ou5y3HGwfRlUUUH3V/Z7sIgLo1UItYb7RY8v8NClQbgy//m//B84IiVfOXYm0Lylzno
	txZ78NAqoTtggqTe3qH5Q4UI3F5LvFHl+ZFdPeOTn8jW+sYn1vE2kMH8Rl32K/WLycGlpCJxjnEOD
	r9rkhRTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9IoG-00000007dJf-2guq;
	Wed, 23 Sep 2026 08:58:36 +0000
Received: from mail-4319.protonmail.ch ([185.70.43.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9IoE-00000007dIp-1PVZ;
	Wed, 23 Sep 2026 08:58:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1790153911; x=1790413111;
	bh=0reunzXmmAlNC6QmWf9sB2B+ZpS4HPPFDGCNxxmhsL4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=bSL/Aqnv5i1WoJpO4J42Q1rB0nbJ2+sPGLyBJWRKgSe3qQft7lvEzarvmDMB13wjB
	 D1AermV1KzlnDF90rhlkjtnII6dZN6h4QeEcHaxSuWJyhaP+XEqBGIt9aH6oDS0gON
	 u2W+M10890a6eqYAf9XjEjcQozoJrP8CMiUBLI/Q8+l2zu/i6hHlSR8kzEylwE9Ygp
	 nft0jLqZ1xH6EJB5pEmi2FbcPmbQJtMsR7kSW0cUCvXZ2RhaoTmGmSehIn8CV9m94A
	 2GsHxfh6kCIF0Nqy1LGcf7S9rky2BOe0i33K8+C3bnQu0NOLwYeKu14AAn2D3cktpw
	 4ysJtnXQ9NdWw==
Date: Wed, 23 Sep 2026 08:58:27 +0000
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
From: Roman Vivchar <rva333@protonmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/3] cpufreq: mediatek: add mt6572 support
Message-ID: <_cWfHoNhfNqR8gHZc9mDkr4jScRg_xP3_yWfR9JqeDpaulfmw3nkbOhfWiqCPhWgG3SgH07xGtOEQ_Afivo61Ldan09HV0uTnas7lBCBI1A=@protonmail.com>
In-Reply-To: <b98716ab-1c7b-4da2-85c8-e425be39b4d7@collabora.com>
References: <20260923-6572-cpufreq-v1-0-41f7af6d6d1a@protonmail.com> <20260923-6572-cpufreq-v1-2-41f7af6d6d1a@protonmail.com> <b98716ab-1c7b-4da2-85c8-e425be39b4d7@collabora.com>
Feedback-ID: 173184497:user:proton
X-Pm-Message-ID: e93288f4c7e7a54fb417d16ef81b885f5c370664
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_015834_525826_9FD10E9B 
X-CRM114-Status: GOOD (  17.22  )
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

On Wednesday, September 23rd, 2026 at 11:36 AM, AngeloGioacchino Del Regno =
<angelogioacchino.delregno@collabora.com> wrote:

> On 9/23/26 09:23, Roman Vivchar via B4 Relay wrote:
> > From: Roman Vivchar <rva333@protonmail.com>
> >
> > Add mt6572 SoC platform data for CPU frequency scaling.
> >
> > Signed-off-by: Roman Vivchar <rva333@protonmail.com>
> > ---
> >   drivers/cpufreq/mediatek-cpufreq.c | 9 +++++++++
> >   1 file changed, 9 insertions(+)
> >
> > diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/media=
tek-cpufreq.c
> > index f15135b2898b..615bccc77c98 100644
> > --- a/drivers/cpufreq/mediatek-cpufreq.c
> > +++ b/drivers/cpufreq/mediatek-cpufreq.c
> > @@ -737,6 +737,14 @@ static const struct mtk_cpufreq_platform_data mt27=
01_platform_data =3D {
> >   =09.ccifreq_supported =3D false,
> >   };
> >
> > +static const struct mtk_cpufreq_platform_data mt6572_platform_data =3D=
 {
> > +=09.min_volt_shift =3D 100000,
> > +=09.max_volt_shift =3D 200000,
> > +=09.proc_max_volt =3D 1250000,
> > +=09.sram_min_volt =3D 0,
>=20
> Are you sure that there's no SRAM regulator on MT6572?

Yes. There's no 'sram' mention in the downstream code, neither mt6323 has s=
ram
regulator.

> If there's none, there's no need to set sram_min_volt here,

Ack

> but if there is, you
> also need to set sram_max_volt.
>=20
> The ccifreq_supported explicitly set to false is ok for human readability=
 of the
> SoC features - that's also unneeded but keep it for the same of understan=
ding
> what's going on with this SoC.
>=20
> Cheers,
> Angelo
>=20
> > +=09.ccifreq_supported =3D false,
> > +};
> > +
>=20
>

Best regards,
Roman

