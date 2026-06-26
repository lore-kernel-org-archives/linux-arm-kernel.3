Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CED4CDE008
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 09:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Lv/xycF/BeAYW6b9Q5Dt2xc6YcWsiS5nJX8Z7401wQ=; b=vvwQzej+KER1p1gf2JbmXIbk21
	Xnam0Pbm0SXjbb3XBVAgRm/Vpg+NgxZnpzvq3DTb0pBJC6vbOJ1ye9TYT/4xKH3YlVmiscEVMrtBV
	UQUW4SlAbGBulFH9WQ8+vNz1o5D/cxoJ2mA6Oo2sN5+GEraZwClhUgi/N7Q5fSCLvuGSDthfee+av
	kRPP9SeSV5QYP8Vcm2zLh83Jr258MgldiQldWftV/kaBu8nuWN67AtRcoXvdArbwudTdfFxYoc3vI
	EV7vi2d6dP3uVbS1M4k+DnXvAM+JFfQCKGtQcfek6cI2TZxOXIRxgCiiOkrAVgcLneT2sn5WUUdgn
	6Gf5sdpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd2Ys-0000000AwUC-3mMX;
	Fri, 26 Jun 2026 09:09:22 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd2Yp-0000000AwTm-409L
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 09:09:21 +0000
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.101.182])
	by APP-01 (Coremail) with SMTP id qwCowADnjNW4QT5qNX5fAw--.14227S2;
	Fri, 26 Jun 2026 17:09:13 +0800 (CST)
Message-ID: <996c3d442e92e7f908fb3a32973805dd2d2680d7.camel@iscas.ac.cn>
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
Date: Fri, 26 Jun 2026 17:09:12 +0800
In-Reply-To: <20260626-agreement-express-b16c71315f7b@wendy>
References: <20260625094449.708386-1-a0987203069@gmail.com>
	 <20260625094449.708386-2-a0987203069@gmail.com>
	 <20260625-bobbing-annotate-d1c4d6874ee2@spud>
	 <20260626-zit-amuck-e743e58d2e15@wendy>
	 <84b93c496fabdeee05d2f962a1b764fdbfaacdb7.camel@iscas.ac.cn>
	 <20260626-agreement-express-b16c71315f7b@wendy>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
MIME-Version: 1.0
X-CM-TRANSID: qwCowADnjNW4QT5qNX5fAw--.14227S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXF4DCrWktr1UAr1rKrWfXwb_yoW5Kw1fpF
	yrJFW5ta4DJr1rXr1kKw18JFyvkw1xJ3WDXr95XFyxAFn0vr10gF12qF909F9rXrs7C3Zr
	Xr4jqryxZryYyFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvlb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwV
	C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7
	MxkF7I0En4kS14v26r4a6rW5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
	4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
	67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
	x0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2
	z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvj
	DU0xZFpf9x07b4oGdUUUUU=
X-Originating-IP: [112.94.101.182]
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_020920_396469_2AEB6D74 
X-CRM114-Status: GOOD (  34.70  )
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

=E5=9C=A8 2026-06-26=E4=BA=94=E7=9A=84 09:57 +0100=EF=BC=8CConor Dooley=E5=
=86=99=E9=81=93=EF=BC=9A
> On Fri, Jun 26, 2026 at 03:58:14PM +0800, Icenowy Zheng wrote:
> > =E5=9C=A8 2026-06-26=E4=BA=94=E7=9A=84 08:22 +0100=EF=BC=8CConor Dooley=
=E5=86=99=E9=81=93=EF=BC=9A
> > > On Thu, Jun 25, 2026 at 05:33:37PM +0100, Conor Dooley wrote:
> > > > On Thu, Jun 25, 2026 at 05:44:43PM +0800, Joey Lu wrote:
> > > > > +
> > > > > +=C2=A0 - if:
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 properties:
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible:
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 contains:
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 const: nuvoton,ma35d1-dcu
> > > > > +=C2=A0=C2=A0=C2=A0 then:
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 properties:
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clocks:
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 minItems:=
 2
> > > >=20
> > > > Anything that updates the minimum constraint should be done at
> > > > the
> > > > top
> > > > level of this schema. The conditional section should then
> > > > tighten
> > > > the
> > > > constraint, in this case that means only having maxItems.
> > > >=20
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 maxItems:=
 2
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clock-names:
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 items:
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 - const: core
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 - const: pix0
> > > >=20
> > > > Does this even work when the top level schema thinks clock 2
> > > > should
> > > > be
> > > > called axi?
> > >=20
> > > Additionally here, only have core and pix0 seems like it might be
> > > an
> > > oversimplification. I doubt removing the second output port means
> > > that
> > > the axi and ahb clocks are no longer needed.
> > > Is it the case that your device supplies the same clock to core,
> > > ahb
> > > and
> > > axi? If so, then you should fill those clocks in in your
> > > devicetree
> > > and
> > > this can just constrain the number of clocks/clock-names to 4.
> >=20
> > The clock controller of that SoC is quite weird -- it has only a
> > single
> > gate bit, but controlling 3 clock gates. All core, ahb and axi
> > clocks
> > have gates controlled by this single bit, so it's why currently
> > it's
> > modelled as only core clock supplied.
>=20
> Yeah, then what's in the binding is definitely wrong.
> Even if the same clock was provided to all clock inputs in the IP,
> all
> individual clock should be listed in the devicetree - although it
> will
> look a little silly to see clocks =3D <&foo 2>, <&foo 2>, <&foo 2>,
> <&foo 2>;
> In this case, 3 clocks controlled by 1 gate bit is an implementation
> detail
> of the SoC's clocking hardware, and not relevant to how the dc
> instance
> should be described.
>=20
> > Well it might be worthful to supply the bus clock before the gate
> > as
> > ahb/axi, especially axi, because both the AXI clock and the core
> > clock
> > constraints the maximum pixel clock.
>=20
> Right. And looking at patch 4/7, and the wording:
> > The Nuvoton MA35D1 SoC integrates a DCUltraLite display controller
> > whose
> > AXI and AHB bus clocks share a single gate enable bit with the
> > display
> > core clock, so the clock driver does not expose them separately.
> > This
> > patch makes the axi and ahb clocks optional in the probe.
>=20
> It sounds like there's probably some issues with how things are
> modelled
> clock wise in this device, unless this is not an accurate statement
> and
> there's actually one clock provided to all three inputs. If they're
> distinct clocks, with different rates, only having one exposed has a
> lot
> of potential to be problematic!

Yes, I agree with this, they're different clocks according to the
manual.

I added the clk people to the CC list in a reply of the previous
revision, but they didn't react yet. I don't know how to represent
multiple clock gates sharing a single control bit in the clock
framework...

Maybe just supplying the ungated AXI/AHB clocks here, and let the core
clock manage the gate?

Thanks,
Icenowy


