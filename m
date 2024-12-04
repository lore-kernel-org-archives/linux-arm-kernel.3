Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74B40E7716E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 15:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E62FsyMAcmSi/iRaaQV/SsddF5jf4yfqk5/NdWw/RL8=; b=DhTiStR/uDHDNf/hnGooxkNcHP
	keEpnzmwfwDStQVF6wa3vA2XRKnd9IWYQc+0/Mm4U0IMwhz4VdS3NsdyenNhzXg719YP8TTjXtldm
	1ApJbwOHxt/wnniBSNdEVcl+EOgnCXaX6D8IwS9pcAjEcMMBZBpxztgg0jTllvonFo1RAKdB9knKH
	cSVQ/LeP8jRWqID6b60RJRFGt5K6nT5C6prteaqbJ0pNw36RJRE6lsaPhNxVDGF2S0n/5uRH2hkxO
	Dv3rE+5M9oZzD8pxULU/M454F1FLZZyhB0zSVTosgY/ogq3a6xmOXzQJquBGjQxSsslRUYJzlg6Ip
	9BnH1USA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIre4-0000000D3NL-0MWY;
	Wed, 04 Dec 2024 15:50:32 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIrcc-0000000D363-2mFw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 15:49:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=E62FsyMAcmSi/iRaaQV/SsddF5jf4yfqk5/NdWw/RL8=; b=Xbi39iYMj6AG15Gq293oTRONvV
	VkHNEUZysnXc2W4Ng5hGEqIUKBdmCxeAEcIZl9arkR3bsb28S+F1dy3re/uIzvgcnCUeTTMCycKF1
	ig+378vztjY9hOxk5Np+rwZ87veFnBUfGi6JGtEpMFvGtBxaGNJ3z+MbUGwZNsNUqNC8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tIrcY-00FE37-Pv; Wed, 04 Dec 2024 16:48:58 +0100
Date: Wed, 4 Dec 2024 16:48:58 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>, Aaro Koskinen <aaro.koskinen@iki.fi>,
	Ard Biesheuvel <ardb@kernel.org>, Daniel Mack <daniel@zonque.org>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	"Jeremy J. Peper" <jeremy@jeremypeper.com>,
	Kristoffer Ericson <kristoffer.ericson@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	Ralph Siemsen <ralph.siemsen@linaro.org>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Russell King <linux@armlinux.org.uk>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH 12/15] ARM: orion5x: mark all board files as deprecated
Message-ID: <11006329-8f7c-4c8d-8754-cd1a068490e2@lunn.ch>
References: <20241204102904.1863796-1-arnd@kernel.org>
 <20241204102904.1863796-13-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241204102904.1863796-13-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_074902_696856_116159D7 
X-CRM114-Status: GOOD (  17.34  )
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

On Wed, Dec 04, 2024 at 11:29:01AM +0100, Arnd Bergmann wrote:
61;7801;1c> From: Arnd Bergmann <arnd@arndb.de>
> 
> Conversion of the old orion5x board files to devicetree has
> stalled over the past few years, so it seems better to remove
> the remaining ones in order to allow  cleaning up the device
> drivers.
> 
> Debian has previously removed the orion/kirkwood kernel
> binary from the armel distro, but building custom kernels
> from the Debian source code should keep working, so
> removing the board files after the 6.12 release ensures
> that this remains possible for the Debian Trixie release,
> assuming this will use the 6.12 LTS kernel.
> 
> Jeremy Peper still plans to convert the Terastation 2 Pro
> to devicetree in the future, but that can be done even
> after it is removed.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

