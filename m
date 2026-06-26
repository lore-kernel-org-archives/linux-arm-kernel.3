Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07F7ECDE008
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 09:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hRt7HP+BkBv7BWVpHVO+yr5VlZet2COkROxgO+S1Xww=; b=rfiBieK8WUZcdMIeveXo9rhnzC
	MI5N6kE/LWB7T67SoaOH1jXSa6EgKePXFsAORakv10jjcmpKxZfjzxZg6zl9ysWCq6lmMfXPszcSr
	VH21gSQB4duZ3/7ZoVJcCAtxH5FbC1npnUeEgNRkFAZGYHlgb8YoJWDYYjzOmxMbLLxYkU7cE4hQM
	MMCTUVyLhrq8IMiH9Ha1Lb0WlsL3/upD7dsS4pe8cCX6mjUG3BplKHlw2ntd2Rca6UNu7CcidkP29
	+usJSiNHANk62TxkBCNTu1av4jhEJwHSGUW9d47fW6OoQppq3suEdHwT2CYO+BV4g4D6uZRsjDhZf
	FXXNQ3MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd2wJ-0000000Azf9-3ZgD;
	Fri, 26 Jun 2026 09:33:35 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd2wH-0000000AzeM-3ILx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 09:33:35 +0000
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.101.182])
	by APP-01 (Coremail) with SMTP id qwCowAA3189mRz5q6z1gAw--.34940S2;
	Fri, 26 Jun 2026 17:33:27 +0800 (CST)
Message-ID: <9456bde5059bea3aac1ed64355e3f017dd9bd3e5.camel@iscas.ac.cn>
Subject: Re: [PATCH v5 1/7] dt-bindings: display: verisilicon,dc: generalize
 for single-output variants
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Conor Dooley <conor@kernel.org>, Joey Lu <a0987203069@gmail.com>, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 	airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, ychuang3@nuvoton.com, schung@nuvoton.com,
 yclu4@nuvoton.com, 	dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Fri, 26 Jun 2026 17:33:26 +0800
In-Reply-To: <20260626-everybody-epilogue-8fb298a54981@wendy>
References: <20260625094449.708386-1-a0987203069@gmail.com>
	 <20260625094449.708386-2-a0987203069@gmail.com>
	 <20260625-bobbing-annotate-d1c4d6874ee2@spud>
	 <e3fe23ddbc504879bd797bbaa595d3653fa139ff.camel@iscas.ac.cn>
	 <20260626-astrology-mural-853d3860e048@wendy>
	 <c0731801729713d35f97bec40ebc21cef31b72b5.camel@iscas.ac.cn>
	 <20260626-everybody-epilogue-8fb298a54981@wendy>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
MIME-Version: 1.0
X-CM-TRANSID: qwCowAA3189mRz5q6z1gAw--.34940S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXFyUAFWUJryDGFyxJF4DCFg_yoWrJw4UpF
	ykJFWUJrWkJr1rtr1UKw1UGF9Fyr1DJ3WDXr1kXFy8JF4qvr1jgr1Ygr1q9ryxXr48Gr1j
	qr1jqry3Zr13AFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvmb7Iv0xC_KF4lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l
	c7CjxVAaw2AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnU
	UI43ZEXa7IUn-o7tUUUUU==
X-Originating-IP: [112.94.101.182]
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_023334_195986_1460B6BA 
X-CRM114-Status: GOOD (  34.93  )
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

=E5=9C=A8 2026-06-26=E4=BA=94=E7=9A=84 10:26 +0100=EF=BC=8CConor Dooley=E5=
=86=99=E9=81=93=EF=BC=9A
> On Fri, Jun 26, 2026 at 05:00:35PM +0800, Icenowy Zheng wrote:
> > =E5=9C=A8 2026-06-26=E4=BA=94=E7=9A=84 08:19 +0100=EF=BC=8CConor Dooley=
=E5=86=99=E9=81=93=EF=BC=9A
> > > On Fri, Jun 26, 2026 at 01:27:21PM +0800, Icenowy Zheng wrote:
> > > > =E5=9C=A8 2026-06-25=E5=9B=9B=E7=9A=84 17:33 +0100=EF=BC=8CConor Do=
oley=E5=86=99=E9=81=93=EF=BC=9A
> > > > > On Thu, Jun 25, 2026 at 05:44:43PM +0800, Joey Lu wrote:
> > > > > > +allOf:
> > > > > > +=C2=A0 - if:
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 properties:
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible:
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 contain=
s:
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 const: thead,th1520-dc8200
> > > > > > +=C2=A0=C2=A0=C2=A0 then:
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 properties:
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clocks:
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 minItem=
s: 5
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 maxItem=
s: 5
> > > > > > +
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clock-names:
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 minItem=
s: 5
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 maxItem=
s: 5
> > > > >=20
> > > > > All the maxItems here repeat the maximum constraint and do
> > > > > nothing.
> > > > >=20
> > > > > Since you didn't change the minimum constraint at the top
> > > > > level,
> > > > > your
> > > > > minItems also do nothing.
> > > > >=20
> > > > > > +
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 resets:
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 minItem=
s: 3
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 maxItem=
s: 3
> > > > > > +
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reset-names:
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 minItem=
s: 3
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 maxItem=
s: 3
> > > > > > +
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 required:
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - resets
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - reset-names
> > > > >=20
> > > > > Both conditional sections have this, but the original binding
> > > > > doesn't
> > > > > require these for the thead device. This is a functional
> > > > > change
> > > > > therefore and shouldn't be in a patch calling itself
> > > > > "generalise
> > > > > for
> > > > > single ended variants".
> > > >=20
> > > > Well yes they're required.
> > > >=20
> > > > Should I send a patch adding the `thead,th1520-dc8200` part of
> > > > the
> > > > schema?
> > >=20
> > > If you mean the code above, no. Adding a conditional section when
> > > there's only that compatible doesn't make sense.
> > >=20
> > > What you could do is just add it at the top level though, which
> > > would
> > > also benefit this patch since it'd not have to be conditionally
> > > added
> > > for the new nuvoton device.
> > > Just note in your commit message about what the ABI impact of the
> > > change
> > > to required properties is (effectively nothing because it's
> > > optional
> > > in
> > > the driver and the only user has the properties).
> >=20
> > Okay, I will craft such a patch and send it.
> >=20
> > >=20
> > > > > > +
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 resets:
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 minItem=
s: 1
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 maxItem=
s: 1
> > > > > > +
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reset-names:
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 items:
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 - const: core
> > > > >=20
> > > > > This is just maxItems: 1.
> > > >=20
> > > > Well the implicit rules of DT binding schemas are quite
> > > > weird...
> > >=20
> > > I don't think it is that strange, as the binding has
> > > =C2=A0 reset-names:
> > > =C2=A0=C2=A0=C2=A0 items:
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: core
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: axi
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: ahb
> >=20
> > Ah does the list constraint the order of items? If it constrains
> > the
>=20
> It does, yes.
> Alternatively, using an enum permits free ordering.

Ah in this case this should be converted to an enum, I think.

Should I send a patch for converting it?

Thanks,
Icenowy

>=20
> > order, it partly breaks the intention of having names; if it does
> > not
> > constrain the order, it needs to be clarified that the required 1
> > reset
> > is core instead of the other two.
>=20
> Given the discussion we're having on the clocks, I wonder if this is
> also an oversimplification and the IP has three resets inputs hooked
> up
> to one output of the reset controller (or 3 outputs controlled by one
> bit..).


