Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36427E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 13:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SknKNH/6YOQB/03edqm/b/mfOkuf62u/tkHcpJXwSIQ=; b=1uJmrYnGugzSVujs8v141tzaQi
	m+Htk0ScE+FSXgc0Jkchd5MaZVTqIljSMH7ukQEWnn4BoIw0x75frCIwdc1C+iyqdFOrIEsW4gCmh
	fE49KG2TCFHTUacRbQjw6Cn1luUWr9eU/prtripa464EIakqTU+waFMrk8LDXblKQDW76ALyaLwMd
	Iar8hnc4+9ByAf6rllcTW9cLrXBldcyJVyEKfyejID7GSXeNJu+mupexptei50F7XQiGm50jsNMhx
	uY4LLIRxeYXp2mGqANsZfwRTa2ToxRLvul0nKvd3BUjy/14oxWyfuK9+soYIcAbbnHWYzx7u03fbT
	QksvdVOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVVhP-00000008X3k-1OKt;
	Wed, 08 Jan 2025 13:02:15 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVV0G-00000008OPd-2YF6;
	Wed, 08 Jan 2025 12:17:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1736338657;
	bh=Vnh+oOkgXUlVPFAt0gfMUQi6C8dArvTIpOxd/A+3DEQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dU295dGE/eDJDpTTubs/64hFUh5X8C63pJE+mfMiXgFSPA/yv+w2lDzzTP9SRAtyu
	 AodPP0J2Bf0us0a5ys06bQw7+WTiviRm7d0bldGKEeNvis77LzZ/njhX1HvPKxsOrx
	 JKV/ScD3hAUI+BeKv4+s5RbZ/a8MRhUHiKk+RJMlpSYNpWJtw3QocIEuPvN/rfioKG
	 VWpITUd+sQYsrYwVOVkgbcQhO3Vx2q5Ggob7s4LPTQHk+YdaodE3J8B0thHs6EufvI
	 B8U96UtQ0SDEhAoV5CQROyLMvcO5mAs4x+RdCvaFL4FOzH30hAJITyKI8z0M5RyGSk
	 oI3gMxuyWwC1Q==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F3FA017E152E;
	Wed,  8 Jan 2025 13:17:36 +0100 (CET)
Message-ID: <f79db33f-ecab-48e6-a2f2-47228183a273@collabora.com>
Date: Wed, 8 Jan 2025 13:17:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] MediaTek ARM32 DTS updates for v6.14
To: Matthias Brugger <matthias.bgg@gmail.com>, arm-soc <arm@kernel.org>,
 SoC Team <soc@kernel.org>
Cc: "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>
References: <ea93d0ea-a1a0-4d36-8880-4f05c85f0c1b@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <ea93d0ea-a1a0-4d36-8880-4f05c85f0c1b@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_041740_797544_A204AA63 
X-CRM114-Status: GOOD (  12.50  )
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

Il 08/01/25 13:14, Matthias Brugger ha scritto:
> Hi Arnd,
> 
> Would you mind to pull the following patches.
> 

Thanks Matthias, I admit I did actually forget about the dts32 change :-)

Cheers,
Angelo

> Regards,
> Matthias
> 
> ---
> The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:
> 
>    Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)
> 
> are available in the Git repository at:
> 
>    https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git/ tags/mtk- 
> dts32-for-v6.14
> 
> for you to fetch changes up to 90234cf9b37c57201a24b78c217a91a8af774109:
> 
>    ARM: dts: mediatek: mt7623: fix IR nodename (2025-01-08 13:08:20 +0100)
> 
> ----------------------------------------------------------------
> mt7623: fix validation error of ir-receiver
> 
> ----------------------------------------------------------------
> Rafał Miłecki (1):
>        ARM: dts: mediatek: mt7623: fix IR nodename
> 
>   arch/arm/boot/dts/mediatek/mt7623.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)




