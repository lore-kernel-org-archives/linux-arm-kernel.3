Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8929BCD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 May 2026 16:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F0M/i/h5xaq0aXZFAyNQRQ+mUTF2jhMyQ16lC400vJ4=; b=zkFegDiOytL0x1dJFUemy9vJzV
	vmOivA4c0er6rAHxh528WLP3roizyrbgeQWWdOYoctohzfWbHDfXIbDlgyexmcdCmMyAnaQd11t3n
	iQ5wZlezMB1cf8u4nrNSXaEvq7D03LQNFzQ1ssgS4T68QlyFiVscBHdxVkUUzrWYvp2BhGZE3nnu5
	TLpmfEJvJIOBIWwjh/1hJmvPtCNxDCqxDCwGt8pITa1/YcmK6hL8XMMPPSlFFabEwP3JO65VPySFA
	UAs2vb7e8UevEPon7NiqgYYFMmiTKG0jwirgdB2nQdiuZZkQwHotfoWv5vE6WrAGKC0t2+1x6tGyU
	9+gZ0bHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOHYL-0000000AzlF-2aDm;
	Sat, 16 May 2026 16:07:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOHYI-0000000Azk5-3L1P;
	Sat, 16 May 2026 16:07:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1BA0E4166B;
	Sat, 16 May 2026 16:07:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B08BBC19425;
	Sat, 16 May 2026 16:07:29 +0000 (UTC)
Message-ID: <daa8e97a-6422-48a3-8634-cf6d4eb8ab7c@tuxon.dev>
Date: Sat, 16 May 2026 19:07:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/5] ARM: configs: at91: sama7: add sama7d65 i3c-hci
To: Manikandan Muralidharan <manikandan.m@microchip.com>,
 alexandre.belloni@bootlin.com, Frank.Li@nxp.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, nicolas.ferre@microchip.com,
 linux@armlinux.org.uk, mturquette@baylibre.com, sboyd@kernel.org,
 tytso@mit.edu, aubin.constans@microchip.com, Ryan.Wanner@microchip.com,
 romain.sioen@microchip.com, durai.manickamkr@microchip.com,
 cristian.birsan@microchip.com, adrian.hunter@intel.com,
 jarkko.nikula@linux.intel.com, npitre@baylibre.com,
 linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
References: <20260507084805.481737-1-manikandan.m@microchip.com>
 <20260507084805.481737-6-manikandan.m@microchip.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260507084805.481737-6-manikandan.m@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260516_090746_857367_701FA44B 
X-CRM114-Status: UNSURE (   4.24  )
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



On 5/7/26 11:48, Manikandan Muralidharan wrote:
> Enable the configs needed for I3C framework and microchip
> sama7d65 i3c-hci driver.
> 
> Signed-off-by: Durai Manickam KR <durai.manickamkr@microchip.com>
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

