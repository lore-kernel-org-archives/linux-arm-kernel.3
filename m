Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B83B0D7833F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 09:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1/GCw4mYPX6ZSQ3WJjriMfbOVdU3huxj8N9hKBLGFoo=; b=SpSh7BIGwYHC2vD0nakZVpLGZ9
	pIwQPGCG/oqOQ6IHLpwFEWy7azHGNblt8kMuqk2wNrjZua+viGhiKoBsTuT8m/f5lN+bJZ6Lg2FQm
	j5GdPFRyajgOtY9skRD2KOu8IIw/AQeQNGZeot64xD19lB7bDy08lnLtZPAttL5cueJZsK4ZHl+ve
	cvCJ4LPF1vU/sFoRto/p8PqPQuU8F8xd2mmqS/hj4OvcEuxR/x1buLm0WRiQUq6tcIQh+VQr/CjN/
	MMCnxoeb+zYP5Zf5ll8J8ZaojraWmLDU8vXbx/To/i0wUiNUBVJcPS01WxSPSWuYg6akBY+BxGggd
	seJuj6zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIPUM-00000008xRX-1FF1;
	Tue, 03 Dec 2024 09:46:38 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIPOZ-00000008vx6-3kKN;
	Tue, 03 Dec 2024 09:40:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733218838;
	bh=4U78tOYVlkvReGUrkFFLBc03ZsaBKxkITzu5sB+X0/E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GBbKJqd75SXOHbhBIXgpv7G/ordaTaQWCayZr0n/29MzJ/jBFsC170PBOehPX15E1
	 k5cCRQHcpuuGmxR+Qm0VwJ/St4ewkjHa/lcZ15jd5nR8K12IN0zyqyzyZM+plfVPYp
	 5FNS+ynuZ75bOlVLh2w/eqd4/xcGXLhol0Vt9UxUQXR1ETLFNU4zDfIshmjEtOBHul
	 cunmGXBta/nM0KF6B8QAf2EDGk1acy85lVwMw00+/tH7hbmbrk5YPB/a9S6C7yWOx8
	 5xydQiyj7ik1siDUFrTXdL/UQPPCM5h51H/0kgYdZ9EGkbxqYox8rV7f3DEoPk6e03
	 JosJMhHcxSU6w==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 22E5117E35EF;
	Tue,  3 Dec 2024 10:40:38 +0100 (CET)
Message-ID: <1ad355df-3f2a-4257-9374-1d125e138791@collabora.com>
Date: Tue, 3 Dec 2024 10:40:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/18] arm64: dts: mediatek: mt7988: add i2c to bpi-r4
 board
To: Frank Wunderlich <linux@fw-web.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Frank Wunderlich <frank-w@public-files.de>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20241202122602.30734-1-linux@fw-web.de>
 <20241202122602.30734-14-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241202122602.30734-14-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_014040_077047_DCC172A9 
X-CRM114-Status: UNSURE (   6.78  )
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
> Add basic i2c nodes to bananapi R4 board.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

arm64: dts: mediatek: mt7988a-bpi-r4: Enable I2C controllers

Enable the I2C0, I2C2 controllers found on the BananaPi R4 board; these
controllers are accessible at ... I don't know, a header on the board?

After which,

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



