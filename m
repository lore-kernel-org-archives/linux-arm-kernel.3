Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA763C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 08:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tGLHPn31SBnvlRKtDGgofPJ9xwIi/cPbYqUokOekMHk=; b=yMNCgO+/TBvZp8fMR7TebMZpn0
	UkL1JK03sHLHH7tpfcGq6zFKLMgdWFXU89BcbeQ4iD9ckJa0w51xFDbCg3f9zPRMwcN/6rBqTjtUN
	SE3uX1QT6QyaJkceQQQkelfIs6Gezkd0J6ciPKnlJZPzfyHqy+Wq+MJEvoDpilD2kpIIzdmBAzTQ7
	Pbl9dlor5ZBpX/8UYuP4h7SasVJyobPe20NaGWWwWFxj7j5zqXlNr5Ukhk+Yw7X6Cs07oG2dYUAVs
	NtgEqJH/eWCDNgTZGfyGunL2l/VTQR3FzHhnzcgAs+7Km7SYw0MQbB3FJ907YZyzeLLHBWUEjITT9
	kXiaBN/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXF2M-0000000Ad31-21M2;
	Thu, 03 Jul 2025 08:11:18 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXEqY-0000000Aatq-1RI4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 07:59:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=tGLHPn31SBnvlRKtDGgofPJ9xwIi/cPbYqUokOekMHk=; b=0vNq3pOW8vaihoEQMlxVNi/Qem
	4KzOjTIY110+8Y30tKn/LO2jaEPbeM7CI0jQ1pfrU2QzaNaWOExTp+OfyYJvMBHoeDNHcH9qwRzyS
	qfx2xx2Qx/XBg4vC7sKrMjQyRpSHQexJ+E+zwNtpaATvXsCSsr8sz+Umhp88dbEGKQDE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uXEqG-0004W2-E6; Thu, 03 Jul 2025 09:58:48 +0200
Date: Thu, 3 Jul 2025 09:58:48 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Tao Ren <rentao.bupt@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Tao Ren <taoren@meta.com>
Subject: Re: [PATCH 5/5] ARM: dts: aspeed: Add Facebook Darwin (AST2600) BMC
Message-ID: <220ac6c2-8373-4742-86fa-f322d6ada624@lunn.ch>
References: <20250702050421.13729-1-rentao.bupt@gmail.com>
 <20250702050421.13729-6-rentao.bupt@gmail.com>
 <a6f6966b-50ee-4b4f-9422-96c6ac9391a2@lunn.ch>
 <aGW8Nm8ZWMwRYVOo@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGW8Nm8ZWMwRYVOo@localhost.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_005906_610814_54058C75 
X-CRM114-Status: GOOD (  11.95  )
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

> > How do RGMII delays work? Connections to switches have to be handled
> > different to PHYs, to avoid double delays. But is there extra long
> > clock lines? Or are you expecting the switch to add the delays?
> > 
> >       Andrew
> 
> Hi Andrew,
> 
> The delays are introduced in BMC MAC by setting SCU control registers in
> u-boot. The delays on the switch side are disabled.

Sorry, but not acceptable. This is something i've been NACKing Aspeed
DT patches for. You need the MAC driver to interpret the phy-mode and
program the SCU control register as needed.

Since you have the MAC introducing the delays, you want phy-mode
'rgmii-id'.

If you want to submit some DT now, drop the ethernet node. This is
what others have been doing while waiting for Aspeed to fix their MAC
driver. Having said that, i've not seen any progress from Aspeed, so
it either needs their customers to apply more pressure, or somebody in
the community to just fix it and submit patches.

    Andrew

---
pw-bot: cr

