Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D77B5C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 May 2025 21:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ML8DjRZA7cKit0Oa6eU0aLRHGdDqUBnThTiiLI5SiXM=; b=SCiua/h77PzDG1y6cxxopIVjlS
	cY7IIWBulzxqpsXpFuMOS3wpmlpF877KxSbdTO4dwws6KnBreTHmRXQ3r4oA4Nop+hrGJSvO4aSBQ
	wbLAeorIUargOfTT3Mgb4NvNIpMwEnyQE22ZkhkGlAZHKZuUHdgKnj2M1aLQgd1rioRgXuCmHOuZN
	ycdxU6A4ybU7tzknvo+tN2No//fIYkC7uLNFQz6SRiuks/qy+NDFo8/gJ0RFMSGWVI/eeklliAFub
	Yc8Q74rLZhn+bbLIdhug8ayrYThX+g4UoLiZSuInDKqovzN62CPUZtpV8VzEDb2VRlam88d+AaB9x
	GpWqkaJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBgVn-00000005xAf-3jib;
	Sun, 04 May 2025 21:04:35 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBgTt-00000005wyZ-1ebO;
	Sun, 04 May 2025 21:02:38 +0000
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-7c597760323so408066685a.3;
        Sun, 04 May 2025 14:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746392556; x=1746997356; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ML8DjRZA7cKit0Oa6eU0aLRHGdDqUBnThTiiLI5SiXM=;
        b=i2VTaY1IRl0cJwJukD/UonBeMgZ6vu6j985hLZP6p/hUSO6LxFy2CayyFhaX6rEeNV
         IVb7+3o6SKLUIAydEVn1Y00DEtFEfNfyLRLDO+Tb9Rwb8Z6nf9hGvNQbo4JR56gJ94Ry
         /t7AnrrdxJOZA7hmincJZFh8RRQRBMTrQQWKuXIioz5fOfaWyXJtHK59o3WuHIcLnmD/
         3s0mYp9j7V8VnZTD8z5d4X425/xW4M8is9Cyfx5XSgdtHpcOpzEITajpwUFQCoHq26Y0
         ApkpwoLJCH4V6v0jdYZBtCQxaTSu08R9HCYrujPLGu07dNWrApm12VVVKatuKjAaik3X
         TulA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746392556; x=1746997356;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ML8DjRZA7cKit0Oa6eU0aLRHGdDqUBnThTiiLI5SiXM=;
        b=hIXqf75l0HL2jehLXFK+BVoz3Zuto4Uc930Falmo4/fajEO81BBjVAJomCLhB76DMT
         vvlIzH4NccLtERak/xjVDMwRUAzA3u8ut6hwqZK+mf1Oa1gpTi/k1mokR76iHFGyCSTv
         3ENV3anby2OudEZq64IhlG0xuvd8EGSkeFtq/aC0GRE3YEDrlr+whJWXtiZ27qAG43ve
         3chCwhzCXPDQxspiC32pyY+Yf2pqocSo7m6YTIqDTv+/U7p0we1e6AZ+V/iOBnuC/T5w
         00SAwesCg7JzocN+EACUwf0tr82maHChdyI4zsSJL3VE4eRNWHoBifqiqArt7D+qsXBk
         OPyA==
X-Forwarded-Encrypted: i=1; AJvYcCVMddlnodrUb8p4SbL0NWZTCRdv0xeWUzuguvkx9cUt9p+gLZomH/z3FsZrnvtmjEt3rl5OBudsoLmYY7Xp7Daw@lists.infradead.org, AJvYcCVxBPBNFt1lUTPwMWm4ge87psbtB+Fsruhfe4hFpu+95lL9HyYl6DAjZuSzSWwUVGJJ+MyX1Tgo31bZ3i91DXQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YzZUyapxmn8cYXnE5uAB5DjpwnkCKSDStlERh6stFajuNKnmqcL
	/6cJ7Y/UR2jhnKVkmmOl+zUBHZrOGkG/lVqgnsTvYHLe0lPjYakC
X-Gm-Gg: ASbGncvWCLN/2Z3aBJGxp9RwQnr8gT8jR9n9HVpB3H6nEAV5aXA/3GWD61L/lfeXtGP
	ySYQjMDGecyHOnfwoAxt2mAMF0K2vu3ksuFXDz6VERykfjQEaJUl6fSdu150y+a7iSdfnuCL7EI
	nfibRBsL4RG+8HyiZqV2AtecOoYWYbaAXJQQ4DIsYK2bP+lC28pSwqcgoBLBqZX2v5eQRRYJ6DE
	f7qe28bnR/B+fiU1Ra5sAF9Ewk8qqBhysWVS2gM4ppHSp6Z7l3haSrXGfQto5p16VgQH2OVm/+7
	M0L8vqbY4dz7XGB8g0a2QlgyE78RzIL5IFc2r1lz/IVaFbM02GIIJ3OQNnCEuQ==
