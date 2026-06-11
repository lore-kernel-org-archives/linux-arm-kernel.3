Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 247D6CD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 04:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fs2D/dmY6qG5eFk5keXxNf0HlHzBHntwLDPmYvPj8xA=; b=hNO7e+U8zg0elFGiJGKvh6KhOc
	9hzMUMCW/mLDnOCNvIi5E5Eo/E1Omvawsst75sXTXHWtIKozOxZHUklmmnuJ02O7i+RSiJSUJbzKZ
	r7kAtok5diASctQFxnL8R4c91s3ac0l+KWBy5Osgl62tqHsr7cfFxHE9jWJ6GZW5KZ57i7OmLh+kQ
	czghAXIZRSPOkpUV+Cso/HLyRVsSej/k/Cxa8F0TEih/vhtuC1hVydMQFz3IAZtf9UjuXkNecvYlT
	3Bzr9AUUnY1r6JnBegumXrmBsVfYaJBQl1dt3XQtWsZ9iP4njYjBZ0H8Fp2Aii7YZv4NtOEk1DU7D
	1XwoQRtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXWgk-00000008eoY-392f;
	Thu, 11 Jun 2026 04:06:43 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXWgi-00000008eoC-12TM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 04:06:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1781150794;
	bh=fs2D/dmY6qG5eFk5keXxNf0HlHzBHntwLDPmYvPj8xA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=h5T9HOKS7M9O1foYkec/z47r6o6cIhERYKZtRFocOM6fumMx01P4miGrprmiV2Qb/
	 xhYspqxpGkBpqRCPopb7HhMu4MoxDRO4y3TArJgafrGawwxg+r+LvQPhzS1uoiWgUo
	 sixF/Ww0INydYwfA+rSm828vbrRIhZHOiBhU3GPI0wjQOfQPOTCdXIvjtKUYB4E5Eb
	 JhwiYxvKlrOSHe3FohbDfZxBVPbnO7Hg6aLR1FA2IeWqPVFWRZYSej4ODOlKQvnw2e
	 MW8fX+uej6ProOA7Lpn1bTkRQ5oLrU/patSOT7Mz340qjQpfLF8TOn3uHsorLbKMUJ
	 MkuYWc7diWwZA==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id CB59160A0C;
	Thu, 11 Jun 2026 12:06:32 +0800 (AWST)
Message-ID: <5543c67f4eb6a206e524c6a590e13bbb1756b0df.camel@codeconstruct.com.au>
Subject: Re: [PATCH v3 0/9] ARM: dts: aspeed: anacapa: restructure
 devicetree for development-phase
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: u8813345@gmail.com, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	 <joel@jms.id.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	colin.huang2@amd.com, Carl Lee <carl.lee@amd.com>, Rex Fu
 <rex.fu.amd@gmail.com>,  Andy Chung <Andy.Chung@amd.com>, Peter Shen
 <peter.shen@amd.com>
Date: Thu, 11 Jun 2026 13:36:32 +0930
In-Reply-To: <20260602-anacapa-devlop-phase-devicetree-v3-0-7c93c5df8d9b@gmail.com>
References: <20260602-anacapa-devlop-phase-devicetree-v3-0-7c93c5df8d9b@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_210640_503555_69E18672 
X-CRM114-Status: GOOD (  11.00  )
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

Hi Colin,

On Tue, 2026-06-02 at 21:24 +0800, Colin Huang via B4 Relay wrote:


...

>=20
> Colin Huang (5):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ARM: dts: aspeed: anacapa: add EVT1 device=
tree and point wrapper to it
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ARM: dts: aspeed: anacapa: add EVT2 device=
tree inheriting EVT1
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ARM: dts: aspeed: anacapa: add DVT devicet=
ree inheriting EVT2

So my concern with these three are that none of the EVT1, EVT2 or DVT
devicetrees correspond with the current Anacapa devicetree. All of them
have variations on the configured GPIOs. Some GPIO lines are renamed
while others are added.

Adding them is (eventually) fine, but I'd rather not do that while
we're shuffling the devicetree sources around.

Renaming them to accommodate changes in the one devicetree is what
we're trying to escape here, so having renames hide in the rest of the
shuffling is definitely problematic.

For example:

   -""                    =20
   +"L_FNIC_FLT"     =20
    "FM_CPU0_SYS_RESET_N"
   -""                                                                     =
                                                                           =
           =20
   +"L_BNIC0_FLT"
    "CPU0_KBRST_N"
   -""
   +"L_BNIC1_FLT"
    "FM_CPU0_PROCHOT_trigger_N"
   -""
   +"L_BNIC2_FLT"
    "FM_CLR_CMOS_R_P0"
   -""
   +"L_BNIC3_FLT"
    "Force_I3C_SEL"
   -""
   +"L_RTM_SW_FLT"
    "SYSTEM_Force_Run_AC_Cycle"
    ""
    ""
   @@ -20,55 +20,57 @@
    "FM_SCM_JTAG_MUX_SEL"
    "Channel2_leakage_Manifold1"
    "FM_BRIDGE_JTAG_MUX_SEL"
   -"Channel3_leakage"
   +"Channel5_leakage_present_EAM1"

I've pasted a script below that helps compare the various dts files.
You can use it to generate the reference from the current aspeed-bmc-
facebook-anacapa.dts, then generate the comparison files from the newly
introduced dts files.

To reiterate, I expect the shuffling of the dts files to result in at
least one of the variants producing the same devicetree as the current
aspeed-bmc-facebook-anacapa.dts.

