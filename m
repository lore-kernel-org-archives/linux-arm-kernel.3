Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C7AECD6E5D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 May 2026 14:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VLXr+EftLebvlemJzcLhz6ygozwA9nA/76kYiGsjTf4=; b=kDEsXjixdIrHAgkUfXkT92RIwN
	JPZxgNNJX1HCjll8OLydHm0vV3WpgmucmdfT6u03gbmNqwCYZzoaF6u1lICjGA9LzfqlHxsCtAWIs
	YUCKGCxaotNE/xwoWdKRVllgbbfcfECdn2QpW31pUoTsNvqr+uyE/Ov+vHV6y+JL+IoP3k4C1C80h
	v3CIUXnOyl4EujfkaFqK0tAghiD+MYEsDPHmFoki1vDCJVd73matP+wCMsmZEFeXsMe+atm0AH15K
	V4+aqNJfkcpPcrH5KNxSAantBAJR6ixWHUdHbm+WJQg/E1gT32LWCpFJqgf1RNZI5kcRc53Qg5jz3
	rpJDCMEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wThVI-00000009eqM-2YpU;
	Sun, 31 May 2026 14:51:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wThVG-00000009epq-3YZt;
	Sun, 31 May 2026 14:51:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A92D04166E;
	Sun, 31 May 2026 14:51:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE4A11F00893;
	Sun, 31 May 2026 14:50:56 +0000 (UTC)
Message-ID: <35c2ea3d-e257-43d9-8d02-4a111259fd5f@tuxon.dev>
Date: Sun, 31 May 2026 17:50:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/5] clk: at91: sama7d65: add peripheral clock for I3C
To: Manikandan Muralidharan <manikandan.m@microchip.com>,
 alexandre.belloni@bootlin.com, Frank.Li@nxp.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, nicolas.ferre@microchip.com,
 linux@armlinux.org.uk, mturquette@baylibre.com, sboyd@kernel.org,
 bmasney@redhat.com, aubin.constans@microchip.com, Ryan.Wanner@microchip.com,
 romain.sioen@microchip.com, tytso@mit.edu, cristian.birsan@microchip.com,
 adrian.hunter@intel.com, npitre@baylibre.com, linux-i3c@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Cc: Durai Manickam KR <durai.manickamkr@microchip.com>
References: <20260525092405.1514213-1-manikandan.m@microchip.com>
 <20260525092405.1514213-3-manikandan.m@microchip.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260525092405.1514213-3-manikandan.m@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_075102_909390_06E8E25F 
X-CRM114-Status: UNSURE (   4.33  )
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



On 5/25/26 12:24, Manikandan Muralidharan wrote:
> From: Durai Manickam KR<durai.manickamkr@microchip.com>
> 
> Add peripheral clock description for I3C.
> 
> Signed-off-by: Durai Manickam KR<durai.manickamkr@microchip.com>
> Reviewed-by: Claudiu Beznea<claudiu.beznea@tuxon.dev>
> Signed-off-by: Manikandan Muralidharan<manikandan.m@microchip.com>

Applied to clk-microchip, thanks!

