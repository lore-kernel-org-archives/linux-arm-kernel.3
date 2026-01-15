Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2D86D4661F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 19:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jFiSZXw01UttpdCib/MdD+ph2WcYlYEXg5EPzVrsx8k=; b=ZGsrDGEGXtcxd/rT2YQdiTtdre
	5H42fG7U+vGkbzezUJynjj3whXs/zI+aXZI1iFQE0sab5LKI6OAwEmeE/MVRkk4XlJ9lENrKaKXGx
	5Z8nTqdJH204W+Z2cc3T2CijQoZKHOpOXgjSoMFA6vM6PSOK1hzTyfg7EFpvv0ZP+rL3g2iHnuT5G
	99p78SKKsML0n5FTVCfT0g8RzlMEWQcaeM27Cv5E4xgvjan8nHob0mdNbIdLRfksguYPiYLGjnOSz
	MRfnDRFH1p/PvuV0iWeg96Lu+wTbflOKvpZnCLty0xa3IKcQxruSPdLwYTcLCXFO78XXMRHvSXpwG
	zT2foM2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgTTx-0000000D6Oj-3LHv;
	Thu, 15 Jan 2026 19:58:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgTTv-0000000D6OM-1RUp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 19:58:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B3EFC42A57;
	Thu, 15 Jan 2026 19:58:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CF78C16AAE;
	Thu, 15 Jan 2026 19:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768507090;
	bh=CEPptNSL/+FCLqFJSQnu0FQS/H+mROxmw2mYR4q5S3I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JEPlgZRng09trAPveVtwXvgcHKps1k0fUJ2zhoqG2dKqvdXMhqvQMl51wRaoyBLIq
	 6PaCs+NTIV2LsMOFdLWHKnqVLO8sL8OlvqIXKxyKrr+oEvuYQ64Ray+ESEQYWace4u
	 a4fVxB6EE4jb+b3CRqoTyQ/TMkvpHKeJL4piRC+YoNd+0BJkrGHKTw9D53tWz+tXtA
	 0vlbdsZwn1UNywwkuVmfbMoB1LKByrZJgnb5ACab9yDFChRekuV03d3Xg8p2rQxaXP
	 awilHQsY9PaIpmWyazw6cRhqIS0SkwUdeVCsCou7+Aki9k8Al18/g8hU4u3u/fpb47
	 KydNrFr4yLZfA==
Date: Thu, 15 Jan 2026 13:58:09 -0600
From: Rob Herring <robh@kernel.org>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, arm-scmi@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: firmware: arm,scmi: Document
 arm,no-completion-irq property
Message-ID: <20260115195809.GA1086054-robh@kernel.org>
References: <20260115004921.548282-1-marek.vasut+renesas@mailbox.org>
 <aWjWLFi6xUIn3_GQ@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aWjWLFi6xUIn3_GQ@bogus>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_115811_458715_516B3455 
X-CRM114-Status: GOOD (  30.25  )
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

On Thu, Jan 15, 2026 at 11:57:32AM +0000, Sudeep Holla wrote:
> On Thu, Jan 15, 2026 at 01:48:56AM +0100, Marek Vasut wrote:
> > Document new property arm,no-completion-irq, which sets all SCMI
> > operation into poll mode. This is meant to work around uncooperative
> > SCP implementations, which do not generate completion interrupts.
> > This applies primarily on mbox shmem based implementations.
> > 
> > With this property set, such implementations which do not generate
> > interrupts can be interacted with, until they are fixed to generate
> > interrupts properly.
> > 
> > Note that, because the original base protocol exchange also requires
> > some sort of completion mechanism, it is not possible to query SCMI
> > itself for this property and it must be described in DT. While this
> > does look a bit like policy, the SCMI provider is part of the
> > hardware, hence DT.
> > 
> > Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> > ---
> > Cc: Conor Dooley <conor+dt@kernel.org>
> > Cc: Cristian Marussi <cristian.marussi@arm.com>
> > Cc: Florian Fainelli <florian.fainelli@broadcom.com>
> > Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> > Cc: Rob Herring <robh@kernel.org>
> > Cc: Sudeep Holla <sudeep.holla@arm.com>
> > Cc: arm-scmi@vger.kernel.org
> > Cc: devicetree@vger.kernel.org
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linux-renesas-soc@vger.kernel.org
> > ---
> > V2: s@mean@&t and limit poll transport to mailbox/shmem only
> > V3: - Reformat the commit message, expand property description to
> >       explicitly spell out this is hardware description.
> >     - Rename property from arm,poll-transport to arm,no-completion-irq
> > ---
> >  .../devicetree/bindings/firmware/arm,scmi.yaml        | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> > index be817fd9cc34b..46d9a0a9a0e58 100644
> > --- a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> > +++ b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> > @@ -146,6 +146,14 @@ properties:
> >        this platform. If set, the value should be non-zero.
> >      minimum: 1
> >  
> > +  arm,no-completion-irq:
> > +    type: boolean
> > +    description:
> > +      An optional property which unconditionally forces polling in all transports,
> > +      meant for hardware which does not generate completion interrupts. This is
> > +      mainly meant to work around uncooperative SCP or SCP firmware, which does
> > +      not generate completion interrupts.
> > +
> 
> I would swap the order of the above two points.
> 
> “This optional property is intended for hardware that does not generate
> completion interrupts and can be used to unconditionally enable forced polling
> mode of operation.”
> 
> You need to update the commit message accordingly. We do not want to indicate
> how this property should be used, as that is left to the implementation. The
> emphasis should be on what this property indicates to its users.
> 
> Please update only if DT maintainers are also in agreement. I have just
> expressed my opinion. IIUC, it is aligned to standard DT binding rules but
> I may be wrong.

Makes sense to me.

With Sudeep's suggestion:

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Rob

