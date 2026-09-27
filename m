Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45D85C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 22:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JEunWAHORE7QJB/neAIW01XaMMmd387JTP0GNMR9sns=; b=MbdES4IqTS/P4EzkKkZo+OYxaB
	saefc+UWk2FNxB3xVkB6dctG/Uau4DABqmrhleajiRpKqzj0BE/3AgjUdDnBQE7VvcgCE7M3qlOHg
	YdaOrZRsMuw/vFt709CYxU01INOgN3jqA+0TN4VY15l5LT4K/+eFAEphQZhzQRQLYEuqHWM5RzILx
	xPYNBTYKCKg8M6wmoTmnqIA/+iIzxVqEowISOwKureEk3cYPLje6oRFe+ne2YR2WP5EtSdF3gbxPH
	RMkmKO63BqFsgXiFNsbSz36XIEHd2DgRyLIrroNRa3KqaDAZWVKosB8Vr5kX4+r3ZuipTepb0sQb1
	xcujNn8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAxhw-0000000GyWx-206P;
	Sun, 27 Sep 2026 22:50:56 +0000
Received: from mx3.wp.pl ([212.77.101.9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAxht-0000000GyW9-0rHG
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Sep 2026 22:50:55 +0000
Received: (wp-smtpd smtp.wp.pl 24064 invoked from network); 28 Sep 2026 00:50:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1790549448; bh=JEunWAHORE7QJB/neAIW01XaMMmd387JTP0GNMR9sns=;
          h=Subject:To:Cc:From;
          b=SW4bKTD99CIEBzOAOnbCdCbxnLD5oiN19v3D6iKcSp24mV0bwXxSx7X/F0SWsjB82
           Wr1YVt/6ztmLR9WI5jKeIX0c6o81L+OMFCs5M9iZ5LrCbs+S+0f3O3IILshw+N3F7g
           c/BN3T3+gKZPrrDV5Humvar+bNqYE7UNykB1wzbNIhbHU0jfmDJir5gOTLEXhzCAaY
           KcLKwep19qDWLvSReDnVSCJKcs/SOFJu81gxtLouNHVCjF9CzwwUV4xU0jVBsatGny
           hv1cJE4+LVxVumBDpjGLfLv5+ToX6ZPl+vMkoLqRJZN4wIAi0hXaOeqZHMUbcf/owd
           Rd2EKszugdfOA==
Received: from [192.168.3.224] (83.5.247.9.ipv4.supernova.orange.pl [83.5.247.9])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with TLS_AES_256_GCM_SHA384 encrypted SMTP
          for <andre.przywara@arm.com>; 28 Sep 2026 00:50:48 +0200
Message-ID: <c643fc84-4f6d-4d69-8f22-4ca12a0fc125@wp.pl>
Date: Mon, 28 Sep 2026 00:50:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: allwiner: h5: OrangePi PC2: add ethernet LEDs
To: Andre Przywara <andre.przywara@arm.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, wens@csie.org,
 jernej.skrabec@gmail.com, samuel@sholland.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250818163520.1004528-1-olek2@wp.pl>
 <20250909012422.43b755a4@minigeek.lan>
Content-Language: pl
From: Aleksander Jan Bajkowski <olek2@wp.pl>
In-Reply-To: <20250909012422.43b755a4@minigeek.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-WP-MailID: 2d5fbca267295a9889e4413d24c1aeb8
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000000 [8ROs]                               
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_155053_721264_B35B8185 
X-CRM114-Status: GOOD (  14.85  )
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

Hi Andre,
I see that my previous reply didn't reach lkml

On 09/09/2025 02:24, Andre Przywara wrote:
> On Mon, 18 Aug 2025 18:35:13 +0200
> Aleksander Jan Bajkowski <olek2@wp.pl> wrote:
>
>> This patch adds support for Ethernet LEDs.
> So I tried this on my OPi-PC2, but I cannot influence the LEDs. I have
> CONFIG_LED_TRIGGER_PHY and CONFIG_LEDS_TRIGGER_NETDEV built in, and I
> see mdio_mux-0.2:01:amber:lan and mdio_mux-0.2:01:green:lan in
> /sys/class/leds, but anything I write into trigger does not seem to
> change the output: it always stays on the network functionality, I
> guess because it's still configured to the PHY hardware wired function?
>
> What am I missing?
>
>

You should also set up the name of the device that controls the activity:

Example:
root@OpenWrt:/sys/class/leds/mdio_mux-0.2:01:green:lan# echo "eth0" > 
device_name
root@OpenWrt:/sys/class/leds/mdio_mux-0.2:01:green:lan# echo "1" > link_10
root@OpenWrt:/sys/class/leds/mdio_mux-0.2:01:green:lan# echo "1" > 
link_1000
root@OpenWrt:/sys/class/leds/mdio_mux-0.2:01:amber:lan# echo "eth0" > 
device_name
root@OpenWrt:/sys/class/leds/mdio_mux-0.2:01:amber:lan# echo "1" > rx
root@OpenWrt:/sys/class/leds/mdio_mux-0.2:01:amber:lan# echo "1" > tx


In the second iteration, I added the default-spate = “keep” property. By 
default,
the LEDs will be activated as before.

Regards,
Aleksander

