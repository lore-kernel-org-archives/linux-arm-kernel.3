Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43617CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 May 2026 13:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pvf/MS/zmru/6FmL1UWsPRZanqYhC55RQ91wErIwJiM=; b=kDt/JI4IXguYYWQfX9GDNon8nK
	WNQbN0HafWBuzr/X/iwKk4v5e991KEESSPavdlr27+JkoydR6rbenF5nGnFhKz9LShfhGzloDgi1T
	0KARiZ5NLJ+YD7psdChItjXRxiq5Xm/ZgpnwfHA/EfLC6qZIbhqS0XSeLwuoEHaH0teP9vnqUVDms
	6S03j8fcWoAMThG4hbROtgaXF9yhemk7hmKKvFCBwZ/GTWBYnrq8Xzwo+l54sDOsN1eGan6lu/1EE
	SLmWv/2fw4cKjxrBQBqtlEWPYNd2Mb5BHLtowBP1dIPBlOKCRVGYG7PtyCn7RCJ6dv8SZJ58LQAv/
	yLKnadTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLhfn-000000091y2-2n3j;
	Sat, 09 May 2026 13:24:52 +0000
Received: from wp23.hostingpalvelu.fi ([31.217.193.162])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLhfl-000000091x1-0Ghi
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 May 2026 13:24:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=bitmer.com;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=pvf/MS/zmru/6FmL1UWsPRZanqYhC55RQ91wErIwJiM=; b=e/Q2yBci0VQjx4P4lAFOVxeDKP
	9fA6rGGNpLd+Z8e9kc5BGpXuBbAMzdp5ezUxc3pCAXg7BrgMjgmT8rMJWQtWi71rPd6OzxrgmGIF4
	Kngiez+2YDurLH2yXVCcrJY0NrhrIiFX33sPY4kC9UpbG7YfviBNAXilzMaSSnvv5AZADXjSMqla5
	5Isxem7ooJ4Fl5rEQ5mWbmTJFU1Yta0pio26QVhwdWh6ByiJz0MuBHCFJUpiBtEpaq/EhZFz6nJeU
	Nbjuz9CfIT3s5NvNjAGxvAm9KFB6dZUv5/DWaUsrdm7SUwBoVo4ChpCxU4bzhVSI1FB3B41wNHk9n
	hSsMIW8w==;
Received: from 81-197-209-194.elisa-laajakaista.fi ([81.197.209.194]:50140 helo=[192.168.0.12])
	by wp23.hostingpalvelu.fi with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.99.2)
	(envelope-from <jarkko.nikula@bitmer.com>)
	id 1wLhfl-00000003c5b-09Al;
	Sat, 09 May 2026 16:24:45 +0300
Message-ID: <45dabfd5-5976-4815-a41e-c7b218c8cfd5@bitmer.com>
Date: Sat, 9 May 2026 16:24:43 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sound: soc: ti: omap3pandora: fix stale ARM machine ID
 check to use DT
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org,
 linux-omap@vger.kernel.org
Cc: Russell King <linux@armlinux.org.uk>, stable@vger.kernel.org,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Grazvydas Ignotas <notasas@gmail.com>,
 "H. Nikolaus Schaller" <hns@goldelico.com>, Tony Lindgren <tony@atomide.com>
References: <20260509020809.33060-1-enelsonmoore@gmail.com>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@bitmer.com>
In-Reply-To: <20260509020809.33060-1-enelsonmoore@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - wp23.hostingpalvelu.fi
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - bitmer.com
X-Get-Message-Sender-Via: wp23.hostingpalvelu.fi: authenticated_id: jarkko.nikula@bitmer.com
X-Authenticated-Sender: wp23.hostingpalvelu.fi: jarkko.nikula@bitmer.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260509_062449_256923_FBFCA351 
X-CRM114-Status: GOOD (  11.09  )
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

Hi

On 09/05/2026 5:08 am, Ethan Nelson-Moore wrote:
> The omap3pandora driver contains a check for the ARM machine ID via the
> machine_is_omap3_pandora() macro. This check is incorrect because the
> machine concerned now supports only FDT booting, which does not use
> machine IDs, and therefore it will always fail. The legacy board file
> for this machine was removed in commit 7fcf7e061edd ("ARM: OMAP2+:
> Remove legacy booting support for Pandora"). To resolve this issue, use
> of_machine_is_compatible() instead.
>
> Fixes: b715da74deaf ("ARM: dts: omap3-pandora: add OMAP3530 600 MHz version")
> Fixes: 9ccd0106c9db ("ARM: dts: omap3-pandora: add DM3730 1 GHz version")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
> ---
>  sound/soc/ti/omap3pandora.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

I guess this is the same than rx51 case that machine_is_omap3_pandora()
still returns true. Dunno is there an updated bootloader for it that
doesn't pass anymore the ID but I think only that case would warrant the
Fixes tags?

