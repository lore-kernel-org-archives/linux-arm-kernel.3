Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F3CBCA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 15:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0MR5T/hYqkDcwtTShdWjbf89ggneYNcFMBTM7A8bZyQ=; b=YPKhBu781MpITU+ZnqSsoxX05+
	EXdERQ375cY0hVh6JN8Nbcq8h5KglMSBBy0tQ/OlFo+CvVoqJz53Bf9/Mu2w6j5/q5Y/WlMmlNp5H
	TlcIaC/53938UFnN9lltD8AuHUcueRcsRK95OYNPobD9dSW0HTcxF0z66MiWO7OUPSDTaX02WwpEQ
	USOqtrbehTsdj4l7z1IwcOXiezB2aW/IfmZLWFsVRi303Ra5rcqWnUGy3Em/NjFwBGC2Huf6m2C2x
	LxMeeIFa29wrk7GNk2MhUQnwnJ5TPA3CLAb/ye7CrwNBIUEUwvhItgr0XhxsKjGYSIctUFYrjtyFK
	1J5y7GnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umDlY-0000000EG39-3SU4;
	Wed, 13 Aug 2025 15:51:52 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umDBt-0000000E8xi-1n3m
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 15:15:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=0MR5T/hYqkDcwtTShdWjbf89ggneYNcFMBTM7A8bZyQ=; b=u3E8TZj8BCALAXtWNYOZqfhkw1
	cVibrwPJIj9GaRoSLvXFyJ9Cmr4V62gFGMwCPmzV54apr0vKhsWCA113sW+yaYxxbCHzlJkooNKf4
	HV8b3oyR5bB+gaD5RSjl3KOK6fxxVMbuw2WjIwt7ioxXsxG9P+P/3++k1Fu2+FjhJF+zQ1yAFq9tD
	MjqjmTuF8qHsLds0r2a0I34tm3W50qv4LyemyMt838zZfZfRRHJqj7e8Sobx5DOICPGs3cizAi7Bn
	7q5/KtycVIrEM7HyAf8kA/wmZTJwLyFuu9JFw0j2qJcAxoIuqXxuH3OiSCO3LTLb9JWH6m38sHRwF
	mWKxFRBQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:37712)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1umD9g-0006th-1R;
	Wed, 13 Aug 2025 16:12:44 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1umD9c-0005rJ-2X;
	Wed, 13 Aug 2025 16:12:40 +0100
Date: Wed, 13 Aug 2025 16:12:40 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH net-next v2 06/10] arm64: dts: allwinner: a527:
 cubie-a5e: Add ethernet PHY reset setting
Message-ID: <aJyraGJ3JbvfGfEw@shell.armlinux.org.uk>
References: <20250813145540.2577789-1-wens@kernel.org>
 <20250813145540.2577789-7-wens@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250813145540.2577789-7-wens@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_081501_466577_6D09E54B 
X-CRM114-Status: GOOD (  11.71  )
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

On Wed, Aug 13, 2025 at 10:55:36PM +0800, Chen-Yu Tsai wrote:
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts b/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
> index 70d439bc845c..d4cee2222104 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
> @@ -94,6 +94,9 @@ &mdio0 {
>  	ext_rgmii_phy: ethernet-phy@1 {
>  		compatible = "ethernet-phy-ieee802.3-c22";
>  		reg = <1>;
> +		reset-gpios = <&pio 7 8 GPIO_ACTIVE_LOW>; /* PH8 */
> +		reset-assert-us = <10000>;
> +		reset-deassert-us = <150000>;

Please verify that kexec works with this, as if the calling kernel
places the PHY in reset and then kexec's, and the reset remains
asserted, the PHY will not be detected.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

