Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3550AD6407A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 12:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K0uaio5DWquWx7p/JnotvheWRqjkbY1Ugb/LjFTwmfY=; b=MSbl8TOBQ4r+j/aerzCENKPUcT
	JWxVDOWg+RbMolIGVzo0lYWKDy7JO4tnqw1q8j6W6m42c7tPmGXB0X4F53wLutWZ6AtWzNK8m3YnK
	0C1jxzjJ4e2iB5iMxnplI2l5r+U9+xBj6bLKmYuQJmgUoyGgIb7vRXy9DksckRobpxSUhLzaIOdcz
	+YFqjxyh29Ap+QHgRDaAlYimDiN1kcVVsAVTfFXrpGfW+FXWecwTCFzvL+lV9Ur6R7+FasJx7jem+
	6tuMnzpt67XSWX4/Zwgb3cX27ckpVb69XGaNBhjNkkU8qGh+vB/d6PyzFeRNx00k92tSb0HL/6oma
	jUuEOVow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVr6J-00000006pAL-1fcd;
	Wed, 17 Dec 2025 12:57:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVr6F-00000006p9M-2LwW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 12:57:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 88675436C5;
	Wed, 17 Dec 2025 12:57:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FCE5C4CEF5;
	Wed, 17 Dec 2025 12:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765976270;
	bh=0GWSqBewhyyuHqjxSx7mEobdDpCUaq4D2Ofg1L0eEOg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NChF4twPixIMjvFN3bzM0j/aTM2OTezt3o6R9cDltERyapZnTlcVmw6OurSzWNfNj
	 93NFCULHMxoN7QZiiY9KGLWdPGDf6fCUnPrTAXH17/c+EWF6F8DbqEc3j9L5/8KY5o
	 eI2xuDcThpwA4JY6zK88hY4zb/tp7SS3NplFQoV93I9loMXTbUVRWnhLk/lb+0B2tA
	 OhtYjBBWzSLRCGJD8iwjXAQ9qrfnPKd9p4+7u08xMRCOuETU0bDWwNSgSGVt72Juub
	 KDfgBHMx9Dnm98o7AvOExHIwDTu/QX5NBT+XXSjK1DV1vmimyKOlGIdJCksyovaxkM
	 l20lpHHG8EyBA==
Date: Wed, 17 Dec 2025 06:57:47 -0600
From: Rob Herring <robh@kernel.org>
To: Nishanth Menon <nm@ti.com>
Cc: Anshul Dalal <anshuld@ti.com>, Tero Kristo <kristo@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v5] dt-bindings: arm: keystone: add boot_* mboxes to
 ti,sci
Message-ID: <20251217125747.GA689283-robh@kernel.org>
References: <20251215-k3_syscon_add_boot_mailboxes-v5-1-5a8fe567fd31@ti.com>
 <20251215135708.ij5e7jr3binzmlbf@panda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215135708.ij5e7jr3binzmlbf@panda>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_045753_051978_AD31A565 
X-CRM114-Status: GOOD (  28.23  )
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

