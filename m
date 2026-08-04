Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BABE6C5518F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 08:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+1e25DepZeRbvIwYwRbIXVPUAS5ZIcSEjcncQ0Lz1j0=; b=tFKCBhDgHpec34M8vE5LPfC8CG
	eMr545jt1gPyEDZ1mGLDfslBRs1TjXic1JgtBUmfiYnHfaMwHiVwW7P8Ym6gVRhf+nJm7nHSnZ9Cv
	g9T8d1VoxYweQY0jHDLQ0lzhzVT5BcsWDWDZjJzTVjn6VCEcDJOQfq6ljfPFCuFYIP5K2ukEh1P0+
	L9k285vesgx2cOgn/G6ABS1qjplr8N2B5xGj8/dHKYnMppJVR0hfIzQsmesOaza+/B9+lbKdRmaRT
	wcQP35ApWGncL1keS/ef5ljbkpYOSqEuFsBnlZLSIA+1i38bYp2EGpJOJqQx+gQ61PcAemKJHGiCp
	tPAZcQcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrAfR-00000001MMO-289b;
	Tue, 04 Aug 2026 08:38:33 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrAfP-00000001MLo-2VRw;
	Tue, 04 Aug 2026 08:38:33 +0000
Date: Tue, 4 Aug 2026 10:38:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1785832708;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+1e25DepZeRbvIwYwRbIXVPUAS5ZIcSEjcncQ0Lz1j0=;
	b=1q/hFnrAZKARngwsSSFG1fn+ERHWPeK/Q2PYhSEUIw+JBjXJMalKpB/IRpkA/FczwznZA5
	00JnC7IybC+zT01et5FF52tsoxpr23aMm0GdTAN8XV0m6OCofsJg9jMKEh4gpf8jGmkv7a
	MCN6eq5bqP17thiA2c32LsqI2ecbeBxMWvW6BRfRm/095xSGYHP9osD37v6ytY0T32WUQi
	H9jJ/mARccK3HM2cerNjma2b6w67wRWE5DnhlroKxHoz73fjdXEg+IFFkKnYG7L/nqI2xG
	/4c36vjIJs1ocrTb//ggW+xOv9+/QtR2uc43+/+qAk2WwoIi3f+AIEMHoScceg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1785832708;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+1e25DepZeRbvIwYwRbIXVPUAS5ZIcSEjcncQ0Lz1j0=;
	b=zT4d68oFcXnLYbELnfcG/wL8TM4UP8eCkJ/ZXKy/ykvMWk/pP+KjIs77W+zu3gJH0O8IEA
	ChFCSfBtI1FyVgDQ==
From: Gregor Herburger <gregor.herburger@linutronix.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, 
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: broadcom: bcm2712-d-rpi-5-b: add
 compatible
Message-ID: <zl5z6owx4v5kg2ian7twpggekaosrenbhvgjq7fimm5j2ptz4i@ygvudatdkems>
References: <20260803-bcm2712-d-stepping-compatible-v2-0-803017e4ba7a@linutronix.de>
 <20260803-bcm2712-d-stepping-compatible-v2-2-803017e4ba7a@linutronix.de>
 <20260804-unbeatable-fluffy-galago-bfe282@quoll>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260804-unbeatable-fluffy-galago-bfe282@quoll>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_013831_813984_FCCFFD7D 
X-CRM114-Status: GOOD (  22.51  )
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

On Tue, Aug 04, 2026 at 09:48:19AM +0200, Krzysztof Kozlowski wrote:
> On Mon, Aug 03, 2026 at 02:09:25PM +0200, Gregor Herburger wrote:
> > The bcm2712 found on the Raspberry Pi 5 is available in the d Stepping
> > and in a c Stepping. There are two separate dts files. The
> > bcm2712-rpi-5-b.dts for the c Stepping and the bcm2712-d-rpi-5-b.dts for
> > the d Stepping. The d stepping does not set its own compatible/model
> > string but uses "raspberrypi,5-model-b".
> > 
> > These two steppings are not compatible. Booting with the wrong dtb file
> 
> Not compatible but...
> 
> > causes a crash at boot.
> > 
> > Add a compatibles string "raspberrypi,5-model-b-d0" to allow us to
> > distinguish between those two steppings.
> > 
> > Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
> > ---
> >  arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts
> > index 127be0fc27c2..11a38cd53401 100644
> > --- a/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts
> > +++ b/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts
> > @@ -3,6 +3,11 @@
> >  
> >  #include "bcm2712-rpi-5-b.dts"
> >  
> > +/ {
> > +	compatible = "raspberrypi,5-model-b-d0", "raspberrypi,5-model-b", "brcm,bcm2712";
> 
> this tells they are compatible. If compatibility was wrong since the
> beginning, you do not have to preserve the ABI.
Ok understood. Will drop the fallback and make it either
	compatible = "raspberrypi,5-model-b-d0", "brcm,bcm2712";
or
	compatible = "raspberrypi,5-model-b", "brcm,bcm2712";
> 
> Best regards,
> Krzysztof
> 
Best regards,
-- 
Gregor Herburger
Linutronix GmbH | Bahnhofstrasse 3 | D-88690 Uhldingen-Mühlhofen
Phone: +49 7556 25 999 35; Fax.: +49 7556 25 999 99

Hinweise zum Datenschutz finden Sie hier (Informations on data privacy 
can be found here): https://linutronix.de/legal/data-protection.php

Linutronix GmbH | Firmensitz (Registered Office): Uhldingen-Mühlhofen | 
Registergericht (Registration Court): Amtsgericht Freiburg i.Br., HRB700 
806 | Geschäftsführer (Managing Directors): Dr. Wilfried Wessner, 
Katharina Kopp, Alexander Gieringer

