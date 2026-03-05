Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19397F30922
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 09:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/NsXFZOw9/QaPgxWwURtSa1Q01nFdh6Nh23N+9BQqCQ=; b=RTij6MO9WCtPsh6UwXizYKYmQo
	kl6/pR7SXWaqWRPlSx6/DDc/iXCQHyVRwNq+wiZ/azmqh+ppnNPCO1X1RuYxNwIKdj8GfNIY6pap7
	ZEsxLlt5UXtqgnf2stFgwqdiSx20tnFrm/vPdUxXMk9tEeUaqzOBPIvrtWN4Yx9RVCntIbLY1fzxF
	xLR+JW+4NI7VXLlRtC/kunLyTxIWJQWx8o2Zb2psABkJe0fTB6R9Pj95EDYummfdFGt8zu9AHEJV6
	Iuu8WaUFR/b+PF37lveO83ZhXjSGFJiaDcnxrMlvN8OQ/hybVp7TDFLSuHaI5LKa+TJqapIB0ccvP
	aru+06yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5HX-00000001RMW-0DOL;
	Thu, 05 Mar 2026 09:46:11 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5HT-00000001RLo-2Ipo;
	Thu, 05 Mar 2026 09:46:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772703964;
	bh=qI0vQGpQ9J5PU/VHkTMEyG+Jjq7ShhP2iWcDSkeEoOQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MpcnuxTw8ZkFdrdd3UtOodNtxRSjJymvguf0Jy7iSET2l3sZUfuO4DBCjBk1MmiPA
	 b/ylMB4Pnfa3kAauLGYhBu4hcHr6ssVNaCSr36tfnvVkOiFEsSTMFSnXgkWpf6LWpf
	 njyJPuIWaky7wPzghqKdthSAXnr0m9Rgj+qIf6PWI1fz8nYwWCUCORZUdJA+C7LK6A
	 GRkuL0HWBsvIu3kG0xszr+FjcG64YWzp2U4tNeHVzUOHekL6wHMpOiv7y5OjLRvhcW
	 evXc+1m+B4x7GWbQL4oGtCgZFcFp09e/vXxmBwIDOrJdUpOnWktXDoA0fxlOi+Yaxu
	 71IXy2/37cV3Q==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EE70517E0454;
	Thu,  5 Mar 2026 10:46:03 +0100 (CET)
Message-ID: <94465ca7-b3dc-4736-9d58-4024f2494e54@collabora.com>
Date: Thu, 5 Mar 2026 10:46:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm: dts: mediatek: mt6589: add basic support for
 Lenovo B8000-F
To: Akari Tsuyukusa <akkun11.open@gmail.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
 sean.wang@mediatek.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20260304192417.818211-1-akkun11.open@gmail.com>
 <20260304192417.818211-3-akkun11.open@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260304192417.818211-3-akkun11.open@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_014607_740357_BF0FEC47 
X-CRM114-Status: GOOD (  12.79  )
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

Il 04/03/26 20:24, Akari Tsuyukusa ha scritto:
> Lenovo YOGA Tablet 10 (Wi-Fi) - B8000-F is a tablet which belongs
> to the "blade" product family. It is powered by MT8125 SoC,
> which is the tablet version of MediaTek MT6589, and has 1GB RAM.
> 
> Like other devices in the "blade" family, it uses a framebuffer
> initialized by the bootloader at a consistent memory address and size.
> This patch adds basic support including UART and simple-framebuffer.

Okay, but this is just a simple framebuffer and a UART; while it may be in some
way useful, there's already one device based on MT6589 that was upstreamed with
just a framebuffer and a serial port, but then didn't receive any more support.

Could you please extend your efforts a little and push at least some support for
clock controllers and power domains for the MT6589 SoC to make it at least barely
useful?

P.S.: My intention is not to block you; I very much welcome efforts to upstream
smartphones and tablets, but that has to be real upstreaming ;-)

Cheers,
Angelo


