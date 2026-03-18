Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66ED5103E171
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 12:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AG2Plse0/oVOXu1n86uPVAH1wWIxCEzbHrIuqXs3m6o=; b=XF7jTyEfQKLXQssoV23NgxRpXj
	roJ666dK28MqP5yx/4cugDNzdJXfoXkQeuBGRZVPKYQrC9WgFKCrpUO2TzMNYqRkEvaMjJ34JL0F7
	EJSgW687GozY+TgtRsAhA07wpw0GDOxr86Sghaltxac4WJ+/TCHYj2AWGv7WLLVpyU/B9cxjjGxmV
	2uo886hmBAnfkqfrOvdwRuxN9vOOFr8M+X1xjlRANOalp7QzE4Yk8g5HqI2kBgjwMv2VW+EqG/v1b
	dYdr3cW2ItvV8D9oe5HnDrxNKI+rNZnc61xS+ih/cK9pdY598fIIkqeMX/UeAJrW6P4HgU/h8ufoe
	0+rzo9LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2qBZ-00000008PQt-1j0u;
	Wed, 18 Mar 2026 12:39:41 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2qBE-00000008PAg-3tQ5;
	Wed, 18 Mar 2026 12:39:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773837558;
	bh=ajpz9j4PDIG86qR5i5L9xxin8pmlylEmgrk8Tz5D+Gs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fcZEYG8DcYj6oZa2FU1hLemwGfXlzzSOLhaOu4FL4dcD0pP1vyJDPjwmT2xUj6Dxo
	 eiPALZXG6fDTRTCjxTCt9h1U8g/rpO3uvkQL9ymjDrmBCrsTXLXZXmBb7DeC+tyRkc
	 AtB2nsZ6T3rocTCu9/8jk6hwwmNo2XM+TAVEk97AUkrfNLNi9+01ONA/NJ1waMscex
	 OI5JMjHlVHclezUwygGrLx1sSHGsW0yPGVMRLvObzbkWYp36nblk4J8+KkUJeDwDRa
	 Ya/uYJQ24yinY2xXBSuwPJ4sY2qpGsm2CNHOmEjMJhagisZBFLeAcROz3G4iK6FUWt
	 MSGaosIbMixFA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B6A8617E1380;
	Wed, 18 Mar 2026 13:39:17 +0100 (CET)
Message-ID: <8c73ca7d-254c-4b89-9b7a-d67afd6f909e@collabora.com>
Date: Wed, 18 Mar 2026 13:39:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/9] regulator: mt6392: Add support for MT6392
 regulator
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
 linux-mediatek@lists.infradead.org
Cc: Fabien Parent <parent.f@gmail.com>, Val Packett <val@packett.cool>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>,
 Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Linus Walleij <linusw@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Gary Bisson <bisson.gary@gmail.com>,
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Julien Massot <julien.massot@collabora.com>,
 Chen Zhong <chen.zhong@mediatek.com>, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org
References: <20260317184507.523060-1-l.scorcia@gmail.com>
 <20260317184507.523060-8-l.scorcia@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260317184507.523060-8-l.scorcia@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_053921_163196_9F78A353 
X-CRM114-Status: GOOD (  12.26  )
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

Il 17/03/26 19:43, Luca Leonardo Scorcia ha scritto:
> From: Fabien Parent <parent.f@gmail.com>
> 
> The MT6392 is a regulator found on boards based on the MediaTek
> MT8167, MT8516, and probably other SoCs. It is a so called PMIC and
> connects as a slave to a SoC using SPI, wrapped inside PWRAP.
> 
> Signed-off-by: Fabien Parent <parent.f@gmail.com>
> Co-developed-by: Val Packett <val@packett.cool>
> Signed-off-by: Val Packett <val@packett.cool>
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> ---
>   drivers/regulator/Kconfig                  |   9 +
>   drivers/regulator/Makefile                 |   1 +
>   drivers/regulator/mt6392-regulator.c       | 487 +++++++++++++++++++++
>   include/linux/regulator/mt6392-regulator.h |  40 ++
>   4 files changed, 537 insertions(+)
>   create mode 100644 drivers/regulator/mt6392-regulator.c
>   create mode 100644 include/linux/regulator/mt6392-regulator.h
> 

..snip..

> +
> +/* The array is indexed by id(MT6392_ID_XXX) */
> +static struct mt6392_regulator_info mt6392_regulators[] = {
> +	MT6392_BUCK("buck_vproc", VPROC, 700000, 1493750, 6250,

s/buck_//g
s/ldo_//g

after which

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



