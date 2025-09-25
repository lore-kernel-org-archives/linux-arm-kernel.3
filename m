Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1A9DCAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 09:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=76q1OAIbWzsCuKoQwsNyMbJZPYklly4WZ986Ya6JeA4=; b=UDdTpU6H0K4DntsCcQi5npeJ2X
	ILtNrmDnxXcJunKjBqJYQAymN1Y1gJeFXPiJC5UM3Z0233kQ0wQz/uo9z709txwYUQD9BmC4NamO/
	IlMFXiSF9Nyz20Y7Ci8XKTJKgACxQDSB4pM4eSra7SpOZqmptFdpiVL06qUjfldLe/0Y0Pn+1MPlO
	e0Um2G/Xoxt1FD+PpIJygXS9QLyZ/DJP62AaVLvZWKhoOmY9f+dFV16w4+PWG3ZmA1cZm2aSjd/s7
	r7rcL9Ob+WDTqXBTxHX4RkIDl6YYKckrpRmmNkf45wKxbKGcvZgo1UdaGye4sdkTEHDOLin/29s47
	1hYCwySQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1iFd-00000007avb-20mW;
	Thu, 25 Sep 2025 09:26:57 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1iFb-00000007aug-0UdR;
	Thu, 25 Sep 2025 09:26:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=76q1OAIbWzsCuKoQwsNyMbJZPYklly4WZ986Ya6JeA4=; b=s6RMm+4h6CxXXGd4nuCdWwwZhb
	3cMJIRtOA+1IzJ3XrBcy7tY+wNR8uNj8KB1shy/sVyqHiMTKVtcEBYwrN7D2BrQW/g9lZNKpOO0Mz
	sWPWmocZIsm5docjMWQW/gDkrLdEvf1h0JoegVhvTOpxviENR2vRPJn7XaQc1OpDvA4B+IiDIgN6r
	21cctmRbuprrDDZWO1dslwRIzVsqcIsvdOgcbuoRat/9uvc/mOZclN5RgbfgY0q/shTzfPihxpwr+
	YbXJMYADcLS0yMc5HZH3XBfA6A7qSpwhSF4ugCcvcOl8QkF2iqQ05bampl2rpVS/zjXD0cVf5O40M
	sY8BTiLQ==;
Received: from i53875a54.versanet.de ([83.135.90.84] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1v1iFE-0001MQ-H3; Thu, 25 Sep 2025 11:26:32 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 quentin.schulz@cherry.de, kever.yang@rock-chips.com, naoki@radxa.com,
 honyuenkwun@gmail.com, inindev@gmail.com, ivan8215145640@gmail.com,
 neil.armstrong@linaro.org, mani@kernel.org, dsimic@manjaro.org,
 pbrobinson@gmail.com, alchark@gmail.com, didi.debian@cknow.org,
 jjm2473@gmail.com, jbx6244@gmail.com, Liangbin Lian <jjm2473@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] arm64: dts: rockchip: introduce LinkEase EasePi R1
Date: Thu, 25 Sep 2025 11:26:29 +0200
Message-ID: <2320204.Dhsi8hcfAM@diego>
In-Reply-To: <20250925092037.13582-1-jjm2473@gmail.com>
References: <20250925092037.13582-1-jjm2473@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_022655_174071_1E6B9152 
X-CRM114-Status: GOOD (  10.81  )
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

Am Donnerstag, 25. September 2025, 11:20:34 Mitteleurop=C3=A4ische Sommerze=
it schrieb Liangbin Lian:
> LinkEase EasePi R1 [1] is a high-performance mini router.
>=20
> Specification:
> - Rockchip RK3568
> - 2GB/4GB LPDDR4 RAM
> - 16GB on-board eMMC
> - 1x M.2 key for 2280 NVMe (PCIe 3.0)
> - 1x USB 3.0 Type-A
> - 1x USB 2.0 Type-C (for USB flashing)
> - 2x 1000 Base-T (native, RTL8211F)
> - 2x 2500 Base-T (PCIe, RTL8125B)
> - 1x HDMI 2.0 Output
> - 12v DC Jack
> - 1x Power key connected to PMIC
> - 2x LEDs (one static power supplied, one GPIO controlled)
>=20
> [1] https://doc.linkease.com/zh/guide/easepi-r1/hardware.html
>=20
> Signed-off-by: Liangbin Lian <jjm2473@gmail.com>
> ---
> Changes in v2:
> - Change deprecated "rockchip,system-power-controller" to "system-power-c=
ontroller"
> - Link to v1: https://lore.kernel.org/r/20250925055906.83375-1-jjm2473@gm=
ail.com/

general process comment,  please don't send multiple versions on the
same day.

This splits reviewers attention (possibly reviewing outdated submissions),
doesn't give people actual time to review and also just fills up inboxes :-)


Heiko