Andrew

   #!/usr/bin/bash
  =20
   set -x
  =20
   : ${ANACAPA_VARIANT:=3D""}
   : ${ANACAPA_REFERENCE:=3D"arch/arm/boot/dts/aspeed/.aspeed-bmc-facebook-=
anacapa.dtb.rt.dts.tmp"}
  =20
   if [ -z "$ANACAPA_REFERENCE" ] || ! [ -e "$ANACAPA_REFERENCE" ]
   then
     gcc -E -Wp,-MMD,arch/arm/boot/dts/aspeed/.aspeed-bmc-facebook-anacapa.=
dtb.d.pre.tmp -nostdinc -I ../scripts/dtc/include-prefixes -undef -D__DTS__=
 -x assembler-with-cpp -o arch/arm/boot/dts/aspeed/.aspeed-bmc-facebook-ana=
capa.dtb.dts.tmp ../arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dt=
s ; ./scripts/dtc/dtc -o arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anaca=
pa.dtb -b 0 -i../arch/arm/boot/dts/aspeed/ -i../scripts/dtc/include-prefixe=
s -Wno-unique_unit_address -Wno-unit_address_vs_reg -Wno-avoid_unnecessary_=
addr_size -Wno-alias_paths -Wno-interrupt_map -Wno-simple_bus_reg   -d arch=
/arm/boot/dts/aspeed/.aspeed-bmc-facebook-anacapa.dtb.d.dtc.tmp arch/arm/bo=
ot/dts/aspeed/.aspeed-bmc-facebook-anacapa.dtb.dts.tmp ; cat arch/arm/boot/=
dts/aspeed/.aspeed-bmc-facebook-anacapa.dtb.d.pre.tmp arch/arm/boot/dts/asp=
eed/.aspeed-bmc-facebook-anacapa.dtb.d.dtc.tmp > arch/arm/boot/dts/aspeed/.=
aspeed-bmc-facebook-anacapa.dtb.d
     dtc -I dts -O dts -o arch/arm/boot/dts/aspeed/.aspeed-bmc-facebook-ana=
capa.dtb.rt.dts.tmp arch/arm/boot/dts/aspeed/.aspeed-bmc-facebook-anacapa.d=
tb.dts.tmp
     ANACAPA_REFERENCE=3Darch/arm/boot/dts/aspeed/.aspeed-bmc-facebook-anac=
apa.dtb.rt.dts.tmp
   fi
  =20
   if [ -n "$ANACAPA_VARIANT" ]
   then
     gcc -E -Wp,-MMD,arch/arm/boot/dts/aspeed/.aspeed-bmc-facebook-anacapa-=
${ANACAPA_VARIANT}.dtb.d.pre.tmp -nostdinc -I ../scripts/dtc/include-prefix=
es -undef -D__DTS__ -x assembler-with-cpp -o arch/arm/boot/dts/aspeed/.aspe=
ed-bmc-facebook-anacapa-${ANACAPA_VARIANT}.dtb.dts.tmp ../arch/arm/boot/dts=
/aspeed/aspeed-bmc-facebook-anacapa-${ANACAPA_VARIANT}.dts ; ./scripts/dtc/=
dtc -o arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-${ANACAPA_VARIA=
NT}.dtb -b 0 -i../arch/arm/boot/dts/aspeed/ -i../scripts/dtc/include-prefix=
es -Wno-unique_unit_address -Wno-unit_address_vs_reg -Wno-avoid_unnecessary=
_addr_size -Wno-alias_paths -Wno-interrupt_map -Wno-simple_bus_reg   -d arc=
h/arm/boot/dts/aspeed/.aspeed-bmc-facebook-anacapa-${ANACAPA_VARIANT}.dtb.d=
.dtc.tmp arch/arm/boot/dts/aspeed/.aspeed-bmc-facebook-anacapa-${ANACAPA_VA=
RIANT}.dtb.dts.tmp ; cat arch/arm/boot/dts/aspeed/.aspeed-bmc-facebook-anac=
apa-${ANACAPA_VARIANT}.dtb.d.pre.tmp arch/arm/boot/dts/aspeed/.aspeed-bmc-f=
acebook-anacapa-${ANACAPA_VARIANT}.dtb.d.dtc.tmp > arch/arm/boot/dts/aspeed=
/.aspeed-bmc-facebook-anacapa-${ANACAPA_VARIANT}.dtb.d
     dtc -I dts -O dts -o arch/arm/boot/dts/aspeed/.aspeed-bmc-facebook-ana=
capa-${ANACAPA_VARIANT}.dtb.rt.dts.tmp arch/arm/boot/dts/aspeed/.aspeed-bmc=
-facebook-anacapa-${ANACAPA_VARIANT}.dtb.dts.tmp
     diff -u "$ANACAPA_REFERENCE" arch/arm/boot/dts/aspeed/.aspeed-bmc-face=
book-anacapa-${ANACAPA_VARIANT}.dtb.rt.dts.tmp | tee ${ANACAPA_VARIANT}-{re=
move,add}
     grep '^-[^-]' ${ANACAPA_VARIANT}-remove | grep gpio-line-names | sed -=
E 's/.+gpio-line-names =3D //' | tr ',' '\n' | sed -E 's/^ //' | sponge ${A=
NACAPA_VARIANT}-remove
     grep '^[+][^+]' ${ANACAPA_VARIANT}-add | grep gpio-line-names | sed -E=
 's/.+gpio-line-names =3D //' | tr ',' '\n' | sed -E 's/^ //' | sponge ${AN=
ACAPA_VARIANT}-add
     diff -u ${ANACAPA_VARIANT}-{remove,add}
   fi


