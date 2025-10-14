Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66495CCD192
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 15:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=37Nmg2NVeBxxzfJbfuXsD1Mwnh3yE228KQ/4hDiITzo=; b=oX/STW2adDd0gU3YhiC8WG8ZOq
	4H6x2a+tw7aiKL61JWoBweH2FvcfF6bTJWAiCiV7w7TQjwU8/XSxN3ywwB0TE+4bUDyAJzk6x5FGA
	n+TI3Xx+FRWxcWGV8UISU7BCQGgtJk2+cDqdLrNZ3VNNhnUY3NixlMkjdjCkGMfdjftydaPaNRFVF
	t/12eXEsYycZk3YinvlmVpvb5ywWu4NZTA4+QQOqA6MA3eQK6d9E/MwTKsuzFvafGsHbrwUx/qxhk
	e5iEkPhEdB6dbZnGWiNMezIunZZui8jOwQ5we34ocuhAc1AmxFeL5nfL7N27hl1x9Ks4r/gTakBG5
	9XbUZaCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8ggp-0000000Glt8-1RoP;
	Tue, 14 Oct 2025 15:11:51 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8ggm-0000000Glqb-2BA0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 15:11:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=37Nmg2NVeBxxzfJbfuXsD1Mwnh3yE228KQ/4hDiITzo=; b=dPNOZ9MPtW2WVRmqQR3u2LpP6L
	uptROoyNGK69M2qy303wCSQ08YH58U2pV6nabHmV4yubRoZo3KZwD6KYU4wT/PC7p9jIp5x/zyLnv
	my7lTuyeVrrF2PsuULGhQHqYtNq+z+4Dw8VxhlwXeNUGZkU2qbO4Wukrq7DxsDDbN+P0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1v8ggM-00AvfK-Pb; Tue, 14 Oct 2025 17:11:22 +0200
Date: Tue, 14 Oct 2025 17:11:22 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Tao Ren <rentao.bupt@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Tao Ren <taoren@meta.com>
Subject: Re: [PATCH v4 11/13] ARM: dts: aspeed: facebook-fuji: Include
 facebook-fuji-data64.dts
Message-ID: <f801a4cb-3d27-439c-82f2-d5ee5aa0d810@lunn.ch>
References: <20250728055618.61616-1-rentao.bupt@gmail.com>
 <20250728055618.61616-12-rentao.bupt@gmail.com>
 <79ddc7b9-ef26-4959-9a16-aa4e006eb145@roeck-us.net>
 <aO2kLyxGlGt12sKD@fedora>
 <ea64d3c1-e517-4bd8-9a2e-56432f286347@lunn.ch>
 <4e099ead-e6df-4489-a775-1730bc852dcf@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4e099ead-e6df-4489-a775-1730bc852dcf@roeck-us.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_081148_578000_8AE62535 
X-CRM114-Status: GOOD (  14.96  )
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

> > If it is already in mainline, i don't care too much if it is wrong. We
> > don't want to cause regressions.
> > 
> > I only object when adding new nodes which are wrong. If we keep adding
> > broken nodes, there is no incentive to fix the broken driver to do the
> 
> This wasn't adding an allegedly (sorry, it worked for me) broken node,
> it was removing one that worked for me all along. Obviously I do not know
> if it worked (or if it is even used) on real hardware, but it worked for
> the fuji-bmc qemu emulation.

It probably does work on real hardware, because it is one of those
"two wrongs makes a right" cases. So i see this as a regression. The
node should not be removed. It should hopefully get corrected sometime
in the future when somebody actually fixes the aspeed driver, and
fixes both wrongs.

   Andrew

