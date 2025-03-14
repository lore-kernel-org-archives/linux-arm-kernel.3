Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB1B4C28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 09:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IxDTWIZSeguFxII/h+vp4Q/n1issodU5t0n062nhjZ8=; b=aUsIWYe7V6h3U22sbgpOHR2hQ4
	mXJYgW4y3lrRPnNOoYLibpEBuLeBPJEi6THUDr1+1PhMRAmb6llq2cfXWrA+SlyjIhBkWl1lLDkrP
	/8YLwyVcldXDgWW08b7Ly7u2yq+u8b5UY3hQJ/kH+0fIk2Uu+ymD30Cc3yJILLor7TPVuAxuWMZix
	+QGfWCnQUuHyVRU2nt/YAht/QNtYDQXsbQGfQ3zn06x0PxmbnRgjp/wS640bh4Eu+anMkz5DT+UU4
	v2KlPjB7tPO11TtnI0DC4Lh7ts/mB2zLUSbTguNmjY6gzIjopxreIIhxmDHe5iOtK2z8lM/xfrdF2
	/vQL88iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt11Z-0000000DcS9-47Jy;
	Fri, 14 Mar 2025 09:08:13 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt0wg-0000000DbVL-0S5i
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 09:03:11 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0737B4415D;
	Fri, 14 Mar 2025 09:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741942985;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IxDTWIZSeguFxII/h+vp4Q/n1issodU5t0n062nhjZ8=;
	b=kvh2pmzSvgV1G8pTOQLE0GER4g7Rg6JnqX+5FCPeATHnu4apFryWeq4h4e99XsPsvRhV+b
	d1e5uo9Xn+ddHKrhTETWynLW0p2V0SLnY6JePKcSnoGBAldlXO/ZmxINYwzlcfm6ERHbHJ
	jZKflPyalMr9ZG+npnqDsie7GBYchMZSaUMkbMFltCFDfL2ykoWdV4wGvHf7I46nq/sDa/
	YuujSxq8by2gqoRijOSTo1JBSFP+XNtM8t8XKpFUcgWljTgbJIKY16AYYFm1goIHnEDuWR
	h1pgDMGoWSIWbCvfJSp/LyAzjcT7NY1HroG2oZvPGCmLoXgpx0kn9EEhgNAbyA==
Message-ID: <88b3ecbe-32b6-4310-afb9-da19a2d0506a@bootlin.com>
Date: Fri, 14 Mar 2025 10:03:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] PCI: j721e: Add support to build as a loadable module
To: Siddharth Vadapalli <s-vadapalli@ti.com>, lpieralisi@kernel.org,
 kw@linux.com, manivannan.sadhasivam@linaro.org, robh@kernel.org,
 bhelgaas@google.com, vigneshr@ti.com, kishon@kernel.org, cassel@kernel.org,
 wojciech.jasko-EXT@continental-corporation.com, bwawrzyn@cisco.com
Cc: linux-pci@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 srk@ti.com
References: <20250307103128.3287497-1-s-vadapalli@ti.com>
 <20250307103128.3287497-5-s-vadapalli@ti.com>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <20250307103128.3287497-5-s-vadapalli@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddufedtgedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomhepvfhhohhmrghsucftihgthhgrrhguuceothhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeuhefgfeehveeggfeggfekhfehgfffkeeghfeuffeikeekjeehkeetvedthedtieenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemfhegtdemsghftddtmehftdehgeemtgeltgdvmedvudgtfeemudehieeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemfhegtdemsghftddtmehftdehgeemtgeltgdvmedvudgtfeemudehieeipdhhvghloheplgfkrfggieemvdgrtddumegtsgdugeemfhegtdemsghftddtmehftdehgeemtgeltgdvmedvudgtfeemudehieeingdpmhgrihhlfhhrohhmpehthhhomhgrshdrrhhitghhrghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudejpdhrtghpthhtohepshdqvhgruggrphgrlhhlihesthhirdgtohhmpdhrtghpthhtoheplhhpihgvrhgrl
 hhishhisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkfieslhhinhhugidrtghomhdprhgtphhtthhopehmrghnihhvrghnnhgrnhdrshgrughhrghsihhvrghmsehlihhnrghrohdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepsghhvghlghgrrghssehgohhoghhlvgdrtghomhdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtohepkhhishhhohhnsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: thomas.richard@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_020310_472631_910A8F5F 
X-CRM114-Status: UNSURE (   7.31  )
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

> +
> +	if (pcie->reset_gpio) {
> +		msleep(PCIE_T_PVPERL_MS);
> +		gpiod_set_value_cansleep(pcie->reset_gpio, 1);
> +	}
> +
> +	if (pcie->refclk)
> +		clk_disable_unprepare(pcie->refclk);
>  

Hello Siddharth,

I think clk_disable_unprepare() is a no-op if the clock is NULL, so the
if statement is useless.

https://elixir.bootlin.com/linux/v6.14-rc6/source/include/linux/clk.h#L1157
https://elixir.bootlin.com/linux/v6.14-rc6/source/drivers/clk/clk.c#L1237
https://elixir.bootlin.com/linux/v6.14-rc6/source/drivers/clk/clk.c#L1099

Regards,

Thomas



