Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92683C982FF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 12:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MG8xy5bcEMmbhnQisVz4MbMW6OJVIA+/9ZxpoK8P3P8=; b=o6jP4qmbzvhUYxzAYMsJX1bMke
	dtUu87gaoxSePwZbJo/P7gwe4JEHvVVfZ2EhTIod1AL9A9K3gDR+ZfPcHk3DO/xSUnlUfuBDP9kya
	A0NR09me4arGXFuPIheurd5zJYGEifk9PctqFTkBWUawrH4DjbVtkQbRw8bjCNKiNEliLSNX/xqbj
	5wS118AyzSNzWTyBkkOkWlnbu0O/C5RCIDskSu2Bv7UiQMO4tAZlQFT+Zu0cQOirRCOEPAku3PGGF
	pfP/j7Mf4QISe8/8oG86TU4TA3YEnnJrFArIs8eo9oE7LyCzoLbjXNjB+JDKb8HCAbOLsOnIrY1ZI
	JLmFXdwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8zIj-00000005GcP-2wcF;
	Tue, 22 Sep 2026 12:08:45 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8zIg-00000005Gb9-1Xbb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 12:08:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=MG8xy5bcEMmbhnQisVz4MbMW6OJVIA+/9ZxpoK8P3P8=; b=6ZfhzkjsxabnIW+nrDuY0S5ueI
	StpgDejclSYGHaStg5BULQ84rmATpfGlYA0SV8XgA5CETGWOWaokPSIPzrFb99esCgHAbgx5NcCsF
	IQU3ycYMzdj99hWvHB9StG3AMz4KfrHi5AmaVPL47ot98CL6ahXor+7aTIT6dzahZpcM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1x8zIS-006a3f-M6; Tue, 22 Sep 2026 14:08:28 +0200
Date: Tue, 22 Sep 2026 14:08:28 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: nicolo.giuliani6@studio.unibo.it
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/3] arm64: dts: marvell: Add Sophos XGS 107w NPU board
Message-ID: <1817c56f-bc79-4e64-94c3-4eb8cdb1f107@lunn.ch>
References: <20260921-send-dt-v2-0-fb6b81002ad7@studio.unibo.it>
 <20260921-send-dt-v2-3-fb6b81002ad7@studio.unibo.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921-send-dt-v2-3-fb6b81002ad7@studio.unibo.it>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_050842_412888_8FA98F9F 
X-CRM114-Status: GOOD (  16.41  )
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

On Mon, Sep 21, 2026 at 02:26:43AM +0200, Nicolo Giuliani via B4 Relay wrote:
> From: Nicolo Giuliani <nicolo.giuliani6@studio.unibo.it>
> 
> Add a device tree for the network processing unit (NPU) of the Sophos
> XGS 87/107 desktop firewalls. The appliance pairs an AMD x86 host with the
> NPU, a Marvell Armada CN9130 SoC with its own eMMC and SPI NOR flash that
> runs independently of the host and serves the front panel ports.
> 
> The eight RJ45 ports and the SFP cage are connected through a Marvell
> 88E6193X switch on the MDIO bus of the SoC, at address 2. Switch port 0
> is the CPU port, a 10GBASE-R link to the first mvpp2 port. Ports 1 to 8
> are the RJ45 ports, which use the internal PHYs of the switch, and
> port 9 is the SFP cage, connected over 1000BASE-X.
> 
> Describe the UART console, the eMMC, the SPI NOR flash that holds the boot
> loader and its environment (read-only), the SFP cage and the switch with
> its ports. The port LEDs, the PCIe link to the x86 host and the USB ports
> are not described.
> 
> The switch is reset through CP GPIO2 pin 17.
> 
> Tested on an XGS 107w with Linux 6.18: boot from eMMC, eMMC and SPI NOR
> access, the mvpp2 link to the switch at 10 Gb/s, the 88E6193X probing with
> its eight user ports, and 936 Mbit/s through a front port. The SFP cage is
> untested.
> 
> Assisted-by: LLM
> Signed-off-by: Nicolo Giuliani <nicolo.giuliani6@studio.unibo.it>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

