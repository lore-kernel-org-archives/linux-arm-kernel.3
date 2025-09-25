Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4D39CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 14:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OvzRWlr1AsAppW+7NbJb7lHmXfQyzadLNFuD+HINmpE=; b=ezyGS7vRc7FMs1m8ooMIKTXGJY
	ENp3d2q8k4vPVDptXJP0jNaC7J4Xq0fWDGT6d9AxZvcZKhmykXbXTXWJMsdSiVAL/53VCveeOqPxO
	yniJBzUgZ5Ou1tqWXaxncP1oa/oGd+KG5eR6jKnIld6MrArFqjKI8n7myH1SYEcDj2rPU8S2sOPP6
	QbKjCwTBfy2aKG+P0bEgxZ54MWfkHMW4Iulh+A0XPR03DkKojVqzfVd7OkAC2+MzA1C8xENobLty7
	+eS24rMIbDOJ+c0O2MegDwmylrNy/6V4MLGlHSe0nF0K6fq8Hv/QiQe/0XZbTWKsoQHPloRZ//oh2
	9iGCdz2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1mbD-00000009lxT-1nfb;
	Thu, 25 Sep 2025 14:05:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1mbC-00000009lwF-2L7D;
	Thu, 25 Sep 2025 14:05:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=OvzRWlr1AsAppW+7NbJb7lHmXfQyzadLNFuD+HINmpE=; b=iWJulSVKBbbakmSNUKDKWKYQ4/
	lQu3EXImNad5P0fgRlP6towcS/5HCP3Y2k5FTEmJbAyf+Yz1joTZOLPITmzOcmgqf2Dk2yFM5UjMM
	XxqvEGYEZbL0Ch2eRs8YsvetOhfTBbchIT+fNqjmn/7BJJ0gh0ta8AlJwmPHMZoV1jZ5ceS/BJP/U
	yU+qN2zV7YoW8C7IJH2qdh/1feGLRJ18E7WIYwjQacVxNv95cyBQeg39A2b0uO3tUSPlN5lH1K5wI
	p5suuFcNDnctA8buje7fs2CFWuxYQLYh0Bi8/lEWQ9P88fEr/sMoxpBl1WUf3YdDR+vWJstNqVFi9
	8lpc03Lw==;
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1mb9-00000009Cqk-1ao4;
	Thu, 25 Sep 2025 14:05:29 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1758809109; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=cQh9vCGaK7a5DYd7rza61JtUGEP0Vz18KvzIfciBZKzG7jXvEMAD3kDwZFw2F5BDouwKe689Bh/3vNB5tAOdJlDlY4j7kOda4ZAxDhcWIUgpOPd1S0CzZ14RnE5zeR1R+VlFouKW/hEIJ/efZXKXoTJV7CqVsZ2ukJiu/DmKZ38=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1758809109; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=OvzRWlr1AsAppW+7NbJb7lHmXfQyzadLNFuD+HINmpE=; 
	b=UZ/VsNtpBrPjPmJ1vrfNmiu/+3MDkNII5l1JivYKK84zCKKOhWw+RVG1FbWXO1fdRAwh0LwLfKKy1yUI3U3uuq43dv84BC+6RDaURBDbrvt3dw1bOD/fRTjZuWucvmGQ9anhWBARMJef8dtvZk89F44coSgM3I5HXluDBTXVPQI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1758809109;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=OvzRWlr1AsAppW+7NbJb7lHmXfQyzadLNFuD+HINmpE=;
	b=jEN2Ueeq3h2ncv9IpdvT6N+pBrPDythheciswAlgARWVQBrUiSGuf6Ms9FtpVs+b
	rZd9U4lz0/vR19E1wqaDeX29hAehM/hu9xbvSuROcq0laF3jqv7a+D+KK4QrFzD8n5r
	qRx9UVBEv3VRY01OlG/2GxUdW0wIUHtNtl0kpF2A=
Received: by mx.zohomail.com with SMTPS id 1758809108075771.102720899719;
	Thu, 25 Sep 2025 07:05:08 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, Chia-I Wu <olvaffe@gmail.com>,
 Chen-Yu Tsai <wenst@chromium.org>, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-hardening@vger.kernel.org,
 linux-pm@vger.kernel.org
Subject: Re: [PATCH v4 8/8] pmdomain: mediatek: Add support for MFlexGraphics
Date: Thu, 25 Sep 2025 16:04:59 +0200
Message-ID: <2015216.PYKUYFuaPT@workhorse>
In-Reply-To: <CAPDyKFpLNJRRxWPm2Eye+Fs8go-LNwWGzPUPPKmNVJkyK5N3Dw@mail.gmail.com>
References: <20250923-mt8196-gpufreq-v4-0-6cd63ade73d6@collabora.com>
 <20250923-mt8196-gpufreq-v4-8-6cd63ade73d6@collabora.com>
 <CAPDyKFpLNJRRxWPm2Eye+Fs8go-LNwWGzPUPPKmNVJkyK5N3Dw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_150527_836940_A2F33276 
X-CRM114-Status: GOOD (  36.79  )
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

