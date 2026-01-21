Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE1ACD2629F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 02:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uq4wlIfuNByeLrC3LqBN7O01qK5/ccL8F/U1p0aob6w=; b=iz4EzsjRcVLvjDXPTPXTylHXPT
	spReRH6yjuV5BJAKkb8035GfD4jEO2cyFGwgw4z1A9pz/icy9QrghGQnz3O3emHlau3ajnpk91QAS
	LWPLJzA7zR9RU6zfA+LXk+hjxGEhgb9ysEVAppEQbhr0HNprANLgwMlCa/8juPifsSI+1WxShpJJs
	gIJmNdcng/McLo0OSV5T+V6S6j0vz6U3ZpzxyMqVbkqQjHZOjErCKm3NFxujZ/5CAytz+vpSN3dM0
	7Wej8JYQg5cbQrvdnpUJSXAF+pqsd8iaJZc7S2Opm8miSGN9amJgyzLjTCVHhk3qibgR0zxd2qZY1
	uuXsl58Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viNb9-00000004kab-26Sz;
	Wed, 21 Jan 2026 02:05:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viNb7-00000004kZw-3Pfj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 02:05:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B008B43735;
	Wed, 21 Jan 2026 02:05:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F0CDC16AAE;
	Wed, 21 Jan 2026 02:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768961128;
	bh=ilN4HPAMj6+h3erNVdSiAUhOdMjO3QbTUbLpJ8T6sfs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XCLtweSplCNXPwSs9uPWVo9gyIfyeEJ7s8mu+QV0Tj2/1Wd7jnexVVhh3Hu4yMahp
	 w1akrc4iImGxGCzDXYr7IhAhER61UjpsABfDYwsGkop13VPaYi0bQBkbSuyPRoFXuA
	 6z/B4vE6lDcX61tskOaO/a4Js1/R0FRkgJ16nHEvTwjEYWAVK+VKMIVjVqEGMvxHIV
	 /ndUC1ozccQb1zsr/XdzHGhcBe5cu0pkcA/6LfTLcnQG23memqFFFbTU+7YTfcN7VZ
	 LuwuQDCihOxUKI24mGZPweUa3SHtpjcVvaIWs5aZsrZYS7dzP/566RlcMXCm0EPcWf
	 vF+N5h2JmRblQ==
Date: Tue, 20 Jan 2026 20:05:27 -0600
From: Rob Herring <robh@kernel.org>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	arm-scmi@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: firmware: arm,scmi: Document
 arm,no-completion-irq property
Message-ID: <20260121020527.GA1659809-robh@kernel.org>
References: <20260117010241.186685-1-marek.vasut+renesas@mailbox.org>
 <aW5hmb9tyw1Gv388@pluto>
 <aW5jwtoYCFs-Pzpk@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aW5jwtoYCFs-Pzpk@bogus>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_180529_893626_2A3A7D4C 
X-CRM114-Status: GOOD (  29.80  )
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

On Mon, Jan 19, 2026 at 05:02:58PM +0000, Sudeep Holla wrote:
> On Mon, Jan 19, 2026 at 04:53:45PM +0000, Cristian Marussi wrote:
> > On Sat, Jan 17, 2026 at 02:02:28AM +0100, Marek Vasut wrote:
> > > Document new property arm,no-completion-irq . This optional property
> > > is intended for hardware that does not generate completion interrupts
> > > and can be used to unconditionally enable forced polling mode of
> > > operation.
> > > 
> > > With this property set, such implementations which do not generate
> > > interrupts can be interacted with, until they are fixed to generate
> > > interrupts properly.
> > > 
> > > Note that, because the original base protocol exchange also requires
> > > some sort of completion mechanism, it is not possible to query SCMI
> > > itself for this property and it must be described in DT. While this
> > > does look a bit like policy, the SCMI provider is part of the
> > > hardware, hence DT.
> > > 
> > > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> > > Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> > > ---
> > > Cc: Conor Dooley <conor+dt@kernel.org>
> > > Cc: Cristian Marussi <cristian.marussi@arm.com>
> > > Cc: Florian Fainelli <florian.fainelli@broadcom.com>
> > > Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> > > Cc: Rob Herring <robh@kernel.org>
> > > Cc: Sudeep Holla <sudeep.holla@arm.com>
> > > Cc: arm-scmi@vger.kernel.org
> > > Cc: devicetree@vger.kernel.org
> > > Cc: linux-arm-kernel@lists.infradead.org
> > > Cc: linux-renesas-soc@vger.kernel.org
> > > ---
> > > V2: s@mean@&t and limit poll transport to mailbox/shmem only
> > > V3: - Reformat the commit message, expand property description to
> > >       explicitly spell out this is hardware description.
> > >     - Rename property from arm,poll-transport to arm,no-completion-irq
> > > V4: - Update first paragraph of commit message and property description
> > >     - Add RB from Rob
> > > ---
> > >  .../devicetree/bindings/firmware/arm,scmi.yaml         | 10 ++++++++++
> > >  1 file changed, 10 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> > > index be817fd9cc34b..d06cca9273c48 100644
> > > --- a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> > > +++ b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> > > @@ -146,6 +146,13 @@ properties:
> > >        this platform. If set, the value should be non-zero.
> > >      minimum: 1
> > >  
> > > +  arm,no-completion-irq:
> > > +    type: boolean
> > > +    description:
> > 
> > Shouldn't these two points have to be swapped as per Sudeep and Rob
> > suggestions ?
> > 
> >     description:
> > 	....
> >     type: boolean
> > 
> 
> I was just referring to the points covered under the `description` and not
> the order of `type` and `description`. I am not sure if there is any such
> requirement as well.

There isn't. The only preference is to be consistent within a file of 
description either first or last.

Rob

