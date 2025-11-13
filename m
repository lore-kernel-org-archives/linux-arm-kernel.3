Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0DB3CD4F2C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 01:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cg2JaE3fv+ghU7ROClHY7SyuqIoTVty2cTLXUgmt9Ho=; b=uWiHjC3JBv5lSNs8sDyIDPoHgt
	TWkueuTh/BYDJMf6lbb+aLU72dUEYp6FcRUlk6SWM82chc/Kc5z9Mfg7nPoO+V9X5n5dE2foh9084
	IpyhChhIOGQ/hLPHdchuueZq5iGEx0H+t9KDROiOcxfs0TmDJV6I+E+97LPtyb0qeID4aWgpFXFjN
	VooJ4fIMd2ECNIIYuwB84X8kANyb9HhJqaKFoMASja/TBsnTRe5m+RN9NEJlW8+8AqBilpDtZF4Hc
	Thf+mAcGK5W/L2WBA3ZKDvComBMbA83Y73vs2QzFOcHWC7/P3dcBm86r9PIAGozqlve86IsSpGgTU
	xnkTsw7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJLxw-00000009i7f-3KX1;
	Thu, 13 Nov 2025 01:17:36 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJLxr-00000009i57-3fsG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 01:17:34 +0000
Received: from pendragon.ideasonboard.com (unknown [213.216.211.176])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 0737122B;
	Thu, 13 Nov 2025 02:15:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1762996530;
	bh=RJdzbBhfGhI09u51y8sQG5hOaq5lWDhaLzOTTvMVY8Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q/6xIIdl2+JQnH0b/1SnFhwrRERG4EdyYO4RnR+B+HR25Z9jH8taSNwl4QQxb3AT7
	 i81CKgCdjf4exuXEhe/7ntYCfVL9wpSkHuXN7Pd69iUyYkdJKNhb09OPpUdYx1rsJH
	 a4OKXAShC1CyNyyw8VREt/l66WqeJKDEhOceQXZE=
Date: Thu, 13 Nov 2025 03:17:19 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Andrew Lunn <andrew@lunn.ch>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] arm64: dts: imx8mp-debix-model-a: Disable EEE for 1000T
Message-ID: <20251113011719.GD9135@pendragon.ideasonboard.com>
References: <20251026122905.29028-1-laurent.pinchart@ideasonboard.com>
 <e87ff7f2-d16f-41f2-b781-b175cfb84b21@lunn.ch>
 <aP83bMDWCre7-Sjw@pengutronix.de>
 <aRR-6Nl3ELB2v8gV@shell.armlinux.org.uk>
 <176295131007.567526.3395425614344577792@ping.linuxembedded.co.uk>
 <aRSD9n_F4aRXAdf3@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aRSD9n_F4aRXAdf3@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_171732_052967_43DB044A 
X-CRM114-Status: GOOD (  22.48  )
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

On Wed, Nov 12, 2025 at 12:56:22PM +0000, Russell King (Oracle) wrote:
> On Wed, Nov 12, 2025 at 12:41:50PM +0000, Kieran Bingham wrote:
> > Perhaps further complicating matters.
> > 
> > I have a Debix Model A as well ... I'm in a different office to Laurent
> > - and I believe EEE is enabled on my board/network switch.
> > 
> > I do not get an interrupt storm.
> > 
> > I'm not sure how this helps yet, - I don't know what to debug as I can't
> > reproduce the issue!
> > 
> > I can provide remote access to the board with ssh if that helps anyone
> > who wants to look at something specific about my setup or run anything
> > if anyone has ideas of what to check my side.
> > 
> > Perhaps we can find some subtle difference between a working case and a
> > non-working case...
> 
> Thanks, that's interesting. I guess the next steps would be to try and
> work out what's different between your two setups.
> 
> - same board revision?
> - same firmware/ATF?
> - same kernel/modules?
> - same type of link partner? (I suspect, given the cpu-pd-wait
>    interaction, isn't the problem.)

I've provided the binaries I use for U-Boot (including TF-A) and the
kernel to Kieran, he will test to see if they make a difference. I also
tested replacing mainline TF-A (v2.13) with the downstream NXP version
listed in the U-Boot i.MX8MP EVK documentation, and that didn't appear
to make any difference.

-- 
Regards,

Laurent Pinchart

