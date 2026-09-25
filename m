Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50818C98321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 12:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zZMwuJi+uuOVEpnd6zSF27+CwSgdbF03Y7EP5Bx37VQ=; b=dxkmPiLhD9hgUR2ZBhnmMeH/p4
	4HKW3NiTacSiTMEyAJURxS1mo7Cx2acthey3mpC8CAH8GH2BJ8gYJ7Q5cnOqh/D12DeIF2iQLGGw5
	JAp88LDudJ/WXKygxGaRM/MABMD5FbTAV2sm3NYCn8zs4B7wQS1gZPyrqbUIfYPfG62/93iGYFrcM
	u7v12rgFV9pTkWsnRkw3d+A7m/zG/dtjDJ/NRbk+EjtdTFjOPUQXdAJ4F4TURF8a4WiG7Ic0NRTlf
	3N5Wty2RtigL5SvBEV2URFJP+SBk92ggJULK4IISlLUs97nag8jWe3he8Jw73iev8kaLQBZMw+z5t
	gZJjW97w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA53u-0000000DKQI-0psb;
	Fri, 25 Sep 2026 12:29:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA53s-0000000DKQB-1v37
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 12:29:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EE6B541AE3;
	Fri, 25 Sep 2026 12:29:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1D691F000FF;
	Fri, 25 Sep 2026 12:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790339395;
	bh=zZMwuJi+uuOVEpnd6zSF27+CwSgdbF03Y7EP5Bx37VQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=k9hQwa5N0f7/1SdDkUvFiNh3KdgCoYAJx8TtlLjJbd7yzw+8ZBEPTrtbFmOqFveLM
	 /V3HxMcneML6BiVfgdrPAxM/QvHsw2tVM5oAiVeVsv0yN4NHyrc0XVMfXiq8+PkMSX
	 MElNsNAHFvwvKXMfUsLjIUHCoiZy7Ch1IAUsMXUBMWyfmN03M1MbswlufDTbW/YYKC
	 ZFqX6j9hITGBzUUPMnM4LfwgsdkxkvYPZJWuGTuxRldU0mgVZNs9cETBNQyzFk1Tam
	 dIE013yxmVCsEkSSWGubYm9A/xirJYv8rCgw1+I0TJ+INOUpIZG7pu09ldTMdssg7f
	 7zsNgAcNkQ55A==
Date: Fri, 25 Sep 2026 07:29:54 -0500
From: Rob Herring <robh@kernel.org>
To: Joakim  Zhang =?utf-8?B?KOW8oOW8uuW6hik=?= <joakim.zhang@cixtech.com>
Cc: Mark Brown <broonie@kernel.org>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"perex@perex.cz" <perex@perex.cz>,
	"tiwai@suse.com" <tiwai@suse.com>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	cix-kernel-upstream <cix-kernel-upstream@cixtech.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 1/4] ASoC: dt-bindings: Add Cadence I2S-SC controller
Message-ID: <20260925122954.GE677989-robh@kernel.org>
References: <20260922112134.4167305-1-joakim.zhang@cixtech.com>
 <20260922112134.4167305-2-joakim.zhang@cixtech.com>
 <arKPdM4bYsAeAKtr@sirena.co.uk>
 <OSNPR06MB86866A7DE38DC5AD8197BF6E82812@OSNPR06MB8686.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <OSNPR06MB86866A7DE38DC5AD8197BF6E82812@OSNPR06MB8686.apcprd06.prod.outlook.com>
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

On Thu, Sep 24, 2026 at 07:33:12AM +0000, Joakim  Zhang (张强庆) wrote:
> 
> Hello,
> 
> > -----Original Message-----
> > From: Mark Brown <broonie@kernel.org>
> > Sent: Tuesday, September 22, 2026 10:24 PM
> > To: Joakim Zhang (张强庆) <joakim.zhang@cixtech.com>
> > Cc: lgirdwood@gmail.com; robh@kernel.org; krzk+dt@kernel.org;
> > conor+dt@kernel.org; perex@perex.cz; tiwai@suse.com; p.zabel@pengutronix.de;
> > cix-kernel-upstream <cix-kernel-upstream@cixtech.com>; linux-
> > sound@vger.kernel.org; devicetree@vger.kernel.org; linux-kernel@vger.kernel.org;
> > linux-arm-kernel@lists.infradead.org
> > Subject: Re: [PATCH 1/4] ASoC: dt-bindings: Add Cadence I2S-SC controller
> > 
> > On Tue, Sep 22, 2026 at 07:21:31PM +0800, joakim.zhang@cixtech.com wrote:
> > 
> > > Add the DT binding for the Cadence I2S-SC controller integrated in the
> > > CIX SKY1 audio subsystem. I2S-SC is a full-duplex stereo controller
> > > supporting standard I2S, left/right-justified and DSP formats, plus
> > > TDM operation with up to 16 slots.
> > 
> > > +properties:
> > > +  compatible:
> > > +    const: cix,sky1-i2s-sc
> > 
> > Should there be some general Cadence fallback for this if it's a Cadence IP?
> 
> Yes, cdns,sky1-i2s-sc should be better.

No. Cadence has nothing to do with sky1. It would be the above *plus* a 
Cadence fallback compatible.

I'm on the fence whether a Cadence compatible is useful. For complex IP 
(e.g. PCIe, USB, etc.), IP vendor fallbacks have proven to be not 
useful. For simple IP blocks, they can be useful. It also depends if 
there is a h/w manual which can be used so we can really define the 
correct numbers of clocks, interrupts, etc. Perhaps I2S is simple 
enough.

Rob

