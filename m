Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6C20CA0FFD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 21:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VLdSQW7+O0R1hhE3XjC/Wy7ssjU7PWHhYOnONnoYdgU=; b=49AtBY+/Vpae578Gl4mM1Cgl6p
	ij3Ep4mAsioDFCqzw+4qspnlOATNlcxfoI5NHUOLoDiLCjgUwkGs4sDdAHER+QyGCM+3jHJoSkYy3
	xOoYb9NK1uKYSaGX51RjoUHBCm+zxF1PX0ymEU+JnkztasWIofE4PXud8hAhYpipqMJrOE3+DGBPN
	Gys2rhCbiKL3MONeh1jixdDHoVQcjg5fZkrzX13UN0Ls8UHVeYchbiLIOtafuoxerQ0eTP85SQrSd
	ucSdX2SgeWM5PuvSfzm+IV/dPKCIGlPBLZYcMz48yxvxYGcjlkyPM3qG13dJCOfQZXg+ee4bl70Om
	nTgmhhoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usTBT-00000008SE9-3DwS;
	Sat, 30 Aug 2025 21:32:27 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usT6n-00000008RxP-1F0E
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 21:27:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=VLdSQW7+O0R1hhE3XjC/Wy7ssjU7PWHhYOnONnoYdgU=; b=e+CtcqMH5Dkqg+YMIEoQ+WwPOa
	2FUxf10H6EbrNyJZgT3G1kwTA0R8GqFIQP4DLIU/ihIKnspRpa96TGG6U0ZcL+xgtdCPIgomfwBtd
	i61RVfTXXxMzg006FakL++46JHX5D8Kxnh8+99gTOHamgwqm9Mr5EHhLlA1Y4ZP9SXd0fw8X8ICEa
	WkdN9B3Ow7yhXn6YNoq8hBxtLGQ3mFqotIC1YEkiewqKH3j9oepeaiV3DnwhgtVHKleGVxZynBKKL
	f+ZviAtD1mbJb8IfAsF+rhuoSOh/sOH/FeIOgH4fT4WQoO9yBBipj5s8Am259n4lYLEZkmCksCLWA
	fjknDKYQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:42508)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1usT6Y-000000004Sw-2Maq;
	Sat, 30 Aug 2025 22:27:22 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1usT6V-000000005PN-1BOn;
	Sat, 30 Aug 2025 22:27:19 +0100
Date: Sat, 30 Aug 2025 22:27:19 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Eric Dumazet <edumazet@google.com>,
	David Miller <davem@davemloft.net>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>
Subject: Re: [PATCH net-next 1/5] arm64: dts: ls1043a-qds: switch to new
 fixed-link binding
Message-ID: <aLNst1V_OSlvpC3t@shell.armlinux.org.uk>
References: <a3c2f8d3-36e6-4411-9526-78abbc60e1da@gmail.com>
 <fe4c021d-c188-4fc2-8b2f-9c3c269056eb@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fe4c021d-c188-4fc2-8b2f-9c3c269056eb@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_142737_621795_DA253AF5 
X-CRM114-Status: GOOD (  10.69  )
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

On Sat, Aug 30, 2025 at 12:27:23PM +0200, Heiner Kallweit wrote:
> The old array-type fixed-link binding has been deprecated
> for more than 10 yrs. Switch to the new binding.

... and the fact we have device trees that use it today means that we
can't remove support for it from the kernel.

I think it would make sense to update the dts files, and add a noisy
warning when we detect that it's being used to prevent future usage.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

