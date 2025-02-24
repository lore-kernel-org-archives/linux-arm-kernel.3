Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E066C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 16:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=prs4XZf+LQU37XZYihXYMGUtI4UK9gIDbyzuWPk6b1E=; b=lM8odz8xP5DjX3Fcsp5CWfZvOI
	zYZ1c3JQsfQYJKGbSWrAhFxwIp8cRdzp+fSq6kwUp/uLBMqThgoB+YQxA1AkgUK1igXqUQB46MbFV
	+svlnpZYPVl0w+HFO233dYMIS1cB0VmipXMTP3yT3EglT1ZrzVVqQ1xINmGypOWROmgCDRrmUveoo
	Z1q6CXra40xiNSvij1uAj8ZgN2lNKpgCC0Aj5i1rcHY2xqWDGlMXXnh+aVoY3NuKJQerXbLpOrbkz
	iPhncVSFiVPzt6RE31MHgH4elbUbOwgfkcPZlgZ1MAGXntCmpjTC+k4fDP1t2UndaxSTC3PTe554M
	jC+Rk9iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmbgA-0000000EUse-1pj3;
	Mon, 24 Feb 2025 16:51:38 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmbec-0000000EUhM-06dI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 16:50:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=prs4XZf+LQU37XZYihXYMGUtI4UK9gIDbyzuWPk6b1E=; b=hSOMAMi9NWkbX+qi46VgOYrtHj
	0FIRcy3jMwJHS5h0X7nTJhRshYOj7P1iQ9S3NN14gjB10MDLPMt20tG5OxmlFWEv+Ir8EtI+PXKSO
	0BrL4bPpgcFnwWXHgDoynSFy8DbAzrJkf1LxfkcwmlahEqMs0b5UmkqL/n7iIOHGdWXEKcQuoUFsl
	EGDOfS9FzdbLp6nX8flr5mj4XDI2H1PBi3Po4MMXjsZLldXe30ESJeADGlsmy9cix9S0riSdY1Mr5
	YdX9Mezq+Bj8KU9f+tjMhYaWB7DGJxAugpfVyP8lFSXtbAABEERdGvPGxHf4ljz3Zd4IAt0dOv4tr
	mwilkKsw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:41954)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tmbeU-0006zA-1n;
	Mon, 24 Feb 2025 16:49:54 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tmbeR-0005AB-0I;
	Mon, 24 Feb 2025 16:49:51 +0000
Date: Mon, 24 Feb 2025 16:49:50 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next 2/2] net: stmmac: dwc-qos: clean up clock
 initialisation
Message-ID: <Z7yjLjfNq89vPnOd@shell.armlinux.org.uk>
References: <Z7yGdNuX2mYph8X8@shell.armlinux.org.uk>
 <E1tmZjr-004uJP-82@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1tmZjr-004uJP-82@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_085002_067973_175B1D65 
X-CRM114-Status: UNSURE (   9.03  )
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

On Mon, Feb 24, 2025 at 02:47:19PM +0000, Russell King (Oracle) wrote:
> Clean up the clock initialisation by providing a helper to find a
> named clock in the bulk clocks, and provide the name of the stmmac
> clock in match data so we can locate the stmmac clock in generic
> code.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Yet more warnings and errors from NIPA, yet this patch passes my local
build tests.

As no one looked at v1, I don't see the point of waiting 24h before
posting v3... no one is probably looking at v2.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

