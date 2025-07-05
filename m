Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B43F4C83030
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Jul 2025 19:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TYyXTUmQ6H2pM7LO9+5e/crU4wTwt+19ctvCu3a6WU8=; b=aiSch4/fCanlgljUaYyDuXLiEG
	zv4j4BKoL733+nNEySatZmGAO6PRA0RF8usOJUEyOQza1qZhy/8PqH7j5rUqLuOVus4dd0BOsBlpt
	1ihDk6mc3WylVx6nUaMOzWpRZPeq+HHIq/7ulsmH3v6KVGjJDvFZ2uQTUxDDlQzdsYHjwT7CVa+jy
	SOPpmC54GhXphXU4Q1SVGKe5f1x1fU6oPJ0tmAD0WZg1NyG8LpV6+TGtbcG92GA2nO6jxa7yhsDZ1
	z3KKx2vsUXuhVaUz16ONmaV82+j+9pgtxtHKv0Gjqtwhuc/4zMICsoqqkE4jtMU5c0ATS081EB9X1
	inGOHL3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uY8Fm-0000000GtMo-3Ers;
	Sat, 05 Jul 2025 19:08:50 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uY8DQ-0000000Gsyd-3UHo
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Jul 2025 19:06:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=TYyXTUmQ6H2pM7LO9+5e/crU4wTwt+19ctvCu3a6WU8=; b=crpHE89SFeeAD+PzikEWt5niTi
	1DytHFCl1lFqqQn7Ymhr+6TLp01FywScGWjAg7SaJ9eOhKNRQSsKR2IO8rrpCTddUHBOf+ucRlOXq
	TV06hPV1xscYnr7o0+1X09kJ3/icPmFzozOoe6q3MWyAVekg3lvfLpChfG3LXifOQEofW9ksRwiwe
	uxeEM4uhroXZjLRYhtwQIXfSKQeLZj0NeI87T4H8gMPEl9VIWTblvaA4nbJ7Jmgy0NL5V82xTzD2X
	HG92G9KGylr0duYfut6/XKriOxADDFQAEpqVu+YDOND6h5i76a4XuPxLosSEAW4vnxCzDNmDGPrMm
	N+KFn2UA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:44334)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uY8Cy-0003TL-1z;
	Sat, 05 Jul 2025 20:05:58 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uY8Ct-0007I6-0t;
	Sat, 05 Jul 2025 20:05:51 +0100
Date: Sat, 5 Jul 2025 20:05:50 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Jisheng Zhang <jszhang@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] net: stmmac: add support for dwmac 5.20
Message-ID: <aGl3jiAjCiXMF_FK@shell.armlinux.org.uk>
References: <20250705090931.14358-1-jszhang@kernel.org>
 <b4091f34-8901-4a30-937a-a9aac35310b7@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b4091f34-8901-4a30-937a-a9aac35310b7@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250705_120625_153741_95BB6113 
X-CRM114-Status: UNSURE (   9.64  )
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

On Sat, Jul 05, 2025 at 05:51:11PM +0200, Andrew Lunn wrote:
> On Sat, Jul 05, 2025 at 05:09:30PM +0800, Jisheng Zhang wrote:
> > The dwmac 5.20 IP can be found on some synaptics SoCs. Add a
> > compatibility flag for it.
> 
> Is a compatible flag enough to make it actually work?

Also, shouldn't there be a binding doc update?
-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

