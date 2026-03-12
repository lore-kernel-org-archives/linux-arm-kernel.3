Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90CDE106705A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 15:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F5qwJavBVWV92QiDrDH0xvkLoJ9dwrCz5qZjjPc0g9E=; b=r97GZYQdWGijcwmpBn+xYTalUp
	/HLYG6LMPvwBaahlwKHrcZBtGQQXzGyjqbRXkyAtsjcP1VFdDDxrDj6/gAa+KPIF86GjNJGDp0Hof
	AuKPUG1sZJD81wgUKBIRE6Md8Fd0GMc0IWE431ysjYG9wsleyBQaLQUcc3beoD04lNxywU1ag3X1d
	bbO2BLoT5wJLPbvZPNIOVNsyIK0+RYwI8dLaYI2kBU/q6CK02QlU+R8az4CK5kenwHU3dp6FsUFIA
	9DIPUHVsWerdWDGzxzTkoh39O7qNZepefj3kn2mLwcIiJGWrOOxuYLbBcB4vrOwbrgsrCw5UgC2TE
	B4tngavA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0iDR-0000000EQZX-0uMi;
	Thu, 12 Mar 2026 15:44:49 +0000
Received: from mail.hugovil.com ([162.243.120.170])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0iDO-0000000EQYK-14QB;
	Thu, 12 Mar 2026 15:44:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=default; h=Content-Transfer-Encoding:Mime-Version:Message-Id:Subject:Cc:
	To:From:Date:subject:date:message-id:reply-to;
	bh=F5qwJavBVWV92QiDrDH0xvkLoJ9dwrCz5qZjjPc0g9E=; b=KIdjU6BjZrTcnKue5AEEHNUND+
	YKAvDSMLR/2ccfbak/Pa7FUnAEyf4/sqXKJTX197jkN81KUcGBVp0bf/TyScvrp8iZweuWzT/EFYW
	9aIBUhGh1VMwNOL/2zloVVeP0Ue/xtjxHPoEKbexVUHjX8gOy7nFbuRb3VE06LM5OTwU=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168] helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.98.2)
	(envelope-from <hugo@hugovil.com>)
	id 1w0iDC-0000000072H-0dJm;
	Thu, 12 Mar 2026 11:44:34 -0400
Date: Thu, 12 Mar 2026 11:44:33 -0400
From: Hugo Villeneuve <hugo@hugovil.com>
To: Rob Herring <robh@kernel.org>
Cc: robin@protonic.nl, andy@kernel.org, geert@linux-m68k.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, dmitry.torokhov@gmail.com,
 hvilleneuve@dimonoff.com, mkorpershoek@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, lee@kernel.org,
 alexander.sverdlin@gmail.com, marek.vasut@gmail.com, akurz@blala.de,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v4 2/4] dt-bindings: input: add settling-time-us common
 property
Message-Id: <20260312114433.5432b94423d7caf3968658a1@hugovil.com>
In-Reply-To: <20260312150210.GA3121485-robh@kernel.org>
References: <20260305192101.2125660-1-hugo@hugovil.com>
	<20260305192101.2125660-3-hugo@hugovil.com>
	<20260312150210.GA3121485-robh@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam_score: -2.0
X-Spam_bar: --
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_084446_386025_389A2D81 
X-CRM114-Status: GOOD (  18.37  )
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

Hi Rob,

On Thu, 12 Mar 2026 10:02:10 -0500
Rob Herring <robh@kernel.org> wrote:

> On Thu, Mar 05, 2026 at 02:20:48PM -0500, Hugo Villeneuve wrote:
> > From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> > 
> > Add common property that can be reused by other bindings.
> > 
> > Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> > ---
> > Note: a similar property is used by gpio-matrix-keypad.yaml:
> >   col-scan-delay-us
> > ---
> >  Documentation/devicetree/bindings/input/input.yaml | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/input/input.yaml b/Documentation/devicetree/bindings/input/input.yaml
> > index 502e0b7eb500a..14652d324e2ca 100644
> > --- a/Documentation/devicetree/bindings/input/input.yaml
> > +++ b/Documentation/devicetree/bindings/input/input.yaml
> > @@ -66,6 +66,14 @@ properties:
> >        reset automatically. Device with key pressed reset feature can specify
> >        this property.
> >  
> > +  settling-time-us:
> > +    description:
> > +      Delay, in microseconds, when activating an output line/col/row GPIO
> > +      before we can reliably read other input GPIOs that maybe affected by this
> > +      output. This can be the case for an output with a RC circuit that affects
> > +      ramp-up/down times.
> 
> Whether it is GPIOs or not depends on the implementation. Just drop 
> 'GPIO' and replace 'GPIOs' with 'lines'.

Ok, will do for V5.

Hugo

> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> 
> Rob
> 

