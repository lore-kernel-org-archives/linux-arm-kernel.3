Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24D7DCEFD03
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 20:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bzx+FeQLP1CozGKkxSfHQ0RHL5a9LlFA+PQ5IhvgPzM=; b=DoGEoHR5aic7b/QzrmBx/tQs6z
	KmlacTCxyJnNCZGfc1NpiIPhzXow90NozQ1R0TDM3Y1066wEZ5QikFZ+Jzw2ezJdWavJTf7/6FjCd
	HHofW4eKBwylAN0SA0Z21wJr3uHw8/OtwzorNxLFteCOFMbOuR4egDX4elpjIrorR15620AQ6hUIH
	w0Uh8XdulD8A5GlnQ7LxpQmVrWzb8sQJ/Z2a2+P/8QOEZcTw6Z7WeJHNo7r5ZIClEmRloKu68fk5a
	PkbnBXDw0e/SY0cDV7VjBYpBDEjflGoTebphHXzT7IBt7pcK3T2QOqICTwgLurekEoPaCoL4JRk3W
	N0jsTcIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdDf5-0000000DogX-2uls;
	Tue, 06 Jan 2026 20:28:15 +0000
Received: from mail-10696.protonmail.ch ([79.135.106.96])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdDf3-0000000DogB-031i
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 20:28:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1767731286; x=1767990486;
	bh=bzx+FeQLP1CozGKkxSfHQ0RHL5a9LlFA+PQ5IhvgPzM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=b8nUmNKK8eC08c8p7xYjerFmooqmeTeyK3qyy1dpFk2ZU067Lla70b5bvin5Do1hr
	 BGAisv64EtHVB3saOB+xzmRpucyshRjjn1fy2CQhIOQVXrpDw0GE9xjDkd5piSs2yC
	 5HAYPCb65jQB/upkUfk7udPb7lqjHBufmNuASVfWA07yAvJTU/BMfVbYw2aJXFeEVo
	 y+0xFaDrnax/BE2D+APInJYBid2Q1xYvS9uVXKYnUpxDfb5BAVkbpyAm97Qx9/rs4P
	 9tQ+evI6MFFuAvGTjtTtWpIfVbh/otFMZxD7mt+b7iSXDGQjpPfvWyAt/tkS/S81+Y
	 Wo1Ji0/S1pxUg==
Date: Tue, 06 Jan 2026 20:28:03 +0000
To: Michal Simek <michal.simek@amd.com>
From: kylebonnici <kylebonnici@proton.me>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>, Peter Korsgaard <peter@korsgaard.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kyle Bonnici <kylebonnici@hotmail.com>
Subject: Re: [PATCH] Coding Style: Format arch/arm/boot/dts/xilinx
Message-ID: <zUWWtNtMhwr9_g1C6mdaGPvyls1-H_tCHfdMuWC35MYUzv88iiaEzS9RTUiucp4QU_RhvuTGiNcl_GV684b6h4-DmdnKPeCLGKB1RHEG6G8=@proton.me>
In-Reply-To: <5262fa29-4094-4c5d-be3f-2c73ee322ef6@amd.com>
References: <20251218125034.248-1-kylebonnici@proton.me> <5262fa29-4094-4c5d-be3f-2c73ee322ef6@amd.com>
Feedback-ID: 172426429:user:proton
X-Pm-Message-ID: 7e4446d1845f876e068d600ec97b45970c81f110
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_122813_823226_5796F673 
X-CRM114-Status: GOOD (  30.60  )
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

Hi,

Thanks for the feedback.

with regard to subject I am not sure in what subsystem file formatting woul=
d go (especially if we run it on even more files and more systems are modif=
ied) Your guidance would be appreciated.

With regard to improving the line wrapping, can you share some examples so =
that I can start looking on improving this?

To run on more files I will wait for feedback from Rob, Krzysztof and Conor=
.

Regards,
Kyle


Sent with Proton Mail secure email.

On Tuesday, January 6th, 2026 at 12:54 PM, Michal Simek <michal.simek@amd.c=
om> wrote:

>
>
> Hi,
>
> On 12/18/25 13:51, kylebonnici wrote:
>
> > From: Kyle Bonnici kylebonnici@hotmail.com
> >
> > - Convert hex value to lowercase
> > - align property values to ' =3D '
> > - clean up whitespaces
> > - fix indentation
> > - add new line between nodes
> >
> > The changes are generated using the dts-linter.
> >
> > This is just a sample of what the above tool can fix and this change is
> > intended to start the conversation on how I should suggest fixes to thi=
s repo
> > Without sending one big PR.
> >
> > Also, this is my first attempt at such a submission. Hopefully I did no=
t miss
> > Anything fundamental in the submission process.
>
>
> my issue is with subject. Where Coding Style: subsystem is not defined.
>
> I tried your tool locally and I think handling in connection to long line=
 should
