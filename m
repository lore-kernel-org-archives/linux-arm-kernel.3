Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F082FC83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 12:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h4qxOMkafipReLLQY48E2N29Bf543EIeVzEu7seHDok=; b=1wv7qVea56xv0afyysOmt/baX7
	dJwG27mLs0AutSM1CuChNKSv8jh3/suaWvhfg7BoyROfdU0PdjGh9cwkdcUaEdH+2wVKoXVUKEjzE
	ZVa7I72potqfdz4CYOFzP9TTKYUJGrxaCrAmTLnDtezYzSgeDGvED1MRjbG1agjXYRFTdwVMqlSZ+
	jNbfGMJtZalIbuP1ugxwsQqa8lk0/n88iJa4iduw2gHE25LVavdurvejKJ6/4dDFocG4VH46PYoVK
	9KVDLbl811Lc2KDOiAsiVVRe7eFnj+RkF26OmxpPJgsHTGSyPnQqjALgW6hCH6gkxNU91d1BDJW3a
	4V+j9weQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZqLZ-0000000BlFP-0k5h;
	Thu, 10 Jul 2025 12:25:53 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZp23-0000000BZ9W-1JM6;
	Thu, 10 Jul 2025 11:01:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=h4qxOMkafipReLLQY48E2N29Bf543EIeVzEu7seHDok=; b=sRuyTAuP2+HBiTZ3U6hYz4/iEE
	+5iW1A76Q2fbx79u9N5t2SHaCcnERTj1epE6ohrcGqip/qMTV8R3nXifRpte8gDznit2ubRWEDylZ
	6FsbEP6IwKRlmc872peyToR5B4F7UC4N6g5YJBZZFTslgEvgIstu5rC1OE9Sdlw3jIjBWU8IWVLJL
	4vANeGIhfXKuwE+O+sLjPaenX8bI5TwIk66pVGatiVk0Mm+IiTxVcV+kg8NJqjknf5OVVUU96u3sY
	rf2W1T2roJ9gCzlsKwwlyAwoXjXqt8oxCiplsxcSBYiVxsQN33qeTHj8yOUoM9n7WsCMFlHjDOql2
	vI0jJqzA==;
Received: from [194.95.143.137] (helo=phil.dip.tu-dresden.de)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uZp1z-0004He-RL; Thu, 10 Jul 2025 13:01:35 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: John Clark <inindev@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/2] Add FriendlyElec NanoPi M5 support for Rockchip RK3576
Date: Thu, 10 Jul 2025 13:01:31 +0200
Message-ID: <175214509878.1901332.11810732138496211392.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250628143229.74460-1-inindev@gmail.com>
References: <20250628143229.74460-1-inindev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_040139_373877_D7D5705A 
X-CRM114-Status: GOOD (  13.67  )
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


On Sat, 28 Jun 2025 10:32:27 -0400, John Clark wrote:
> This series adds device tree support for the FriendlyElec NanoPi M5 board,
> powered by the Rockchip RK3576 SoC (4x Cortex-A72, 4x Cortex-A53, Mali-G52
> MC3 GPU, 6 TOPS NPU). The patches enable basic booting and connectivity,
> including dual 1Gbps Ethernet, USB 3.2, microSD, M.2 PCIe NVMe, and HDMI.
> 
> Changes in v5:
>  - Addressed Jonas Karlman's feedback:
>    - Added mmc0 alias for SD card
>    - Updated regulator names to match schematic (e.g., vcc12v_dcin,
>        vcc5v0_sys_s5, vcc3v3_m2_keym, vcc3v3_sd_s0, usb3_port2_5v,
>        vcc5v0_usb_otg0, vcc5v_hdmi_tx)
>    - Fixed vcc3v3_sd_s0 voltage to 3.3V
>    - Removed unnecessary regulator-state-mem for fixed regulators
>    - Removed vcc_5v0_device regulator
>    - Added pinctrl for Ethernet PHY reset GPIOs in mdio0 and mdio1
>    - Used correct pinctrl format for sdmmc and sfc1 (<&pin>)
>    - Increased SPI flash frequency to 50 MHz
>    - Updated LED colors (sys: red, led1/led2: green) and functions
>        (LED_FUNCTION_HEARTBEAT, LED_FUNCTION_LAN)
>    - Dropped rng node (enabled by default)
>    - Omitted HDMI mode-switching GPIO (to be added later with driver
>        support)
>    - Updated pinctrl names to match schematic (e.g., pcie0_pwren_h,
>        sdmmc0_pwren_h, usb3_host_pwren_h, usb_otg0_pwren_h, hp_det_l,
>        pcie0_perstn)
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: rockchip: add FriendlyElec NanoPi M5 board
      commit: d15e51907ef472d31af0a4f735d4597b53dc379e
[2/2] arm64: dts: rockchip: Add FriendlyElec NanoPi M5 support
      commit: f2a71544d56bc8de459e1df9eecf616d141cd633

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

