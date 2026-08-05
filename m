Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9E34C55ABA
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 12:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8XjuuAS9qzELKWMzzGKFt00IGUUpW4MBEhvQC26pWBc=; b=rAqWLuIa39s1rVdONQ5E7DADIg
	AxcYIi02I8Rp0IblX/6Mkk6OFyklOsEi+RutFrJTXvjbyiJPv4WSZODwbHo55tIpyDD1krZhVfT8R
	EkfjzlIKvNvdADvM8j0tsuzPU/qxzeUDdNXQzXz4lY0i0E3L0eT19zuW9eVix7lQL8lp4zWTYoQNZ
	pSkoN+VKl/ySjlKJ6MhyDXqGY+ls1W9r3tJRwHKlPQavS/3r+svVNdGlTFvqqdNMVEh4CTK1+wojG
	ZX4q25kmspoq4DHOw+SDsSCdG0kLv4JPsxVTYScPyrnQHDzyN45BYHwYu/NzqNBVzneWclVunY70W
	CgSxeuGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wraeM-00000003tlN-1wld;
	Wed, 05 Aug 2026 12:23:10 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wraeK-00000003tl1-25IE;
	Wed, 05 Aug 2026 12:23:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=8XjuuAS9qzELKWMzzGKFt00IGUUpW4MBEhvQC26pWBc=; b=XY4YXHWoFxOikBgzmUK4/FQFSi
	mHJDkn1jprsIY1vu53fcnRoDUYwGNLBLyh8aA8HGBQFJevr6dktTjyoR/sOhysO/pehiL3Pl+Xfuc
	PUvomUBObKIB6exaioP9dCxSjP/mjzrFAobd7YCNCg6uQHuqyqeiR+ClP3X8w/cT+YVU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wrae7-00GAIv-J5; Wed, 05 Aug 2026 14:22:55 +0200
Date: Wed, 5 Aug 2026 14:22:55 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Heiko Stuebner <heiko@sntech.de>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH net-next v2 6/8] net: phy: add X-Powers AC300 EPHY
 control driver
Message-ID: <05af101c-62d4-4d46-b170-052487ecb681@lunn.ch>
References: <20260804-submit-acx00-of-dynamic-v1-v2-0-3eef49ff1d8c@gmail.com>
 <20260804-submit-acx00-of-dynamic-v1-v2-6-3eef49ff1d8c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804-submit-acx00-of-dynamic-v1-v2-6-3eef49ff1d8c@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_052308_550739_C546F067 
X-CRM114-Status: UNSURE (   8.30  )
X-CRM114-Notice: Please train this message.
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

On Tue, Aug 04, 2026 at 08:27:04PM -0600, James Hilliard wrote:
> The AC300 Fast Ethernet PHY needs a separate non-PHY Clause 22 endpoint
> to complete package setup before the link endpoint becomes usable.

Please use the functions in phy_package.c

    Andrew

---
pw-bot: cr

