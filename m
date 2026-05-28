Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 743DFCD6E45
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 22:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vrDLdKSVaGwj0WHI4sdHIiYlLMo3OmoPXFdy4E2nHJg=; b=ru0zv6gar91zmxDMxZdpIsLtfq
	IoziJfv2fwNo1GcD6OQwP4KUu9nXNz9OxYskf8lI4KZpPCy+q2Hoz441C9kEp/sdXw6JGIcynoVKM
	nPqFLjp3U2ODtES/hIkakaQ2qNcol6KGkkB4PKACVcFkCNO91TnYSdcRpOXK/BiMEz6UX9oWg+dNj
	qY0//aYCfCnyeE5vT6UOlZv8zPgRQ+oQyd1A4VjASg7EQ9goMCnOQqY6Iy6ZV7DRANpmpn+viHnWK
	DUy9wUEFqY3xaFImrK/Fv26TSgAbnIA5+uMd2NoTL3zYh0pKgh7/hB9MLGVGljTWbtw0gXwdBygzG
	Sz95xe2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSiy9-00000006SbJ-1Sjg;
	Thu, 28 May 2026 22:12:49 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSiy7-00000006Sav-350T;
	Thu, 28 May 2026 22:12:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=vrDLdKSVaGwj0WHI4sdHIiYlLMo3OmoPXFdy4E2nHJg=; b=NboZHQsTQ1ZxknZG2sCj469/Pf
	u8SeI3n3cNy8XnGkKSQNJoezJ7Ed71sP5cq0thZY/j1Hf1gM3mEhEVoiH/Ad+zJLSDCWRkAh6yu/l
	yhMqqR4h+j9QhO9YTp5UuFG3pBoIkJdjoxlifEVeLpH10QC/GWyl94auZYDpDBuFMDcdOVYOj5IVH
	ST54yIC0wGfMUZqmLrpplUz+KXY7Bsgr0l6WHSA+aFVbwUmzmgp89grstStqXIC4pRONR3MFCwU7T
	QZoDvPVIx/5AoCVttw5drYudGtJb3m3QjltqNLIQqEM9h9tYwxhfBbYF4lrof16YDlMDUoR9PLaYI
	q/2RDg1w==;
From: Heiko Stuebner <heiko@sntech.de>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: jonas@kwiboo.se, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Chukun Pan <amadeus@jmu.edu.cn>
Subject: Re: [PATCH v2 4/5] arm64: dts: rockchip: Enable USB 2.0 ports on ArmSoM Sige1
Date: Fri, 29 May 2026 00:12:33 +0200
Message-ID: <6849370.F8r316W7xa@phil>
In-Reply-To: <20260525070010.1060602-1-amadeus@jmu.edu.cn>
References: <20260505171208.3267387-5-heiko@sntech.de>
 <20260525070010.1060602-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_151247_795355_A70C61A2 
X-CRM114-Status: UNSURE (   9.91  )
X-CRM114-Notice: Please train this message.
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

Am Montag, 25. Mai 2026, 09:00:10 Mitteleurop=C3=A4ische Sommerzeit schrieb=
 Chukun Pan:
> Hi,
>=20
> > +&usb_host0_xhci {
> > +	extcon =3D <&usb2phy>;
> > +	maximum-speed =3D "high-speed";
> > +	phys =3D <&usb2phy_otg>;
> > +	phy-names =3D "usb2-phy";
>=20
> The same warning for this otg port:
> [    0.232211] dwc3 fe500000.usb: Configuration mismatch. dr_mode forced =
to host

According to the schematics, this is an actual Type-C port, so not really
sure what the controller or driver is doing there.

Could you possibly check which condition in
dwc3_get_dr_mode() in drivers/usb/dwc3/core.c is triggering this?


> > +&usb2phy_otg {
> > +	status =3D "okay";
> > +};
>=20
> OTG port missing: `vbus-supply =3D <&vcc5v0_usb_otg>;` [1]

I've added the supply now.


Thanks for testing
Heiko



