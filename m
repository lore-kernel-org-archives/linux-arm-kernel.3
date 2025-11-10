Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54082CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 07:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XwWXlcD2QHd3J6mfyhMce5c1M88wj7XNZuDI+QPCNPc=; b=fy22LdL8VO2+nrdfL3RiKwHU58
	oTWEq2MmZsPhsYAW/SGqbZ/nhtlhCpKAe7Z31Wg3TOlibTNjlezhdbdTTA7I3rYR0/YJoSME6VAMj
	RHQKEXovVm1fROzUCHUq5PDh/82zCvKnlAkIPHH2+ZRnpTIBdNZgxZua3VTYoqIGWGssNrq3hF8nN
	zikRKd28D+h88BbdJaXWqwO63k9bhXmMJDdJqhLr6ZsN9zGiyIUaX+HnJW5aVmUCH+Xf+tX5CbxrB
	ju2shzMiOZrGmVNNmxiIQAKo7GWaZz4a07Lg8MzfO1/P65WRY/8WjuaPeZTLB4DDcwz88pvFpHjA9
	PKaf1dEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIMiV-00000004v1c-2yXK;
	Mon, 10 Nov 2025 07:53:35 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIMiT-00000004v0o-2QOB;
	Mon, 10 Nov 2025 07:53:35 +0000
X-QQ-mid: zesmtpip4t1762761171t85c608ae
X-QQ-Originating-IP: 4/pj04GV+NUG9bPpfO1T31SnMqTdV393yM24KkNEq88=
Received: from [IPV6:240f:10b:7440:1:64e0:6ba: ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 10 Nov 2025 15:52:47 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3134091033668820903
Message-ID: <0C31787C387488ED+fd39bfe6-0844-4a87-bf48-675dd6d6a2df@radxa.com>
Date: Mon, 10 Nov 2025 16:52:46 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND] Re: [PATCH] PCI: dw-rockchip: Skip waiting for link up
To: Shawn Lin <shawn.lin@rock-chips.com>, Niklas Cassel <cassel@kernel.org>
Cc: Damien Le Moal <dlemoal@kernel.org>, Anand Moon <linux.amoon@gmail.com>,
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Dragan Simic <dsimic@manjaro.org>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?=
 <kw@linux.com>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>,
 mani@kernel.org
References: <20250113-rockchip-no-wait-v1-1-25417f37b92f@kernel.org>
 <1E8E4DB773970CB5+5a52c9e1-01b8-4872-99b7-021099f04031@radxa.com>
 <6e87b611-13ea-4d89-8dbf-85510dd86fa6@rock-chips.com>
 <aQ840q5BxNS1eIai@ryzen> <aQ9FWEuW47L8YOxC@ryzen>
 <55EB0E5F655F3AFC+136b89fd-98d4-42af-a99d-a0bb05cc93f3@radxa.com>
 <aRCI5kG16_1erMME@ryzen>
 <F8B2B6FA2884D69A+b7da13f2-0ffb-4308-b1ba-0549bc461be8@radxa.com>
 <780a4209-f89f-43a9-9364-331d3b77e61e@rock-chips.com>
 <4487DA40249CC821+19232169-a096-4737-bc6a-5cec9592d65f@radxa.com>
 <363d6b4d-c999-43d4-866e-880ef7d0dec3@rock-chips.com>
Content-Language: en-US
From: FUKAUMI Naoki <naoki@radxa.com>
In-Reply-To: <363d6b4d-c999-43d4-866e-880ef7d0dec3@rock-chips.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrsz:qybglogicsvrsz4b-0
X-QQ-XMAILINFO: NDd9MucL1yTJP8cslL27VgoiFHesaAmGI8PUnF2ncR/NwSMNxHDMHj/c
	rCh3V0/XArTE0RE2jpdRHQijik12OEfi8E+Wal5zRRSbeC50GTE53hSS9bKaoEYUrPuTReI
	XsbIaS9R1ih+4njnNW0uHsXRm2kx6EbdtRCCM5IiO8LO0Y+bd/Qp4+3oJuKHUsC0g622oxf
	8IQRcJ6ib6lPmvGn1aNROCX7NixdZEe95rCSJyqbnnH7k665xTlEsCSUa/JWCxinrNKGDzU
	yUE30Xc+0r2uctajNr8zM4KnXYtf4NFcpAHf2rkLC8AOKtGhbCSQYafz8gDzVWpM1zXlBct
	gVqmao0bnJ1ZfpOKJcZXT3KffHGKvRDZHXj/oeCK/p77BCwYJTJaOhjN2Ep4Lz+hZAK5Jxx
	xfvmgDwrl+f4vI6XfQsZFgyqt5bkRFXSaqb8LGj+qfoZTwYxXjyQT7D181r+7+Z9K/J7lyC
	I8uJOEWwMjmphI9ePhN5lpNKDka6/fhO9WMscyqLxWfQ7VZ8UGFvImXNygg5m6Pts+Us7YQ
	ZHO0xHZKQvzoCrwY0lGUZ5LQDr0Hh1DRbEiJELHWMiWvwXV0umFSnkXuZ6PJN1gPC2vfNSq
	MAvMPWZ71dzG/5uUIYAo1nNJ9yLxX4oNXgTBt0OrD4TecUElV0Cr7WlVpXhM24Ux/SHGn85
	tXe+4tw5sAXgOfVSbceDv4eLRDqhWScJ2udV2rne7q7LeWdjL06Oa84DJaZl0LYQJo1HVPI
	EObwJtNGDhlnltdlbt+IP3OHLaQDlQJxXVDZQ0Escf+OGlGqzIdpgA61ObFd4xu/M66Sten
	GHaH1F39I4Y8Hq4eN1BVYAHQ3+rsPSybgTs+qTWqPCVPW5Fn7dh/QMZEgGgzCmfX5lLYB2K
	6Ua5HgX1oju+jkoiUD0f8zYaIk0NcB03P/aMJZSotzb1T3O6tASW9sClsq53U3efVyzotMD
	XgEndcutICkHrzlXjJRp1qFf8r26E9u+5D/KN6AjQWrzfgh63Kl4Bqq0kk7nclK3uNRVrf8
	8dsGEHAkB3vvvXT3Im
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-SPAM: true
X-QQ-RECHKSPAM: 3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_235334_002265_FB254B0C 
X-CRM114-Status: UNSURE (   7.91  )
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

Hi Shawn,

On 11/10/25 16:12, Shawn Lin wrote:
(snip)> Thanks for testing. I just got a ASM2806 switch as yours and 
verified it
> on vanilla v6.18-rc5. After 30 times of cold boot, two NVMes behind
> ASM2806 work as expected. Nothing special happened when I checked
> with PA as well. You could help check the log and lspci dump there[1].
> 
> [1]https://pastebin.com/sAF1fT0g

Thanks for the info!

I tried ASM2806 on Radxa ROCK 5B (RK3588).
  https://gist.github.com/RadxaNaoki/640e47d377add9fe38301de164d4058e

It doesn't work on PCIe 2.0 (M.2 E Key), but it does work on PCIe 3.0 
(M.2 M Key).

Could you try PCIe 2.0 slot on your board?

Best regards,

--
FUKAUMI Naoki
Radxa Computer (Shenzhen) Co., Ltd.


