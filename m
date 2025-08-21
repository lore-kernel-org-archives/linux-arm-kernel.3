Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7EF4CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 23:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BMkb1buTvlUfPqvdGmKnTZ6PYBXWNXgx6s2vhkMyY84=; b=tI2UKvDfXy76pEcyUnU74hyGbL
	8Hv3k9iyABv4LVuBmfeNbOmT7w55nXn6Ci9h2yh+vWGsnhwzMDT9Wvp817kOggsrzEWY2xbZ/ek2H
	fwccvFrRYNZ3gYKaGrs8hL/xn0TwpRSd6s6Tde2gQzgkc3tE7456bZNnCJeo80PFtn5QPsmkBCcTW
	iCuZLLC/8yxP0vmYho+kAI1ww9qM7DwCiTcgTN4PtAOju3wfYd13VnI3NYv/YeB3LLa9bMt6kcvx/
	K/56hOeCSEgoEuylchoN9YthMIPdy8BwU6TLMwgppuJyrs4UP9+oL2Iy+tsT08sDI2j59u8Diay5g
	Hko3hPuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upEtR-00000000x6J-2mZI;
	Thu, 21 Aug 2025 23:40:29 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up9yc-00000000AKT-2WcK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 18:25:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=BMkb1buTvlUfPqvdGmKnTZ6PYBXWNXgx6s2vhkMyY84=; b=gyeHZKLK5S2Dq4VaZyLTGgq+q9
	AnRcfuoZvy9rHNpDM1DSUzVP5zPgVOlItlZoAv2VgTdtI6pd9HXPoYTpfF/heAKCL2niw8sGjL8ht
	nVSbl3dIT0fx7o02PJW7oCl6+alHHUlNxD0PBr+hipbneDarsZqdTFl4BesNeTR4CD8Q=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1up9yT-005U9b-Sq; Thu, 21 Aug 2025 20:25:21 +0200
Date: Thu, 21 Aug 2025 20:25:21 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Gregory Clement <gregory.clement@bootlin.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [PATCH v2] ARM64: dts: mcbin: fix SATA ports on Macchiatobin
Message-ID: <4d7d6e91-7ebe-4efa-8c52-949004a20812@lunn.ch>
References: <E1up9Jw-00BbOE-VC@rmk-PC.armlinux.org.uk>
 <aKdgHGElBEyHeP67@shell.armlinux.org.uk>
 <A598C273-6EEA-4F86-8E5E-A07F80295AA6@public-files.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <A598C273-6EEA-4F86-8E5E-A07F80295AA6@public-files.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_112530_640117_8531191E 
X-CRM114-Status: GOOD (  11.78  )
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

> Hi,
> 
> I sent it at least twice..maybe this new was added in between.
> But i have no marvell board for testing so i cannot verify my changes are correct.
> I only tried to fix binding errors.
> regards Frank

You might be able to use ./scripts/dtc/dtx_diff

Generate the DTB before the change and after, and they should be
identical if the disable in the dtsi is correctly re-enabled in the
.dts file.

It would be good to check all Marvell DT blobs, both arm and arm64.

     Andrew

