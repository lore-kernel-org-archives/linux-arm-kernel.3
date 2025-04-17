Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F9DFC369BD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 03:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZybCaegNwM4Mhdme7ie8tDG2/MD9+wEJuMfumqWYcxs=; b=kWf1MjvvNcQF5iXwUMW8+yLPTC
	5thEW6Gkf4UiiErU4nAeBn6LZkEHLVO/mam9BFCEwG2m/4StKYExYTprBAzxsZXZbUSVAklrV7LCh
	PGPYEDYQxV/8f+ejW3EHAOHxMBYtgI0eHzBSSpywDQw+AmmNHfxEPN/tbns9JhQm6KnAi0ELvkCvw
	aGyxxhTK0K/SGRzTMk0Mt1QIf2pwEU3h+gqFmMKn+ilF/MPzbgbMihiOHITdgkBkM2j6WLZWcfY3F
	QcP6QaI89/7P1d1+gykgNoRjrhEXFSepbDEkvhetk+FGD4aLA3yc8lET8hTI7KDg4lPAetbd2IVz/
	sHEyCNCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5FyM-0000000BcKf-2XPX;
	Thu, 17 Apr 2025 03:31:30 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5FwV-0000000Bc8d-1t58
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 03:29:37 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53H3TR952971983
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Apr 2025 22:29:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744860567;
	bh=ZybCaegNwM4Mhdme7ie8tDG2/MD9+wEJuMfumqWYcxs=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Oh77/Ta1cA2spSYlOCajSt7iUrBWGPh3XMG/daGR1vFMikEl7Ynu9xTRsREyAOP3M
	 0+NcpyWw+E0aSppYTFBMCKkQN5dKfhABz+RyDSg7F5gsGqjw+/5XnHIhSmKh9Mg6Si
	 JrLixEMXhsoynS5aJ8mBhw/KnFeZLe9y9ZC5iCns=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53H3TRud019651
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 16 Apr 2025 22:29:27 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 16
 Apr 2025 22:29:27 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 16 Apr 2025 22:29:27 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53H3TRMV044506;
	Wed, 16 Apr 2025 22:29:27 -0500
Date: Wed, 16 Apr 2025 22:29:26 -0500
From: Bryan Brattlof <bb@ti.com>
To: Robert Nelson <robertcnelson@gmail.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Vignesh
 Raghavendra" <vigneshr@ti.com>, Nishanth Menon <nm@ti.com>,
        Andrew Davis
	<afd@ti.com>, Roger Quadros <rogerq@kernel.org>,
        Siddharth Vadapalli
	<s-vadapalli@ti.com>, Judith Mendez <jm@ti.com>,
        Andrei Aldea
	<a-aldea@ti.com>, Dhruva Gole <d-gole@ti.com>,
        Jason Kridner
	<jkridner@beagleboard.org>,
        Deepak Khatri <lorforlinux@beagleboard.org>,
        Ayush Singh <ayush@beagleboard.org>
Subject: Re: [PATCH v3 2/2] arm64: dts: ti: Add k3-am62-pocketbeagle2
Message-ID: <20250417032926.xamsafgue2ryj7sa@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20250415225940.3899486-1-robertcnelson@gmail.com>
 <20250415225940.3899486-2-robertcnelson@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250415225940.3899486-2-robertcnelson@gmail.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_202935_619615_DBD36778 
X-CRM114-Status: GOOD (  12.46  )
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

On April 15, 2025 thus sayeth Robert Nelson:
> BeagleBoard.org PocketBeagle 2 is an upgraded version of the popular
> PocketBeagle.  It is based on Texas Instruments AM6232 or AM6254 SoC.
> Its dual or quad A53 cores can provide higher performance than classic
> PocketBeagle. The new design comes with pre-soldered headers, a 3-pin
> JST-SH 1.00mm UART debug port, a USB-C port, Texas Instruments
> MSPM0L1105 Cortex-M0+ MCU for ADC, 512MB RAM, and a LiPo Battery charger.
> 
> MSPM0L1105 firmware source: https://openbeagle.org/pocketbeagle/mspm0-adc-eeprom
> * EEPROM 24c32 emulation
> * ADC ad7291 emulation
> 
> https://www.beagleboard.org/boards/pocketbeagle-2
> https://openbeagle.org/pocketbeagle/pocketbeagle-2
> 
> Signed-off-by: Robert Nelson <robertcnelson@gmail.com>
> CC: Rob Herring <robh@kernel.org>
> CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
> CC: Conor Dooley <conor+dt@kernel.org>
> CC: Vignesh Raghavendra <vigneshr@ti.com>
> CC: Nishanth Menon <nm@ti.com>
> CC: Andrew Davis <afd@ti.com>
> CC: Roger Quadros <rogerq@kernel.org>
> CC: Siddharth Vadapalli <s-vadapalli@ti.com>
> CC: Judith Mendez <jm@ti.com>
> CC: Andrei Aldea <a-aldea@ti.com>
> CC: Dhruva Gole <d-gole@ti.com>
> CC: Jason Kridner <jkridner@beagleboard.org>
> CC: Deepak Khatri <lorforlinux@beagleboard.org>
> CC: Ayush Singh <ayush@beagleboard.org>
> ---
> Changes since v2:
>  - cleanup unused serial aliases
>  - cleanup unused sdhci0 (un-populated) aliases
>  - cleanup unused main_i2c1 (un-populated) aliases
>  - add missing main_i2c0 aliases
>  - fix bootph, function, color, gpios order in leds nodes
>  - drop local cpsw disable, needs to be moved to k3-am62-main
>  - MSPM0L1105 add firmware source and note where emulated
>  - usb0 add note about Type-C connector, but only wired for USB 2.0
>  - usb1 add compatible note with original PocketBeagle expansion boards
> Changes since v1:
>  - fix '_' in main-i2c2-default-pins
>  - aliases i2c match original pocketbeagle
>  - add mcu_m4fss with reseved memory and mailbox
>  - drop unused main_gpio0_pins_default pinmux
>  - drop unused main_gpio1_pins_default pinmux
>  - drop unused main_spi2_pins_gpio pinmux
>  - Reserve 128MiB of global CMA
> ---

I must say this is a fun little board! Excited to see all the carrier 
boards people will make :)

Reviewed-by: Bryan Brattlof <bb@ti.com>

~Bryan

