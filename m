Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 739C4D73619
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 09:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p6Jh4SxY1ytdqTmgThiHPRHN3lBNWUgl05Rqys0/nzg=; b=lf3GVhCiet6pVFpmPxlC2joZAY
	pqtGLjRHzYEXr7SqmIQLyRDlCQ1j7BJkP8JdI9A/jWmIAD/rinBj7gFllBAMpsPQNNemRBRPQXx26
	K7ORTRPAYHKObfw4IiSEPWnb0oY2TMoP2zuIyT5VkY3kKZ7pMXTKhtq6cMs2qN+8tqlU6IwxfPhjZ
	3DvqB9zIrVhYDpuCe9SITNvU/9DjE3G9SpTLjI1p87ABTf0VmoWhX26jOmW+/qkV6LTT6S2sidYnL
	+J5vNHqQFTIdzPdk+QQCDP9u9+HFd7IKyNsLcQVHesYUllDBfz2hNtLK4U8IWR7feiZnFKQ7pVvfz
	8KK9oS+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIPQT-00000008wTD-12b7;
	Tue, 03 Dec 2024 09:42:37 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIPOU-00000008vus-0xAL;
	Tue, 03 Dec 2024 09:40:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733218832;
	bh=5gmTp1cyr0lrzH/E7sGr4jjHaM1uKkn2Md8Q4cRF9/c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lUWe4m+teu0trGQ/WXQGJiM4RCP7U7uD1pF+/wVvZL4f6H123vkTywTUW37pmaOPf
	 ttj71aknIYBqnmtHqZDh4Q+3MUs8ClxmOaZwJfdOd8lEuOYLn8tG4lzxFcuTVTGwrk
	 T2orAVxHF/KprPG6CDwzy9ZRWA1IjrOW26Okx7s/XcOUJEvSwTwlnjYt/F8sUhjQj2
	 brgzk6n8KKw75PGCzrgOlKgMVn7/8HmyuPqTCvCwBtMSXpuuhPAYC314BZrA/cPtEX
	 Y+Ti3Bvyzlo7Rqm9Deh/UZdZFnBrWjdy7UDRanBOchAubj3JtKVJ86I/ORxL2/Zo28
	 GcOkIH5HvHGig==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 406B217E35D8;
	Tue,  3 Dec 2024 10:40:32 +0100 (CET)
Message-ID: <79ac6523-b002-4e10-95ac-3df378f4f3f5@collabora.com>
Date: Tue, 3 Dec 2024 10:40:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 17/18] arm64: dts: mediatek: mt7988: enable ssusb1 on
 bpi-r4
To: Frank Wunderlich <linux@fw-web.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Frank Wunderlich <frank-w@public-files.de>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20241202122602.30734-1-linux@fw-web.de>
 <20241202122602.30734-18-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241202122602.30734-18-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_014034_435449_64AB233B 
X-CRM114-Status: UNSURE (   5.64  )
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

Il 02/12/24 13:25, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Enable front-usb on Bananapi R4 board.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


