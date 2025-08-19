Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 558C7CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 19:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w8WUf8AmfS+FFPYraOMaxO5P5F0IKPj4rPj8B6ogiWg=; b=XsAPjx5WTnW/Dy0wiQPucPCsUT
	XuVgYJl2uw+taQuX8HotcMEb5pvtNTNRkvdqmxoBm6ajTY2NWaeFneXbxTGVouLSBYwA3+lPL5jE5
	ky9qKbK5wwtZtyqeyfphQtXpcPZeRLDPoxvSAQqXP075OZrBFrjUVtPixoOmmRJT0fq7gAzc9CcX3
	j1xpmo1Ishgm9t1k3CqW6rtMAd7/7N+o9L1extHMfQ9T3jKEbu0Cx1eenqXWB+fnmJOG4tlKei8oY
	9mUMtXuci733xnp9ofq99uuvNLKJkDi92DBRtI3WsdfZPIIIYepGt8qzED4TN/M96Tg7tGsyd1sAo
	sRfszMLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoSUY-0000000BUSM-0bBT;
	Tue, 19 Aug 2025 19:59:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoQOl-0000000B9aL-1q2y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 17:45:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 96C9346213;
	Tue, 19 Aug 2025 17:45:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30523C4CEF1;
	Tue, 19 Aug 2025 17:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755625526;
	bh=DtrKhkB5ryM3ThMC1G9NOf7X3JSBqYTo0pkcmv1KFFw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=suyIBS+Hz9tOiYiyMeqt0DrLTdK10UHR/pK/mcyUh74/6m2e6llELdkzR0qKnI4Cv
	 AFNxspBPi6ItduOnJtf8IF+rd6D2J0FdtsS/UDAiFKF5yNBZMCToKyYuP2hrQ2wS0L
	 AQyo0gcajG0jPk4a37rYP6TSWLL4yMqjy6evj6NyIEPVnIIoCFsgjFFLEGTFneX6pU
	 WH1iH9znN2nUtR1qpNTmENsDEyskR2M2fcLhQhgUu0v2sG/bcaOcFdk2lDyGTIIMA9
	 NMTK+mAcPNG4nn+rKRXu1IWEpNuzt5ugp3xrTAiMWN+uTqoTB98scumWC0flba699/
	 +ZalplsFY/USg==
Date: Tue, 19 Aug 2025 18:45:17 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: "O'Griofa, Conall" <conall.ogriofa@amd.com>
Cc: "Erim, Salih" <Salih.Erim@amd.com>, "dlechner@baylibre.com"
 <dlechner@baylibre.com>, "nuno.sa@analog.com" <nuno.sa@analog.com>,
 "andy@kernel.org" <andy@kernel.org>, "Simek, Michal"
 <michal.simek@amd.com>, "linux-iio@vger.kernel.org"
 <linux-iio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>
Subject: Re: [PATCH] MAINTAINERS: Update xilinx-ams driver maintainers
Message-ID: <20250819184442.25f6904e@jic23-huawei>
In-Reply-To: <BY5PR12MB4212A540F9799D6F326003388B30A@BY5PR12MB4212.namprd12.prod.outlook.com>
References: <20250819150448.1979170-1-salih.erim@amd.com>
	<BY5PR12MB4212A540F9799D6F326003388B30A@BY5PR12MB4212.namprd12.prod.outlook.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_104527_523350_0577CBCE 
X-CRM114-Status: GOOD (  17.26  )
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

On Tue, 19 Aug 2025 15:10:15 +0000
"O'Griofa, Conall" <conall.ogriofa@amd.com> wrote:

> [AMD Official Use Only - AMD Internal Distribution Only]
> 
> Acked-by: O'Griofa, Conall <conall.ogriofa@amd.com>

I'm not entirely sure why but b4 only picked up:

[PATCH] MAINTAINERS: Update xilinx-ams driver maintainers
    + Acked-by: Michal Simek <michal.simek@amd.com>
    + Acked-by: 
    + Link: https://patch.msgid.link/20250819150448.1979170-1-salih.erim@amd.com

Anyhow I fixed it up to include Connal's ack whilst applying.

Salih and Connal, thanks for stepping up.

Jonathan

> 
> > -----Original Message-----
> > From: Salih Erim <salih.erim@amd.com>
> > Sent: 19 August 2025 16:05
> > To: Erim, Salih <Salih.Erim@amd.com>; O'Griofa, Conall
> > <conall.ogriofa@amd.com>; jic23@kernel.org
> > Cc: dlechner@baylibre.com; nuno.sa@analog.com; andy@kernel.org; Simek,
> > Michal <michal.simek@amd.com>; linux-iio@vger.kernel.org; linux-arm-
> > kernel@lists.infradead.org; linux-kernel@vger.kernel.org;
> > devicetree@vger.kernel.org
> > Subject: [PATCH] MAINTAINERS: Update xilinx-ams driver maintainers
> >
> > Removes Anand Ashok from maintainers and adds Salih and Conall as new
> > maintainers.
> >
> > Signed-off-by: Salih Erim <salih.erim@amd.com>
> > ---
> >  Documentation/devicetree/bindings/iio/adc/xlnx,zynqmp-ams.yaml | 3 ++-
> >  MAINTAINERS                                                    | 3 ++-
> >  2 files changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/iio/adc/xlnx,zynqmp-ams.yaml
> > b/Documentation/devicetree/bindings/iio/adc/xlnx,zynqmp-ams.yaml
> > index a403392fb263..3ae1a0bab38f 100644
> > --- a/Documentation/devicetree/bindings/iio/adc/xlnx,zynqmp-ams.yaml
> > +++ b/Documentation/devicetree/bindings/iio/adc/xlnx,zynqmp-ams.yaml
> > @@ -7,7 +7,8 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
> >  title: Xilinx Zynq Ultrascale AMS controller
> >
> >  maintainers:
> > -  - Anand Ashok Dumbre <anand.ashok.dumbre@xilinx.com>
> > +  - Salih Erim <salih.erim@amd.com>
> > +  - Conall O'Griofa <conall.ogriofa@amd.com>
> >
> >  description: |
> >    The AMS (Analog Monitoring System) includes an ADC as well as on-chip
> > sensors diff --git a/MAINTAINERS b/MAINTAINERS index
> > daf520a13bdf..b4b27a31a782 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -27537,7 +27537,8 @@ F:    include/uapi/linux/dqblk_xfs.h
> >  F:   include/uapi/linux/fsmap.h
> >
> >  XILINX AMS DRIVER
> > -M:   Anand Ashok Dumbre <anand.ashok.dumbre@xilinx.com>
> > +M:   Salih Erim <salih.erim@amd.com>
> > +M:   Conall O'Griofa <conall.ogriofa@amd.com>
> >  L:   linux-iio@vger.kernel.org
> >  S:   Maintained
> >  F:   Documentation/devicetree/bindings/iio/adc/xlnx,zynqmp-ams.yaml
> > --
> > 2.34.1  
> 


