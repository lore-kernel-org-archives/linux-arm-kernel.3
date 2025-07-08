Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEBABC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 08:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QQvqBPw3McC9h/lzq7+wr98DNQmeALi71dtMM2h+vvA=; b=sRSfVtR0EYAMztDgGKUAF5dFxc
	6PQn4mWnL0D5M7LWiIGF8tXrIzU3qzzsObPDzuGjiOVZF8KnXvclYhBdssZBs7+K2jwl/acWT5kFu
	pZ/+SYDeuwUQAmVHUGo2Br3XjatqlhjE/t00qLDsY/Ps3jOf9koIW6UD/n0qL47YhiY0S56unWlgH
	8vQlLO77SR7LH6JeKW7DA5rXGa+6Zym4mJ0D6teiQr46NHVmJI5a/WVYh+SxyRMdDxfGRUBUYbS55
	nkXPf3/9DNdl+IAKJpbC4cd/XO5CEAinziCzzeGGSgTXHwAIbUy7/NSjDGrJJGjLSTSxUPYLVNJdv
	lhwL7Ijw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ41x-00000004nXi-2yo1;
	Tue, 08 Jul 2025 08:50:25 +0000
Received: from cpanel.siel.si ([46.19.9.99])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ3nN-00000004lRn-3V6B
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 08:35:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=QQvqBPw3McC9h/lzq7+wr98DNQmeALi71dtMM2h+vvA=; b=Uoqz69KkweX+xolNw0fj5ALFgs
	7zrkprM5ZpFOzRU+Vfu9WO3o2ScIRGOHtTXPjD2P7uJLEv9QHETYbAMAP3jeglq8JMpJlXO28fvxj
	7Z+YNnvyxWSfelsJINuJSnGOSpZxc0xJdWSyLxiPSVMriVc4ETkvAz1htxqoZGPMKtIQYfCDJfFd/
	j/swsNLxnpRgfp8WnjkMvbwUhaZkpBKvQzWOkJVb7K1nixQDeAkuvQa0xKKHcZVVEcvvm/3L5Qv5M
	nYluUtHkU1L5Pw79zTJLOzhFY/YcKiXD8oPrWGJOGW3XgZfRYtKuREUeoiphUEuCFPQ3bigB/SxAS
	NKsTQAaA==;
Received: from [89.212.21.243] (port=49512 helo=[192.168.69.116])
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1uZ3nJ-00GzWU-2v;
	Tue, 08 Jul 2025 10:35:17 +0200
Message-ID: <626bca58-e481-4d6f-9bb7-252c040f4b3b@norik.com>
Date: Tue, 8 Jul 2025 10:35:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Upstream] Re: [PATCH v3] arm64: dts: freescale:
 imx93-phycore-som: Delay the phy reset by a gpio
To: Andrew Lunn <andrew@lunn.ch>, Christoph Stoidner <C.Stoidner@phytec.de>
Cc: Stefan Wahren <wahrenst@gmx.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "upstream@lists.phytec.de" <upstream@lists.phytec.de>
References: <b2ea6b7f-3623-4486-82a0-cab97053a53e@gmx.net>
 <34a4441d4b4ed8db7cac585ce93ec2357738cc11.camel@phytec.de>
 <7f6d7199-0a20-4370-a8b0-1d05326af052@gmx.net>
 <bf0eb48fc72f4b0abbf62077c2f1fe4438579746.camel@phytec.de>
 <967484d9-4165-4b75-bbb7-a203c36e8beb@gmx.net>
 <517be266ebc3b55da53372a76a139245f8945cd8.camel@phytec.de>
 <5afa6d62-4a3f-4c28-8165-363075ac36d8@lunn.ch>
 <a948b903766a82897e5fc17a840ab40e29f5eda4.camel@phytec.de>
 <8e448625-b4ad-4bf1-8930-6fecdedb1d8d@lunn.ch>
 <78ec24d09d129d52d3442f6319cf1ef5b6ce7f3d.camel@phytec.de>
 <739f93d0-4cb4-4f1a-8792-84502d4beefe@lunn.ch>
Content-Language: en-US
From: Primoz Fiser <primoz.fiser@norik.com>
Autocrypt: addr=primoz.fiser@norik.com; keydata=
 xjMEZrROOxYJKwYBBAHaRw8BAQdAADVOb5tiLVTUAC9nu/FUl4gj/+4fDLqbc3mk0Vz8riTN
 JVByaW1veiBGaXNlciA8cHJpbW96LmZpc2VyQG5vcmlrLmNvbT7CiQQTFggAMRYhBK2YFSAH
 ExsBZLCwJGoLbQEHbnBPBQJmtE47AhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQagttAQducE+T
 gAD+K4fKlIuvH75fAFwGYG/HT3F9mN64majvqJqvp3gTB9YBAL12gu+cm11m9JMyOyN0l6Os
 jStsQFghPkzBSDWSDN0NzjgEZrROPBIKKwYBBAGXVQEFAQEHQP2xtEOhbgA+rfzvvcFkV1zK
 6ym3/c/OUQObCp50BocdAwEIB8J4BBgWCAAgFiEErZgVIAcTGwFksLAkagttAQducE8FAma0
 TjwCGwwACgkQagttAQducE8ucAD9F1sXtQD4iA7Qu+SwNUAp/9x7Cqr37CSb2p6hbRmPJP8B
 AMYR91JYlFmOJ+ScPhQ8/MgFO+V6pa7K2ebk5xYqsCgA
Organization: Norik systems d.o.o.
In-Reply-To: <739f93d0-4cb4-4f1a-8792-84502d4beefe@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cpanel.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_013522_356100_E85E6D4F 
X-CRM114-Status: GOOD (  18.40  )
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

Hi all,

is there something holding up this patch?

BR,
Primoz

On 2. 06. 25 14:26, Andrew Lunn wrote:
>>> I agree it is long enough, but i'm also surprised how slow the kernel
>>> was. Are you using a fixed IP address, or dhcp?
>>
>> I use a fixed IP address.
>>
>> But isn't the bringup of ethernet+phy interface one of the last things
>> that happens during the kernel boot-up?
> 
> Mounting the rootfs is somewhat towards the end of the core
> kernel. But if you have an initramfs, there can be modules loaded both
> before and afterwards, and once the rootfs has been mounted, yet more
> modules can be loaded.
> 
>> However, what timing would you expect?
> 
> I've seen interfaces configured up from deep within
> register_netdev(). I don't remember the exact configuration, but i
> thought it was NFS root. It might be in combination with initramfs. If
> you have the Ethernet driver as a module in the initramfs, and are
> using the "rootwait" option, it could be that you are already past the
> point it would first mount the rootfs, and with every new device
> popping into existence it is trying to see if the just created device
> allows it to do the mount. At that point, register_netdev() is going
> to trigger actions.
> 
> 	Andrew
> _______________________________________________
> upstream mailing list -- upstream@lists.phytec.de
> To unsubscribe send an email to upstream-leave@lists.phytec.de

-- 
Primoz Fiser
phone: +386-41-390-545
email: primoz.fiser@norik.com
--
Norik systems d.o.o.
Your embedded software partner
Slovenia, EU
phone: +386-41-540-545
email: info@norik.com

