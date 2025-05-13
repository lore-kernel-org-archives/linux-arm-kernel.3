Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03F71C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 19:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L61EUFuE+Uq6nCLl8f3dUo/UmLoSS1/cO7xG1BCxA+c=; b=IQMigCZqgqkGx0IOWnkqJoqnLC
	eKw7PWimRVB4my+AWbQdqKMif68yea4XMeNbQM1s9s5MQM0Ug8WQbgGF4ikcpRut7cqws7phMyh8l
	skj4bW80z6/ZfCzQWRNCPEmD3VDUw0/yZZDWZOy6d//Td3HC7sSzKgIOj0Xd/aMW2yatL92P0HVHp
	3HcHAzz6yr20ZIspfMbGyVzzhXzYfMvWEmaS7W14cBgmV603X6s5oS9PcqBTE0qokC54fHUlcXgYz
	imeQFdwMgen80mzrU9xjbXwsteXTNovYkW43eVOM0ngTcUT1r0RIQMZC5tU/mxr9jzQXyWhngWH63
	2QOmUfiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEv13-0000000DL0S-3GMy;
	Tue, 13 May 2025 19:10:13 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEuef-0000000DHpz-008c
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 18:47:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=L61EUFuE+Uq6nCLl8f3dUo/UmLoSS1/cO7xG1BCxA+c=; b=nF
	jfmaiBN+QXzHcGAxI2akzGtdEYv8hNnwN5bDkrKU2qOZkD3thr9CvnhfbCh9Sws/nn88v0oDli/Yw
	LghD3qJnTInrgopOeQRV3Dp1XSP7Inlufs+3/c3btAMq4FEM+LMov4OghGMahsKm5qU/X3M3paV7F
	iOCO059MV0q/rTU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uEueZ-00CULZ-Gk; Tue, 13 May 2025 20:46:59 +0200
Date: Tue, 13 May 2025 20:46:59 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Imre Kaloz <kaloz@openwrt.org>
Subject: Re: [PATCH 0/7] pinctrl: armada-37xx: a couple of small fixes
Message-ID: <f638f5ca-a479-4ab2-a8ae-6300bbe0cb08@lunn.ch>
References: <20250512-pinctrl-a37xx-fixes-v1-0-d470fb1116a5@gmail.com>
 <60ef3803-4f8b-4d9b-bef8-6cf3708af057@lunn.ch>
 <CACRpkdbqPLaBheEv1=ky1gUJ-qSsPRjR0J-UXEuhXf2Oix_EzQ@mail.gmail.com>
 <aefa5ed3-1085-4e88-b3ec-4cf9958e7e2a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aefa5ed3-1085-4e88-b3ec-4cf9958e7e2a@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_114705_041301_A3FACD7E 
X-CRM114-Status: GOOD (  18.27  )
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

On Tue, May 13, 2025 at 06:51:35PM +0200, Gabor Juhos wrote:
> 2025. 05. 13. 15:36 keltezéssel, Linus Walleij írta:
> > On Mon, May 12, 2025 at 11:33 PM Andrew Lunn <andrew@lunn.ch> wrote:
> >> On Mon, May 12, 2025 at 04:22:36PM +0200, Gabor Juhos wrote:
> >>> The series contains several small patches to fix various
> >>> issues in the pinctrl driver for Armada 3700.
> >>
> >> I'm not sure all these should be for stable. Some are clear bugs, but
> >> not propagating the errors has not bothered anybody so far, a
> >> requirement for stable.
> > 
> > So we are at -rc6 so I'm not sending these as fixes to Torvalds
> > right now unless they are super-critical.
> > 
> > I will merge this for v6.16 (-rc1) and then the stable maintainers
> > will have to decide from the point it enters mainline.
> > 
> > Gabor: can you look over the tags? Once you have decided
> > on stable/non-stable tags I will merge the series.
> 
> Sure, I will send a v2. Just a question, shall I also remove the 'Fixes' tags
> along with the 'stable' ones? If I keep those, they might land up in stable
> trees anyway.

For the return values patches, i would drop the Fixes. It is just
really continuing development work for the driver.

	Andrew

