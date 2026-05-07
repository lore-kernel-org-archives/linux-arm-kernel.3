Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 718E7CD343B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 07:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3b4b28TuPNj8yn2sDhzaIm3oqnG0shWCKwgFtiocTqM=; b=y9YGDVMrWckd374Y/7pxV76Kuo
	L/shgfiq2viUIWlQr9Qs39AckxrGpF9zNyqqbXyE/Rkc6Berkg9Fo5G3srBwwQOnXaEeV3Mf/2bs9
	47RZ6nAk0lFwOTOy6VQQSGlsZvXHNUL4517Vmtp/8HjWAC3vCLqBsY6ofVW3lEkA8jaPOWD/sPboe
	1MBPEVHnJmEwvQ0a1BrUFOXrgOgjSKFvX4RUASpdkLsABEEawWywpKLlYxV0peslTlzb9r0rQpA2r
	R97FC3+PsRiN37PwkfLn3sZ0aDHVVW1NMEwtwgasOSHwFEEdD1cs/yu/l6rzpkybqvexArS3qaTb6
	9GMsvucw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKtNr-000000033bW-1w0l;
	Thu, 07 May 2026 07:42:59 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKtNq-000000033b5-2lSx;
	Thu, 07 May 2026 07:42:58 +0000
Date: Thu, 7 May 2026 09:42:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1778139775;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3b4b28TuPNj8yn2sDhzaIm3oqnG0shWCKwgFtiocTqM=;
	b=f5YLVYa0cHniVtKvXQOFWqYVDnfXZcUJjfLIvWvKBdSwK9s0oAB1RPyBc7dO+3Blk3NTn4
	GpxT3sR2o/WWELh+5Z5TLZOvRTig7QaWAdNWIJAkR+kp+lO+OfNNmq/UEJE+v3qOiJ7eoJ
	/HriXvxtPG4myHTFYjXaAxD0UxzwlHNUH88l4CoduBO6jrso6AXQEDsWaHiusY/5HozeNJ
	1wY34ut1hOVgyueTriT4jWRL9LYPAXJ4kGGXNx7VlwN8thCRl97fpcX9acKOtRPa23FAgd
	hvb09JSEJORG9aBhD0Ge5LxBM7AWhyoISyscpC+4Ia1MUMEDIx0+Nti552mueg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1778139775;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3b4b28TuPNj8yn2sDhzaIm3oqnG0shWCKwgFtiocTqM=;
	b=NBzyqdae625W0XACnkcozEF9sHTVppPY8kMo86M30It6Y6Q4f9ZEqS7UvtbRFgvMIMbVgS
	gGCrqTIiiwm/XqBA==
From: Gregor Herburger <gregor.herburger@linutronix.de>
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, 
	Srinivas Kandagatla <srini@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: raspberrypi,bcm2835-firmware: Add
 bcm2712-firmware compatible
Message-ID: <7g6bvlp5fs4bkviiyywqu5wb5hndkczcamgtir5ow262cqkmdo@xyj2otywjepn>
References: <20260506-rpi-otp-driver-v3-0-294602663695@linutronix.de>
 <20260506-rpi-otp-driver-v3-1-294602663695@linutronix.de>
 <20260506-unguided-duty-892b11b7c618@spud>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260506-unguided-duty-892b11b7c618@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_004258_837497_A682C2DC 
X-CRM114-Status: GOOD (  16.45  )
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

On Wed, May 06, 2026 at 05:50:42PM +0100, Conor Dooley wrote:
> On Wed, May 06, 2026 at 02:28:15PM +0200, Gregor Herburger wrote:
> > Add a compatible string for the bcm2712 firmware.
> > 
> > Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
> > ---
> >  .../bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml      | 13 ++++++++++---
> >  1 file changed, 10 insertions(+), 3 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
> > index 983ea80eaec9..fbcfa2bc168a 100644
> > --- a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
> > +++ b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
> > @@ -21,9 +21,16 @@ select:
> >  
> >  properties:
> >    compatible:
> > -    items:
> > -      - const: raspberrypi,bcm2835-firmware
> > -      - const: simple-mfd
> > +    oneOf:
> > +      - items:
> > +          - enum:
> > +              - raspberrypi,bcm2712-firmware
> > +              - raspberrypi,bcm2835-firmware
> > +          - const: simple-mfd
> > +      - items:
> > +          - const: raspberrypi,bcm2712-firmware
> > +          - const: raspberrypi,bcm2835-firmware
> > +          - const: simple-mfd
> 
> This diff doesn't make sense, either the new firmware is compatible with
> the old one or it is not. It shouldn't appear twice.

Ok. I will change it to:
-    items:
-      - const: raspberrypi,bcm2835-firmware
-      - const: simple-mfd
+    oneOf:
+      - items:
+          - const: raspberrypi,bcm2835-firmware
+          - const: simple-mfd
+      - items:
+          - const: raspberrypi,bcm2712-firmware
+          - const: raspberrypi,bcm2835-firmware
+          - const: simple-mfd

While reading the writing-schema.rst documentation I saw that it says most
bindings shouldn't need a select. Imho the select in this file doesn't add
anything which isn't covered witht the compatible. I wonder if I should drop the
select block?

Regards
Gregor

