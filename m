Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55A27C369D1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 19:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7jgnpxJBroqmGgF9RegbrqkOqfq6AUI492Gh3HYB7II=; b=T7aYQOYCpgrmONDv4YZ5p719Kr
	jYtx/gZ0McoRCk8q64xQ1jkC1tKdbSAfa0VgeXxIXDjL2i5FUBSWosCW6UqQE+UFHt5SMYkXd0vry
	DE4AK4gLNEf5LanaaBoVZMlmXBFrxxRH/knnbSkm9Ee/daM6NFIjAYLfzsexOQwV6+5fI0jexfpNn
	eZMOMUl5Mx+3xIkhwFqfwf1ShChfdsZp+xFoLpb/VEk1X07PtfDkoCdxqioOzj+lCPCyKu/JgnQLW
	PvzNXPKQZfAauZZzX64Mt+NT1QHjz4zFn0NZS6embBk1W7WxS4Lc51VuxMJUPjaSicN4ZFJi564vS
	Wd3Ds5VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7JbI-00000008Mwy-08L2;
	Tue, 22 Apr 2025 19:48:12 +0000
Received: from mout.gmx.net ([212.227.17.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7J4w-00000008HgS-1LAN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 19:14:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1745349268; x=1745954068; i=wahrenst@gmx.net;
	bh=7jgnpxJBroqmGgF9RegbrqkOqfq6AUI492Gh3HYB7II=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:From:Subject:To:
	 References:In-Reply-To:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=ZbgjCBN8g2+IcErVhtpHqXb8euo8B+ldrBMmTlDlQ3VckIuQwsyiTUHMPDV5Fb8W
	 mHP07pcRaOHdv48BCOllfvuKdgaz5LD6qGIFvjfrVqK4MNqg632AXIDNjYzhZT6BS
	 sIovTZzQw5NWIddIGqNeG6Y30/fkGHe8bvPGg+XLMqDgZ1zoYIEfFbRSwq1rt6ZPS
	 gk6Iajqvqpc62YUKmOjDo/yUs6SMePaXng0F2aUnug8utD/qHfvA42H9zbTcli1KX
	 PP4wuQCglghMiWTt+LMvPPvRjH6O1n4TVbt0cDWpsNgsGwu9M0R4ss0ntAuPviPbw
	 8aAaLd0ksDO608f1/g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.107] ([37.4.251.153]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M9Wyy-1uAczI2nxM-000Hyo; Tue, 22
 Apr 2025 21:14:28 +0200
Message-ID: <20c11fba-421d-4f73-bd4c-f9d177e7167e@gmx.net>
Date: Tue, 22 Apr 2025 21:14:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Stefan Wahren <wahrenst@gmx.net>
Subject: Re: [PATCH v9 -next 04/12] clk: rp1: Add support for clocks provided
 by RP1
To: Andrea della Porta <andrea.porta@suse.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Krzysztof Wilczynski <kw@linux.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Linus Walleij
 <linus.walleij@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic
 <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Saravana Kannan <saravanak@google.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-gpio@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
 Herve Codina <herve.codina@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Andrew Lunn
 <andrew@lunn.ch>, Phil Elwell <phil@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 kernel-list@raspberrypi.com, Matthias Brugger <mbrugger@suse.com>
References: <cover.1745347417.git.andrea.porta@suse.com>
 <e8a9c2cd6b4b2af8038048cda179ebbf70891ba7.1745347417.git.andrea.porta@suse.com>
Content-Language: en-US
In-Reply-To: <e8a9c2cd6b4b2af8038048cda179ebbf70891ba7.1745347417.git.andrea.porta@suse.com>
Autocrypt: addr=wahrenst@gmx.net; keydata=
 xjMEZ1dOJBYJKwYBBAHaRw8BAQdA7H2MMG3q8FV7kAPko5vOAeaa4UA1I0hMgga1j5iYTTvN
 IFN0ZWZhbiBXYWhyZW4gPHdhaHJlbnN0QGdteC5uZXQ+wo8EExYIADcWIQT3FXg+ApsOhPDN
 NNFuwvLLwiAwigUCZ1dOJAUJB4TOAAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEG7C8svCIDCK
 JQ4BAP4Y9uuHAxbAhHSQf6UZ+hl5BDznsZVBJvH8cZe2dSZ6AQCNgoc1Lxw1tvPscuC1Jd1C
 TZomrGfQI47OiiJ3vGktBc44BGdXTiQSCisGAQQBl1UBBQEBB0B5M0B2E2XxySUQhU6emMYx
 f5QR/BrEK0hs3bLT6Hb9WgMBCAfCfgQYFggAJhYhBPcVeD4Cmw6E8M000W7C8svCIDCKBQJn
 V04kBQkHhM4AAhsMAAoJEG7C8svCIDCKJxoA/i+kqD5bphZEucrJHw77ujnOQbiKY2rLb0pE
 aHMQoiECAQDVbj827W1Yai/0XEABIr8Ci6a+/qZ8Vz6MZzL5GJosAA==
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:Ntqta0IiidRZQq7Lb9rAcotXlATvSMUgzlP7Se2sAXsQhLJBxQ4
 yyWYwBm2nrVVOv7vwfEvZbEHdhYpbmL0SgbF4Q+3/x1PYOo/hxmHsMf5yHadkEFCJQtJO3r
 VXXdBu/ZUbnnBDhbuukVjKfXsM2ugFlO4GQ2cOvaLT/XaUvjG6l8NyjWwqfUdAkRYo5pacf
 VzEgZeMbhtRcBfppw6s2w==
UI-OutboundReport: notjunk:1;M01:P0:GXGW574ymxc=;wFIfr50NKDhE8PgYJYzjDQS0Vrz
 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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_121446_658506_03386557 
X-CRM114-Status: UNSURE (   8.83  )
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

Am 22.04.25 um 20:53 schrieb Andrea della Porta:
> RaspberryPi RP1 is an MFD providing, among other peripherals, several
> clock generators and PLLs that drives the sub-peripherals.
> Add the driver to support the clock providers.
>
> Signed-off-by: Andrea della Porta<andrea.porta@suse.com>
Reviewed-by: Stefan Wahren <wahrenst@gmx.net>

