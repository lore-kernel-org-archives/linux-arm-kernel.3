Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA44BC88E70
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 13:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B/Qebpkyia7V9pMGpccYgansMwWpW6vE7u/sVxLMc3E=; b=Lej38fhGYqGtjpaXwJxSpHnAMS
	LJxZEUqWRHgk96PM7KPxPFoudG/2Nnr5WMtDkuQp9RjNOFyEvf/yJsRGXDZI4n5+frG8QRIm93tWn
	lqv9C1Gr/kd594fh1k97e506R2TlRAcaP/xAFvy1Q0mjnQSvVFHEGaKyDLUs8rVp6PFImmd716os7
	WIFRu4jKl7gUfTP/b61MVcH/ljahdSt8c8OmYRF8VdvMhdm6bQWZWe4cJNpnENc3nFTLMDhulyxYf
	VTKLLWHnV3i+O5wJR72wykDFP+Bbxbk5Oek8WKcSEQikF7Bb5gBECGa3UHeZ5qeF7vsw5BqQCB4CN
	YhPirJDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x66sp-00000003nwc-1dDf;
	Mon, 14 Sep 2026 13:38:07 +0000
Received: from mail-10699.protonmail.ch ([79.135.106.99])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x66sm-00000003nvM-2lcj;
	Mon, 14 Sep 2026 13:38:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1789393078; x=1789652278;
	bh=B/Qebpkyia7V9pMGpccYgansMwWpW6vE7u/sVxLMc3E=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=NJ0rfnMMy84/9NHohWDfpdGh2gxIltiRsLcwaARcSvx7JR9qSCKY5kJK4lrd29ir1
	 dbhk3o+u4HH9XNZZNzlYh9RGTnGlb/EpfYLU7+4G8ndsyF007N2VcKbBW0sRxQgNmH
	 1ytgCKt3xQhkRoSd1WnDDeiR/Hd528+UrRfAc5j4M9VR70DWxP9zS3IehEg7SFh1X2
	 v5QIk2ORN1pmQmGxqWY//eHqevAdJTGTMqoBL/ZIZUVpk/ajMIkxOxk+68JIjvuDxZ
	 zkAE1tapqrm3FIHmiqARo3rytBY7JijtIQmWSDn+Pe+NPXIuPnW0bHbkWY09O7lSTa
	 XKN08dSA0BFpg==
Date: Mon, 14 Sep 2026 13:37:52 +0000
To: Jonas Karlman <jonas@kwiboo.se>
From: =?utf-8?B?5a6J5a65?= <HystericalDragons@proton.me>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Chukun Pan <amadeus@jmu.edu.cn>, jensen <jensenhuang@friendlyarm.com>, Andrey Korshunov <razor1702@gmail.com>, Diederik de Haas <diederik@cknow-tech.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 3/4] arm64: dts: rockchip: Add devicetree for the FriendlyElec NanoPi R28S
Message-ID: <66PL3p_9JZeRYUAhCjIDPQ436Zk4n3R8OfbYE7P7kxQ3TKTLX1DL3BxD9jbW4aiyqZYvpoe6T8z4HrQy9Mh8Mg5uOJUEJZrU4atc921xoHs=@proton.me>
In-Reply-To: <dcaf96df-4a51-446a-a92d-6bb4e21af618@kwiboo.se>
References: <20260914-r28s-upstream-v5-0-7409c498e8dc@proton.me> <20260914-r28s-upstream-v5-3-7409c498e8dc@proton.me> <dcaf96df-4a51-446a-a92d-6bb4e21af618@kwiboo.se>
Feedback-ID: 91982645:user:proton
X-Pm-Message-ID: ff6ff779a7f57ae7c11879d732179b8724b41cac
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_063805_314039_321A1348 
X-CRM114-Status: GOOD (  21.37  )
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

Hi Jonas,

Thanks for the review, and for going through the schematic.

>> +  aliases {
>> +          mmc2 =3D &sdio0;
>
> This looks to be missing an serial2 alias:
>
>     serial2 =3D &uart2;

Added in v6.

>> +          pinctrl-0 =3D <&usr_btn>;
>
> This is named gpio4_b2_usr_btn in the schematics.

You are right, the net is GPIO4_B2_USR_BTN. v6 renames the label to
gpio4_b2_usr_btn and the node to gpio4-b2-usr-btn. The other pin
configuration labels (led1, led2, led_sys, pwr_wf, pcie_eth_perstb)
is already match their nets.

> This is missing nodes for bluetooth:
>
>     bluetooth {
>         bt_wake_host: bt-wake-host {
[...]
> Suggest you also add host_wake_wl:
[...]
> and wl_wake_host:

I checked all four against the schematic and the pins are right:
HOST_WAKE_WL on GPIO1_A6, WL_WAKE_HOST on GPIO1_A7, HOST_WAKE_BT on
GPIO1_B4, BT_WAKE_HOST on GPIO1_B5, all of them wired to the module on
sheet 16.

I still left them out. The AIC8800D80 has no upstream driver, so there
is no wifi@1 node and no bluetooth node under &uart2 to reference these
pin configurations from, and a pinctrl state that nothing references is
never applied. I would rather add them in the patch that adds those
nodes where they can be tested. If you want them in now for the NEO3
Plus work, point it out so and I will add them in the next revision.

>> +&sdio0 {
>
> We can likely be explicit and declare:
>
>     no-mmc;
>     no-sd;
>
> This is missing the vmmc-supply used.
>
>     vmmc-supply =3D <&vcc_3v3>;

They are both added in v6. The module's VBAT comes from VCC_3V3 through a f=
errite
bead and VDDIO from VCC_1V8, which matches the vqmmc-supply that was
already there.

>> +&uart2 {
>
> We can likely declare dma-names here:
>
>     dma-names =3D "tx", "rx";

Added in v6.

>> +  dr_mode =3D "peripheral";
>
> Why do you disable dual role here? Is it not possible to have it work in
> host mode? E.g. using a USB hub with power pass-thru?

The port is wired as a device only, see sheet 15:

- Both CC pins have a 5.1k pull-down, R3811 and R3812, so the port always
  presents itself as a UFP. There is no CC controller and no Rp that
  could advertise a DFP.
- USB20_OTG0_ID is not connected, R3922 is /NC, and the sheet has a
  "Slave Mode" note right next to it.
- VBUS is an input. It goes through the input protection into
  VCC5V0_SYS, which powers the whole board. Nothing can source 5V onto
  the connector.

So behind a powered hub the board is powered, but it still cannot
present itself as a host to the other side. v6 keeps
dr_mode =3D "peripheral" and states the above in a comment above it.

Your comments on the other two patches are in v6 as well: the USB nodes
stay in the board devicetrees, and the binding lists the R28S and the
Zero2 in a single entry. The coding style patch is dropped -- Diederik,
for the record, only 18 of the ~2900 "status" properties under
arch/arm64/boot/dts/rockchip are preceded by a blank line, so the series
now follows what the rockchip devicetrees do instead.

Looking forward to the NEO3 Plus series, and enjoy the R28S once it
arrives.

Regards,
AnRong

