Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E91A5D29C2E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 14:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c7Ep0GD4eG911kODoOvUPprYM2xLb7geaPpEU8Rcz+g=; b=svLY4WU/224/qNNzGJrskJ0zx6
	zaXMBLhf0Kdipdgq9bqXFry9t7n+l02jSKUIKUN16vq5C+Ho/ZG4L8sw/hb5pWgaKiFAokcN2NvSn
	uv7ROcxoWYr0DJxdXi6yA+jdMkJYGOhqvzXWrpCdOlbtRVY1tle0TBAkuJDpU9j/4f4fZycs32YhT
	hrlcdBbku8rPxVMh7DCls+GKIIgsBCoGPu7gbf+iOX55W/LKUGW+0XTVt6h9wEi+EJ+Nar41WFKbn
	pGC2bgW6TY5qKWfB0gEFySHgQa7A0Pp6BFvHYHXMTRbd9MlK738M7m7O+d9cKQDWTAgsyTwd+NIDF
	imPWKqnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhq7r-00000002Eib-3Bbh;
	Mon, 19 Jan 2026 14:21:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhq7o-00000002Ehb-07mZ
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 19 Jan 2026 14:21:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=c7Ep0GD4eG911kODoOvUPprYM2xLb7geaPpEU8Rcz+g=; b=CdKV+M276T3j8WIj/XFiLDjice
	yeYQ+M108mNqXuxXkbfPoGmJ0d9OLuZenHGUChxM6oxtGngj7dzXzL8/Ke6teXfI/15wHdV3HaXif
	mCVSXLviDx5cpwbGmrLC/U6ow2gmdZd07sCjWqDEZxWtcUlOBumTSHaVmmgmmKVOMVUJmtV09gAm/
	Lg5jNxehBqjoBsmr6pcGaxC/yr+4D3x17IxF5cS+o5wLpjR6//5ZcWmZuIKj+VwYDKZrQG4OR0DId
	NrvkLvXns6W2BBNSZrVtF77yrhlUlPvNqNqlvmF/8pZaESnwNNADHbvaRzB5KnRU8id5isJPffCkn
	rSDBs0Xw==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhq7l-0000000CFOx-03HP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 14:20:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=c7Ep0GD4eG911kODoOvUPprYM2xLb7geaPpEU8Rcz+g=; b=CA3py8ftIBYki7YqehhBkcUCAE
	Jq7C+1KCwjIrVDFC+GK3VKxuTunuovVb/OOJLH4mvTDrjY9ZYAsq64o/VUCK+zUCJVX18CKCiZgwJ
	nlEuzXZNNYKP51fFNdGzccFRUqUQ3D7Cv9ycIXAkCOtHHRr9Ap3iqOw2o8Cp1r46+4wU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vhq7T-003VPQ-Ln; Mon, 19 Jan 2026 15:20:39 +0100
Date: Mon, 19 Jan 2026 15:20:39 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Andrew Jeffery <andrew@aj.id.au>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	BMC-SW <BMC-SW@aspeedtech.com>
Subject: Re: [PATCH 3/5] gpio: aspeed-sgpio: Create llops to handle hardware
 access
Message-ID: <bb5bdcf2-6bd3-49c7-b3e5-210b7f332137@lunn.ch>
References: <20260117-upstream_sgpio-v1-0-850ef3ffb680@aspeedtech.com>
 <20260117-upstream_sgpio-v1-3-850ef3ffb680@aspeedtech.com>
 <55fbb766-12b5-441a-b06c-d807097e5476@lunn.ch>
 <OSQPR06MB725219B6ED261DBB4E8BC33D8B88A@OSQPR06MB7252.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OSQPR06MB725219B6ED261DBB4E8BC33D8B88A@OSQPR06MB7252.apcprd06.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_142057_181452_90F52DB0 
X-CRM114-Status: UNSURE (   8.06  )
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

> We did consider regmap. However, llops is intended to abstract not only
> register
> 
> access but also layout-specific bit mapping, which is difficult to express
> 
> cleanly with a flat regmap interface.

O.K. I was just thinking, if you can swap to regmap, you could maybe
then go one step further and use gpio_regmap_register(). But if you
have extra logic in here, that will not work.

     Andrew

