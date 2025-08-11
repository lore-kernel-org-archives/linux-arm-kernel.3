Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF10AC87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 13:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zqifTpDaQhWEUMpUlGKro4a6sMf2oQed5RETrkmaP4A=; b=ryIjJhp5/Ap9uykvlSE5ywVRnO
	0F3v4W5p70qKqNRfHucnbBeGGwojE9jH0w7C/aLYjWVDtXao5ho40yDX3iMhr+GhBK9UU4EQDQnVU
	uEmdxaSkNFB0zZDSu9Ui+Yi0Q5UJZBo0aPlZIU/pBfoZn/9AWhMm8lAVTqewq0n8wHVGpUHm3nCR6
	5yafJPnChmzab3HqC5Z392aQmBalbm4TZ6i0+ewQYUDCSNfu5+nw8GIDrTz45Gccfb4L5CuT1b+b1
	/ywWHwyHB0fzWsYSSKclZNEXPQrpTSqvnn4pGFRfJb+cHqN5y1RioILT7o4K4K3xD10dCZ/69NQjs
	NGhveoSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulSKI-00000007mEI-48i4;
	Mon, 11 Aug 2025 13:12:34 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulSBo-00000007kxn-2NTc;
	Mon, 11 Aug 2025 13:03:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=zqifTpDaQhWEUMpUlGKro4a6sMf2oQed5RETrkmaP4A=; b=jB7ocoBy0jyhkKMHmY6LE+HubP
	c4Mr/18h967h9VLLwinMbOjQI4AVp+uWE3NZ3O/7k4HjyrqN050E+B3EXHuRkACnGbqvtr1goE0VR
	LqGupZiZbYisc6eOX21769LVJR25mbO93JBN5rgDOi/r1AddDoIDaBhtXwk9nfaeR8+fGFmDnZkkb
	iqxW0Opt8IQUCQtx4IdlPlyOlbsb1Fbs+8pivjENBioDb7ou2lQDMHWKBVq7poKkdVDRL2wuIPLTw
	pGzD+4n2F2cx6HNx+IpxM4UcG9sd1uG584j+G3t5cGrFp7ON3y2rJhVySpEfaCBEG7fly0we3ofo6
	NLvsSDTw==;
Received: from i53875a0c.versanet.de ([83.135.90.12] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1ulSBb-0001JS-NF; Mon, 11 Aug 2025 15:03:35 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: amadeus@jmu.edu.cn, conor+dt@kernel.org, devicetree@vger.kernel.org,
 krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 naoki@radxa.com, robh@kernel.org
Subject: Re: [PATCH 1/3] arm64: dts: rockchip: disable display subsystem for Radxa
 E52C
Date: Mon, 11 Aug 2025 15:03:34 +0200
Message-ID: <2784232.uZKlY2gecq@diego>
In-Reply-To: <20250811130108.462673-1-amadeus@jmu.edu.cn>
References: <3125650.687JKscXgg@diego> <20250811130108.462673-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_060348_627563_467236B6 
X-CRM114-Status: GOOD (  15.36  )
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

Am Montag, 11. August 2025, 15:01:08 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Chukun Pan:
> > What actual problem does this fix?
> >
> > For example we also enable on-soc iommus all the time, because they're
> > on the soc and don't need board-level properties.
> >
> > The "display-subsystem" without users looks mostly in the same spot.
> >
> > So I do expect a description of what problem gets fixed that this needs
> > to be disabled.
>=20
> Disable the display-subsystem to remove this error log:
> [    1.382440] rockchip-drm display-subsystem: [drm:0xffffa3985873555c] *=
ERROR* No available vop found for display-subsystem.

ok, that makes sense then

> I will improve the commit message in v2. Do I need to remove the Fixes ta=
g?

Nope, please keep the fixes tag

Thanks
Heiko



