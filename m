Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01433D41C30
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 10:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IF/vepkYLlzPa+ADSxysQyPEUO3lIiqkFDR8yTHUMM4=; b=EG8yoQoxcXavSjJXdIeH1/NPBX
	BreyKREeDAh0+QyuAfnRO2fx3xlZACaXig5jrOZPisadDOhKOkIZvhCfTpYaFuvMqZ/cPZ8fnnCJ8
	D8DZVq+3QWmv8bSrcc8gS+MaI1giI2J6uBzKqJpDg9XjP0ptfclda9q263HabE0Gn+TwRJ3rEAmzA
	ojcxMEA+mURSVtdhVVkqRUrXWo8hnr2r9nRGKykXaYzZWqqFonYD1V+r3qE/6QI2KnT76WMcXi7KI
	DXmCkv8Vc18uPqapVy63JbEmKeoku8u6yDPc0pfGFHIyFhXSMHnTtMYvHSuM70K+3EyJvMbCjP7ad
	bed9rNOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBAnl-00000006Tnq-00Bh;
	Wed, 13 Nov 2024 10:40:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBAly-00000006Te9-22Ic;
	Wed, 13 Nov 2024 10:38:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=IF/vepkYLlzPa+ADSxysQyPEUO3lIiqkFDR8yTHUMM4=; b=CBe5AvXfestGvhxJcrUgwi+oY8
	xlQe2jcw2KNDE3/hVp9rWxaH3GP9WGhODEAakhm42ENnxCYucOi5UvTqcx9Wa38a1x/2BJdXGruyS
	/maCEg3I4cSNYgNzbn08SV1c1mco+oB/9ETF0mZIDPZpQnQSaIwAv1DKnUqukRVo/Ws899AidjXzl
	jSaUF6gqd10wC/Ai3aIEm4U2iEMjsaORz5TBx4cM/K6uqH51m/aG0OmerXZfCROcxTG9swnLJcumI
	oDCXPoth8j5H7WsQgLnz3OkhaqGlpv14ZdfgSMsIg/nDh7065WS0O+bbECFpEkYpHDsYka4JKAy7a
	DjU1Pbcw==;
