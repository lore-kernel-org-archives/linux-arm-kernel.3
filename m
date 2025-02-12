Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3C69C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 22:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w9YBH9UyznpRVlP3/w2Oqz8oZTY66Gg6x58A7aj+HJ8=; b=ZsodXRNUWVp63g8qNlYMGPmnci
	T1Bhqq2n1E7QLOAU8GLDxBF6Y0+dPWSXcF5HLkx9wKDm6vTeqXVxUZQqSUGNUo70r31OntWeuqvGg
	IKFip9VWkmMVGAZ8RDoFJrDT8K5E+bD8tNbKNSAEBrYpGDtakCnuvqgrHu4RJaPR1Y3n1+8P7zJHU
	5zK+R7mBxi1oWG1xYb/CJ4B6srGvHcVp1MTSJnl2p47Y3c8x7x4mOka0/sbvE+a4rDMSwabDSRdmC
	eKRFVFkshpiDSdx8oPEFkMOmdWSeO0NZhh5Ixs/tEJa+CcrH23Mkccxk7deXEDC9x87drQvsjRMzc
	yzcVwjnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiKw4-00000008zef-1sdx;
	Wed, 12 Feb 2025 22:10:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiKud-00000008zLM-2DVc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 22:08:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6BE905C625B;
	Wed, 12 Feb 2025 22:08:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77D87C4CEE5;
	Wed, 12 Feb 2025 22:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739398134;
	bh=RSxeycxN+OR2igWs7iCrFsgBzSuOib+ZW47/gosGsbo=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=S3uDUavh3srVd/+ScWyYzIgrv9yfSjD3VWdiUs8F90WyBe+qeaVzl7rfrHgoMyJna
	 5O92+xsrNLpe8Wx74mhBcJRud9eVDTo0YFmFEk3RWeQroO9xJAnWW1X1GgvcQYHeDc
	 HpTA6edH7JXUog7PEVIKlfYfWRbVkXJR0GOFahCYDF8FksTcB+kh1HkuvX7BoeJPha
	 lntcn9Jr6Zsvj8tcwZKvZSWpgHDCaDHIcvwvqwnJxZj5OPg+BxwbdUrK9c5YcqPVgE
	 CgIAv9ML+/T+BA9G46HeWIU/vjVCmXh8IHjnpZBCDBE9yGB2T52Nf1ixzUnRR8Ct02
	 XkDycYYo+ykow==
Date: Wed, 12 Feb 2025 16:08:53 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
In-Reply-To: <20250212-wilc3000_bt-v1-0-9609b784874e@bootlin.com>
References: <20250212-wilc3000_bt-v1-0-9609b784874e@bootlin.com>
Message-Id: <173939808305.598743.2426492109317429179.robh@kernel.org>
Subject: Re: [PATCH 00/12] bluetooth: hci_wilc: add new bluetooth driver
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_140855_658164_7392AF22 
X-CRM114-Status: GOOD (  37.56  )
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Eric Dumazet <edumazet@google.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Marek Vasut <marex@denx.de>, Ajay Singh <ajay.kathat@microchip.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Marcel Holtmann <marcel@holtmann.org>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Kalle Valo <kvalo@kernel.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org, Simon Horman <horms@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "David S. Miller" <davem@davemloft.net>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org