X-Google-Smtp-Source: AGHT+IE28+xEK7288oQImXpZSUZs2LbwMwLdxQciIh7WFkHeIOKTXFrxgU5POHxG3pYM8Mke5GY4gQ==
X-Received: by 2002:a05:620a:2697:b0:7c5:49b7:237c with SMTP id af79cd13be357-7cadfe16d0dmr954871285a.27.1746392555994;
        Sun, 04 May 2025 14:02:35 -0700 (PDT)
Received: from [192.168.21.149] ([216.237.233.165])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cad243f339sm472102685a.90.2025.05.04.14.02.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 May 2025 14:02:34 -0700 (PDT)
Message-ID: <b603e92f-8c1a-4aea-8bab-82a1f035c7fa@gmail.com>
Date: Sun, 4 May 2025 17:02:33 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: rockchip: Add Luckfox Omni3576 Board
 support
To: Andrew Lunn <andrew@lunn.ch>, Jonas Karlman <jonas@kwiboo.se>
Cc: heiko@sntech.de, robh@kernel.org, conor+dt@kernel.org,
 detlev.casanova@collabora.com, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250502205533.51744-1-inindev@gmail.com>
 <20250504102447.153551-1-inindev@gmail.com>
 <20250504102447.153551-4-inindev@gmail.com>
 <bb171ae2-c495-49a3-a7eb-a4b865e54199@kwiboo.se>
 <87892840-bdbf-43d4-bd93-cb98f5e1c672@lunn.ch>
Content-Language: en-US
From: John Clark <inindev@gmail.com>
In-Reply-To: <87892840-bdbf-43d4-bd93-cb98f5e1c672@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250504_140237_435196_96DAFE98 
X-CRM114-Status: GOOD (  18.13  )
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

On 5/4/25 10:12 AM, Andrew Lunn wrote:
>>> +&gmac0 {
>>> +	clock_in_out = "output";
>>> +	phy-handle = <&rgmii_phy0>;
>>> +	phy-mode = "rgmii-rxid";
>>
>> See Andrew's remark on v1 of this patch.
> 
> Hi John
> 
> If you have questions, please ask. It is not a good idea to silently
> ignore reviewers comments. Either do something about it, ask
> questions, or politely argue why the reviewer is wrong, because
> sometimes we are.
> 
Hi Andrew,
Thanks for your feedback and the link to the RGMII delays discussion. I 
assumed you suggested switching to phy-mode = "rgmii-id" from 
rgmii-rxid. The vendor’s downstream kernel uses rgmii-rxid with tx_delay 
= <0x20>, as shown in my post. I tried rgmii-id and removed tx_delay, 
but the interface failed to get a DHCP address. Reverting to rgmii-rxid 
with the delay restored functionality. Any advice on correctly 
configuring rgmii-id or adjusting delays for this board?
Best,
John Clark

>>> +	pinctrl-names = "default";
>>> +	pinctrl-0 = <&eth0m0_miim
>>> +		     &eth0m0_tx_bus2
>>> +		     &eth0m0_rx_bus2
>>> +		     &eth0m0_rgmii_clk
>>> +		     &eth0m0_rgmii_bus
>>> +		     &ethm0_clk0_25m_out>;
>>> +	snps,reset-gpio = <&gpio2 RK_PB3 GPIO_ACTIVE_LOW>;
>>> +	snps,reset-active-low;
>>> +	snps,reset-delays-us = <0 20000 100000>;
>>
>> The snps,reset- props are depracated, please move to reset props in the
>> Ethernet PHY node.
> 
> FYI: snps,dwmac.yaml says:
> 
> snps,reset-gpio:
>      deprecated: true
>      maxItems: 1
>      description:
>        PHY Reset GPIO
> 
> Anything with 'deprecated: true' you should not be using in new DT
> blobs. Don't blindly copy vendor DT, you need to verify it is up to
> Mainline quality, and if not, bring it up to Mainline quality.
> 
>>> +	tx_delay = <0x20>;
> 
> This property probably plays a role in the issue with phy-mode.
> 
> arch/arm64/boot/dts/rockchip$ grep "rgmii-id" *
> rk3328-orangepi-r1-plus-lts.dts:	phy-mode = "rgmii-id";
> rk3566-bigtreetech-cb2.dtsi:	phy-mode = "rgmii-id";
> rk3566-nanopi-r3s.dts:	phy-mode = "rgmii-id";
> rk3566-odroid-m1s.dts:	phy-mode = "rgmii-id";
> rk3566-orangepi-3b.dtsi:	phy-mode = "rgmii-id";
> rk3566-radxa-zero-3e.dts:	phy-mode = "rgmii-id";
> rk3566-rock-3c.dts:	phy-mode = "rgmii-id";
> rk3568-evb1-v10.dts:	phy-mode = "rgmii-id";
> rk3568-evb1-v10.dts:	phy-mode = "rgmii-id";
> ...
> etc.
> 
> You might be able to learn something from these.
> 
> 	Andrew