Received: from mail.manjaro.org ([2a01:4f8:c0c:51f3::1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBAlv-0000000DFbc-1cES;
	Wed, 13 Nov 2024 10:38:53 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1731494319;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IF/vepkYLlzPa+ADSxysQyPEUO3lIiqkFDR8yTHUMM4=;
	b=TP7jCWIzDHOvG6IaVPJw1zfuuw2FKJ1Bh0h2H/+0gswy1ADCLGYi2WQoTvzZ9ssMgdIryY
	vIu232el3rCYgagbcyYlswLfXcQ2pWLLb7rBWrC6C8tlENyR7M8FHIYXDZvRiG/di/llH4
	WMgmzq9Wwuq3+IorsKn6hlakinn3tNSpUOaxEAgo8Ow6HqCCo+i7KD/W4XpP2CdfDSQESe
	qJto4tSlZESB1jp7tTw7La4pvWBCmrwsuagTnmmlYJ7esUk8/7JMfhqJ0HfZvTZXs6r7Wu
	VKuw19CI5tcn5LNyZfxXC5ty+YjPXelReeTEARGVXGYe/ryfajlFwbt6MnqFNA==
Date: Wed, 13 Nov 2024 11:38:37 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: =?UTF-8?Q?Tam=C3=A1s_Sz=C5=B1cs?= <tszucs@linux.com>
Cc: Jonas Karlman <jonas@kwiboo.se>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, FUKAUMI Naoki
 <naoki@radxa.com>, Chukun Pan <amadeus@jmu.edu.cn>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: rockchip: Enable UART8 on rock-3b
In-Reply-To: <CA+Gksr+E-tZe4sKVNa8zpATwdTW_DiOQxOf_Jujf5SURzhSPSg@mail.gmail.com>
References: <20241111181807.13211-1-tszucs@linux.com>
 <20241111181807.13211-4-tszucs@linux.com>
 <4ba81dfa-f276-4e05-b46b-92f50dbcfcc4@kwiboo.se>
 <CA+GksrJLpeU8x-kjR1Ng3ySf+giiufCsJuBssng9qoX1PjAunA@mail.gmail.com>
 <9330ebb370780c001fd2aaee49aec9e8@manjaro.org>
 <CA+GksrJjDPve29Vh7ZFhM+JFp058xmXZAPeuLuFth7v=JeiH2w@mail.gmail.com>
 <0eb19e4daf2cdf3d4a04935876c3d3b0@manjaro.org>
 <CA+Gksr+E-tZe4sKVNa8zpATwdTW_DiOQxOf_Jujf5SURzhSPSg@mail.gmail.com>
Message-ID: <dc628e6e50239aac65a4424738000612@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_103851_646950_3DB3DFB6 
X-CRM114-Status: GOOD (  27.19  )
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

Hello Tamas,

On 2024-11-13 11:24, Tamás Szűcs wrote:
> On Wed, Nov 13, 2024 at 12:25 AM Dragan Simic <dsimic@manjaro.org> 
> wrote:
>> On 2024-11-12 22:04, Tamás Szűcs wrote:
>> > On Tue, Nov 12, 2024 at 4:07 PM Dragan Simic <dsimic@manjaro.org>
>> > wrote:
>> >> Please correct me if I'm wrong, but isn't this UART supposed to be
>> >> used for the Bluetooth part of an SDIO WiFi + Bluetooth module, in
>> >> form of a non-standard M.2 module that Radxa sells?
>> >
>> > UART8 is supposed to be used for any radio module connected to the M2E
>> > connector.
>> > It will typically be responsible for Bluetooth or BLE but it could be
>> > 802.15.4 or whatever. In any case, all wanting to use it will need the
>> > uart8 node enabled.
>> 
>> I see, but I'm still guessing what's the actual use of enabling the
>> UART8 when it will remain pretty much useless without the additional
>> DT configuration, such as in the WiFi+Bluetooth DT overlay that Jonas
>> sent a bit earlier?
> 
> The actual use is device enablement.

Hmm, I'll need to think more about how it fits together.

>> I think that the UART8 should be enabled together with something that
>> actually makes use of it, which in this case unfortunately cannot be
>> automatically detected and configured, so it belongs to a DT overlay.
>> I'll get back to this in my next response.
> 
> I agree, bluetooth blocks dedicated to specific modules should belong
> to DT overlays.
> 
>> >> With that in mind, I see very little sense in just enabling the UART,
>> >> without defining the entire Bluetooth interface, which AFAIK produces
>> >
>> > Defining a bluetooth node would hardwire idiosyncrasies of a given
>> > radio module's Bluetooth core. Sure you could add a sleep clock, all
>> > kind of sideband signals for wakeups, reset, power down, etc. But hey,
>> > some will use them, some won't. I think it's undesirable and
>> > unnecessary. You can hciattach from here and most will work just like
>> > that. Tighter integration or anything special, module specific on top
>> > should be handled individially, on a case-by-case basis. This is a dev
>> > board after all. I say trick of all trades.
>> >
>> >> nasty looking error messages in the kernel log when there's actually
>> >> nothing connected to the UART.
>> >
>> > My dmesg is clean as a whistle
>> > root@rock-3b:~# dmesg | grep -E 'fe6c0000|ttyS0'
>> > [    0.344818] fe6c0000.serial: ttyS0 at MMIO 0xfe6c0000 (irq = 26,
>> > base_baud = 1500000) is a 16550A
>> > What kind of nasty errors do you recall?
>> 
>> Those would be the kernel error messages produced with the Bluetooth
>> DT configuration in place, but with no SDIO module installed.
> 
> These are the kernel messages related to UART8 with the uart8 DT node
> enabled and an SDIO module installed.

Out of curiosity, what M.2 module are you testing it with?

