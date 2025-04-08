Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C649C369A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 19:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=chJQd/x3TDW3v8jq2xVO4tzD8MeEWuj7YPs7yTPdQh8=; b=YbYpyAq5CbP+Jh0MUkKvwj/zxr
	bSLhHSmCNm0xKW6yRFC+0MkGjMAxkkDFF7FljUXYUZOTbb9sLjPbfGmsY7m08wWk2xEavdR7he7LJ
	GuBtGAd8pE7dSXMA0hIcJvEds7kmo6+MyGHFkykOeYuiGmjqYG9sDOZYOc0Eh1AeIwYM9psfZwu7o
	Dx8W8yg5WOiq9tUqeikItJPJHnPZkxZHf0i8MuDo+vgKGdzhM8cDFqbBj1RF6E+Is2p5RUzr3n2xX
	Td+XF2lIuSwMB0sOzhhW8IC30j4Q0ihJW462ntGF5+3CF6GG8gcjXENaLX7PSY8dABJZuL+N7ioZF
	F52/6SJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Ebt-00000005Etn-1GXL;
	Tue, 08 Apr 2025 19:27:49 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2DCy-000000052dV-3spi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 17:58:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=chJQd/x3TDW3v8jq2xVO4tzD8MeEWuj7YPs7yTPdQh8=; b=02S55y8CW7SPGPnlOrMHC/7Ped
	uuuD5/vQiHyLAwkJHjIY55/FRxedXYGGT8HcmkhR+6jt3UxyodnnvyxwXy7Q10bKOYzIFIArAdwls
	J7/0ndNjdCXEKcBJflrMKYR++oiS2sKobOylmyscPc+pmjifLv3DxKEXlevsY7yWdRJvFF7q6cxJK
	g/+yW0q4jVIk25dgYQwqUFhOErzm1lGsZEx6nqmBxHZbD3hrs6w59yvq11bO7Bz/bbl0E8rB6zVq8
	PMtwjQtoXoO5jw3TjGKevV/CN0Q8i9XSjaflZlRgZZGV2RHtso9WkOVQZzQqK1aRKY5YoXFYyJ2nM
	DOIeLhfg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:55812)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1u2DCj-0007sz-2W;
	Tue, 08 Apr 2025 18:57:46 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1u2DCg-0001cy-1T;
	Tue, 08 Apr 2025 18:57:42 +0100
Date: Tue, 8 Apr 2025 18:57:42 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Simon Horman <horms@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.or
Subject: Re: [net-next PATCH 1/2] net: phy: mediatek: permit to compile test
 GE SOC PHY driver
Message-ID: <Z_VjljzFAa8gf5Cd@shell.armlinux.org.uk>
References: <20250408155321.613868-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408155321.613868-1-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_105800_966546_25B4CB52 
X-CRM114-Status: UNSURE (   8.60  )
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

On Tue, Apr 08, 2025 at 05:53:13PM +0200, Christian Marangi wrote:
>  config MEDIATEK_GE_SOC_PHY
>  	tristate "MediaTek SoC Ethernet PHYs"
>  	depends on (ARM64 && ARCH_MEDIATEK) || COMPILE_TEST
> -	depends on NVMEM_MTK_EFUSE
> +	depends on NVMEM_MTK_EFUSE || COMPILE_TEST

Isn't this equivalent to:

	depends on (ARM64 && ARCH_MEDIATEK && NVMEM_MTK_EFUSE) || COMPILE_TEST

?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

