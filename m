Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7560DCAC5B9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 15:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IsJOyWxYTnSzM823W7VRWdUdPLOKig+uzT39p4FJXVw=; b=VZ6inPMvWPqsB0z84OpSpmq0c0
	u16ZGgRgoa1qQ8sJS366WhNYSxwzNB3GkMHyuK4XEZkkSUf29UFXv845TgbFxILH97p8nlzlTioT1
	R762LhIRzogqP24EHuYsh1vqY40SAuOz9XOGJx1ay4RlGahNZGaZj6/5zZsW1vtTCIWjTT+BIKf3a
	Q1bZebWLAHVM/S5/SUyt4KT597DyVX/5P/u5yi6jvgWTTC65n20vWbr1pYP8FBxgvlGYywKflbq10
	sLtmWHp6xPYdzKFlwr28LUsbqvtmCtf3xi4hm3cwduC3KGPy5zVkQ7LUBcm+SJKGhOabEEIim5bAB
	PBxmTUhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3FyS-00000002o0D-3Fi0;
	Mon, 29 Sep 2025 15:39:36 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3FyQ-00000002nzm-2QTQ;
	Mon, 29 Sep 2025 15:39:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=IsJOyWxYTnSzM823W7VRWdUdPLOKig+uzT39p4FJXVw=; b=VWWA0KnMv1KRO+v0x0Pgoe4jJL
	Q0z7nv9BmMZQC1tgtRC6yObi66xEw8xnvKEcur2X2k4CCkq5ddT2YHB2bqniNnmHTHb92waqUnD0X
	ZH2S4QACc2L/mpeYv3zV1Tf3GKSwX47He0qRIg2ZNLdjgGvrjOFAtPBmeo+j3OpR14Z92J+QvRO++
	4nRsM2gQk0iicjDOGB62XT63NlY/gpGSsULrPsfGHMPMP38qOQVA6IMzFHtKrDz/BjxyZRBhp3MGV
	aAhCSEFUjMULfwPBTeUiglSdd9BAItwct2FipqTda3/9Bf3VAkeBY6hptTSGRglGPORmfQFFRgC8b
	7+NHyJ1Q==;
Received: from e227-076.eduroam.tuwien.ac.at ([128.130.227.76] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1v3FyJ-0008A3-Fe; Mon, 29 Sep 2025 17:39:27 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: guptarud@gmail.com, Dragan Simic <dsimic@manjaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Ondrej Jirman <megi@xff.cz>,
 Martijn Braam <martijn@brixit.nl>,
 Kamil =?UTF-8?B?VHJ6Y2nFhHNraQ==?= <ayufan@ayufan.eu>,
 "Leonardo G. Trombetta" <lgtrombetta@gmx.com>
Subject: Re: [PATCH v4 0/4] Upstreaming Pinephone Pro Patches
Date: Mon, 29 Sep 2025 17:39:26 +0200
Message-ID: <8606261.29KlJPOoH8@phil>
In-Reply-To: <49dafe9afc5962d8fec10e6135c9b84d@manjaro.org>
References: <20250929-ppp_light_accel_mag_vol-down-v4-0-6598f22d3451@gmail.com>
 <49dafe9afc5962d8fec10e6135c9b84d@manjaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_083934_636874_E15BD477 
X-CRM114-Status: GOOD (  15.57  )
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

Am Montag, 29. September 2025, 10:32:59 Mitteleurop=C3=A4ische Sommerzeit s=
chrieb Dragan Simic:
> Hello Rudraksha,
>=20
> On 2025-09-29 09:35, Rudraksha Gupta via B4 Relay wrote:
> >       arm64: dts: rk3399-pinephone-pro: Add light/proximity sensor=20
> > support
> >       arm64: dts: rk3399-pinephone-pro: Add accelerometer sensor=20
> > support
> >       arm64: dts: rk3399-pinephone-pro: Add magnetometer sensor support
> >       arm64: dts: rk3399-pinephone-pro: Fix voltage threshold for=20
> > volume keys
>=20
> Please note that the patch summaries/subjects are still a bit
> wrong in the v4 of this series, because there should be no
> "rk3399-pinephone-pro:" prefixes in them.
>=20
> You can always check the commit history for the file you're
> editing, to see what's the expected format of the patch summary.
> It differs a bit between the subsystems and architectures, so
> it should always be checked.

for reference for Rockchip dts files, the preferred format is:
arm64: dts: rockchip: Do something on boardname

aka "arm64: dts: rockchip: " and the rest is free form but should
mention the board.

But I'll generally fix those up myself if needed, so right now
there is no need to resend just for that change.


Heiko



