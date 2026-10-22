Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F709606A322
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 12:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TdXmYvB6;
	dkim=pass (2048-bit key, unprotected) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=Snk5EOio
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=FRwt2WcZeWxHKJ9m7NiyRoa0EfXEk/BEIxFglE8bS0M=; b=TdXmYvB6T0uC9v
	N/z/FlRz8Br4hjBkwECNQAtmbsYneszXFqLz186mlwYbe51oS8+dklTaMI1oj8kfo7A4am8LeB+iz
	f6bUDPbh/maiJdZrz/H0Wg/e0Fy7Jd+J8pLlgRLPt2dFV47jGU2PUpGZYMU98mAPneqRLuzQNBXNK
	eimyqmaqGo94+6b/FIVCvhveSihfFmQryf4qNaubqoQEbmgnNy1GQU0iFck4ZGJZgg/Cscs28Irps
	3GPR8Jko2syYhimctNRKyAF0UYJmw6Kv/NTrkUdT5EhXNqGlGzuulXtxEe6lFhC+Iey87Oa4hVp76
	Ec2vslNJl+8E1DAYKr1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJsML-0000000E7kx-3mBD;
	Thu, 22 Oct 2026 12:57:29 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJsMJ-0000000E7jq-1PL8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 12:57:28 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9123110A9DC;
	Thu, 22 Oct 2026 14:57:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1792673841;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=FRwt2WcZeWxHKJ9m7NiyRoa0EfXEk/BEIxFglE8bS0M=;
	b=Snk5EOioAY/Qi7BuC7hNBky54JtiDqOgfCYOXbVGP4DZQJLIddBItXZl74BVWr7N9Bmx22
	8cWY2LwOzEcQmGs8RzGf1kObRUJVFlNzRGi/5jtaC5oI681+N6ALxeHOlSfBinAK1AKc1h
	yGPb6RxUkhCF3bcHuGJPnKPZHgsWGQeUIPf1gVyF31HBC660eyHsyzPhq+MwNMpgtZfx2/
	XdvVXbOXkjL26AJNjKqgzPFvf45+4EDHjgbJA/gn0q01xVSjqiFLGYYQVZeEWeVupel8cg
	SaXIjFqat3m5/2usJ7tUSscrqUf06paW9YJoo9Ov2Zfzvu9RfFWYtd7XckQufQ==
Message-ID: <3e8b2a76-3372-4bec-abd5-df2b5b03d40b@nabladev.com>
Date: Thu, 22 Oct 2026 14:57:20 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: zynqmp: Add ifm ZynqMP VHIP6 EvalBoard
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Michal Simek <michal.simek@amd.com>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Linus Walleij <linusw@kernel.org>
References: <20260916204509.166633-1-marex@nabladev.com>
 <20260916204509.166633-2-marex@nabladev.com>
 <ad7fdd3a-489a-4573-8dec-961a16e6539b@amd.com>
 <20261013132625.GA159927@killaraus.ideasonboard.com>
 <acdfefce-a7cd-4918-bcca-52357bcf182d@amd.com>
 <20261013175438.GL4214@killaraus.ideasonboard.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <20261013175438.GL4214@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_055727_524683_B92ACCB9 
X-CRM114-Status: GOOD (  20.72  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/13/26 7:54 PM, Laurent Pinchart wrote:
> CC'ing missing ARM64 SoC maintainers.

Has there been any input from the maintainers ?

Thank you for your help !

> On Tue, Oct 13, 2026 at 03:47:12PM +0200, Michal Simek wrote:
>> On 10/13/26 15:26, Laurent Pinchart wrote:
>>> On Tue, Oct 13, 2026 at 10:21:26AM +0200, Michal Simek wrote:
>>>> On 9/16/26 22:44, Marek Vasut wrote:
>>>>> Add support for ifm ZynqMP VHIP6 EvalBoard reference design.
>>>>> The board is populated with four ethernet ports, QSPI NOR,
>>>>> eMMC, UART and USB host interfaces.
>>>>>
>>>>> Signed-off-by: Marek Vasut <marex@nabladev.com>
>>>>> ---
>>>>> Cc: Conor Dooley <conor+dt@kernel.org>
>>>>> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
>>>>> Cc: Michal Simek <michal.simek@amd.com>
>>>>> Cc: Rob Herring <robh@kernel.org>
>>>>> Cc: devicetree@vger.kernel.org
>>>>> Cc: linux-arm-kernel@lists.infradead.org
>>>>> Cc: linux-kernel@vger.kernel.org
>>>>> ---
>>>>> NOTE: Checkpatch complains about ethernet-phy-id2000.a240 being
>>>>>          undocumented, but the TI DP83822I is generic C45 PHY that
>>>>>          is valided by Documentation/devicetree/bindings/net/ethernet-phy.yaml
>>>>> ---
>>>>> V2: - Rename lm75 node to sensor@
>>>>>        - Use GPIO_ACTIVE_LOW macro
>>>>> V3: - Drop bogus clk_ignore_unused bootargs
>>>>>        - Drop gpio line names
>>>>> ---
>>>>>     arch/arm64/boot/dts/xilinx/Makefile           |   1 +
>>>>>     .../dts/xilinx/zynqmp-vhip6-evalboard.dts     | 300 ++++++++++++++++++
>>>>>     2 files changed, 301 insertions(+)
>>>>>     create mode 100644 arch/arm64/boot/dts/xilinx/zynqmp-vhip6-evalboard.dts
>>>>
>>>> I am not able to review or take this board support further without publicly
>>>> available hardware documentation for the platform (board-level and relevant
>>>> interface details). Please share public documentation links once available, and
>>>> I’ll be happy to revisit the patches.
>>>
>>> There are plenty of boards that have no public documentation. Pretty
>>> much all phones and laptops are like that. We even have a whole
>>> architecture that only runs on a few machines in a single person's
>>> basement [*] :-) The kernel has never required public schematics for
>>> boards, SoCs or IP cores.
>>>
>>> [*] A slight exageration possibly, but that's how I heard arch/alpha/
>>>       being described at the maintainers summit.
>>
>> Pretty much every SOC with programmable logic or FPGA boards have unlimited
>> amount of configurations and make no sense to describe all of them.
> 
> As far as I understand, the dts describes the board only, there's no PL
> devices in there. The fact that the SoC has programmable logic doesn't
> seem relevant, unless I'm missing something. The situation is the same
> as with any other SoC. We have lots of device tree sources in upstream
> for all kind of boards, with or without schematics available, for
> development boards or for boards integrated in products, for easily
> available mass-market products or for specialized devices more costly to
> source.
> 
> Maybe I'm wrong about all this, so I've CC'ed all ARM64 SoC maintainers
> on this e-mail to get feedback on the overall mainline policy for
> upstreaming device tree sources.
> 
>> It means what make sense to describe are boards which people can look, check and
>> compare that configuration against their custom design.
>> But if there is no public documentation what you want to use to compare against?
>>
>> Can anybody even buy this board? (I expect you can buy that phones and laptops).
> 


-- 
Best regards,
Marek Vasut

