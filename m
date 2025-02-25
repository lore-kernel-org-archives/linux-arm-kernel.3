Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A15D4C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 16:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e3VmXvqmgpmlkacg4yCqG6k/DWw/7LO2D1NyxSJiktc=; b=IYVu/rIIhDXpzLhCHdgYoxI3nu
	mwt1CXo9mccZtlSUzuR94rxIMCT61MY05jFR9iQJ6J1bnFgl/c4M+3VMl1YUUkVTQWV4Qh+Tap/yK
	Mu5QDi8Yon/BS1Wxtwg86EyJfio4W34oVE7HSj8/PUve2gTAyKmg96viFBpk+oGP3AT6sVDMIEs5e
	BHCOeEu5+9oYNijilp7z4pN/UucaG9c1YBHZrlD2RH6qPCSHCrdsGZO3AhYpO3p/+dueuT7sE2r/8
	ONA5lcIThAomfZYHF0O9Jimljp7ezxyZyPvXlOQ4UQBHu34EqA3j6tB//gFgXYqcI+39f9Oc94AsR
	U9i8Qx3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmxxC-00000000FqO-1Yc9;
	Tue, 25 Feb 2025 16:38:42 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmvL8-0000000HQi0-0rSr;
	Tue, 25 Feb 2025 13:51:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=e3VmXvqmgpmlkacg4yCqG6k/DWw/7LO2D1NyxSJiktc=; b=UP4byKOgV4ukVo21U5njdpdZC0
	G4UYijU2274eCrrlkKTfbuZSamLwWkZdjJYtqnNdcNL8pIQoMObhFrr6qyHdQig4KiT6Wdj18Yzhx
	yy/ckGOZzVfYTDYy1YR18vgMtRIB9TN5Uees+9P8PejyiR+5lwuHi2M5UswRsCsj1DPo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tmvKu-00HWpb-CB; Tue, 25 Feb 2025 14:51:00 +0100
Date: Tue, 25 Feb 2025 14:51:00 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: SkyLake Huang =?utf-8?B?KOm7g+WVn+a+pCk=?= <SkyLake.Huang@mediatek.com>
Cc: "daniel@makrotopia.org" <daniel@makrotopia.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux@armlinux.org.uk" <linux@armlinux.org.uk>,
	"hkallweit1@gmail.com" <hkallweit1@gmail.com>,
	Steven Liu =?utf-8?B?KOWKieS6uuixqik=?= <steven.liu@mediatek.com>,
	"davem@davemloft.net" <davem@davemloft.net>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"dqfext@gmail.com" <dqfext@gmail.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"horms@kernel.org" <horms@kernel.org>,
	"edumazet@google.com" <edumazet@google.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>
Subject: Re: [PATCH net-next v2 1/3] net: phy: mediatek: Add 2.5Gphy firmware
 dt-bindings and dts node
Message-ID: <176f8fe1-f4cf-4bbd-9aea-5f407cef8ac5@lunn.ch>
References: <20250219083910.2255981-1-SkyLake.Huang@mediatek.com>
 <20250219083910.2255981-2-SkyLake.Huang@mediatek.com>
 <a15cfd5d-7c1a-45b2-af14-aa4e8761111f@lunn.ch>
 <Z7X5Dta3oUgmhnmk@makrotopia.org>
 <ff96f5d38e089fdd76294265f33d7230c573ba69.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ff96f5d38e089fdd76294265f33d7230c573ba69.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_055114_243300_BC4A2D5B 
X-CRM114-Status: UNSURE (   8.50  )
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

> > Would using a 'reserved-memory' region be an option maybe?
> Or maybe just leave those mapped registers' addresses in driver code
> (mtk-2p5ge.c)? Like:
> #define MT7988_2P5GE_PMB_BASE (0x0f100000)
> #define MT7988_2P5GE_PMB_LEN  (0x20000)

The problem with hard coding them is you need some way to know which
set of hard coded values to use, because the hardware engineers will
not guarantee to never move them, or change the bit layout for the
next generation of devices.

PHYs don't use compatibles because they have an ID in register 2 and
3. Is this ID specific to the MT7988?

	Andrew

