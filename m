Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B39A4E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 13:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rkq8zF6A3kRJ4sJSqjBDGe4RzLUupi6rrrEohNdz9xI=; b=dEpAa3uJhTqITY62Lgb3RLkC4j
	ELFmvJgs8dmyE50sqVQhyVzqfPzNem4I/8fXrKEDkFo3aMD33ZX8xS8vzioMlcVDmLyq/DiZl+DSZ
	1DY533MsGw/5uLyvWkrBWAlTsJQNMY3Ba5jK4TuOk8CS8G/F1t4Eo07vRWL3rxe9wAq7atPs+ipK+
	rAazCSv9hK5i/MWkpfWAB6Q+lv89CfIdDDSS4GG8zAdUVjWAPVnPjcKrLgFnG6+q8VVDcvv0hvlj3
	FFzLnmPYVz1jfqgZK30bYQPa9Wy6qhczW92iUmS+UiR3NCJ/ZBz2pUjEL2y1xFBn/afb11RM+YiER
	ipK8Vp9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKdSF-00000007rdB-0OMX;
	Mon, 09 Dec 2024 13:05:39 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKd7z-00000007lhJ-0x1v;
	Mon, 09 Dec 2024 12:44:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733748281;
	bh=aRM4AjETfxblgVQs2jCylFYpTFhBx0s71WVjQD11xxo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Bl3gop7Wy7pK0sFk0FHAjU48eqP/0utLBOC+nkcjHPhp/6Afq/lA2E7r0CMZ6MAvw
	 kHdABAIbwOZ1FULOPWc8s68WIhxcO1Ui54KcduCBWNCiRun9u2y8ZWCRweC+UdlWAr
	 nZzvNA6tBbubuSauaI0Ar6KNqIV4VG9torEgsN18lZERZw7MudJXQxuPg5n5kn/Rml
	 b+VaP/IfHdFDXeI2BMTv4FSpo0KPUR8KKTuF/MRZa5tKGxecaHcXscJE3GoPnF6LV/
	 QEZw1ULFSVlS33iex53SVVYFn3NbLYhlOrqzr6MIDc9EgClANQ2KvN1gDhZMU2IfCU
	 p8SeUt/kLXuYA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B6B4E17E3750;
	Mon,  9 Dec 2024 13:44:40 +0100 (CET)
Message-ID: <d6be8228-3448-49a5-81a7-98acbdd19fbe@collabora.com>
Date: Mon, 9 Dec 2024 13:44:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/5] pinctrl: mediatek: add MT7988 pinctrl driver
To: Frank Wunderlich <linux@fw-web.de>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@kernel.org>
Cc: Frank Wunderlich <frank-w@public-files.de>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Daniel Golle <daniel@makrotopia.org>, Sam Shih <sam.shih@mediatek.com>,
 =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
References: <20241202110045.22084-1-linux@fw-web.de>
 <20241202110045.22084-3-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241202110045.22084-3-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_044443_417977_26ED0118 
X-CRM114-Status: UNSURE (   7.68  )
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

Il 02/12/24 12:00, Frank Wunderlich ha scritto:
> From: Daniel Golle <daniel@makrotopia.org>
> 
> Add pinctrl driver for the MediaTek MT7988 SoC.
> 
> Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> [correctly initialise for the function_desc structure]
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> 

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



