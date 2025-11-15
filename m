Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CB25CEB2D2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Nov 2025 19:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rCnLinFSCuqBJDyfqX+tMbAqkI3HnLPnZBm6nawq29I=; b=tkH1pS1y6ZqDo/uKpnjlpZF+TM
	E6C454KC0FW3Z0ndAfX9DZ12OpacV2/X4qMXxMimy5wFUStz1BJ9wsz6U7owidzXhwv9nEoC828zo
	KPMOE0MZL81e7kjuFXPPAXVgsEga7VEs+uJBSFe0XhjWaD5v82a5gu9P9la7kCA37K48uwbHpEpHf
	pxTDph4m6zIwRk0q7Tzddi1UDRHAOvVmp6T3LXnenbk9AAq64np8CnKUJbXA1aBV6G4zoLFA6Dfi9
	yL2XCQuM9I70u49Q3AwXsq6XARzghit5XFt+DEinor7nIuaqzNjmSAphXAOoOuUkzLjoX1HY3WbtI
	vghqSh/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKMKr-0000000E26s-015m;
	Sat, 15 Nov 2025 19:53:25 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKMKo-0000000E26Q-1C6k;
	Sat, 15 Nov 2025 19:53:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=rCnLinFSCuqBJDyfqX+tMbAqkI3HnLPnZBm6nawq29I=; b=PlMCL/QMATDToyk283lXVcUG4b
	dg+oiL5O+e164xittfMKOqOLXsDOV7rVdOi8R4/OqDeIqWxu1kwFuNvLTZBzyvDuzwhMbvePqHLsd
	FJWRlOuR9JPf7q4E2j/dPE+1Qn6bcCcLjWyxh5QRU2fhMDQr29apUYxBOM+qkFmAC1tSl9hjUbouJ
	L7GSsjr3MmakPY100yy6ybzhGJKkJyll8iDT8YgXxG/lbkINjlFCHLG0N+N8xxSHi1bZ25ASWFjOR
	tZEH2yWUPSVe3Ysli+SEtYm+fJLX1X+QC3nn9C9M7dOccrpaejKhFPHleaBXiP+osr8py2gJiyPVP
	YS4RezbA==;
Received: from i53875bd0.versanet.de ([83.135.91.208] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vKMKf-0000BN-5F; Sat, 15 Nov 2025 20:53:13 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: amadeus@jmu.edu.cn, conor+dt@kernel.org, devicetree@vger.kernel.org,
 krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 robh@kernel.org
Subject: Re: (subset) [PATCH 1/6] arm64: dts: rockchip: add mmc aliases for 100ASK
 DshanPi A1
Date: Sat, 15 Nov 2025 20:53:12 +0100
Message-ID: <2251982.Mh6RI2rZIc@diego>
In-Reply-To: <20251115150010.1052575-1-amadeus@jmu.edu.cn>
References: <176307502906.495066.9339764118786240746.b4-ty@sntech.de>
 <20251115150010.1052575-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251115_115322_366736_CC830D04 
X-CRM114-Status: GOOD (  11.34  )
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

Am Samstag, 15. November 2025, 16:00:10 Mitteleurop=C3=A4ische Normalzeit s=
chrieb Chukun Pan:
> > Applied, thanks!
>=20
> > [4/6] arm64: dts: rockchip: fixes supply for 100ASK DshanPi A1
> >       commit: 621bb09a76fa12a9e61c9d745ae524db86abf781
>=20
> Sorry, I don't know if this is a problem:
>=20
> The commit message started with an extra ">".
>=20
> >From the schematic, the supply of ES8388 chip and the vmmc-supply
> of SD card both originate from the VCC3V3_S0 regulator, fix it.
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git/=
commit/?id=3D621bb09a76fa12a9e61c9d745ae524db86abf781

thanks for noticing this. I've now edited the commit message in place
to fix that.

Heiko