On Wed, 12 Feb 2025 16:46:19 +0100, Alexis Lothoré wrote:
> Hello,
> 
> WILC3000 ([1]) is a combo chip exposing 802.11b/g/n and Bluetooth 5.
> Support for the wlan part has recently been integrated upstream ([2]) in
> the existing wilc1000 driver. This new series aims to bring support for
> the bluetooth side.
> 
> The WILC3000 chip is controlled through a SDIO or SPI bus for the wlan
> part (similarly to wilc1000), and uses standard HCI commands over a UART
> bus for the bluetooth operations. This work is based on the code
> available in the vendor kernel ([3]), in which bluetooth is managed
> directly in the wireless driver, and relies on user to trigger the
> hardware configuration (chardev manipulations + hciattach). The series
> brings a new dedicated bluetooth driver to support the bluetooth feature
> from the chip, without relying on the user to perform the device
> bringup. However, getting completely rid of the wlan driver dependency
> is not possible: it is still needed for early BT CPU configuration and
> BT firmware download, so the new driver still have a dependency of the
> wlan one, with an approach similar to the one used by the rsi driver.
> 
> - Patch 1 brings the new dt binding
> - Patch 2-9 prepares the wlan side, either by exposing the needed
>   functions to initialize BT, or by mitigating behavior which would
>   prevent BT and WLAN from runnning in parallel
> - Patch 10 brings the new bluetooth driver
> - Patch 11 updates the device tree description for sama5d27_wlsom1_ek
>   board (which I used to validate this series) to use the new driver
> - Patch 12 adds a new entry for this driver in the MAINTAINERS files
> 
> This series has been tested with WILC3000 both in SDIO mode (with the
> chip embedded on the sama5d27_wlsom1_ek) and SPI mode (custom wiring on
> an SPI on the same eval board, with a WILC3000-SD).
> 
> Since this works needs new code in both the existing wlan driver and the
> new driver, I have included both linux-wireless and bluetooth mailing
> lists, while keeping the entire series for clarity, but let me know if
> you want to proceed differently.
> 
> [1] https://www.microchip.com/en-us/product/atwilc3000
> [2] https://lore.kernel.org/linux-wireless/20241004114551.40236-1-marex@denx.de/
> [3] https://github.com/linux4microchip/linux/tree/linux-6.6-mchp/drivers/net/wireless/microchip/wilc1000
> 
> ---
> Alexis Lothoré (12):
>       dt-bindings: bluetooth: describe wilc 3000 bluetooth chip
>       wifi: wilc1000: add a read-modify-write API for registers accesses
>       wifi: wilc1000: add lock to prevent concurrent firmware startup
>       wifi: wilc1000: allow to use acquire/release bus in other parts of driver
>       wifi: wilc1000: do not depend on power save flag to wake up chip
>       wifi: wilc1000: remove timeout parameter from set_power_mgmt
>       wifi: wilc1000: reorganize makefile objs into sorted list
>       wifi: wilc1000: add basic functions to allow bluetooth bringup
>       wifi: wilc1000: disable firmware power save if bluetooth is in use
>       bluetooth: hci_wilc: add wilc hci driver
>       ARM: dts: at91-sama5d27_wlsom1: update bluetooth chip description
>       MAINTAINERS: add entry for new wilc3000 bluetooth driver
> 
>  .../net/bluetooth/microchip,wilc3000-bt.yaml       |  41 +++
>  MAINTAINERS                                        |   7 +
>  .../boot/dts/microchip/at91-sama5d27_wlsom1.dtsi   |   8 +
>  .../boot/dts/microchip/at91-sama5d27_wlsom1_ek.dts |  10 -
>  drivers/bluetooth/Kconfig                          |  13 +
>  drivers/bluetooth/Makefile                         |   3 +-
>  drivers/bluetooth/hci_uart.h                       |   1 +
>  drivers/bluetooth/hci_wilc.c                       | 333 ++++++++++++++++++++
>  drivers/net/wireless/microchip/wilc1000/Kconfig    |   3 +
>  drivers/net/wireless/microchip/wilc1000/Makefile   |  11 +-
>  drivers/net/wireless/microchip/wilc1000/bt.c       | 345 +++++++++++++++++++++
>  drivers/net/wireless/microchip/wilc1000/cfg80211.c |   7 +-
>  drivers/net/wireless/microchip/wilc1000/hif.c      |   2 +-
>  drivers/net/wireless/microchip/wilc1000/hif.h      |   2 +-
>  drivers/net/wireless/microchip/wilc1000/netdev.c   |  14 +
>  drivers/net/wireless/microchip/wilc1000/netdev.h   |   5 +
>  drivers/net/wireless/microchip/wilc1000/sdio.c     | 101 ++++--
>  drivers/net/wireless/microchip/wilc1000/spi.c      |  43 +++
>  drivers/net/wireless/microchip/wilc1000/wlan.c     | 154 ++++-----
>  drivers/net/wireless/microchip/wilc1000/wlan.h     |  23 ++
>  include/net/wilc.h                                 |  19 ++
>  21 files changed, 996 insertions(+), 149 deletions(-)
> ---
> base-commit: 95f6f2d73dc40ab53a94756689ce5cfd2f23361a
> change-id: 20240828-wilc3000_bt-fa452f2a93ad
> 
> Best regards,
> --
> Alexis Lothoré, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/microchip/' for 20250212-wilc3000_bt-v1-0-9609b784874e@bootlin.com:

arch/arm/boot/dts/microchip/at91-sama5d3_eds.dtb: nand-controller: #address-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dtb: serial@200: Unevaluated properties are not allowed ('bluetooth@0' was unexpected)
	from schema $id: http://devicetree.org/schemas/serial/atmel,at91-usart.yaml#






