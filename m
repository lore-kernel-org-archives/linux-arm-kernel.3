Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B9ACC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 13:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=weGolSbdA7OP6EvHvm4+CdGLpzTlp7bfL85xlugRMfE=; b=pc68hiUNDA/twllt/LrlLZfa/W
	FZb6rw1DlAjklrA0wRN3uPZOmD6rHCZHiKrweJxcg8XKtLAsSzmrWD0wwhoOqWoPMzR4+DPEaEwlu
	Afe+/PFEL7g75AKx3i5obcPYgeNzOe3CyimLZTDx4EBfbNemEtYtu8QJdfJ1zUvjtXEOwLTqYgbVz
	HkLL5Uw9fHZmgwQnlLHmZvaPHNKN6qAzTCDt47J3sJ28RgthlUn+m63hkmgiF9sl3qByljZEuZVlS
	z0qB92aBaMEH7z12Xw3SP594Kg7BTtnCqvE1p/2lu8eGA3P0pFie5OPI+3zpEyMYU1cFn/q3XRli6
	NLxsEU+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weYxB-0000000HE0V-3sMl;
	Tue, 30 Jun 2026 13:56:45 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weYx9-0000000HDyW-1IoE;
	Tue, 30 Jun 2026 13:56:44 +0000
Date: Tue, 30 Jun 2026 15:56:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1782827796;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=weGolSbdA7OP6EvHvm4+CdGLpzTlp7bfL85xlugRMfE=;
	b=0rb3NqkgCzFv6dbBuCuwXzrZKSBa9njLgZ96iT/WN43BeeKU3gr7MEpntPp3hzITKwsmuY
	VRnpSAkMk4n25hUGcfgk5hEB8A5vlKZJxXYw2qZ2ZDH2nL4vILUyUYbjcbOk7i1WaPCrFG
	YqegR+OEwAsQh+3ZtZbOvmUbYG6PrSShi2JKYJf/to8ygpc7GO1vniz6Ce3+/YhTI5Ox9w
	Axm575H+QFTgVpiSceVMLzAd4Xdlxztidtq6oDovgYQB6BbDet1bss/O4obc1jQKxnaNWU
	65+gwQggwkCl4iqgWoj1Em/YqCKfnsFIySkurNFaJMtpLBvrpA7SpUsTTfV/MQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1782827796;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=weGolSbdA7OP6EvHvm4+CdGLpzTlp7bfL85xlugRMfE=;
	b=AHHvtVMRcbJ8NFESLjJ5OP0fWjOj4UyyFmEdYuob9ujo1w8bqGZtuNYhkwxgkZVUVoIh4Z
	ZqP9vst7URTmScDw==
From: Gregor Herburger <gregor.herburger@linutronix.de>
To: Conor Dooley <conor@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: raspberrypi,bcm2835-firmware: Include
 'reboot-mode.yaml'
Message-ID: <qgoblikagfbcmbqoryw4ajfa6qyx3wpj4qfeuuntima542qlkq@evebdvjaxern>
References: <20260626-rpi-tryboot-v1-0-490b1c4c4970@linutronix.de>
 <20260626-rpi-tryboot-v1-2-490b1c4c4970@linutronix.de>
 <20260626-quaking-shove-fcc9d8057ae0@spud>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260626-quaking-shove-fcc9d8057ae0@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_065643_528498_4253FAFC 
X-CRM114-Status: GOOD (  23.41  )
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

Hi Conor,

On Fri, Jun 26, 2026 at 04:57:35PM +0100, Conor Dooley wrote:
> On Fri, Jun 26, 2026 at 09:35:05AM +0200, Gregor Herburger wrote:
> > The Raspberry Pi firmware allows to set a reboot mode called tryboot
> > that allows to try booting from a different partition to allow updating
> > of the boot partition. Allow reboot mode properties by referencing the
> > reboot-mode schema.
> > 
> > Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
> > ---
> >  .../devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml    | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
> > index 983ea80eaec97..30b490e0d9fb3 100644
> > --- a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
> > +++ b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
> > @@ -133,11 +133,14 @@ properties:
> >      required:
> >        - compatible
> >  
> > +allOf:
> > +  - $ref: /schemas/power/reset/reboot-mode.yaml#
> > +
> >  required:
> >    - compatible
> >    - mboxes
> >  
> > -additionalProperties: false
> > +unevaluatedProperties: false
> 
> I think you should keep additionalProperties: false and add
> mode-normal: true
> mode-tryboot: true
> 
> (I don't know if the latter works though, you may need to have a $ref to
> uint32-array).
> 
> What you've done permits freeform reboot modes, but I think only normal
> and tryboot are valid?

Ah yes good point. I do think it should be restricted to
'mode-{normal,tryboot}'. 

Sashiko also suggested to set maxItems to 1 and I think that is a good idea as
well, because afaik the firmware only accepts a 32bit value for the reboot flag.
The $ref to uin32 is not needed that is already enforced by the
patternProperties "^mode-.*$": in reboot-mode.yaml.

Therefore I will add the following (and keep additionalProperties: false):

properties:
...

  mode-normal:
    maxItems: 1

  mode-tryboot:
    maxItems: 1

allOf:
  - $ref: /schemas/power/reset/reboot-mode.yaml#


I will do some more testing and send a v2 later.

Regards
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