On Tuesday, 23 September 2025 16:24:13 Central European Summer Time Ulf Hansson wrote:
> On Tue, 23 Sept 2025 at 13:41, Nicolas Frattaroli
> <nicolas.frattaroli@collabora.com> wrote:
> >
> > Various MediaTek SoCs use GPU integration silicon named "MFlexGraphics"
> > by MediaTek. On the MT8196 and MT6991 SoCs, interacting with this
> > integration silicon is required to power on the GPU.
> >
> > This glue silicon is in the form of an embedded microcontroller running
> > special-purpose firmware, which autonomously adjusts clocks and
> > regulators.
> >
> > Implement a driver, modelled as a pmdomain driver with a
> > set_performance_state operation, to support these SoCs.
> >
> > The driver also exposes the actual achieved clock rate, as read back
> > from the MCU, as common clock framework clocks, by acting as a clock
> > provider as well.
> >
> > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > ---
> >  drivers/pmdomain/mediatek/Kconfig            |  16 +
> >  drivers/pmdomain/mediatek/Makefile           |   1 +
> >  drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c | 928 +++++++++++++++++++++++++++
> >  3 files changed, 945 insertions(+)
> 
> [...]
> 
> > +
> > +static int mtk_mfg_set_performance(struct generic_pm_domain *pd,
> > +                                  unsigned int state)
> > +{
> > +       struct mtk_mfg *mfg = mtk_mfg_from_genpd(pd);
> > +
> > +       /*
> > +        * Occasionally, we're asked to set OPPs when we're off. This will fail,
> > +        * so don't do it at all. We do foo != GENPD_STATE_ON instead of !foo
> > +        * as to not depend on the actual value of the enum.
> > +        */
> > +       if (mfg->pd.status != GENPD_STATE_ON)
> > +               return 0;
> 
> Returning 0 here, means that we may end up never restoring the
> performance state for a device and its genpd, when the device is
> getting runtime resumed. In genpd_runtime_resume() we are calling
> genpd_restore_performance_state() before calling genpd_power_on().
> This is deliberate, see commit ae8ac19655e0.
> 
> That said, I think we need to manage the restore in the ->power_on()
> callback. In principle, it means we should call
> mtk_mfg_set_oppidx(mfg, genpd->performance_state) from there.
> 

Thanks for pointing this out, yeah setting the oppidx in power_on
does look like the right choice.

> > +
> > +       return mtk_mfg_set_oppidx(mfg, state);
> > +}
> > +
> > +static int mtk_mfg_power_on(struct generic_pm_domain *pd)
> > +{
> > +       struct mtk_mfg *mfg = mtk_mfg_from_genpd(pd);
> > +       int ret;
> > +
> > +       ret = regulator_bulk_enable(mfg->variant->num_regulators,
> > +                                   mfg->gpu_regs);
> > +       if (ret)
> > +               return ret;
> > +
> > +       ret = clk_prepare_enable(mfg->clk_eb);
> > +       if (ret)
> > +               goto err_disable_regulators;
> > +
> > +       ret = clk_bulk_prepare_enable(mfg->variant->num_clks, mfg->gpu_clks);
> > +       if (ret)
> > +               goto err_disable_eb_clk;
> > +
> > +       ret = mtk_mfg_eb_on(mfg);
> > +       if (ret)
> > +               goto err_disable_clks;
> > +
> > +       ret = mtk_mfg_power_control(mfg, true);
> > +       if (ret)
> > +               goto err_eb_off;
> > +
> > +       return 0;
> > +
> > +err_eb_off:
> > +       mtk_mfg_eb_off(mfg);
> > +err_disable_clks:
> > +       clk_bulk_disable_unprepare(mfg->variant->num_clks, mfg->gpu_clks);
> > +err_disable_eb_clk:
> > +       clk_disable_unprepare(mfg->clk_eb);
> > +err_disable_regulators:
> > +       regulator_bulk_disable(mfg->variant->num_regulators, mfg->gpu_regs);
> > +
> > +       return ret;
> > +}
> 
> [...]
> 
> Note, I intend to have a bit closer look at this soon, but I just
> observed the issue I pointed out above from my first quick look.

I actually have a question about a mystery that has been puzzling
me as I work on v5: when unloading the driver that uses the PD
(panthor) and my driver using `modprobe -r panthor mtk_mfg_pmdomain`,
I see that sometimes detach_dev is called with the pd status
reportedly being off, but according to my own power-on/power-off
counting I hacked in, it actually being on. It then proceeds to
call my remove, which results in three splats from the regulator
subsystem as the regulators weren't balanced with disables before
they were freed, which isn't the main problem but more a symptom
of the bigger problem that power_off and power_on calls don't
appear to be balanced by the pmdomain subsystem when a driver is
removed under certain circumstances.

Did I run into a core pmdomain bug here, or do I have to balance
the power_on/off myself somehow in detach_dev? If the latter, I'm
struggling to figure out how I can determine that the PD is still
on without doing my own bookkeeping, as pmdomain core seems to clear
these fields before my detach_dev gets to them :(

> 
> Kind regards
> Uffe
> 

Kind regards,
Nicolas Frattaroli