On Mon, Dec 15, 2025 at 07:57:08AM -0600, Nishanth Menon wrote:
> On 11:38-20251215, Anshul Dalal wrote:
> > The bootloader on K3 devices makes use of mailboxes as per the ROM spec
> > which might be different than one's available to the kernel (firmware
> > spec).
> > 
> > Therefore, this patch adds the missing mailbox entries to the DT binding
> > if the matching compatible is ti,am654-sci to represent the mailboxes
> > exposed by the hardware during boot for the purpose of loading the
> > firmware. The newly added mboxes are made optional by keeping minItems
> > as 2 to remain compliant with existing device-trees.
> > 
> > Signed-off-by: Anshul Dalal <anshuld@ti.com>
> > ---
> > Changes in v5:
> > - Added commit description for the optional mailboxes
> > - Link to v4: https://lore.kernel.org/r/20251205-k3_syscon_add_boot_mailboxes-v4-1-8e216fb88941@ti.com
> > 
> > Changes in v4:
> > - Make new boot_* mboxes conditional on ti,am654-sci compatible
> > - Link to v3: https://lore.kernel.org/r/20251112-k3_syscon_add_boot_mailboxes-v3-1-66155a4236dc@ti.com
> > 
> > Changes in v3:
> > - Drop [1/2] of the last patch series
> > - Update existing example with boot_* mailboxes instead of adding a new one
> > - Link to v2: https://lore.kernel.org/r/20251112-k3_syscon_add_boot_mailboxes-v2-0-aebc1e47b391@ti.com
> > 
> > Changes in v2:
> > - Remove maxItems entry
> > - Remove RFC tag from patch (added by mistake in v1)
> > - Document the new mailboxes in mboxes instead of mbox-names
> > - Provide example with all the mailboxes set
> > - Update commit title to have "ti,sci"
> > - Split into two patches
> > - Link to v1: https://lore.kernel.org/r/20251111-k3_syscon_add_boot_mailboxes-v1-1-529a27f21076@ti.com
> > ---
> >  .../devicetree/bindings/arm/keystone/ti,sci.yaml   | 50 +++++++++++++++++++---
> >  1 file changed, 43 insertions(+), 7 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml b/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml
> > index 25a2b42105e5..d9eb2a81e539 100644
> > --- a/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml
> > +++ b/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml
> > @@ -51,15 +51,15 @@ properties:
> >      minItems: 1
> >  
> >    mbox-names:
> > +    minItems: 2
> > +    maxItems: 6
> >      description: |
> >        Specifies the mailboxes used to communicate with TI-SCI Controller
> >        made available from TI-SCI controller.
> > -    items:
> > -      - const: rx
> > -      - const: tx
> >  
> >    mboxes:
> >      minItems: 2
> > +    maxItems: 6
> >  
> >    ti,host-id:
> >      $ref: /schemas/types.yaml#/definitions/uint32
> > @@ -79,6 +79,42 @@ properties:
> >      type: object
> >      $ref: /schemas/reset/ti,sci-reset.yaml#
> >  
> > +if:
> > +  properties:
> > +    compatible:
> > +      contains:
> > +        const: ti,am654-sci
> > +then:
> > +  properties:
> > +    mbox-names:
> > +      minItems: 2
> > +      items:
> > +        - const: rx
> > +        - const: tx
> > +        - const: notify
> > +        - const: boot_rx
> > +        - const: boot_tx
> > +        - const: boot_notify
> > +    mboxes:
> > +      minItems: 2
> > +      items:
> > +        - description: RX thread
> > +        - description: TX thread
> > +        - description: Notify thread
> > +        - description: boot stage RX thread
> > +        - description: boot stage TX thread
> > +        - description: boot stage Notify thread
> > +else:
> > +  properties:
> > +    mbox-names:
> > +      items:
> > +        - const: rx
> > +        - const: tx
> > +    mboxes:
> > +      items:
> > +        - description: RX thread
> > +        - description: TX thread
> > +
> >  required:
> >    - compatible
> >    - mbox-names
> > @@ -99,11 +135,11 @@ examples:
> >  
> >    - |
> >      dmsc: system-controller@44083000 {
> > -      compatible = "ti,k2g-sci";
> > +      compatible = "ti,am654-sci";
> >        ti,host-id = <12>;
> > -      mbox-names = "rx", "tx";
> > -      mboxes = <&secure_proxy_main 11>,
> > -               <&secure_proxy_main 13>;
> > +      mbox-names = "rx", "tx", "notify", "boot_rx", "boot_tx";
> > +      mboxes= <&secure_proxy_mcu 6>, <&secure_proxy_mcu 8>,
> > +        <&secure_proxy_mcu 5>, <&secure_proxy_mcu 5>, <&secure_proxy_mcu 4>;
> >        reg-names = "debug_messages";
> >        reg = <0x44083000 0x1000>;
> 
> Please add a different example for am654, i want to make sure k2g still
> continues to be checked.
> 
> That said, AM62 series of devices do not use notification pipe for
> standard communication. So, the schema will break for those.
> 
> in summary:
> k2g: rx, tx
> am654, j721e, j721s2, j7200, j784s4, .. : rx, tx, notify, boot_rx,
> boot_tx, boot_notify
> am625, am62p ..: rx, tx, boot_rx, boot_tx, boot_notify
> 
> we will need three examples, and will need to add am62x series as one
> additional compatible.

Do we really? We have a whole tree of examples in .dts files.

Rob

