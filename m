Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BB57CA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 16:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mM96EH6+OvEcFcgZIg/Izjec9utL//+6+FzoZE3eP/I=; b=gjYZN5nzixR4O5FMPmGvC/KiNG
	3+/sveddt//MSY9xtoEIVK4h03H2JdadKhNm8+FMBS+ZIJGkhfrX+AX/wblMsLFIGQ0FrrRn0/7dh
	VE7yO0SxB8UNwYoX0BYAtO17PCf4BctbSyoPvcjPq6cFaStggd990pmZ+U2v8qFn5IzwQ7Of2psQj
	8i/LTYG5466+XU8m1vxSihEgpIM2pSQZGaeNKMzb24js0Wn3oZmhei4dldkXoZh15fJi1Dq/8rEBz
	AcW4nA+dO9ZjMQtSmu2kmULEAqsSZzQaUozto5BG8/hBrx6OT00hG6tUuACJE0HsXQ+OHqBYqrH5O
	dIKQ1PDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDlWC-0000000GppE-3h9U;
	Mon, 05 Oct 2026 16:26:24 +0000
Received: from xmbghk7.mail.qq.com ([43.163.128.50])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDlW8-0000000Gpom-2dFc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 16:26:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1791217577; bh=mM96EH6+OvEcFcgZIg/Izjec9utL//+6+FzoZE3eP/I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=MfTGUDxi+UN0hsK/OAOGHm2aw/nh9jCYFSf20bmqP+QC6h2h6Qg+VIb0hdERWJqHI
	 8ikH80zF+Ja00BLxE4GoRbLooTm1xI/WArbQ66KmuTZMyM2lNrEqEAWxr7OAGWTE6a
	 2GUQtnC1vTGqGPjAwbhDIy8FzjAzMxUdXqhgrVtA=
Received: from [198.18.0.1] ([2409:8a7c:21c:8010:c675:1308:618e:14ff])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id 68EABA6E; Tue, 06 Oct 2026 00:26:14 +0800
X-QQ-mid: xmsmtpt1791217574thc5z48a5
Message-ID: <tencent_13712505F7B9023560934C4431D3411C1508@qq.com>
X-QQ-XMAILINFO: Me8mHstNM5a8SJ1BJzUVkamztcveQ3txPTzgUYUGcf+HueWlJZc2WpvtxLMDfw
	 APP03LMvlAUXwRXad9ICAXzfE1q3sj1h/EiynQQmAjd2YYdYLbufeaeo3zUmGXdwsE60wrhXFyL6
	 N/7wMfc6KQVmxmDO+KeNpZe+KagorjYyndye/7s7sxF+n9cQVFIqtl3zWDfmq62EBmKCSRVG/jei
	 TGFhGohyKb4UrwnJCzdguv4e5Az+1o3z6X9yZHVfZXbxgeAoj4p9IGQFh3I8NwY2cYzdzrMgjva7
	 cqYWnteOl5/wZ1P6ZMcNU8lYLg2D4KmaTEiausW4J7rqkfyIDMBanoPZxJpm7fR22GXG+gloF9Ab
	 p1/C1cR2jq9OlZu63j2APyeq1UfF7bin2ZgG/ZwHRafAGVdAIdIxmsC2NcD+Ll6a3jABMo7qWdEB
	 4GnWzj9W520b64Vn4bS0uHxxfF+vX2omtYlIVUDp3DZVie7jTOHm4wbhHakk739n0LwAnIszbCJ4
	 fHcYdD7y7/moEhzhGLeNekxzOwaFiCNYUxrAJ1c2YsMVMHx3OW6yR+X1eyLUbLbwBXVEHXq+Fq3q
	 EwnYQoN3hc3zMspH476AGbyrvzZ//GICk4kbWhcq5dHQJLoMXhJKHJAj9pIQIPcv6hAYDqDKQNg3
	 m+KVhX9PsYxyzduXBOLxqlBRHCUak4ANcZvRpyUdRnAj0/JdYmXzthGDHQsud1iDStd9y83DQHBC
	 /o6Q/qbaRwqLmHAC+Q7DlwFyF8ukhTQOjBmG4iuNiHJwziuSgWtK2oskN90zd2EsC8zH0lyi6qrK
	 Nk2MwSstGeOPJ0PKH/Kt+BuYqfDWuUCyG4VG09byMPkCW3pwRkHln7SyXCalflR1tQks3aI+YxNo
	 /Zwk9+6Kf+WclgCnKhLA7jaURpSExwgZz9vKhgVgrS+/o+SlxxTp/TUnRIMOIAF2fkSyEso32/W4
	 zAbec6F0b+gzUAhfLS+l5OqCW+KMHdunWnzyfSEjXFUpfgXDHb4kyf2NFJMnP8WVWATDxm6aK7jW
	 DVNJ/e9QlKoXUVYRYvtlF5y0sguQmj5mhCna/MdlbDIMc0j2rQ
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-OQ-MSGID: <e2571f5c-820d-4d4c-85ac-1908b55db0ed@qq.com>
Date: Tue, 6 Oct 2026 00:26:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: zynqmp: Add EBDEE EdgeBoard FZ3A development
 board
To: Andrew Lunn <andrew@lunn.ch>
Cc: Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Michal Simek
 <michal.simek@amd.com>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261003194625.936288-1-2254650260@qq.com>
 <tencent_06FFBD8580099835137D0C541050057B4906@qq.com>
 <fb944e1e-2386-4e5e-a2f8-8c0ccf66362f@lunn.ch>
Content-Language: en-US
From: Pufan Jin <2254650260@qq.com>
In-Reply-To: <fb944e1e-2386-4e5e-a2f8-8c0ccf66362f@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_092621_696829_565EB543 
X-CRM114-Status: UNSURE (   8.63  )
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


On 2026/10/5 05:25, Andrew Lunn wrote:
>> +&gem3 {
>> +	clocks = <&lpd_lsbus>, <&zynqmp_clk GEM3_REF>,
>> +		 <&zynqmp_clk GEM3_TX>, <&zynqmp_clk GEM3_RX>,
>> +		 <&zynqmp_clk GEM_TSU>;
>> +	phy-mode = "rgmii-id";
>> +	status = "okay";
>> +};
> No MDIO bus? No phy-handle?
>
>     Andrew
Hi Andrew,

Thanks for the review. In v1, the mdio node and phy-handle were omitted,
relying on the Cadence MACB driver's MDIO auto-probing, which was 
incomplete.

According to the hardware schematics and live register readback, the board
has an on-board Micrel KSZ9031RNX Gigabit PHY strapped to MDIO address 1
(PHYAD[2:0] = 001b, PHY ID 0x00221620).

In v2, I have added an explicit mdio bus node with the PHY at reg = <1>:

```
     mdio {
         phy0: ethernet-phy@1 {
             reg = <1>;
             compatible = "ethernet-phy-id0022.1620";
         };
     };
```

and referenced it with phy-handle = <&phy0> under phy-mode = "rgmii-id".

This has been validated on physical hardware at 1000 Mbps Full Duplex
with zero CRC/frame errors.

Best regards,
Pufan Jin


