Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 921B1CA600D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 13:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IaKcoXA7uPRlCi3Ecfqo5f4Dhh72RmQqlLLkldNTjso=; b=2BpryQmhoZbXGOR6PFotHhSgMv
	I3q8e0Y8Ob6zP778XNMilOAojgUvKfzzeDZbcJzGyJfJshCN2VNVVe1eeCTdNkXfZy0qSS2VmA9Ws
	G3dWtL7+XqBHiB76hg7knKNy/4TUQYzIq/KJW7GbCPo3C5XUNPP/lSa0jechSfK0fi8KxyAoEHSWX
	/g6i5oYC7nG25hs0KQ5UPJN+CHvtDvy0pD7wYZHBLsMkJh2i/hHSBEv72832x314Xyk1kTxkkfI3a
	ty/0O0xuBlrHLtyTqYZKGjjHCNHKW8IwSwiMU1Ohzz9jnMgIhukJUOht49yItnXbPFDrZRz36Gr0J
	enDGpDBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEo61-00000004SIM-3JhM;
	Thu, 08 Oct 2026 13:23:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEo60-00000004SIB-0lza;
	Thu, 08 Oct 2026 13:23:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 91FD641AE2;
	Thu,  8 Oct 2026 13:23:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46D4A1F000FF;
	Thu,  8 Oct 2026 13:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791465819;
	bh=IaKcoXA7uPRlCi3Ecfqo5f4Dhh72RmQqlLLkldNTjso=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RHuYqDuIrL8iQD4la9YrcwktXJhQQprAokPtDnmpMPNXPSHY5ca67kKZlHHgGJNmY
	 1LKSOPlvn/6Hat3YzJR7XItq2QBsVqvy/XpQDSu80+/0e+lofThNQA33zlQU7CjAui
	 rLy8HMDwe4VivcAy96svKc6V6OuGl6FQRIXjQdy6YUyFiRsti6srnM64BQrnM1N43w
	 wP0zR33+IDK3szDf93BKvHeOuX0Bj5hKJC3msHbPfrp20v+uxPGMDW0V3z2192zpsA
	 J2YBLba1L6ed+gllwGUCJFI/vaL3NOlJEsBkF6kP5FtCm95yOweNJBbC30xDuE5x+s
	 jPVKHcBdb+6zA==
Date: Thu, 8 Oct 2026 08:23:38 -0500
From: Rob Herring <robh@kernel.org>
To: Alexey Charkov <alchark@flipper.net>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Sebastian Reichel <sre@kernel.org>,
	Shawn Lin <shawn.lin@rock-chips.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v3 2/5] dt-bindings: power: reset: syscon-reboot-mode:
 allow supplies
Message-ID: <20261008132338.GA183998-robh@kernel.org>
References: <20261006-b4-rk3576-reboot-mode-v3-0-6edba064693b@flipper.net>
 <20261006-b4-rk3576-reboot-mode-v3-2-6edba064693b@flipper.net>
 <20261007212432.GA381404-robh@kernel.org>
 <CAKTNdwFo03jFGMeJQpxXp1yOX+cG+6BZOYf1eGGZTdZWAFdz5A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKTNdwFo03jFGMeJQpxXp1yOX+cG+6BZOYf1eGGZTdZWAFdz5A@mail.gmail.com>
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

On Thu, Oct 08, 2026 at 01:58:55AM +0400, Alexey Charkov wrote:
> On Thu, Oct 8, 2026 at 1:24 AM Rob Herring <robh@kernel.org> wrote:
> >
> > On Tue, Oct 06, 2026 at 08:02:40PM +0400, Alexey Charkov wrote:
> > > Whatever program that acts on a reboot mode runs before a full OS, so it
> > > may lack the capability to enable the regulators it depends on, and a
> > > reset that preserves the mode register generally leaves the regulators as
> > > the previously running system left them.
> > >
> > > Allow a reboot mode node to name such supplies, so that they can be
> > > turned on while the mode is being requested.
> > >
> > > Signed-off-by: Alexey Charkov <alchark@flipper.net>
> > > ---
> > >  .../devicetree/bindings/power/reset/syscon-reboot-mode.yaml       | 8 ++++++++
> > >  1 file changed, 8 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/power/reset/syscon-reboot-mode.yaml b/Documentation/devicetree/bindings/power/reset/syscon-reboot-mode.yaml
> > > index 79ffc78b23ea..5ed70c87269e 100644
> > > --- a/Documentation/devicetree/bindings/power/reset/syscon-reboot-mode.yaml
> > > +++ b/Documentation/devicetree/bindings/power/reset/syscon-reboot-mode.yaml
> > > @@ -36,6 +36,14 @@ patternProperties:
> > >    "^mode-.*$":
> > >      maxItems: 1
> > >
> > > +  "^[a-z0-9]+(-[a-z0-9]+)*-supply$":
> > > +    description:
> > > +      Supply that has to be powered for whatever program acts on the mode.
> > > +      That could be a boot ROM with no access to regulators, and a warm reset
> > > +      leaves them as the previously running system left them and not necessarily
> > > +      what their expected out-of-reboot state is. Any supply described here is
> > > +      enabled when a mode is requested, and stays enabled.
> >
> > Sorry, but no. If we allow this, then what next? clocks? power-domains?
> > GPIO lines? The list is endless. Maybe if a not generic binding is used,
> > but still pretty much pure configuration.
> 
> These are the resources which are required to handle the reboot mode
> request, they are not exactly configuration. There is a limited and
> hardware defined number of IP blocks which need to be powered for the
> reboot mode request to complete successfully. In my case (Rockchip
> RK3576), these are the IPs that need to be made aware of the trained
> DDR memory parameters: if they are unpowered _at warm reboot_ then the
> boot process stalls immediately with an exception (cold reboot is
> handled by the power-on default state of the PMIC).

If you need certain h/w blocks, then you should list them and then you 
can get whatever resources they have. That's assuming we were to go down 
this path, not an endorsement for doing this.

> I see that this may be abused to hack around what should be a
> bootloader's job, so it would be great to find a way to explicitly
> limit the scope of these - though I couldn't think of one yet. Any
> suggestions would be much appreciated.

Maybe the boot phase stuff could work here?

Rob

