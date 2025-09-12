Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25980CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 08:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oUdEGwvRI7D4i2NKUGPy5YHiNUuMPDrl4mYNzn+SjM4=; b=zB58QXdDTCN1eOeUHE7HJY92Rh
	p53p7JP3C97ydY+7Ppe9N9b9RQaaeBUyXEEYqVzdiSp5DsuirHWd62/oGEjhlDTDREKtMPxfXND3O
	xaPKzPaIGDcs5AL0BMD8Rj/EGp7HGVNGegIoWGuN2j0B81Vd1I1T0H27dkhUVkJYJXJrcRxAoFmG1
	ng1YMk0qUxQZUm0Mt79VIqKwuYUMfotmxwLOXzg5x09FHh6LfVpsgc7Mfq3Dg5QlT0L1qkER9LKMH
	Nj9GqwbkFC7x7s3dzMPSbfKnC3Tx8MYS0XtKMEiQKYOnhi9pbPYrNU46qhp1nEYPvHlqvDH7GHS8j
	L7KEMOjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwysr-00000007pd9-0UAn;
	Fri, 12 Sep 2025 08:11:53 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwysl-00000007pXY-014M;
	Fri, 12 Sep 2025 08:11:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1757664705;
	bh=ChD5uzNPZ1WBHrWScX2ak5FoHQeYerLzYbNrlQE8re4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cilfCyRHe4aX0DqLgy+NZgtdbGXyJGobjPngaOq3MX8OOSAF6aHK86amPYYrYaYzx
	 kXT72uwglGG0J6JeCE9QS0l+mQUez42hd6YhJHb4SQU8vlbED9s9aB8qGX4TIXn1wY
	 JVZFlakfvMyiuLWMtf4PhrRfBrhiZeh+QNvLquH0feTVub/iPiaSTiwBuuovx5mO18
	 X87oBp57iBy1trJpG61b8vMZDi+gdJUcIM/PkfvX4c31vdgyjiQczC9GOIHdQ2fifz
	 kLTTGEP4uDMF/e9qibi79+usdAKnNxtVv6rTlYzFKEwU69UiZfg0c+4pXZya7t9UyB
	 CcQA7LT9w5lbg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 383BB17E1301;
	Fri, 12 Sep 2025 10:11:43 +0200 (CEST)
Message-ID: <b4358926-cb35-4123-9629-b1eb0b7113ef@collabora.com>
Date: Fri, 12 Sep 2025 10:11:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/12] arm64: dts: mediatek: mt8173-elm: Drop unused
 bank supply
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>, airlied@gmail.com,
 amergnat@baylibre.com, andrew+netdev@lunn.ch, andrew-ct.chen@mediatek.com,
 broonie@kernel.org, chunkuang.hu@kernel.org, conor+dt@kernel.org,
 davem@davemloft.net, dmitry.torokhov@gmail.com, edumazet@google.com,
 flora.fu@mediatek.com, heiko@sntech.de, houlong.wei@mediatek.com,
 jeesw@melfas.com, kernel@collabora.com, krzk+dt@kernel.org, kuba@kernel.org,
 lgirdwood@gmail.com, linus.walleij@linaro.org,
 louisalexis.eyraud@collabora.com, luiz.dentz@gmail.com,
 maarten.lankhorst@linux.intel.com, marcel@holtmann.org,
 matthias.bgg@gmail.com, mchehab@kernel.org, minghsiu.tsai@mediatek.com,
 mripard@kernel.org, p.zabel@pengutronix.de, pabeni@redhat.com,
 robh@kernel.org, sean.wang@kernel.org, simona@ffwll.ch,
 support.opensource@diasemi.com, tiffany.lin@mediatek.com,
 tzimmermann@suse.de, yunfei.dong@mediatek.com
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-bluetooth@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-sound@vger.kernel.org, netdev@vger.kernel.org
References: <20250911151001.108744-1-ariel.dalessandro@collabora.com>
 <20250911151001.108744-11-ariel.dalessandro@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250911151001.108744-11-ariel.dalessandro@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_011147_212015_E5266742 
X-CRM114-Status: UNSURE (   5.90  )
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

Il 11/09/25 17:09, Ariel D'Alessandro ha scritto:
> The mediatek,mt8173-thermal device tree binding schema doesn't allow
> regulator supplies like the ones defined in mt8173-elm.dtsi. Drop these as
> the associated driver doesn't implement them either.
> 
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



