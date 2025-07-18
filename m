Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AE70C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 05:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W/KPWTypw68rlP2ivlSO9Nj2ROf6caTcYTdVpsWKxvc=; b=ZeLNz57GsPLIhQYcD4SZuVPGS/
	N/439fU1UlxXesMd0JTsiD7r9QpE0eE0nI560ShsPeUc0au1DyAH0oNT2YCfyBA0h+RP84y9lh/p6
	0HFswCbocGS24jWV3Jj4jDVfWE7CS5DAcbAhBKPBr7ni5JDdvuHtIwvjnUNHewzYthbxsXVQSZf+N
	df3bWo2vbCaBcW4SYGkXbAk5ELOaitzmKB7LEPyivcjyo+RQZ0O1cPhxSZb2Dz275M/LouDngGB1g
	37/O/krWCF8u8BkiyCmFHRl6nYAVVPbi5lSOwWgWbvm8GFmy0xjjRV72I8jW3Y4kZXYSGwUjP2Up1
	dIN/M8YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucdPV-0000000Bi9b-3vbl;
	Fri, 18 Jul 2025 05:13:29 +0000
Received: from cpanel.siel.si ([46.19.9.99])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucdN2-0000000Bi1E-3z8I
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 05:10:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=W/KPWTypw68rlP2ivlSO9Nj2ROf6caTcYTdVpsWKxvc=; b=bHtpiwwMCcg9TRDTp1vAU0mAOP
	UjNvWxcSyqSJ1QV/cYhkOdE7c4/VHxifdUj0l19MpDEXumGku8zcyYtRE/wTEdvZMmJBBicB0kTEh
	Wg5k1ZH2+24DmV/mquzZDK+0fpj65l1nbauMJG6b7w/oJv3LZdhyFJy3dOhRUFG8pypH+zRXWzqDC
	fGUWkB3gjZAzgGhQ8EMG3d5s0ga0H4gQMlHyQQVTG9fPhWoRIZNXRpVsIEhfA0wq54aCWnnUFK1wc
	dmH2yiqBHomhi/mzhjf/YKY0q3UlI4McXLMS7XTKkJJBGVIGz1eC1NKy4x1dF3iMmZblqw8P9zDuo
	UtlbD7jQ==;
Received: from [89.212.21.243] (port=48060 helo=[192.168.69.116])
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1ucdN0-000Axh-0k;
	Fri, 18 Jul 2025 07:10:53 +0200
Message-ID: <4a882430-877c-40e9-b7bd-21d423340b20@norik.com>
Date: Fri, 18 Jul 2025 07:10:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Populate of_node for i.MX netdevs
To: Jakub Kicinski <kuba@kernel.org>
Cc: Wei Fang <wei.fang@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>,
 Clark Wang <xiaoning.wang@nxp.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, imx@lists.linux.dev, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, upstream@lists.phytec.de,
 Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>
References: <20250717090037.4097520-1-primoz.fiser@norik.com>
 <20250717070204.66e34588@kernel.org>
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
In-Reply-To: <20250717070204.66e34588@kernel.org>
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
X-CRM114-CacheID: sfid-20250717_221057_462073_A61DAD4E 
X-CRM114-Status: UNSURE (   7.53  )
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

Hi Jakub,

On 17. 07. 25 16:02, Jakub Kicinski wrote:
> On Thu, 17 Jul 2025 11:00:35 +0200 Primoz Fiser wrote:
>> Recently when working on predictable network names for i.MX SoCs, it
>> was discovered that of_node sysfs properties are missing for FEC and
>> EQOS interfaces.
>>
>> Without this, udev is unable to expose the OF_* properties (OF_NAME,
>> OF_FULLNAME, OF_COMPATIBLE, OF_ALIAS, etc.) and thus we cannot identify
>> interface based on those properties.
>>
>> Fix this by populating netdev of_node in respective drivers.
> 
> Seems legit, but would be good to CC Open Firmware maintainers.

Added Rob & Saravana to CC.

> 
> If we want to make propagating the OF linkage a think I think we should
> add a flavor of SET_NETDEV_DEV() which does that for the caller.
> SET_NETDEV_DEV_OF() ?

OK, so you suggest to add MACRO:

#define SET_NETDEV_DEV_OF(net, np)  ((net)->dev.of_node = (np))

I like the idea too.

Way cleaner especially if others will join later.

Shall we do that already for v2 or as a separate series?

BR,
Primoz


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

