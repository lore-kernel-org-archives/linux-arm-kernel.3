Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1901C55174
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 07:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JRnmSwfePuxjzp3S3366V2iKuGTS0E5jGJbo3/yzTqY=; b=JP8/irNDbIo9yLxThOUTa7vFMP
	cSMyWlgxBY2QzfTSSbl1f/jJ+aPLS8oIK1OCbzYCuoq2GQvw6CkjV+6KUGNdNOBDc06uBP8mlFMnG
	5iq+SrehkaBgkQpd8TTpcA5pX/OraOhSXGcjg/nQPVfKigvGIbT9XOuxlruxj6BFYP4x9C/spPgF0
	Xzlo6NISFJ9LY8//Xtc5GFQHXZrxCs9zWpGSvGwt9t3OZ5IEtJwOhNRoKjTDwzOdoZA74CRYKUbCm
	R5DnzIa5P+ET7V2NRIUSIESkMgGjaDTE3RO5FlKudhWYijAzSgUVYgIxGItgmd9cbuQwtthtbvLaj
	/ei/bcrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrW2Z-00000003PAs-0Iq7;
	Wed, 05 Aug 2026 07:27:51 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrW2W-00000003P9q-0nOw;
	Wed, 05 Aug 2026 07:27:50 +0000
Date: Wed, 5 Aug 2026 09:27:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1785914863;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JRnmSwfePuxjzp3S3366V2iKuGTS0E5jGJbo3/yzTqY=;
	b=yEayGddaDKi2zac0rvSRmjjvtr1lIAegfo0pQUMXWYmEfWWGeLMLxxSFzkYq9+QyNN+bsJ
	ACYgn6vC4qdJK/LQHJHd6qgOmecgYZg3tuKadXmFaLntp+3bntqmrmWp3YHcYPrSx4MkYq
	KUIYmTBkyo5ODeoHXPokddunWa0qXSjgT5JBWhTxv12cVAdxZOUihsTaAj1YxR9MRLE7Sh
	faQJ6rGQMqHwvXpZ/QWtLsV6XYMMVKk+JAXVv6Ig6Wvd3xOHvEcI7mkK87PfCPzhGRD1Nx
	KaFz5ndvZ0fGWBSe76bLcx8V+d/Wkg1OcXDfH3BCp7czsobPSD4Rs2ATRXvTRg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1785914863;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JRnmSwfePuxjzp3S3366V2iKuGTS0E5jGJbo3/yzTqY=;
	b=fkzURMFPZeNTOuzVlxu4KF2sqGwU73Oo0MmvEOCYJNKxGa44uyEPBf59FbH1Kc4MBchImb
	bL2YR40YTXln9pAA==
From: Gregor Herburger <gregor.herburger@linutronix.de>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Eric Anholt <eric@anholt.net>, devicetree@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] arm64: dts: broadcom: bcm2712-d-rpi-5-b: add
 compatible
Message-ID: <vv6ufnanks27moditlav2ebaub6m5te5tag3m6qv5l65cm25iw@i7m54od3wz4k>
References: <20260804-bcm2712-d-stepping-compatible-v3-0-1860094486eb@linutronix.de>
 <20260804-bcm2712-d-stepping-compatible-v3-2-1860094486eb@linutronix.de>
 <6ed9b2e5-b700-477a-8f6f-cb48c597a111@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6ed9b2e5-b700-477a-8f6f-cb48c597a111@gmx.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_002748_407543_798E982B 
X-CRM114-Status: GOOD (  25.24  )
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

On Tue, Aug 04, 2026 at 04:57:09PM +0200, Stefan Wahren wrote:
> Hi Gregor,
> 
> sorry for my late reply.
> 
> Am 04.08.26 um 15:13 schrieb Gregor Herburger:
> > The bcm2712 found on the Raspberry Pi 5 is available in the d Stepping
> > and in a c Stepping. There are two separate dts files. The
> > bcm2712-rpi-5-b.dts for the c Stepping and the bcm2712-d-rpi-5-b.dts for
> > the d Stepping. The d stepping does not set its own compatible/model
> > string but uses "raspberrypi,5-model-b".
> In case the SoC and not the board has a D stepping, why do just change the
> board compatible without the SoC compatible like "brcm,bcm2712-d0"?
> > 
You mean changing both compatible strings? Like this:
	compatible = "raspberrypi,5-model-b-d0", "brcm,bcm2712-d0";

Don't know actually. Have not found an example for something like this in the
tree. I prefer it actually like it is. Would like to hear the opinion of an
devicetree maintainer about this.

> > These two steppings are not compatible. Booting with the wrong dtb file
> > causes a crash at boot.
> This sounds like the patch should have a fixes tag?
Yes can add one.
> > 
> > Add a compatibles string "raspberrypi,5-model-b-d0" to allow us to
> > distinguish between those two steppings.
> > 
> > Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
> > ---
> >   arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts | 5 +++++
> >   1 file changed, 5 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts
> > index 127be0fc27c22..5a86ad69645c3 100644
> > --- a/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts
> > +++ b/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts
> > @@ -3,6 +3,11 @@
> >   #include "bcm2712-rpi-5-b.dts"
> > +/ {
> > +	compatible = "raspberrypi,5-model-b-d0", "brcm,bcm2712";
> > +	model = "Raspberry Pi 5 d0 Stepping";
> > +};
> > +
> >   &gio_aon {
> >   	brcm,gpio-bank-widths = <15 6>;
> > 
> 

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

