Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2BFBC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 08:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PEddp/n8BHMaxzbon+hPDMkCYvTSmq0VUfvKBZduSm0=; b=E1rM/NI4FiFOENC8G5Re4o1/9y
	ZxzWhFO662biUAu71SXnKUqf7gNN/sIF7SCJ4qYwQ5Di/2UlbwD2QplgrLNmp3fqy4YPnsiCu7FwC
	10YgvTJDt1bTTKqaJ7p1S0xAxP+d+TwjqPoT2cktRVvD/vYkrDe1EHEPGZ48Q7tO9ztw4jI3GfMs7
	3XT4FR+65byGjJV5nEU1NBvVlR029iWiFi1Gyn914sq2372HzyO80hJV4kUxa5HeG936kqyvYU24F
	GPT1mw9tDLSo0wMg5NRJ/onXUMhI1s/HxAGP+M/lJHgD3SbuOBUNLrCQuzUjXeUz90B9IGvIc8R0J
	tpT6Mm7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt0p0-0000000DZYu-00NI;
	Fri, 14 Mar 2025 08:55:14 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt0nJ-0000000DZOk-3iUU;
	Fri, 14 Mar 2025 08:53:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741942407;
	bh=Lb2brasLmXxFUZ5PYKeX8+kW9/EYKz5KnLrvoiEwS3s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Kql8FUDUwJOtf2ngUAwFIngGhnqhy/Ot5/oclRLWrlyj5I0foexVQfTV0Q/nUGT4q
	 txV1CBScjOXIZa6poTuapxE9mvBGaeq5ZaP/KNI9qGj0cX9pyU0HIS0YRS1eg42J/j
	 Gzxf3qcXryNFqhRj4EVeOuhidiAvfozxc5OuXlgRpOhqrokC9jMzirPmjiOnUSS1rw
	 XCqOSEu+u0n0VkgJAGKRNlJnVgo7NEU1R4pXk2GpqPESO/A4c+mRJU8I/3u3GBaNgF
	 gPWfxNw4YLv0stIERWEDgxc0XoBV8vX6/ZR+17/3NPqUegG8oUPCf4lg/wy0HTo8IV
	 4S6+O7Thue6uA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9586A17E0E37;
	Fri, 14 Mar 2025 09:53:26 +0100 (CET)
Message-ID: <90d1c0f2-b037-482e-a569-f75b713e3a71@collabora.com>
Date: Fri, 14 Mar 2025 09:53:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] pmic: mediatek: Add pmic auxadc driver
To: "Lu.Tang" <Lu.Tang@mediatek.com>, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Chen Zhong <chen.zhong@mediatek.com>,
 Sen Chu <shen.chu@mediatek.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-gpio@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20250314073307.25092-1-Lu.Tang@mediatek.com>
 <20250314073307.25092-2-Lu.Tang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250314073307.25092-2-Lu.Tang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_015330_079113_3B670E74 
X-CRM114-Status: UNSURE (   7.81  )
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

Il 14/03/25 08:32, Lu.Tang ha scritto:
> From: "Lu.Tang" <lu.tang@mediatek.com>
> 
> Add pmic mt6363 and mt6373 auxadc driver
> 

Can't you just add MT6363 and MT6373 support to the already present
mt6359-auxadc driver?!

Regards,
Angelo



