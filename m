Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBA10CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 07:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yWirnlgUqsih5agjfKLNMjvXyjJWT1GudlldLMjLJAE=; b=J3OhxpzYgmFP+n+UkQuYNS1eGk
	AEKuixsGLvZn6hq+sU+cvQDFHAlRkmKiYp0S5lpePHrb+yCW6TaYKIESnuVj41KXBkKj3RtJ/GGkM
	cjnclB98DUHSh4jNRh2frCjs771UZWSBJWkHv1NDaJcfX24Bhb0jSPqrvWPwSKHDSFmXTTql0B4pY
	+wfBfiaxhTM7yhi0zxSNC3Ap5sJz9rWrwqe8Ea90ClF88BV29QDja5gPWHvzLJ0vUAWAKKETuSfSR
	VXymOOVi08rtsnOJUO+YvSf5eND+Kvlj4p9hobbkyimfJBXNkDylithLnreEperODjpHA50VBNnh8
	WGiL/B9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3ra4-00000006wzw-31AD;
	Wed, 01 Oct 2025 07:48:56 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3ra2-00000006wzV-0vQj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 07:48:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=yWirnlgUqsih5agjfKLNMjvXyjJWT1GudlldLMjLJAE=; b=EwIHvDe29Y/0FaTlnyxYT5CQfP
	ml164IF5wdv/3j8q8YWcPrwHGW20AGyWUk81CksirHPTMUmDpWSwCdnKgTQgpwTJHQJ3rmbs8kOjG
	YJk8JOGNK3NKp6k8z+j75aCB5paTDJA60bCoHOfI2WMAZMPW3jdoAQeOOaDo5UV8nyCBTtb7Ks+ym
	oaqe6xR4e1Ne+68rElBtwSwCoEwczUHcu90Oc53yaL6aK6V4upb6MU9zdB+Vb0M/L0ucvLp5u1jQu
	P3ufPMZ5kg4ImM/9grAYs3aI76n3ovKFV9ll+jH0qj08I875wEveobVBve+PDGx4H4AVQoxagUO7q
	NM8Uq8Eg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:33724)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1v3rZp-000000000BF-100I;
	Wed, 01 Oct 2025 08:48:41 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1v3rZn-000000005JE-3RiQ;
	Wed, 01 Oct 2025 08:48:39 +0100
Date: Wed, 1 Oct 2025 08:48:39 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Paolo Abeni <pabeni@redhat.com>
Cc: Jakub Kicinski <kuba@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Chen-Yu Tsai <wens@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: Re: [PATCH net-next v8 2/2] net: stmmac: Add support for Allwinner
 A523 GMAC200
Message-ID: <aNzc17ZW56gLX87v@shell.armlinux.org.uk>
References: <20250925191600.3306595-1-wens@kernel.org>
 <20250925191600.3306595-3-wens@kernel.org>
 <20250929180804.3bd18dd9@kernel.org>
 <20250930172022.3a6dd03e@kernel.org>
 <d5aaff54-04dd-4631-847c-a2e9bd5ad038@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d5aaff54-04dd-4631-847c-a2e9bd5ad038@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_004854_262518_D2517FC8 
X-CRM114-Status: GOOD (  19.52  )
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

On Wed, Oct 01, 2025 at 09:25:07AM +0200, Paolo Abeni wrote:
> On 10/1/25 2:20 AM, Jakub Kicinski wrote:
> > On Mon, 29 Sep 2025 18:08:04 -0700 Jakub Kicinski wrote:
> >> On Fri, 26 Sep 2025 03:15:59 +0800 Chen-Yu Tsai wrote:
> >>> The Allwinner A523 SoC family has a second Ethernet controller, called
> >>> the GMAC200 in the BSP and T527 datasheet, and referred to as GMAC1 for
> >>> numbering. This controller, according to BSP sources, is fully
> >>> compatible with a slightly newer version of the Synopsys DWMAC core.
> >>> The glue layer around the controller is the same as found around older
> >>> DWMAC cores on Allwinner SoCs. The only slight difference is that since
> >>> this is the second controller on the SoC, the register for the clock
> >>> delay controls is at a different offset. Last, the integration includes
> >>> a dedicated clock gate for the memory bus and the whole thing is put in
> >>> a separately controllable power domain.  
> >>
> >> Hi Andrew, does this look good ?
> >>
> >> thread: https://lore.kernel.org/20250925191600.3306595-3-wens@kernel.org
> > 
> > Adding Heiner and Russell, in case Andrew is AFK.
> > 
> > We need an ack from PHY maintainers, the patch seems to be setting
> > delays regardless of the exact RMII mode. I don't know these things..
> 
> The net-next PR is upon us, let's defer even this series to the next cycle.

Would've been nice to have been given the opportunity to respond to
Jakub's email before that decision was made. Not all of us are in
the US timezone. (Jakub's email came in gone 1am my time.)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

