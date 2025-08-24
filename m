Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEEF2CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Aug 2025 06:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VZCaMapTETng5pIytVlEMZBY5TruZH+760du3o1zOpA=; b=ziFOaogtPF6o8wcsiTNwEHZvQQ
	uNCTM4eT+4nl8LQsMd+Usvtm4GWx+Uv09V+3AXneXiRJ5TpIjzlxp2CrXZTCfjq9Hb2KwdDQl/M/Q
	JEKSWL8wnOX+ycmb69NfdKa+RFO7IsQbQ8RzpLTN7Gr2Xs/MjnAOaGRQ6lvbw0MJpcu5eqHUqxi11
	rHe9NNSXseP9DrUo2trN71UuIFzgfk6tQbjNtSYu+CaH1heTDh1WXCaNxeAhJJ6Sjg5gOhwy4pdMr
	VqihviRBz3AjcWVJ43KbHUyXCCPtJofBfrb845YR5pNRh3t7dvVBcbhp98mTi71u4NEbLd3535vhg
	Pr53K6ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uq4Sk-00000005mlN-46rO;
	Sun, 24 Aug 2025 06:44:22 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uq4Q8-00000005mgF-0lyH;
	Sun, 24 Aug 2025 06:41:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=VZCaMapTETng5pIytVlEMZBY5TruZH+760du3o1zOpA=; b=B7OGi2FbZnIosyM5CTBNRrnNKH
	eKExY8+NIQyIVYn8PaHlqmcoXZhRWWjD1f9czvj4Q/fTXfS7RrPvP5WZGz7Eereqnw2FDXvFldL4G
	JvcHyBM72S2YdAcbpKYRGQDj3H7I/FsqqJZnyZI+Q0XvSjsInDm7iWgG6yKHOqhRYD5oy7SSXJaHj
	OaJpdhCCYGBCFo+/zd1fTak8eHrqgauBfoWMj5zTegBFvOqFn3ynxjeXzPkkA/hhT/g5xFaVfTtAC
	ow479OHIuOwfeOJ0ri3/20piHCMKpahgSRUJ2eYSn/Lrawb9LPGIIi2eCAIOINGq3qyWbiOoKv5GK
	EWTT/clQ==;
Received: from [212.111.254.164] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uq4Px-0007JE-D7; Sun, 24 Aug 2025 08:41:29 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Chukun Pan <amadeus@jmu.edu.cn>, FUKAUMI Naoki <naoki@radxa.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 2/3] arm64: dts: rockchip: remove vcc_3v3_pmu regulator for
 Radxa E52C
Date: Sun, 24 Aug 2025 08:41:28 +0200
Message-ID: <7988840.GXAFRqVoOG@phil>
In-Reply-To: <0318E801E3D6726D+65c4f189-4e22-4a9b-83d7-cbb0816df373@radxa.com>
References: <BCD8E43E564BC334+1e45d36f-edc7-4c3c-90c9-7b0f2a52360f@radxa.com>
 <20250819134028.634780-1-amadeus@jmu.edu.cn>
 <0318E801E3D6726D+65c4f189-4e22-4a9b-83d7-cbb0816df373@radxa.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250823_234140_221622_6A756703 
X-CRM114-Status: GOOD (  15.99  )
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

Am Mittwoch, 20. August 2025, 04:10:24 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb FUKAUMI Naoki:
> Hi Chukun,
>=20
> On 8/19/25 22:40, Chukun Pan wrote:
> > Hi,
> >=20
> >> How about the following instead?
> >>
> >> @@ -538,7 +538,7 @@ regulator-state-mem {
> >> 				};
> >> 			};
> >>
> >> -			vcc_3v3_s3: dcdc-reg8 {
> >> +			vcc_3v3_pmu: vcc_3v3_s3: dcdc-reg8 {
> >> 				regulator-name =3D "vcc_3v3_s3";
> >> 				regulator-always-on;
> >> 				regulator-boot-on;
> >=20
> > On rk356x, the Flash chip is usually powered by VCCIO_FLASH, which
> > is also connected through a 0 ohm resistor, so I didn't write like
> > this. e.g. https://github.com/torvalds/linux/commit/a706a593cb19
>=20
> I think it should match the schematic, i.e. it should be "vcc-supply =3D=
=20
> <&vccio_flash>;".

I very much agree :-) .

Having at least the phandle match the schematics nameing is very helpful
when someone tries to look something up between those two.


Heiko



