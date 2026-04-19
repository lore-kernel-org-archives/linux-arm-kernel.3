Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6DF4EA719A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Apr 2026 15:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:In-Reply-To:References:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cLT2eB/INmsUfan5ZJAA2c3NcOmLZcowwg74jDCzZuo=; b=sD83iQEvAECmM92TRww+87bDae
	yMdvfN0CPXDFk/Q0K33MTOwTa4AIRgpwHXT2NHXwL50FuW2FDcUTsBKa7pGfP9dswKRWoObjmddyN
	zWamWpVIt08CZOci35JFNKAapUBLlQ/vYq8icsmf4G4N/8Rm5KIW8WboSihlhB6dM1pTqwoh7tmdl
	pdHbqaKREgjwUFw3T3YLfVftDLiX9YUG+WEN8AkO3lYn0OdWfiD20KxCX88eK9LeVb2+DEo7u6XMM
	6X9SK4JZVksufOUTtXN3f3Afo5r0TwbNZMKtIGEDAx7g0GZ17W10HE5jidcufrV0sNSLabwHQ5PQI
	huDmE/9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEULf-00000005u0F-3poY;
	Sun, 19 Apr 2026 15:46:15 +0000
Received: from out-174.mta1.migadu.com ([95.215.58.174])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEULd-00000005tzS-138b
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Apr 2026 15:46:14 +0000
Date: Sun, 19 Apr 2026 15:42:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1776613559;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cLT2eB/INmsUfan5ZJAA2c3NcOmLZcowwg74jDCzZuo=;
	b=j2Zw050Wogbc2NCupEep4CzUQsU7sA3tgzIJaluoWghjIvUaL0f7VP2OZgBqANVGKwEX+W
	G/Azd3ri6eq84cN/+3ERkL3ueNR5HbXYh4JG3LZCWrtSV2HI+suUWTassAM20Psu757NTv
	IzHmQCw1pzmfmWBameM/c69i4bkt5/NJq0QN0D4Lp/A4yE6/KkOEfxWtLtbUjg3XHvhH/c
	iHIsiKEIjwRjVWHIk8xO3VtPfOqFXH16NqXuSDJ5BIzdr3cLEFVxyxpArtbrwM+HLQaEIC
	mGNo/PUbm0Ztu2c4uF24lNy4HHVlAr6afGwLLP/OMNop4LnSkkoG34OX4daGWQ==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ferass El Hafidi <funderscore@postmarketos.org>
To: linux-amlogic@lists.infradead.org, christian.koever-draxl@student.uibk.ac.at, neil.armstrong@linaro.org, khilman@baylibre.com
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Christian Stefan K=?UTF-8?B?w7Y=?=v=?UTF-8?B?w6k=?=r-Draxl <christian.koever-draxl@student.uibk.ac.at>
Subject: Re: [PATCH] arm64: dts: amlogic: add support for Amedia X98Q
References: <20260419150855.121136-1-christian.koever-draxl@student.uibk.ac.at>
In-Reply-To: <20260419150855.121136-1-christian.koever-draxl@student.uibk.ac.at>
Message-ID: <tdqzsc.3ut55yjhut283@postmarketos.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8; format=flowed
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260419_084613_523772_EF21AA6E 
X-CRM114-Status: GOOD (  10.55  )
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

On Sun, 19 Apr 2026 15:08, christian.koever-draxl@student.uibk.ac.at wrote:
>From: Christian Stefan Kövér-Draxl <christian.koever-draxl@student.uibk.ac.at>
>
>The X98Q is a TV box based on the Amlogic S4 (S905W2) SoC.
>Add the device tree for this board and document the compatible string.
>
>Supported features:
>- 1GB/2GB RAM (via U-Boot memory fixup)
>- 10/100 Ethernet (Internal PHY)
>- eMMC and SD card storage
>- PWM-based CPU voltage regulation
>- UART (Serial console)
>
>Signed-off-by: Christian Stefan Kövér-Draxl <christian.koever-draxl@student.uibk.ac.at>
>---
>- The Wi-Fi chip on this board is Amlogic W150S1. I have left the SDIO node enabled
>  but omitted the specific chip sub-node due to lack of mainline drivers (yet).
>- The console uses uart_b at 921600 baud.
>- Verified memory via /proc/device-tree; U-Boot patches the node to around 2GB if board supports more than 1GB.
>- Tested on the 2GB RAM plus 16GB EMMC variant.
>

Also, I just noticed now, but you seem to be missing a lot of people in
your To/Cc. You should use get_maintainer.pl to get the list of
the people you should send your patch to.

(you can also use b4 (v0.14 is what I use) to make sending patches
properly much easier)

--
Best regards,
Ferass

