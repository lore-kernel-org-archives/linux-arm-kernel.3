Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3CD3C282CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 12:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xj1ondHkUDB4kusQaE47ncftB8bHAQQvSz6m4h0Jvy4=; b=OUhJ9XCwRYU2agEqlb3pgBRzll
	Z667s6BZXZuYlreA3Zk5X2wzbAPUCSJBf2AS+r7DwsTZG3ZUiCKR9kDZ7ia7NGSIxHG9NFkKx09wE
	P9wOlBX2pI/DcUo15it+a8WQhtNfO9yO93/C+n2u5khrsolNZXHKqCVA1ViIl8smhLweYKVkMn/qn
	Pkz940i9YTf/dljIAIva6inbeSk5oRsWSK4339V5179DUVQRO48YMMbFQVD2g7Uks1U7QWug7K2mw
	TDQ1n7ZtmyRWb42DnwmA4EAPiFsCf5qledEg1ddnToW8VJjdvbjpBsQlfT8if7suPPJznxhXZRSWD
	CtXJNsXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp4aC-00000000gbQ-1jy2;
	Mon, 03 Mar 2025 12:07:40 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp3lf-00000000VGA-0d2t;
	Mon, 03 Mar 2025 11:15:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741000525;
	bh=zHGCADU56T7A224lF133oGjwzLj/Y9hZrXbv8NOAx1U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Zp/H58vJ9rjRaEthdrCDdcQWdjaAb1mvE/B2PKHjamT9xW01devW47qz6T+qEtx6b
	 M3E0H2siHWMutWk60bE3BnHGzRW5Eim8AOm7eBhMdBAln/VMk4Dd1OHZ/2MlPGZ+Qc
	 lSfZ4gtN4+f6C/GCTf69DojqEueBPedXBGKiourDxcDKScxW3TnCK7US7PZ/wfq8jA
	 0rGL0bUZkC19Jr6yWljZK6j9C5NpLmhWh1quFmZ3vosaz6I4szPUqLbOl2kFgnYtId
	 SH4Q2ocYXq72C6WtD8FKYVuKSV7P1TeZ8/O75g86GPmSEBk4QVOEsvHyRyWdOEjMov
	 NFjeojr1ZOgBQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7517517E086B;
	Mon,  3 Mar 2025 12:15:24 +0100 (CET)
Message-ID: <ea3cfb5c-bcba-4530-8bd4-6738acfaad90@collabora.com>
Date: Mon, 3 Mar 2025 12:15:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/20] ASoC: mediatek: mt6359-accdet: Implement HP_EINT
 polarity configuration
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
 <20250302-mt6359-accdet-dts-v2-6-5bd633ee0d47@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250302-mt6359-accdet-dts-v2-6-5bd633ee0d47@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_031527_355415_91E4C9A0 
X-CRM114-Status: UNSURE (   8.51  )
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
> From: Andrew Perepech <andrew.perepech@mediatek.com>
> 
> The driver currently reads the HP_EINT polarity from the Devicetree but
> never actually configures the hardware accordingly.
> 
> Implement the polarity configuration in hardware.
> 
> Signed-off-by: Andrew Perepech <andrew.perepech@mediatek.com>
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