> be improved.
>
> But in general I don't have a problem to use any tool to do coding style
> formatting.
>
> Newlines I don't really mind but lower case, additional spaces, tabs/spac=
es are
> nicely visible.
>
> I think you should get ack from Rob, Krzysztof and Conor to run it in big=
ger scale.
>
> Thanks,
> Michal
>
> > Signed-off-by: Kyle Bonnici kylebonnici@proton.me
> > ---
> > arch/arm/boot/dts/xilinx/zynq-7000.dtsi | 72 +++++++++++--------
> > arch/arm/boot/dts/xilinx/zynq-cc108.dts | 11 ++-
> > arch/arm/boot/dts/xilinx/zynq-ebaz4205.dts | 1 +
> > arch/arm/boot/dts/xilinx/zynq-parallella.dts | 7 +-
> > arch/arm/boot/dts/xilinx/zynq-zc702.dts | 17 +++++
> > arch/arm/boot/dts/xilinx/zynq-zc706.dts | 13 ++++
> > arch/arm/boot/dts/xilinx/zynq-zc770-xm010.dts | 10 +++
> > arch/arm/boot/dts/xilinx/zynq-zc770-xm011.dts | 5 ++
> > arch/arm/boot/dts/xilinx/zynq-zc770-xm012.dts | 6 ++
> > arch/arm/boot/dts/xilinx/zynq-zc770-xm013.dts | 8 +++
> > arch/arm/boot/dts/xilinx/zynq-zed.dts | 7 ++
> > .../boot/dts/xilinx/zynq-zturn-common.dtsi | 5 +-
> > 12 files changed, 126 insertions(+), 36 deletions(-)
> >
> > diff --git a/arch/arm/boot/dts/xilinx/zynq-7000.dtsi b/arch/arm/boot/dt=
s/xilinx/zynq-7000.dtsi
> > index 153b8d93cbee..dd8a6528e8a7 100644
> > --- a/arch/arm/boot/dts/xilinx/zynq-7000.dtsi
> > +++ b/arch/arm/boot/dts/xilinx/zynq-7000.dtsi
> > @@ -27,10 +27,9 @@ cpu0: cpu@0 {
> > clock-latency =3D <1000>;
> > cpu0-supply =3D <&regulator_vccpint>;
> > operating-points =3D <
> > - /* kHz uV /
> > - 666667 1000000
> > - 333334 1000000
> > - >;
> > + / kHz uV */
> > + 666667 1000000
> > + 333334 1000000>;
> > };
> >
> > cpu1: cpu@1 {
> > @@ -78,17 +77,21 @@ out-ports {
> > /* replicator output ports /
> > port@0 {
> > reg =3D <0>;
> > +
> > replicator_out_port0: endpoint {
> > remote-endpoint =3D <&tpiu_in_port>;
> > };
> > };
> > +
> > port@1 {
> > reg =3D <1>;
> > +
> > replicator_out_port1: endpoint {
> > remote-endpoint =3D <&etb_in_port>;
> > };
> > };
> > };
> > +
> > in-ports {
> > / replicator input port */
> > port {
> > @@ -179,13 +182,13 @@ intc: interrupt-controller@f8f01000 {
> > compatible =3D "arm,cortex-a9-gic";
> > #interrupt-cells =3D <3>;
> > interrupt-controller;
> > - reg =3D <0xF8F01000 0x1000>,
> > - <0xF8F00100 0x100>;
> > + reg =3D <0xf8f01000 0x1000>,
> > + <0xf8f00100 0x100>;
> > };
> >
> > L2: cache-controller@f8f02000 {
> > compatible =3D "arm,pl310-cache";
> > - reg =3D <0xF8F02000 0x1000>;
> > + reg =3D <0xf8f02000 0x1000>;
> > interrupts =3D <0 2 4>;
> > arm,data-latency =3D <3 2 2>;
> > arm,tag-latency =3D <2 2 2>;
> > @@ -204,6 +207,7 @@ ocm: sram@fffc0000 {
> > #address-cells =3D <1>;
> > #size-cells =3D <1>;
> > ranges =3D <0 0xfffc0000 0x10000>;
> > +
> > ocm-sram@0 {
> > reg =3D <0x0 0x10000>;
> > };
> > @@ -214,7 +218,7 @@ uart0: serial@e0000000 {
> > status =3D "disabled";
> > clocks =3D <&clkc 23>, <&clkc 40>;
> > clock-names =3D "uart_clk", "pclk";
> > - reg =3D <0xE0000000 0x1000>;
> > + reg =3D <0xe0000000 0x1000>;
> > interrupts =3D <0 27 4>;
> > };
> >
> > @@ -223,7 +227,7 @@ uart1: serial@e0001000 {
> > status =3D "disabled";
> > clocks =3D <&clkc 24>, <&clkc 41>;
> > clock-names =3D "uart_clk", "pclk";
> > - reg =3D <0xE0001000 0x1000>;
> > + reg =3D <0xe0001000 0x1000>;
> > interrupts =3D <0 50 4>;
> > };
> >
> > @@ -304,6 +308,7 @@ nfc0: nand-controller@0,0 {
> > reg =3D <0 0 0x1000000>;
> > status =3D "disabled";
> > };
> > +
> > nor0: flash@1,0 {
> > status =3D "disabled";
> > compatible =3D "cfi-flash";
> > @@ -336,24 +341,26 @@ slcr: slcr@f8000000 {
> > #address-cells =3D <1>;
> > #size-cells =3D <1>;
> > compatible =3D "xlnx,zynq-slcr", "syscon", "simple-mfd";
> > - reg =3D <0xF8000000 0x1000>;
> > + reg =3D <0xf8000000 0x1000>;
> > ranges;
> > +
> > clkc: clkc@100 {
> > bootph-all;
> > #clock-cells =3D <1>;
> > compatible =3D "xlnx,ps7-clkc";
> > fclk-enable =3D <0>;
> > clock-output-names =3D "armpll", "ddrpll", "iopll", "cpu_6or4x",
> > - "cpu_3or2x", "cpu_2x", "cpu_1x", "ddr2x", "ddr3x",
> > - "dci", "lqspi", "smc", "pcap", "gem0", "gem1",
> > - "fclk0", "fclk1", "fclk2", "fclk3", "can0", "can1",
> > - "sdio0", "sdio1", "uart0", "uart1", "spi0", "spi1",
> > - "dma", "usb0_aper", "usb1_aper", "gem0_aper",
> > - "gem1_aper", "sdio0_aper", "sdio1_aper",
> > - "spi0_aper", "spi1_aper", "can0_aper", "can1_aper",
> > - "i2c0_aper", "i2c1_aper", "uart0_aper", "uart1_aper",
> > - "gpio_aper", "lqspi_aper", "smc_aper", "swdt",
> > - "dbg_trc", "dbg_apb";
> > + "cpu_3or2x", "cpu_2x", "cpu_1x", "ddr2x",
> > + "ddr3x", "dci", "lqspi", "smc", "pcap", "gem0",
> > + "gem1", "fclk0", "fclk1", "fclk2", "fclk3",
> > + "can0", "can1", "sdio0", "sdio1", "uart0",
> > + "uart1", "spi0", "spi1", "dma", "usb0_aper",
> > + "usb1_aper", "gem0_aper", "gem1_aper",
> > + "sdio0_aper", "sdio1_aper", "spi0_aper",
> > + "spi1_aper", "can0_aper", "can1_aper",
> > + "i2c0_aper", "i2c1_aper", "uart0_aper",
> > + "uart1_aper", "gpio_aper", "lqspi_aper",
> > + "smc_aper", "swdt", "dbg_trc", "dbg_apb";
> > reg =3D <0x100 0x100>;
> > };
> >
> > @@ -380,10 +387,10 @@ dmac_s: dma-controller@f8003000 {
> > * "dma4", "dma5", "dma6", "dma7";
> > */
> > interrupts =3D <0 13 4>,
> > - <0 14 4>, <0 15 4>,
> > - <0 16 4>, <0 17 4>,
> > - <0 40 4>, <0 41 4>,
> > - <0 42 4>, <0 43 4>;
> > + <0 14 4>, <0 15 4>,
> > + <0 16 4>, <0 17 4>,
> > + <0 40 4>, <0 41 4>,
> > + <0 42 4>, <0 43 4>;
> > #dma-cells =3D <1>;
> > clocks =3D <&clkc 27>;
> > clock-names =3D "apb_pclk";
> > @@ -412,7 +419,7 @@ ttc0: timer@f8001000 {
> > interrupts =3D <0 10 4>, <0 11 4>, <0 12 4>;
> > compatible =3D "cdns,ttc";
> > clocks =3D <&clkc 6>;
> > - reg =3D <0xF8001000 0x1000>;
> > + reg =3D <0xf8001000 0x1000>;
> > };
> >
> > ttc1: timer@f8002000 {
> > @@ -420,7 +427,7 @@ ttc1: timer@f8002000 {
> > interrupts =3D <0 37 4>, <0 38 4>, <0 39 4>;
> > compatible =3D "cdns,ttc";
> > clocks =3D <&clkc 6>;
> > - reg =3D <0xF8002000 0x1000>;
> > + reg =3D <0xf8002000 0x1000>;
> > };
> >
> > scutimer: timer@f8f00600 {
> > @@ -466,6 +473,7 @@ etb@f8801000 {
> > reg =3D <0xf8801000 0x1000>;
> > clocks =3D <&clkc 27>, <&clkc 46>, <&clkc 47>;
> > clock-names =3D "apb_pclk", "dbg_trc", "dbg_apb";
> > +
> > in-ports {
> > port {
> > etb_in_port: endpoint {
> > @@ -480,6 +488,7 @@ tpiu@f8803000 {
> > reg =3D <0xf8803000 0x1000>;
> > clocks =3D <&clkc 27>, <&clkc 46>, <&clkc 47>;
> > clock-names =3D "apb_pclk", "dbg_trc", "dbg_apb";
> > +
> > in-ports {
> > port {
> > tpiu_in_port: endpoint {
> > @@ -499,8 +508,7 @@ funnel@f8804000 {
> > out-ports {
> > port {
> > funnel_out_port: endpoint {
> > - remote-endpoint =3D
> > - <&replicator_in_port0>;
> > + remote-endpoint =3D <&replicator_in_port0>;
> > };
> > };
> > };
> > @@ -512,6 +520,7 @@ in-ports {
> > /* funnel input ports */
> > port@0 {
> > reg =3D <0>;
> > +
> > funnel0_in_port0: endpoint {
> > remote-endpoint =3D <&ptm0_out_port>;
> > };
> > @@ -519,6 +528,7 @@ funnel0_in_port0: endpoint {
> >
> > port@1 {
> > reg =3D <1>;
> > +
> > funnel0_in_port1: endpoint {
> > remote-endpoint =3D <&ptm1_out_port>;
> > };
> > @@ -526,8 +536,8 @@ funnel0_in_port1: endpoint {
> >
> > port@2 {
> > reg =3D <2>;
> > - funnel0_in_port2: endpoint {
> > - };
> > +
> > + funnel0_in_port2: endpoint {};
> > };
> > /* The other input ports are not connect to anything /
> > };
> > @@ -539,6 +549,7 @@ ptm@f889c000 {
> > clocks =3D <&clkc 27>, <&clkc 46>, <&clkc 47>;
> > clock-names =3D "apb_pclk", "dbg_trc", "dbg_apb";
> > cpu =3D <&cpu0>;
> > +
> > out-ports {
> > port {
> > ptm0_out_port: endpoint {
> > @@ -554,6 +565,7 @@ ptm@f889d000 {
> > clocks =3D <&clkc 27>, <&clkc 46>, <&clkc 47>;
> > clock-names =3D "apb_pclk", "dbg_trc", "dbg_apb";
> > cpu =3D <&cpu1>;
> > +
> > out-ports {
> > port {
> > ptm1_out_port: endpoint {
> > diff --git a/arch/arm/boot/dts/xilinx/zynq-cc108.dts b/arch/arm/boot/dt=
s/xilinx/zynq-cc108.dts
> > index f5525c048426..25828ba9fa16 100644
> > --- a/arch/arm/boot/dts/xilinx/zynq-cc108.dts
> > +++ b/arch/arm/boot/dts/xilinx/zynq-cc108.dts
> > @@ -55,6 +55,7 @@ ethernet_phy: ethernet-phy@1 {
> > &qspi {
> > status =3D "okay";
> > num-cs =3D <1>;
> > +
> > flash@0 { / 16 MB /
> > compatible =3D "jedec,spi-nor";
> > reg =3D <0x0>;
> > @@ -63,26 +64,32 @@ flash@0 { / 16 MB /
> > spi-rx-bus-width =3D <4>;
> > #address-cells =3D <1>;
> > #size-cells =3D <1>;
> > +
> > partition@0 {
> > label =3D "qspi-fsbl-uboot-bs";
> > reg =3D <0x0 0x400000>; / 4MB /
> > };
> > +
> > partition@400000 {
> > label =3D "qspi-linux";
> > reg =3D <0x400000 0x400000>; / 4MB /
> > };
> > +
> > partition@800000 {
> > label =3D "qspi-rootfs";
> > reg =3D <0x800000 0x400000>; / 4MB /
> > };
> > +
> > partition@c00000 {
> > label =3D "qspi-devicetree";
> > reg =3D <0xc00000 0x100000>; / 1MB /
> > };
> > +
> > partition@d00000 {
> > label =3D "qspi-scratch";
> > reg =3D <0xd00000 0x200000>; / 2MB /
> > };
> > +
> > partition@f00000 {
> > label =3D "qspi-uboot-env";
> > reg =3D <0xf00000 0x100000>; / 1MB */
> > @@ -92,8 +99,8 @@ partition@f00000 {
> >
> > &sdhci1 {
> > status =3D "okay";
> > - broken-cd ;
> > - wp-inverted ;
> > + broken-cd;
> > + wp-inverted;
> > };
> >
> > &uart0 {
> > diff --git a/arch/arm/boot/dts/xilinx/zynq-ebaz4205.dts b/arch/arm/boot=
/dts/xilinx/zynq-ebaz4205.dts
> > index 14f644156a6f..d4c07d28ec25 100644
> > --- a/arch/arm/boot/dts/xilinx/zynq-ebaz4205.dts
> > +++ b/arch/arm/boot/dts/xilinx/zynq-ebaz4205.dts
> > @@ -53,6 +53,7 @@ &nfc0 {
> >
> > #address-cells =3D <1>;
> > #size-cells =3D <0>;
> > +
> > nand@0 {
> > reg =3D <0>;
> > };
> > diff --git a/arch/arm/boot/dts/xilinx/zynq-parallella.dts b/arch/arm/bo=
ot/dts/xilinx/zynq-parallella.dts
> > index 366af4fcf8d9..e498feaa7ca4 100644
> > --- a/arch/arm/boot/dts/xilinx/zynq-parallella.dts
> > +++ b/arch/arm/boot/dts/xilinx/zynq-parallella.dts
> > @@ -44,10 +44,10 @@ &gem0 {
> > ethernet_phy: ethernet-phy@0 {
> > /* Marvell 88E1318 */
> > compatible =3D "ethernet-phy-id0141.0e90",
> > - "ethernet-phy-ieee802.3-c22";
> > + "ethernet-phy-ieee802.3-c22";
> > reg =3D <0>;
> > marvell,reg-init =3D <0x3 0x10 0xff00 0x1e>,
> > - <0x3 0x11 0xfff0 0xa>;
> > + <0x3 0x11 0xfff0 0xa>;
> > };
> > };
> >
> > @@ -63,13 +63,16 @@ dcd1 {
> > regulator-name =3D "VDD_DSP";
> > regulator-always-on;
> > };
> > +
> > dcd2 {
> > regulator-name =3D "1P35V";
> > regulator-always-on;
> > };
> > +
> > ldo1 {
> > regulator-name =3D "VDD_ADJ";
> > };
> > +
> > ldo2 {
> > regulator-name =3D "VDD_GPIO";
> > regulator-always-on;
> > diff --git a/arch/arm/boot/dts/xilinx/zynq-zc702.dts b/arch/arm/boot/dt=
s/xilinx/zynq-zc702.dts
> > index 6955637c5b1a..63eded827b37 100644
> > --- a/arch/arm/boot/dts/xilinx/zynq-zc702.dts
> > +++ b/arch/arm/boot/dts/xilinx/zynq-zc702.dts
> > @@ -34,6 +34,7 @@ chosen {
> > gpio-keys {
> > compatible =3D "gpio-keys";
> > autorepeat;
> > +
> > switch-14 {
> > label =3D "sw14";
> > gpios =3D <&gpio0 12 0>;
> > @@ -41,6 +42,7 @@ switch-14 {
> > wakeup-source;
> > autorepeat;
> > };
> > +
> > switch-13 {
> > label =3D "sw13";
> > gpios =3D <&gpio0 14 0>;
> > @@ -112,6 +114,7 @@ i2c@0 {
> > #address-cells =3D <1>;
> > #size-cells =3D <0>;
> > reg =3D <0>;
> > +
> > si570: clock-generator@5d {
> > #clock-cells =3D <0>;
> > compatible =3D "silabs,si570";
> > @@ -126,6 +129,7 @@ i2c@1 {
> > #address-cells =3D <1>;
> > #size-cells =3D <0>;
> > reg =3D <1>;
> > +
> > adv7511: hdmi-tx@39 {
> > compatible =3D "adi,adv7511";
> > reg =3D <0x39>;
> > @@ -141,6 +145,7 @@ i2c@2 {
> > #address-cells =3D <1>;
> > #size-cells =3D <0>;
> > reg =3D <2>;
> > +
> > eeprom: eeprom@54 {
> > compatible =3D "atmel,24c08";
> > reg =3D <0x54>;
> > @@ -151,6 +156,7 @@ i2c@3 {
> > #address-cells =3D <1>;
> > #size-cells =3D <0>;
> > reg =3D <3>;
> > +
> > gpio@21 {
> > compatible =3D "ti,tca6416";
> > reg =3D <0x21>;
> > @@ -163,6 +169,7 @@ i2c@4 {
> > #address-cells =3D <1>;
> > #size-cells =3D <0>;
> > reg =3D <4>;
> > +
> > rtc: rtc@51 {
> > compatible =3D "nxp,pcf8563";
> > reg =3D <0x51>;
> > @@ -173,14 +180,17 @@ i2c@7 {
> > #address-cells =3D <1>;
> > #size-cells =3D <0>;
> > reg =3D <7>;
> > +
> > hwmon@34 {
> > compatible =3D "ti,ucd9248";
> > reg =3D <0x34>;
> > };
> > +
> > hwmon@35 {
> > compatible =3D "ti,ucd9248";
> > reg =3D <0x35>;
> > };
> > +
> > hwmon@36 {
> > compatible =3D "ti,ucd9248";
> > reg =3D <0x36>;
> > @@ -396,32 +406,39 @@ &qspi {
> > bootph-all;
> > status =3D "okay";
> > num-cs =3D <1>;
> > +
> > flash@0 {
> > compatible =3D "jedec,spi-nor";
> > reg =3D <0x0>;
> > spi-tx-bus-width =3D <1>;
> > spi-rx-bus-width =3D <4>;
> > spi-max-frequency =3D <50000000>;
> > +
> > partitions {
> > compatible =3D "fixed-partitions";
> > #address-cells =3D <1>;
> > #size-cells =3D <1>;
> > +
> > partition@0 {
> > label =3D "qspi-fsbl-uboot";
> > reg =3D <0x0 0x100000>;
> > };
> > +
> > partition@100000 {
> > label =3D "qspi-linux";
> > reg =3D <0x100000 0x500000>;
> > };
> > +
> > partition@600000 {
> > label =3D "qspi-device-tree";
> > reg =3D <0x600000 0x20000>;
> > };
> > +
> > partition@620000 {
> > label =3D "qspi-rootfs";
> > reg =3D <0x620000 0x5e0000>;
> > };
> > +
> > partition@c00000 {
> > label =3D "qspi-bitstream";
> > reg =3D <0xc00000 0x400000>;
> > diff --git a/arch/arm/boot/dts/xilinx/zynq-zc706.dts b/arch/arm/boot/dt=
s/xilinx/zynq-zc706.dts
> > index 3b803c698473..d6447e544d8f 100644
> > --- a/arch/arm/boot/dts/xilinx/zynq-zc706.dts
> > +++ b/arch/arm/boot/dts/xilinx/zynq-zc706.dts
> > @@ -73,6 +73,7 @@ i2c@0 {
> > #address-cells =3D <1>;
> > #size-cells =3D <0>;
> > reg =3D <0>;
> > +
> > si570: clock-generator@5d {
> > #clock-cells =3D <0>;
> > compatible =3D "silabs,si570";
> > @@ -87,6 +88,7 @@ i2c@1 {
> > #address-cells =3D <1>;
> > #size-cells =3D <0>;
> > reg =3D <1>;
> > +
> > adv7511: hdmi-tx@39 {
> > compatible =3D "adi,adv7511";
> > reg =3D <0x39>;
> > @@ -102,6 +104,7 @@ i2c@2 {
> > #address-cells =3D <1>;
> > #size-cells =3D <0>;
> > reg =3D <2>;
> > +
> > eeprom: eeprom@54 {
> > compatible =3D "atmel,24c08";
> > reg =3D <0x54>;
> > @@ -112,6 +115,7 @@ i2c@3 {
> > #address-cells =3D <1>;
> > #size-cells =3D <0>;
> > reg =3D <3>;
> > +
> > gpio@21 {
> > compatible =3D "ti,tca6416";
> > reg =3D <0x21>;
> > @@ -124,6 +128,7 @@ i2c@4 {
> > #address-cells =3D <1>;
> > #size-cells =3D <0>;
> > reg =3D <4>;
> > +
> > rtc: rtc@51 {
> > compatible =3D "nxp,pcf8563";
> > reg =3D <0x51>;
> > @@ -134,6 +139,7 @@ i2c@7 {
> > #address-cells =3D <1>;
> > #size-cells =3D <0>;
> > reg =3D <7>;
> > +
> > ucd90120@65 {
> > compatible =3D "ti,ucd90120";
> > reg =3D <0x65>;
> > @@ -309,6 +315,7 @@ &qspi {
> > bootph-all;
> > status =3D "okay";
> > num-cs =3D <2>;
> > +
> > flash@0 {
> > compatible =3D "jedec,spi-nor";
> > reg =3D <0>, <1>;
> > @@ -316,26 +323,32 @@ flash@0 {
> > spi-tx-bus-width =3D <1>;
> > spi-rx-bus-width =3D <4>;
> > spi-max-frequency =3D <50000000>;
> > +
> > partitions {
> > compatible =3D "fixed-partitions";
> > #address-cells =3D <1>;
> > #size-cells =3D <1>;
> > +
> > partition@0 {
> > label =3D "qspi-fsbl-uboot";
> > reg =3D <0x0 0x100000>;
> > };
> > +
> > partition@100000 {
> > label =3D "qspi-linux";
> > reg =3D <0x100000 0x500000>;
> > };
> > +
> > partition@600000 {
> > label =3D "qspi-device-tree";
> > reg =3D <0x600000 0x20000>;
> > };
> > +
> > partition@620000 {
> > label =3D "qspi-rootfs";
> > reg =3D <0x620000 0x5e0000>;
> > };
> > +
> > partition@c00000 {
> > label =3D "qspi-bitstream";
> > reg =3D <0xc00000 0x400000>;
> > diff --git a/arch/arm/boot/dts/xilinx/zynq-zc770-xm010.dts b/arch/arm/b=
oot/dts/xilinx/zynq-zc770-xm010.dts
> > index 5fe799c3c7cf..4929a5aa1678 100644
> > --- a/arch/arm/boot/dts/xilinx/zynq-zc770-xm010.dts
> > +++ b/arch/arm/boot/dts/xilinx/zynq-zc770-xm010.dts
> > @@ -62,32 +62,39 @@ eeprom: eeprom@52 {
> > &qspi {
> > status =3D "okay";
> > num-cs =3D <1>;
> > +
> > flash@0 {
> > compatible =3D "jedec,spi-nor";
> > reg =3D <0x0>;
> > spi-tx-bus-width =3D <1>;
> > spi-rx-bus-width =3D <4>;
> > spi-max-frequency =3D <50000000>;
> > +
> > partitions {
> > compatible =3D "fixed-partitions";
> > #address-cells =3D <1>;
> > #size-cells =3D <1>;
> > +
> > partition@0 {
> > label =3D "qspi-fsbl-uboot";
> > reg =3D <0x0 0x100000>;
> > };
> > +
> > partition@100000 {
> > label =3D "qspi-linux";
> > reg =3D <0x100000 0x500000>;
> > };
> > +
> > partition@600000 {
> > label =3D "qspi-device-tree";
> > reg =3D <0x600000 0x20000>;
> > };
> > +
> > partition@620000 {
> > label =3D "qspi-rootfs";
> > reg =3D <0x620000 0x5e0000>;
> > };
> > +
> > partition@c00000 {
> > label =3D "qspi-bitstream";
> > reg =3D <0xc00000 0x400000>;
> > @@ -104,14 +111,17 @@ &spi1 {
> > status =3D "okay";
> > num-cs =3D <4>;
> > is-decoded-cs =3D <0>;
> > +
> > flash@1 {
> > compatible =3D "sst25wf080", "jedec,spi-nor";
> > reg =3D <1>;
> > spi-max-frequency =3D <1000000>;
> > +
> > partitions {
> > compatible =3D "fixed-partitions";
> > #address-cells =3D <1>;
> > #size-cells =3D <1>;
> > +
> > partition@0 {
> > label =3D "data";
> > reg =3D <0x0 0x100000>;
> > diff --git a/arch/arm/boot/dts/xilinx/zynq-zc770-xm011.dts b/arch/arm/b=
oot/dts/xilinx/zynq-zc770-xm011.dts
> > index f9a086fe66d3..d4e739772d7b 100644
> > --- a/arch/arm/boot/dts/xilinx/zynq-zc770-xm011.dts
> > +++ b/arch/arm/boot/dts/xilinx/zynq-zc770-xm011.dts
> > @@ -51,20 +51,25 @@ &nfc0 {
> > status =3D "okay";
> > #address-cells =3D <1>;
> > #size-cells =3D <0>;
> > +
> > nand@0 {
> > reg =3D <0>;
> > +
> > partitions {
> > compatible =3D "fixed-partitions";
> > #address-cells =3D <1>;
> > #size-cells =3D <1>;
> > +
> > partition@0 {
> > label =3D "nand-fsbl-uboot";
> > reg =3D <0x0 0x1000000>;
> > };
> > +
> > partition@1000000 {
> > label =3D "nand-linux";
> > reg =3D <0x1000000 0x2000000>;
> > };
> > +
> > partition@3000000 {
> > label =3D "nand-rootfs";
> > reg =3D <0x3000000 0x200000>;
> > diff --git a/arch/arm/boot/dts/xilinx/zynq-zc770-xm012.dts b/arch/arm/b=
oot/dts/xilinx/zynq-zc770-xm012.dts
> > index 24520e7d3965..32422aed77a3 100644
> > --- a/arch/arm/boot/dts/xilinx/zynq-zc770-xm012.dts
> > +++ b/arch/arm/boot/dts/xilinx/zynq-zc770-xm012.dts
> > @@ -56,26 +56,32 @@ eeprom1: eeprom@52 {
> > &nor0 {
> > status =3D "okay";
> > bank-width =3D <1>;
> > +
> > partitions {
> > compatible =3D "fixed-partitions";
> > #address-cells =3D <1>;
> > #size-cells =3D <1>;
> > +
> > partition@0 {
> > label =3D "nor-fsbl-uboot";
> > reg =3D <0x0 0x100000>;
> > };
> > +
> > partition@100000 {
> > label =3D "nor-linux";
> > reg =3D <0x100000 0x500000>;
> > };
> > +
> > partition@600000 {
> > label =3D "nor-device-tree";
> > reg =3D <0x600000 0x20000>;
> > };
> > +
> > partition@620000 {
> > label =3D "nor-rootfs";
> > reg =3D <0x620000 0x5e0000>;
> > };
> > +
> > partition@c00000 {
> > label =3D "nor-bitstream";
> > reg =3D <0xc00000 0x400000>;
> > diff --git a/arch/arm/boot/dts/xilinx/zynq-zc770-xm013.dts b/arch/arm/b=
oot/dts/xilinx/zynq-zc770-xm013.dts
> > index 103e87ea7253..9c94421bf650 100644
> > --- a/arch/arm/boot/dts/xilinx/zynq-zc770-xm013.dts
> > +++ b/arch/arm/boot/dts/xilinx/zynq-zc770-xm013.dts
> > @@ -61,6 +61,7 @@ si570: clock-generator@55 {
> > &qspi {
> > status =3D "okay";
> > num-cs =3D <2>;
> > +
> > flash@0 {
> > compatible =3D "jedec,spi-nor";
> > reg =3D <0>, <1>;
> > @@ -68,26 +69,32 @@ flash@0 {
> > spi-tx-bus-width =3D <1>;
> > spi-rx-bus-width =3D <4>;
> > spi-max-frequency =3D <50000000>;
> > +
> > partitions {
> > compatible =3D "fixed-partitions";
> > #address-cells =3D <1>;
> > #size-cells =3D <1>;
> > +
> > partition@0 {
> > label =3D "qspi-fsbl-uboot";
> > reg =3D <0x0 0x100000>;
> > };
> > +
> > partition@100000 {
> > label =3D "qspi-linux";
> > reg =3D <0x100000 0x500000>;
> > };
> > +
> > partition@600000 {
> > label =3D "qspi-device-tree";
> > reg =3D <0x600000 0x20000>;
> > };
> > +
> > partition@620000 {
> > label =3D "qspi-rootfs";
> > reg =3D <0x620000 0x5e0000>;
> > };
> > +
> > partition@c00000 {
> > label =3D "qspi-bitstream";
> > reg =3D <0xc00000 0x400000>;
> > @@ -100,6 +107,7 @@ &spi0 {
> > status =3D "okay";
> > num-cs =3D <4>;
> > is-decoded-cs =3D <0>;
> > +
> > eeprom: eeprom@2 {
> > compatible =3D "atmel,at25";
> > reg =3D <2>;
> > diff --git a/arch/arm/boot/dts/xilinx/zynq-zed.dts b/arch/arm/boot/dts/=
xilinx/zynq-zed.dts
> > index 52ba569b2b9f..dd46d71e3f36 100644
> > --- a/arch/arm/boot/dts/xilinx/zynq-zed.dts
> > +++ b/arch/arm/boot/dts/xilinx/zynq-zed.dts
> > @@ -51,6 +51,7 @@ &qspi {
> > bootph-all;
> > status =3D "okay";
> > num-cs =3D <1>;
> > +
> > flash@0 {
> > compatible =3D "jedec,spi-nor";
> > reg =3D <0>;
> > @@ -58,26 +59,32 @@ flash@0 {
> > spi-rx-bus-width =3D <4>;
> > spi-max-frequency =3D <50000000>;
> > m25p,fast-read;
> > +
> > partitions {
> > compatible =3D "fixed-partitions";
> > #address-cells =3D <1>;
> > #size-cells =3D <1>;
> > +
> > partition@0 {
> > label =3D "qspi-fsbl-uboot";
> > reg =3D <0x0 0x100000>;
> > };
> > +
> > partition@100000 {
> > label =3D "qspi-linux";
> > reg =3D <0x100000 0x500000>;
> > };
> > +
> > partition@600000 {
> > label =3D "qspi-device-tree";
> > reg =3D <0x600000 0x20000>;
> > };
> > +
> > partition@620000 {
> > label =3D "qspi-rootfs";
> > reg =3D <0x620000 0x5e0000>;
> > };
> > +
> > partition@c00000 {
> > label =3D "qspi-bitstream";
> > reg =3D <0xc00000 0x400000>;
> > diff --git a/arch/arm/boot/dts/xilinx/zynq-zturn-common.dtsi b/arch/arm=
/boot/dts/xilinx/zynq-zturn-common.dtsi
> > index defef9c8da13..57e6cda1a798 100644
> > --- a/arch/arm/boot/dts/xilinx/zynq-zturn-common.dtsi
> > +++ b/arch/arm/boot/dts/xilinx/zynq-zturn-common.dtsi
> > @@ -33,6 +33,7 @@ chosen {
> >
> > gpio-leds {
> > compatible =3D "gpio-leds";
> > +
> > usr-led1 {
> > label =3D "usr-led1";
> > gpios =3D <&gpio0 0x0 0x1>;
> > @@ -49,6 +50,7 @@ usr-led2 {
> > gpio-keys {
> > compatible =3D "gpio-keys";
> > autorepeat;
> > +
> > key {
> > label =3D "K1";
> > gpios =3D <&gpio0 0x32 0x1>;
> > @@ -73,8 +75,7 @@ &gem0 {
> > phy-mode =3D "rgmii-id";
> > phy-handle =3D <&ethernet_phy>;
> >
> > - ethernet_phy: ethernet-phy@0 {
> > - };
> > + ethernet_phy: ethernet-phy@0 {};
> > };
> >
> > &sdhci0 {

