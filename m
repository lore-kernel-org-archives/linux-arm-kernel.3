Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 093F6C982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 11:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Cc:To
	:Subject:Message-ID:From:Content-Transfer-Encoding:Content-Type:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=89B9ISIa0ErpX/7TVt0J21h4twW1PJGNW1n+amGHNfk=; b=KAs3Hk71tX8ZDkukJABx5qXdFJ
	gw8aCnoVKc/JCZ6YN0mCU0N3AB26uB/lz/AuCEmxEUiM7YbU0Kf/QtQmEN4C5VdpZkhYfqHCPabdo
	bBLum9mk7JokksCmakghdET6n3xVZm54N/LAymVag/kAEQT9wwxL/RDFdE4dVukGFvKTiRk2tfWdZ
	SNTL+IZC5WTU8IaqvGuqBIgDwmofbX4qpaELWchMxIstSrhw4tdGtJa027iabmBlvi2gPhVzOZ6MV
	WkaWdsxZ13ty7aaM7OWBbsndoIhWR4y1eSxEGNl2cdXIC3daSGAZB6JqHYtA5/PAVqVcWn3cIo2aO
	5DsOXg1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8c0X-00000001rC2-3BgO;
	Mon, 21 Sep 2026 11:16:25 +0000
Received: from out-155.mta1.migadu.com ([2001:41d0:203:375::9b] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8c0T-00000001r6I-3RQW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 11:16:24 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=gatQIgMu3v/IsMUVrYP5QjjizymHE9HTRW55gqqQDXU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789989377; v=1; x=1790594177;
 b=Ah2ILXlJUiKmMBQ1B/wLli2UkwdnNt4Qa+mxodmPSWcyTrLObSoJRJF1Dy4SpeONenSkSuyd
 2oEAlmsNg4E9NeLNx0OoxjKhbzo5mUU+ObrfGPgu1UpcWiGkB2PgBkFyNIIm15DrankoS2e6zu/
 wyWp5ShFZ9eamQ8BRyRJH2rs=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 89478576c1541826;
	Mon, 21 Sep 2026 11:16:16 +0000
X-Mizu-Trace-ID: 89478576c1541826
X-Migadu-Flow: FLOW_OUT
MIME-Version: 1.0
Date: Mon, 21 Sep 2026 11:16:16 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Frank Wunderlich" <frank.wunderlich@linux.dev>
Message-ID: <6b691a27f27eee1a058426cc7fd5a3fbdbfd45a6@linux.dev>
TLS-Required: No
Subject: Re: [PATCH 1/2] clk: mediatek: mt7988: keep combo-lane U3 PHY ref
 clock enabled
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 "Frank Wunderlich" <linux@fw-web.de>, "Stephen Boyd" <sboyd@kernel.org>,
 "Brian Masney" <bmasney+clk@redhat.com>, "Jerome Brunet"
 <jbrunet+clk@baylibre.com>, "Matthias Brugger" <matthias.bgg@gmail.com>,
 "Mathias Nyman" <mathias.nyman@intel.com>, "Chunfeng Yun"
 <chunfeng.yun@mediatek.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>
Cc: "Frank Wunderlich" <frank-w@public-files.de>, "Daniel Golle"
 <daniel@makrotopia.org>, "Mihai Ordean" <research@mihaiordean.com>,
 "Chen-Yu Tsai" <wenst@chromium.org>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-usb@vger.kernel.org
In-Reply-To: <a71b6552-ea57-4575-89e1-14d414d53569@collabora.com>
References: <20260919114744.46777-1-linux@fw-web.de>
 <20260919114744.46777-2-linux@fw-web.de>
 <a71b6552-ea57-4575-89e1-14d414d53569@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_041622_004799_C0D34546 
X-CRM114-Status: GOOD (  14.24  )
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

Am 21. September 2026 um 11:59 schrieb "AngeloGioacchino Del Regno" <ange=
logioacchino.delregno@collabora.com>:

Hi angelo

> On 9/19/26 13:47, Frank Wunderlich wrote:
>=20
>=20>=20
>=20> From: Mihai Ordean <research@mihaiordean.com>
> >  CLK_INFRA_USB_PIPE is the reference clock of xphyu3port0, the U3/PCI=
e
> >  combo serdes. On MT7988 that lane is shared between ssusb0's SuperSp=
eed
> >  side and pcie2, but only the consumer that claims the PHY holds the =
gate.
> >  On the BPI-R4 Pro, ssusb0 is configured USB2-only (u3p-dis-msk=3D1) =
and
> >  pcie2 claims the lane for the CN13/CN15 M.2 slot, so pcie2 is the so=
le
> >  holder. u3p-dis-msk does not remove ssusb0's SuperSpeed root hub: th=
at is
> >  decided by xhci_has_one_roothub(), which keys off usb3_rhub.num_port=
s
> >  from the xHCI capability registers, so bus 2 is registered and live
> >  regardless. When the M.2 slot is empty, pcie2 fails link training (-=
110)
> >  and its error path calls phy_power_off()/phy_exit(), which gates thi=
s
> >  clock - and sspxtp_sel with it, as nothing else consumes it. The sti=
ll
> >  registered SuperSpeed root hub is then left polling a serdes whose P=
HY
> >  reference clock has just stopped,
> >=20
>=20I'm not sure why said clock cannot be assigned to the USB controller =
as well
> as the PCIe PHY to keep the refcount high, avoiding to gate it?

the clock is assigned to the phy which is assigned to both consumers

mt7988a.dtsi:

		xsphy: xs-phy@11e10000 {
			compatible =3D "mediatek,mt7988-xsphy",
				     "mediatek,xsphy";
			...

			xphyu3port0: usb-phy@3400 {
				reg =3D <0x3400 0x500>;
				clocks =3D <&infracfg CLK_INFRA_USB_PIPE>;

		ssusb0: usb@11190000 {
			compatible =3D "mediatek,mt7988-xhci", "mediatek,mtk-xhci";
			...
			phys =3D <&xphyu2port0 PHY_TYPE_USB2>,
			       <&xphyu3port0 PHY_TYPE_USB3>;
		};

		pcie2: pcie@11280000 {
			compatible =3D "mediatek,mt7986-pcie",
				     "mediatek,mt8192-pcie";
			...

			phys =3D <&xphyu3port0 PHY_TYPE_PCIE>;
			phy-names =3D "pcie-phy";
			...
		};

but this seems not enough...do you mean we need to define the clock again=
 for both
consumers (e.g. via assigned-clock-parents property)?

regards Frank

> Cheers,
> Angelo
>=20
>=20>=20
>=20> and asserts the shared SSUSB interrupt
> >  outside the xHCI event ring; xhci_irq() reads USBSTS with EINT clear=
 and
> >  returns IRQ_NONE, so the core disables the line ("nobody cared") and=
 the
> >  next USB teardown blocks forever in xhci_disable_slot().
> >  Boot logs show the storm threshold being crossed 86-107 ms after the
> >  pcie2 probe failure, while the earlier combo-mux switch to PCIe mode
> >  (~550 ms before) causes no trouble, pointing at the clock gating rat=
her
> >  than the mux as the trigger.
> >  Mark the gate CLK_IS_CRITICAL so the combo lane keeps its reference =
clock.
> >  Only port 0's gate is affected; ssusb1 uses CLK_INFRA_USB_PIPE_CK_P1=
.
> >  Signed-off-by: Mihai Ordean <research@mihaiordean.com>
> >  Signed-off-by: Frank Wunderlich <frank-w@public-files.de>


regards Frank

