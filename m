Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F5D9E73179
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 13:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZQh9OYc3Oc4hr8yMakIVLGrYeLd2XVCP0GPV4wb5uzM=; b=q6zCUHDnB8c3ypsf5t6ZbUfYkv
	UVA2mocOBwRtw5wadZOdbVMUaLqUEaEXbTd48n9Wu0SWUNHavZbc/gFHUL7FVAYCbClPX/O/WXOB8
	9Qdi0JOcFbu8ikXZCgoVw0Km1ZSYt1Wf/JCo+OzsDFtKG6EWDbfvDHsQZ05lnksphCg3oeTqZ+SS6
	gO+qKfPd3G+Pl0OlSAj+ub2t+mgVCaVcyfW2OyvMwkANH0nvR6A8NZzAhZRO3lG+8PUK+U7/AmCbL
	Y+RXwxLCBRs18GCiOpFa9RuLK5w/bOO3L5FaMyfIGoI/bHiXV1y9W0tgKSx4LXlA1xEuM4Uu37IAN
	DOdSFTiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmuPR-000000052Qm-2d2u;
	Mon, 02 Feb 2026 13:56:09 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmuPP-000000052QG-0IB7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 13:56:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=ZQh9OYc3Oc4hr8yMakIVLGrYeLd2XVCP0GPV4wb5uzM=; b=onYzNWYTUx1c1sMmhmU2VYAXzS
	2EEyuUZNK6gff5lLgdPS2mFkrr2o7bA9Vu8lMFTKNj5rQ0PWvjbWbg3ogQtO43rJE0hB3vvA+E8fL
	evzT/vn2UqXuxBP3LBeLA2qnvecZ0gXSEyDVoQ7yqGREkK1pYoc8/5smRdD0cDfg39f0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vmuPF-005pYn-72; Mon, 02 Feb 2026 14:55:57 +0100
Date: Mon, 2 Feb 2026 14:55:57 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Mihai Sain <mihai.sain@microchip.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
	varshini.rajendran@microchip.com, cristian.birsan@microchip.com,
	balamanikandan.gunasundar@microchip.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, ryan.wanner@microchip.com
Subject: Re: [PATCH 1/5] clk: at91: sam9x7: Remove gmac peripheral and
 generic clock entries with ID 67
Message-ID: <2fa66fa6-1ad5-430b-b030-c3969147c853@lunn.ch>
References: <20260202104025.3781-1-mihai.sain@microchip.com>
 <20260202104025.3781-2-mihai.sain@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202104025.3781-2-mihai.sain@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_055607_132482_F22EC8ED 
X-CRM114-Status: UNSURE (   8.90  )
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

On Mon, Feb 02, 2026 at 12:40:21PM +0200, Mihai Sain wrote:
> According with datasheet table 12.1 the instance ID 67 is reserved.
> This change drops the gmactsu_clk and gmac_gclk entries from
> the SAM9X7 clock description tables.

It would be nice to mention in the commit message that there are no
users of these clocks in mainline, so there are no backwards
compatibility issues.

	Andrew

