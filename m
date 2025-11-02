Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9D62CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Nov 2025 15:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yl2yW43YqWl7eDMsGT29Nc+XmaI2SOpYNwGloMs3KAA=; b=0obtgwiOz2KhBK4fCUD21JoOmj
	mNQNLtiOzVKyg7Jj0I96zyc/bHWYWIGaffQdlN6q/eu3F4BaRRrhDkVa232yeFi+LOM+Znhv0Y9ID
	wOQxJp28RORxrBYNDpPm32t6RyzpqUdl4fm6n3hEDpFA9Pc3CdbS5rIa9Z59i8tB/6W1HhgeSEMDo
	CEAXVi8Bn+b+f0kEo/ciKEPDpZiXMeLfhVE15DsaLvUfPz8BrU0AQ3eskcrlbQbHKhq8mZ0Kp0Zms
	Ez+Ss3AZ+ZL61MKEidS3Q3t969qKsHZMS7QedpRN3PLo+NqMZ7QDUFBVHlshJiCQ2u5eKjndjV3wN
	AZEJx+5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFaK6-00000008cjl-2N4z;
	Sun, 02 Nov 2025 15:48:54 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFaK3-00000008cjG-46PI;
	Sun, 02 Nov 2025 15:48:53 +0000
Received: from pendragon.ideasonboard.com (82-203-160-149.bb.dnainternet.fi [82.203.160.149])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id D065D10D4;
	Sun,  2 Nov 2025 16:46:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1762098416;
	bh=nPOfhTMcxOpJUCQ3O3IQahZCN/dRkEJN4xU3hX+etf0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wRWu0IkArjwiQeCVj7KIfJ9WoJcHWxhZAaVwVxOHGzrcLTj9z9YyCdQd+dbsJWkP3
	 1CJGBAA//UX001rO9zJLbBgwZoT+7MjPijd/05KFmHlVDGxIub2Y5x7QpDrKHmFTba
	 NI3xzB1vCDR08fo6Xu+lQ0cVbwQ9MGMUAW4dzxBA=
Date: Sun, 2 Nov 2025 17:48:34 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	"Ivan T. Ivanov" <iivanov@suse.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Phil Elwell <phil@raspberrypi.com>, Rob Herring <robh@kernel.org>,
	Stanimir Varbanov <svarbanov@suse.de>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org
Subject: Re: [PATCH v2] arm64: dts: broadcom: bcm2712: rpi-5: Add ethernet0
 alias
Message-ID: <20251102154834.GB27255@pendragon.ideasonboard.com>
References: <20251102111443.18206-1-laurent.pinchart@ideasonboard.com>
 <bfc2be91-dcf9-4b38-a3f3-a1cad6c6aef2@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <bfc2be91-dcf9-4b38-a3f3-a1cad6c6aef2@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251102_074852_165901_5FD7A3C1 
X-CRM114-Status: GOOD (  14.23  )
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

On Sun, Nov 02, 2025 at 04:35:30PM +0100, Andrew Lunn wrote:
> On Sun, Nov 02, 2025 at 01:14:42PM +0200, Laurent Pinchart wrote:
> > The RP1 ethernet controller DT node contains a local-mac-address
> > property to pass the MAC address from the boot loader to the kernel. The
> > boot loader does not fill the MAC address as the ethernet0 alias is
> > missing. Add it.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> 
> Should this have a Fixes: tag?

I can add

Fixes: 43456fdfc014 ("arm64: dts: broadcom: Enable RP1 ethernet for Raspberry Pi 5")

(or maybe Florian can when picking up this patch, if a v3 is not
needed).

> What MAC address does it currently get?  Random?

The local-mac-address property is not currently filled by the boot
loader, so it's all 0's. The kernel then assigns a random MAC address.

-- 
Regards,

Laurent Pinchart

