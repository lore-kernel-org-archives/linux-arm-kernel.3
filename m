Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E31E7E64AB1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 14:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JhZ+9VqG+ji4VIkvODX7RMWIrjNh/Lz8fchxYDui0o0=; b=K4NKAZk+x8/+DHPpK/kifPy04r
	6kW/+gF0egk4SXO9rOTqSkKWs0iUFFqhC42tH6fPa4bv1zHyrDquPgjUbQD39cgOSH5baY/V/I2+D
	PYUeihm9SH0Qbf6KiyHI8XMsQUn7e9R8WQYiBXzCu+E9uH1zH2zzyM42PnPfR153OTUJdeMUxxLYh
	eiZ7glq4joxq2St+YpJd4swytBaaFvf0Wc/AqmhkR4Tj3QS3P/w3FomCcWyA/Od2ITkrg1ZgfUTVN
	wEBGU7ejXxWOFlwEhQIu4tm9EaiJ5TdekGi6BHP0ctiX4XBScwOxgRgKhfZrqvYuZET2f7Uq8NGTj
	NlYJFUMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIToF-00000009l9A-0Bnb;
	Tue, 03 Dec 2024 14:23:27 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tITnE-00000009l3P-0lpK;
	Tue, 03 Dec 2024 14:22:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733235742;
	bh=LIGgbpNvs8ug8ujhBucQyBXzqtfXM2BSdyAxzQVrREE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mQZ0zZ91/Hy36C5/1SvhSA/6gKvxSnKblYLlOcqBz6ep5NJ8KP0TTNdOGIBHAmEVZ
	 +F8olwwnhGKwUqvqEKrhn/bDEYDTgEhs3f5q24xI6mYfTOntsR+FBGAFCCnpFuPstU
	 Oxwv+hOCJZKGB0sitCvHfVvYFiAQQ74+gfVmpB3v6qtfXJCwrNFbdZOJn/yv+4jrHa
	 FIqa2cs/4i6xgSbQtTbj9V/0modhIcyHjSJzNQR8i2PwHe5eq9HjPuTMhkPNDnOVks
	 4Vd1swyjOJsQ4YwjYK7eZ1XxQiFt0CXY15KRyjzghNTPiCu5KEANskk1XSM4no7iID
	 +HDzGCHPT6EBA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F20BE17E0DE6;
	Tue,  3 Dec 2024 15:22:21 +0100 (CET)
Message-ID: <f47f08c0-0fb4-4826-9b25-1277cabe4bb6@collabora.com>
Date: Tue, 3 Dec 2024 15:22:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/18] arm64: dts: mediatek: mt7988: add i2c to bpi-r4
 board
To: frank-w@public-files.de, Frank Wunderlich <linux@fw-web.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20241202122602.30734-1-linux@fw-web.de>
 <20241202122602.30734-14-linux@fw-web.de>
 <1ad355df-3f2a-4257-9374-1d125e138791@collabora.com>
 <CA7E06EB-D26A-45D0-BF13-9C6B640F27A0@public-files.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CA7E06EB-D26A-45D0-BF13-9C6B640F27A0@public-files.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_062224_367218_8F060A01 
X-CRM114-Status: GOOD (  11.58  )
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

Il 03/12/24 11:58, Frank Wunderlich ha scritto:
> Am 3. Dezember 2024 10:40:38 MEZ schrieb AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>:
>> Il 02/12/24 13:25, Frank Wunderlich ha scritto:
>>> From: Frank Wunderlich <frank-w@public-files.de>
>>>
>>> Add basic i2c nodes to bananapi R4 board.
>>>
>>> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
>>
>> arm64: dts: mediatek: mt7988a-bpi-r4: Enable I2C controllers
>>
>> Enable the I2C0, I2C2 controllers found on the BananaPi R4 board; these
>> controllers are accessible at ... I don't know, a header on the board?
> 
> These 2 i2c have directly connected spare devices (pmic on i2c0 and i2c-mux on i2c2 added in later commits to have it a bit cleaner). I2c1 is on gpio header which i have not added to let user choose if he wants i2c option or gpio. I can also add i2c1 to r4 board with the right pinctrl but imho it should be disabled to have gpio function default.

And again, you should really add all that information to the commit description,
as that not only helps me to review your submission, but also helps other people
checking the commit history....!

Cheers

> 
>> After which,
>>
>> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>
>>
> 
> 
> regards Frank




