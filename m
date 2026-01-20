Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C850ED2ECF7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 08:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dxgtuw6/eiHYsPsz91G2+s/blRfxmN8N4VduCGdXThM=; b=4UUtlHqp20izChFdobDP7jnvf0
	y/2lUnmorVp6ccfHQaWrHtKFzZNF9MqrugjEy/oCop2ZaWVkof7z3rj4+CSV9zfTzWBD2XT/JIesU
	gSbmIhrr0mY/aev8wY0Y7+5HEuMKUrz2dUqLQbSTUOUXCRHHtrUgzkJTq/AemAUwDamf/xla1veYr
	nbJuHIk/ZBR3fGV1vigYKfidiIL7F8wGtzUBB7TtUPOPLJibrKrFW27fOD1KQ1cJfnvZfqsS61j1u
	cSiCLulGcN3grFYLmxJmMU+oAIsjGkrSgrwf7jjFOss8gCRIFXY0WKqT+l+FYozJSEQ7RxJcED4JR
	pz6pHRJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi7X0-00000003UkR-46Ul;
	Tue, 20 Jan 2026 08:56:11 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi7Wy-00000003Ujf-1Bxu;
	Tue, 20 Jan 2026 08:56:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=dxgtuw6/eiHYsPsz91G2+s/blRfxmN8N4VduCGdXThM=; b=EEUU3TtcX15TaXsTpy+efUZgnr
	GvRN3Wul0JrdfXvzmqZFYEm9I5Uuv2B2EaNTsD6vtuVQ2+71/Bp0nMxYDfQreGXBBUP8E75DD691R
	sAIRMetPw+PlnHZgC9fXRBVhvGFkXks8VAGKpYofCqbwcrnGs2p5BTnF2BLcVEKn8IjMgEHdbP4kL
	vuJxuwoN8jvH8O5oN6rX7N6gVXJ1b2PMiViNfcUxHagz6JNq/xpOXqaAQAnK0ZGMXv6M0VDImvFsR
	LMq0DtfiImIzlNlKYk4TEmnqJ22gXd2Z3+oQymTtqHxJ9fB9TTcxhaeEAlz4ysIznmFaON5yNz4x1
	QaakdUVA==;
Received: from [192.76.154.230] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vi7Wm-003K6A-Kw; Tue, 20 Jan 2026 09:55:57 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Alexey Charkov <alchark@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Manivannan Sadhasivam <mani@kernel.org>, Shawn Lin <shawn.lin@rock-chips.com>
Cc: shawn.lin@rock-chips.com, Quentin Schulz <quentin.schulz@cherry.de>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Explicitly request UFS reset pin on RK3576
Date: Tue, 20 Jan 2026 09:55:56 +0100
Message-ID: <5743823.mogB4TqSGs@phil>
In-Reply-To: <6479d7b8-7712-4181-9c82-0021da94d1a8@rock-chips.com>
References: <20260119-ufs-rst-v1-1-c8e96493948c@gmail.com>
 <6479d7b8-7712-4181-9c82-0021da94d1a8@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_005608_362836_B80C22A8 
X-CRM114-Status: GOOD (  24.03  )
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

Am Dienstag, 20. Januar 2026, 02:39:28 Mitteleurop=C3=A4ische Normalzeit sc=
hrieb Shawn Lin:
> =E5=9C=A8 2026/01/19 =E6=98=9F=E6=9C=9F=E4=B8=80 17:22, Alexey Charkov =
=E5=86=99=E9=81=93:
> > Rockchip RK3576 UFS controller uses a dedicated pin to reset the connec=
ted
> > UFS device, which can operate either in a hardware controlled mode or a=
s a
> > GPIO pin.
> >=20
>=20
> It's the only one 1.2V IO could be used on RK3576 to reset ufs devices,
> except ufs refclk. So it's a dedicated pin for sure if using ufs, that's
> why we put it into rk3576.dtsi.
>=20
> > Power-on default is GPIO mode, but the boot ROM reconfigures it to a
> > hardware controlled mode if it uses UFS to load the next boot stage.
> >=20
>=20
> ROM code could be specific, but the linux/loader driver is compatible=EF=
=BC=8C
> so for the coming SoCs, with more 1.2V IO could be used, it's more
> flexible to use gpio-based instead of hardware controlled(of course,
> move reset pinctrl settings into board dts).
>=20
> > Given that existing bindings (and rk3576.dtsi) expect a GPIO-controlled
> > device reset, request the required pin config explicitly.
> >=20
> > This doesn't appear to affect Linux, but it does affect U-boot:
> >=20
>=20
> IIUC, it's more or less a fix for loader, more precisely U-boot here?
> I'm not entirely certain about the handling here, is it standard
> convention to add a fixes tag in this context?

Yes, a fixes tag is warranted here, in Linux it "only" fixes a potential
issue due to the mismatch between pinconfig and gpio during probe.

nce this patch then enters the kernel, it can be cherry-picked to
the current u-boot development cycle. I don't think u-boot is doing
stable releases though, so U-Boot will only profit for the next
version where this is included.

Heiko



