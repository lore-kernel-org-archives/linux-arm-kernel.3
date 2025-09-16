Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F91FCAC598
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 13:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ib09a/uzULTUP3ZLXwL02uoyXM3Yn6AyZlKW3rPZoDY=; b=pKQQISOX4d5v7nAVkmaSri3Jyy
	4c2Zrbj6Dw4kE8F7L7OSEkqJZbzCW5R0rRUOJuTO3m+khMPflQCDDsPyLcgXVKdX5S8oys+G6NaUK
	vJlj1rxn9pimTwiEslKPiSt1T/p79yoTrLPgmVTmhIK8vrdf8i39NxPfaT+M7jXKYabfD6lqVC5LN
	hU4TUfFLGbmOS0lu7NuKLdZt5+kWmMbkVAVshOCIQBO5nD3n5pI+adYCQL93DaKNql5gWTkzbXhBW
	8orwbMXePqUrbZ32sKdnjXy9ztagJ/m/d0z+ooPKEldGQ9hIrQVjEpcymY/xKQA2egcc0YRGw5qr2
	jg0CC3Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyVan-00000007uTF-2A2O;
	Tue, 16 Sep 2025 13:19:33 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyVak-00000007uSL-0uvV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 13:19:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1758028770; x=1789564770;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=GCqjILCeKyNT+/Gxo+qzeEjfs57+lZtCCEoAb15K/7Q=;
  b=n3zHmSOCT4l074ytm3AL8r+YFjroj0CiAlWgwVZiF2LJb4smkHa4+J7u
   3WZsCGg9maQsMGRaEdaqATKy9ldVAL7lGvYmEIjeWJYlcBWjVZs7eXv6k
   D/FRyM9c/FwNjGe2KLEQH5cw6zWyg9WW+62TgASBWjJkraOzgfXGgECgU
   +dAPzT5G6GbpEiyrCCqYcHOGpMemwULWHpsjG7YmjQdUUb83aDpXyacPX
   bPyvOaz8d5vDlUCJH18tflQORMCZeI+xxf0JGEce+GwjGeuLZ8pF8683G
   2ZfeaoeklhRtto0lpBuzr0MscsI6ZgHOGTcaITpWylouBT2GV3/Jk3GHF
   A==;
X-CSE-ConnectionGUID: V/byoQjpSTeHg7RE9/pKtQ==
X-CSE-MsgGUID: IY9Gcb90RGOMWsNzTufLXQ==
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; 
   d="scan'208";a="52399102"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 16 Sep 2025 06:19:28 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 16 Sep 2025 06:19:15 -0700
Received: from [10.159.245.205] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Tue, 16 Sep 2025 06:19:12 -0700
Message-ID: <0695ca65-536c-48d9-ad1b-49452e67a6f9@microchip.com>
Date: Tue, 16 Sep 2025 15:19:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] ARM: microchip: clk for 6.18 #1
To: <sboyd@kernel.org>, <mturquette@baylibre.com>,
	<linux-clk@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, SoC Team
	<soc@kernel.org>
CC: Linux Kernel list <linux-kernel@vger.kernel.org>, linux-arm-kernel
	<linux-arm-kernel@lists.infradead.org>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Conor Dooley <conor@kernel.org>, Claudiu
 Beznea <claudiu.beznea@tuxon.dev>, <oe-kbuild-all@lists.linux.dev>,
	<llvm@lists.linux.dev>, kbuild test robot <lkp@intel.com>
References: <20250916080545.9310-1-nicolas.ferre@microchip.com>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Content-Language: en-US, fr
Organization: microchip
In-Reply-To: <20250916080545.9310-1-nicolas.ferre@microchip.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_061930_481071_8DDAD302 
X-CRM114-Status: GOOD (  19.53  )
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

On 16/09/2025 at 10:05, nicolas.ferre@microchip.com wrote:
> From: Nicolas Ferre <nicolas.ferre@microchip.com>
> 
> Dear clock maintainers,
> 
> Here are the first clk changes for 6.18.
> I don't think they have conflict with changes for the deprecated round_rate()
> to determine_rate() topic.
> They are in linux-next for a couple of days.

But... this series depends on this patch:
https://lore.kernel.org/r/20250827145427.46819-4-nicolas.ferre@microchip.com

Which will be part of a pull-request to-be-sent soon to arm-soc (which 
is part of linux-next, so the build error doesn't appear there).

Once the pull-request is done, do you prefer that I do an immutable 
branch between CLK and ARM, that I queue this at91 PM patch into the clk 
pull-request or that everything goes through arm-soc?

Thanks to the kbuild test bot.
Regards,
   Nicolas

> Please pull. Thanks, best regards,
>    Nicolas
> 
> The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:
> 
>    Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)
> 
> are available in the Git repository at:
> 
>    git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/clk-microchip-6.18
> 
> for you to fetch changes up to e3130c2a9a0c8e549e044e659be6f762a1b1f725:
> 
>    ARM: at91: remove default values for PMC_PLL_ACR (2025-09-15 16:24:25 +0200)
> 
> ----------------------------------------------------------------
> Microchip clock updates for v6.18
> 
> This update includes:
> - add one clock for sam9x75
> - new meaning for MCR register field in clk-master
> - use force-write to PLL update register to ensure
>    reliable programming sequence
> - update Analog Control Register (ACR) management to accommodate
>    differences across SoCs
> 
> ----------------------------------------------------------------
> Balamanikandan Gunasundar (1):
>        clk: at91: sam9x7: Add peripheral clock id for pmecc
> 
> Cristian Birsan (2):
>        clk: at91: add ACR in all PLL settings
>        ARM: at91: remove default values for PMC_PLL_ACR
> 
> Nicolas Ferre (1):
>        clk: at91: clk-sam9x60-pll: force write to PLL_UPDT register
> 
> Ryan Wanner (1):
>        clk: at91: clk-master: Add check for divide by 3
> 
>   drivers/clk/at91/clk-master.c      |  3 ++
>   drivers/clk/at91/clk-sam9x60-pll.c | 82 +++++++++++++++++------------------
>   drivers/clk/at91/pmc.h             |  1 +
>   drivers/clk/at91/sam9x60.c         |  2 +
>   drivers/clk/at91/sam9x7.c          |  6 +++
>   drivers/clk/at91/sama7d65.c        |  4 ++
>   drivers/clk/at91/sama7g5.c         |  2 +
>   include/linux/clk/at91_pmc.h       |  2 -
>   8 files changed, 59 insertions(+), 43 deletions(-)
> 

