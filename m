Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62EF6CD8C88
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Jun 2026 12:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hes2OTh9pgH61V0We+XGuVxzEVXtvlEX3hLLTiG39qg=; b=BlokQKhM5xhZIOxk/6OaDxMgyX
	mqY5QIpPNITyB5lI1i2dQazBCBIJNfL6rraAdvxUYWN9K9mjikIjEs49XmkNMCn6kxJm7hLvk+gVt
	D/FlT7rn366EdQeGeCJ1GSoCnX/JG2sW6e/4tLcBOFyz8RA3lwNha2Xoxb7ydYX+u7MdCsK8VJC0S
	b01DoULC0vzROaARQ3trCFW+3MeQWKYWKcM3TmnBQecag2VjcPO0YME8uf/mClKEknT+4TEkXECou
	AtobDRFnZEvhvKsqKl5KfMS3uDFM8FCz/BIhEoGK7c+2Q8hFHFJrWw/pzEdvwpvY7P0nC/Sx0f6F7
	Soh5kERQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWCTI-00000002Ee7-0d71;
	Sun, 07 Jun 2026 12:19:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWCTH-00000002Edy-2w0b;
	Sun, 07 Jun 2026 12:19:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 102B242D63;
	Sun,  7 Jun 2026 12:19:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34CFD1F00893;
	Sun,  7 Jun 2026 12:19:14 +0000 (UTC)
Message-ID: <4330e1e6-9513-4674-8795-b4150c3c1aeb@tuxon.dev>
Date: Sun, 7 Jun 2026 15:19:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/5] Add microchip sama7d65 SoC I3C support
To: Manikandan Muralidharan <manikandan.m@microchip.com>,
 alexandre.belloni@bootlin.com, Frank.Li@nxp.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, nicolas.ferre@microchip.com,
 linux@armlinux.org.uk, mturquette@baylibre.com, sboyd@kernel.org,
 bmasney@redhat.com, aubin.constans@microchip.com, Ryan.Wanner@microchip.com,
 romain.sioen@microchip.com, tytso@mit.edu, cristian.birsan@microchip.com,
 adrian.hunter@intel.com, npitre@baylibre.com, linux-i3c@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
References: <20260525092405.1514213-1-manikandan.m@microchip.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260525092405.1514213-1-manikandan.m@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
> Durai Manickam KR (2):
>    ARM: dts: microchip: add I3C controller

Applied to at91-dt, thanks!

> 
> Manikandan Muralidharan (3):
>    ARM: configs: at91: sama7: add sama7d65 i3c-hci

Applied to at91-defconfig, thanks!

