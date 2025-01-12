Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2A83E7719C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jan 2025 08:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rrBZMX3isiKut8IdPpzmOqVncQJFg6Ju0J78pmuQScM=; b=uq8bvKwhtwJfSF56LVGzO6z+CT
	zyEjtY/jVd6MSthb9baPT0jI6hPp4xczZ2zqz2FhDtmmEJ4unECDT0tbubyEoiVQfieIYP2X3C42R
	212+efBPvtPAsPGnhscLoN51fgY2bb++iFYYsrPD39BtCFKeXmj1r/43uQfFFZzrgieu7R9vXVmaK
	H21aQY+05sMHsYTYVse1Y+bGzCBRLGIbq/PBh5eiHuEDqnW2EXTUwZS/IDRLJz3OdF5x25zK3evVd
	JXOwM7qJR+7oOWI9RzvUYGD+Ybc+2GroSSMRfozO0DW7faaAUvtffqwER9hhYsu5QAkzsqBroqpL4
	m5PbyrOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWte4-00000002Mp3-14n5;
	Sun, 12 Jan 2025 08:48:32 +0000
Received: from mail.manjaro.org ([116.203.91.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWtcn-00000002MiB-48dE;
	Sun, 12 Jan 2025 08:47:15 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1736671629;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rrBZMX3isiKut8IdPpzmOqVncQJFg6Ju0J78pmuQScM=;
	b=t4mIgqp1KbrRwBjEHiQep2+1HN9DuwuuoZou78uVv25jvPOgyher+SCTS9YSdxvxKCeNyS
	1emd0DhoHgm73m70TR9pm8uuhSCFvfyp7ohVKlacoQjedQwKE6lR4OGZH6NlUxGecfkEc3
	yXqCRn2Yio6zRt174sDL1cxk0zBDaQBaZIp0j/4JVyhrv9V5RiqezUXPYbSOqZNAfL+sAh
	xtnvWYOSNT4JvOrXA2MXRik+nDw3bwwcBujywrI3SMYQGUFuZTTcQuJhHA4pzrZ/8FJM0r
	mBGeaHXkuEkaF7bTeFMGVchCl9Y//okNmreQKTZnZjRGdp549vFcxvDdlNsBWQ==
Date: Sun, 12 Jan 2025 09:47:08 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: Junhao Xie <bigfoot@classfun.cn>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Jonas
 Karlman <jonas@kwiboo.se>, Chukun Pan <amadeus@jmu.edu.cn>, FUKAUMI Naoki
 <naoki@radxa.com>, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/3] arm64: dts: rockchip: add dts for Ariaboard
 Photonicat RK3568
In-Reply-To: <20250112073344.1976411-4-bigfoot@classfun.cn>
References: <20250112073344.1976411-1-bigfoot@classfun.cn>
 <20250112073344.1976411-4-bigfoot@classfun.cn>
Message-ID: <1e72cc9cdc390e79e97806fe4f7d8abf@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250112_004714_203062_7D972EB6 
X-CRM114-Status: GOOD (  12.06  )
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

Hello Junhao,

On 2025-01-12 08:33, Junhao Xie wrote:
> Add dts for Ariaboard Photonicat RK3568.
> 
> Working IO:
>     Debug UART
>     SDIO QCA9377 WiFi and Bluetooth
>     M.2 E-Key PCIe WiFi and Bluetooth
>     M.2 B-Key USB Modem WWAN
>     Ethernet WAN Port
>     MicroSD Card slot
>     eMMC
>     HDMI Output
>     Mali GPU
>     USB Type-A
> 
> Not working IO:
>     Ethernet LAN Port (Lack of SGMII support)
>     Power management MCU on UART4 (Driver pending)
> 
> Not working IO in MCU:
>     Battery voltage sensor
>     Board temperature sensor
>     Hardware Power-off
>     Hardware Watchdog
>     Network status LED
>     Real-time clock
>     USB Charger voltage sensor
> 
> About onboard power management MCU:
>     A heartbeat must be sent to the MCU within 60 seconds,
>     otherwise the MCU will restart the system.
>     When powering off, a shutdown command needs to be sent to the MCU.
>     When the power button is long pressed, the MCU will send a shutdown
>     command to the system. If system does not shutdown within 60 
> seconds,
>     the power will be turned off directly.
>     MCU only provides voltage for charger and battery.
>     Manufacturer removed RK8xx PMIC.

Unless the design of the board is proprietary, it would be good
to provide a link to the board schematic, for those interested
in verifying the board DT file.

As a note, I already tried to find the board schematic with no
success, so the design might be proprietary.

