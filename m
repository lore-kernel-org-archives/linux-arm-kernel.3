Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FF2EC282C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 11:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C5lB0ynMTjz311rtiwFRZ/uasHJvOy1c7DROnpG9OSY=; b=lhbs1BBySxW5DUnuoyIDfLWmyQ
	dUl3JP0QxJkWWOa3gwU0eEwtkRRXLwIhqgPgh7Y325PIUApRJHzs4iYZVhE0SANoZVWKnotlJaWOi
	v4slMTkG+dSt1Q2xn6WXNtSvCF+mwqv343ov+TbzTJ7hDdcloG2jKF7Pw9Nd5+zh+GskowqbWZnst
	aHnvuvdHGJIKt/1uNlgMEjjSYuSOxvU8GLIFTk+Kb4KWW5mNxilzRQY6hOmqOoJRickk3VMDwFG2m
	/BlItTh+YFaezWANryUSza4e8upoyh1lQ8xYpKMMw2b2CvcZClKWCX/d/gscGGygj3jOW/QDKkjFG
	JvmXKEiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp3zD-00000000ZAG-0tKG;
	Mon, 03 Mar 2025 11:29:27 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp3fk-00000000TLO-0Bv6;
	Mon, 03 Mar 2025 11:09:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741000158;
	bh=ZcX0DHh2Mg8R/p4/TYSQ+SL3z06CIojJdCvj2ypyrc8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XAKxN6wVZoFkpjIJdp3hOdXhAkfHsC8LBHDCcqe9pZd+RBKaQa2b79cTRHuOlNTSr
	 rn91mmh9K2l7J2cODw8LykmW94yFVG40cti3cCqSak5kpTneQ1rs05GBLOg/rSSCfP
	 YgxbkSdZWntoXM6uFRURKfBUzMIYqSFhSlC8pTs/b+MBsrRD25qy5nKehLs7//jVkh
	 xwlzAyiex0Vkn6eSEYX53tAmNY0F2nvxFPCas0oZQaHfcSDkH6osCDT8LD/hHOLHOt
	 3De62TzbjmbyxZEaQohuCscJdjOFD4f3TbmMLwEPoHd8/9C6OugS0rbLlKPGkw5sV2
	 PlvaH9b5wUXOA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2F16E17E068F;
	Mon,  3 Mar 2025 12:09:17 +0100 (CET)
Message-ID: <4c454ee5-6102-4fae-86de-1f562ab9d2b3@collabora.com>
Date: Mon, 3 Mar 2025 12:09:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 19/20] arm64: dts: mt6359: Add accessory detect node
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Sen Chu <sen.chu@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>,
 Lee Jones <lee@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-pm@vger.kernel.org, Andrew Perepech <andrew.perepech@mediatek.com>
References: <20250302-mt6359-accdet-dts-v2-0-5bd633ee0d47@collabora.com>
 <20250302-mt6359-accdet-dts-v2-19-5bd633ee0d47@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250302-mt6359-accdet-dts-v2-19-5bd633ee0d47@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_030920_228097_D27606B5 
X-CRM114-Status: UNSURE (   7.45  )
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

Il 02/03/25 17:30, Nícolas F. R. A. Prado ha scritto:
> Add audio jack detection node. PMIC accessory detect driver will
> create an input device that will send key events on jack
> insertion/removal or accessory device key presses.
> 
> Co-developed-by: Andrew Perepech <andrew.perepech@mediatek.com>
> Signed-off-by: Andrew Perepech <andrew.perepech@mediatek.com>
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



