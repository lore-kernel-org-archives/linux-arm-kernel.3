Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0AC2EE6B68
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 21:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VRXrvJyXuU80BGjmx7qnWd/sGJIr3g8x8V6NGdVYxEc=; b=AaRmAuMmndOfzb4KXwqEstTEBP
	JPDSjYeqC8LGKZs4p1DLp947DXtfrq1SR/qbhL6Wgq/ruhfR7iifPDOFpkEb8dB/oDvuqwpAqUKDD
	Uw35PcDzY4WByqqNgK6KSCV2bgph/VDO+MGn/RP+JUmgYib+YyE+Xs2rsCmSmT1yGjH66yu+x6S8w
	wONWC5hhq17EW0McOsXI7qGLn3R7Z3VWEz3e+9ADDjowY3BSNTC+Bd5E1JUE5iv1VsiCd7WBTt9So
	Y+CayYMTun/amu4V+6D/jUoZNWC8tYYxdPoxEgDYb5gubDxnp5rABa/oKCoqDd8AvKCA3uWUl6kU1
	eRM5BQXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voThE-0000000Br6f-0hFK;
	Fri, 06 Feb 2026 21:49:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voThB-0000000Br5u-0D9c;
	Fri, 06 Feb 2026 21:48:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DC63B42E42;
	Fri,  6 Feb 2026 21:48:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEEB0C116C6;
	Fri,  6 Feb 2026 21:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770414535;
	bh=H4erEfFToWfA+jBlL+HzFAov4TXWTZ4TqD9JOrZRmYM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZmGMT+PGeTzXZO+POJyn2sjH2EwLirAqkA5MCZoTylQFmpKaTF74vh7v+MVhvogVQ
	 5pDkxCSVhCnpH18eWqoHtjadUXSq7Zh41dMGgS1u8Kj1Yw6J65uS2zhhwuezAW13zR
	 glma8FHw5oOBbljFoTlD3CCNCAN1ySOGaltxJEKDGgvckBzsqYPVROXDpExH1UPyzo
	 dvgRIx7MGZFCLWGHeo+RvDS02vpdY0LmeVEixaGrQa5y55dPcEOnOM8Z9foQoGVgEG
	 lslHXVbVoImpqhccP7i5/WMxFObd9iCL9qEMzfqCvPNpDdJaARNqBKHhFchBZPcDEO
	 UWNNS8i6TWA8A==
Message-ID: <d1a092bb-515f-4b37-ba2b-2d455778a6ed@kernel.org>
Date: Fri, 6 Feb 2026 22:48:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [bug report] phy: apple: Add Apple Type-C PHY
To: Janne Grunau <j@jannau.net>, Dan Carpenter <dan.carpenter@linaro.org>
Cc: Neal Gompa <neal@gompa.dev>, Neil Armstrong <neil.armstrong@linaro.org>,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-phy@lists.infradead.org, linux-kernel <linux-kernel@vger.kernel.org>
References: <caa37f28-a2e8-4e0a-a9ce-a365ce805e4b@stanley.mountain>
 <aYXvX1bYOXtYCgfC@stanley.mountain>
 <20260206214743.GA194367@robin.jannau.net>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20260206214743.GA194367@robin.jannau.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_134857_111507_0812D350 
X-CRM114-Status: GOOD (  12.27  )
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

On 06.02.26 22:47, Janne Grunau wrote:
> On Fri, Feb 06, 2026 at 04:40:47PM +0300, Dan Carpenter wrote:
>> [ Smatch checking is paused while we raise funding.  #SadFace
>>    https://lore.kernel.org/all/aTaiGSbWZ9DJaGo7@stanley.mountain/ -dan ]
> 
> This is unfortunate, there have been useful bug reports.
> 
>> Commit 8e98ca1e74db ("phy: apple: Add Apple Type-C PHY") from Dec 14,
>> 2025 (linux-next), leads to the following Smatch static checker
>> warning:
>>
>> 	drivers/phy/apple/atc.c:2209 atcphy_map_resources()
>> 	warn: 'resources[i]->addr' isn't an ERR_PTR
>>
>> drivers/phy/apple/atc.c
>>      2191 static int atcphy_map_resources(struct platform_device *pdev, struct apple_atcphy *atcphy)
>>      2192 {
>>      2193         struct {
>>      2194                 const char *name;
>>      2195                 void __iomem **addr;
>>      2196                 struct resource **res;
>>      2197         } resources[] = {
>>      2198                 { "core", &atcphy->regs.core, &atcphy->res.core },
>>      2199                 { "lpdptx", &atcphy->regs.lpdptx, NULL },
>>      2200                 { "axi2af", &atcphy->regs.axi2af, &atcphy->res.axi2af },
>>      2201                 { "usb2phy", &atcphy->regs.usb2phy, NULL },
>>      2202                 { "pipehandler", &atcphy->regs.pipehandler, NULL },
>>      2203         };
>>      2204         struct resource *res;
>>      2205
>>      2206         for (int i = 0; i < ARRAY_SIZE(resources); i++) {
>>      2207                 res = platform_get_resource_byname(pdev, IORESOURCE_MEM, resources[i].name);
>>      2208                 *resources[i].addr = devm_ioremap_resource(&pdev->dev, res);
>> --> 2209                 if (IS_ERR(resources[i].addr))
>>
>> This is checking the wrong variable.  The * is missing.
>> if (IS_ERR(*resources[i].addr)) {
> 
> This issue was identified by testing and is fixed in next by commit
> 7d55b44e2be1 ("phy: apple: atc: Actually check return value of
> devm_apple_tunable_parse").
> 
> https://lore.kernel.org/all/20260104-atcphy-tunable-fix-v2-1-84e5c2a57aaa@kernel.org/

I think I actually messed this up *twice*! Once for the tunables and 
once again for the resources here :(


Sven



