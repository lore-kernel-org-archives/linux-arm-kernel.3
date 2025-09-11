Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAC90CAC58E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 22:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k38r4YA5840dqQerOX6ASJvj7ltULIdsb+/xx7kZDp4=; b=JPhVD21B4E6sZi+XXA2NgmQ+Fn
	p9s564PVVyD8SzypyHhvw3LbuSaKsMO8+HtMsCKKaOJmHQGntT83AyBe1mxiNdyElj7zdfXL/WCw8
	iXDBK8Rp1pX7cIs+lV/BgyH1xQybEZ/3CwRnNH+XGxICLYPB6TW3SKpK2o3vm1km+gac7UJwiB0d+
	QFdlR7DkzHmgOT7oxBx7XD+vqnrx6/VNLcF/SMpwfuYqELXsN1y/F5PhFmotdb00mvqLMKjmF8vrg
	BZfOtNH6k0pXrg1VFEoEQ4EzEE2njDtGUt8MyHMzoSe61Is7bNWpEVx24zmqFPX0b3bESE2LfxD7v
	PszZg+dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwpXJ-00000005eNo-3NVv;
	Thu, 11 Sep 2025 22:13:01 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwpXG-00000005eME-33Hp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 22:13:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=k38r4YA5840dqQerOX6ASJvj7ltULIdsb+/xx7kZDp4=; b=RUSWSziVQseGJ3SzEMC5DuSIof
	xSJSdXq3E10/hf6iFm61jJPQi3jJswsp5oxz3zVxrfjSr1J+Fj4l0qv7VTcMtkWc3f4O/Crfd6iS1
	Hf7hA9A83Kwc+SfQwLkSz19rrepirv6/5Kt8JLN/PLhz6IcJge/qJUMMLi3dNf6wkFxc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uwpX6-0088t2-RU; Fri, 12 Sep 2025 00:12:48 +0200
Date: Fri, 12 Sep 2025 00:12:48 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Josua Mayer <josua@solid-run.com>
Cc: Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Wunderlich <frank-w@public-files.de>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 3/4] arm64: dts: marvell: cn9132-clearfog: fix
 multi-lane pci x2 and x4 ports
Message-ID: <9272b233-b710-4e57-b3ff-735f45c03c74@lunn.ch>
References: <20250911-cn913x-sr-fix-sata-v2-0-0d79319105f8@solid-run.com>
 <20250911-cn913x-sr-fix-sata-v2-3-0d79319105f8@solid-run.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911-cn913x-sr-fix-sata-v2-3-0d79319105f8@solid-run.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_151258_765169_1491B81F 
X-CRM114-Status: GOOD (  10.91  )
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

On Thu, Sep 11, 2025 at 08:28:06PM +0200, Josua Mayer wrote:
> The mvebu-comphy driver does not currently know how to pass correct
> lane-count to ATF while configuring the serdes lanes.
> 
> This causes the system to hard reset during reconfiguration, if a pci
> card is present and has established a link during bootloader.
> 
> Remove the comphy handles from the respective pci nodes to avoid runtime
> reconfiguration, relying solely on bootloader configuration - while
> avoiding the hard reset.
> 
> When bootloader has configured the lanes correctly, the pci ports are
> functional under Linux.

Does this require a specific bootloader? Can i use mainline grub or
bareboot?

	Andrew

