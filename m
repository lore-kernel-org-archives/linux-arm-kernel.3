Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2728C55172
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 05:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0zyImKWqChWg64BRinKUqCmM80XKHS+TQ7R7MDBDEAI=; b=Cjo2Y4rt7D/yaTrBFCAKnbjSht
	EL1T/R2SG3+0vBp9GwairF6uQXa2qgZtkeOwiMYTkn4V1/Tz/ZB55xEW1xp4ixSAT41sVBkOjg51x
	gg4j1yjUTyDkriaQNx09R+Rp//Gb9oeEAp2ruTt6Ju9wvq7TQ2umFDH0AW/sbqp5k3Tw2E/bsq+NO
	koEIKZs3lM3e/7RVDgQ5GLOgl0HzoGAd+tqZ9t1TwF9HxAjEN2hYpM6A9dvWhaUyFoh0wPyk8g18U
	opb7HH1g2ZlVfBikTpZ2B167xO3jizjn09nIzVE9cX35gw/Gk/hoKz/p2yPVITbxP0Lniom7yKlYX
	7sqtSSpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr7Sw-0000000120K-1YK6;
	Tue, 04 Aug 2026 05:13:26 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr7St-000000011zo-3Yq8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 05:13:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1785820401;
	bh=0zyImKWqChWg64BRinKUqCmM80XKHS+TQ7R7MDBDEAI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=SeuVWyW63EDw3w3sBXJnGaJfGnsyqrG5HcucHOA94P/95jxP5Gma+01cwpWXoLENe
	 3mebM61BstbCtSWm0p163Fs5AjN4op67t0lx+GAJQ1qXmiI8kCOIAtW7tPb1C+5jAq
	 F2UfaTLzpgkl/NFQstxsnDYawHBYRt8I+vto8tM2vvFRWvszh5RGNFd8lP0Pzphog5
	 6fUxwsUuCVE8Ej69zbaLUm/x/k13v70yaYQSnFVr6YWYCTlHoZELCizxMCF/pV5qz3
	 3k8AZQ+NZzWwxN1HXHuIDm/CUqpLPguwm44OXpPklXlBQmICIArEVd0A7efgyOl8ch
	 IYszW99+2LG/Q==
Received: from [192.168.68.117] (unknown [180.150.113.112])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id B20A6655A9;
	Tue,  4 Aug 2026 13:13:19 +0800 (AWST)
Message-ID: <6da6d2fa5111e479aeefd62da70974601acccb96.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2 RESEND] arm64: dts: nuvoton: ma35d1: add CAN nodes
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Jacky Huang <ychuang570808@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
 Zi-Yu Chen <zychennvt@gmail.com>
Cc: soc@lists.linux.dev, Jacky Huang <ychuang3@nuvoton.com>,
 schung@nuvoton.com,  Rob Herring <robh@kernel.org>, krzk+dt@kernel.org,
 Conor Dooley <conor+dt@kernel.org>, 	linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org
Date: Tue, 04 Aug 2026 14:43:19 +0930
In-Reply-To: <825a3a1b-8891-4172-afd6-8de6077fa129@gmail.com>
References: <20260708082457.460710-1-zychennvt@gmail.com>
	 <5f2954e4-2e0c-40d0-b67f-933446c83cc1@app.fastmail.com>
	 <825a3a1b-8891-4172-afd6-8de6077fa129@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_221324_079435_25C45B0E 
X-CRM114-Status: GOOD (  11.82  )
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

Hi all,

On Mon, 2026-07-13 at 10:57 +0800, Jacky Huang wrote:
> Hi Arnd,
>=20
> Thanks for the clarification.
>=20
> Shan-Chun and I are still maintaining the MA35 platform.
>=20
> I have reviewed this patch and it looks good to me.
>=20
> Reviewed-by: Jacky Huang <ychuang3@nuvoton.com>
>=20
> We agree that the current maintenance path for MA35 could be clearer.
> We will work on making the MA35 maintenance flow more transparent.

I discussed this with Jacky off-list. Going forward I'll take MA35
patches with R-b tags from Jacky and Zi-Yu through the BMC tree to keep
things simple.

I'll pick up v2 for the next merge window if there are no other issues
with it.

Andrew

