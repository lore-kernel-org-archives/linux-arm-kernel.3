Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C233C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 08:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k/2bdOzQBD6OE3B8HPukuQQHvzhr/VcrWFjg7cYUY6A=; b=pKZWp5CnJNK1JZ12f2Ri0W82HD
	UwkUT61TdKNVE4AxUWfKATYOArWI+YNX2q0/pq2N/GYqhVmCInh6+yKobJChypoiEZeQ8dHTCzgC5
	7mG2snM8+2OSyJbC8zwYiTbg3cqx/gxzBXHTH7smemcR66UecapOx93YC1mPp2cQDFuT82xIuOJJN
	dIhF+oaQWAaT6JgbEQjld10fp8NEcuFvhIfH5+nGbdo5oVA+fEUW91VAFoxZYqPXd4sgoRTZW3DTl
	9RKXa/gH0C40B6Z1Z3NPnFERXzJNecp+Ceo2nfuCO+UvqHosE117+6M/UX1gUNI+YAjctQjv+upRc
	QLJgjibA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiqdY-00000009xJX-1por;
	Mon, 04 Aug 2025 08:33:40 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiqCB-00000009tl4-2Yjd;
	Mon, 04 Aug 2025 08:05:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754294722;
	bh=FYLnhdEGvKvTuON4KAML6Oi2n8qm37XovUco3wVoE8Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CbCTfOD5k19H11a4u8Q/Woseup+CwmLYRS5HHnfKWg7HCiwgwh6as3K7nqjqmhFKi
	 dixMcCmrIFnvDHVlV+ldfXa8C031R8gxmtAJYO6rfOkedswPQC9lBXxzUSAyBHfocn
	 Y76UqLKPidiEh447HlFNPsj4Cz4VB2gI/5G5Ego6L6X77jBTNp0fdn5uLQ0E9A4utF
	 xuqj/T9V2FN1w4VGto2+U+/FYRHFRPRXE7IbBl/b284iCjrdMxALFF2WqSXlaBJMzC
	 SNySu9agllgUfSfCEoDG9fNGjIqNJp/aOXSukvimp4CZCJ03io549A8zlEkvE+NLQT
	 gyaYO7/ct9n3w==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8410217E0DB9;
	Mon,  4 Aug 2025 10:05:21 +0200 (CEST)
Message-ID: <a9cd33f5-cc37-4a1d-b1fd-094761a146ed@collabora.com>
Date: Mon, 4 Aug 2025 10:05:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] Input: mtk-pmic-keys - MT6359 has a specific release
 irq
To: Julien Massot <julien.massot@collabora.com>, kernel@collabora.com,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org
References: <20250801-radxa-nio-12-l-gpio-v1-0-d0840f85d2c8@collabora.com>
 <20250801-radxa-nio-12-l-gpio-v1-1-d0840f85d2c8@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250801-radxa-nio-12-l-gpio-v1-1-d0840f85d2c8@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_010523_796685_A7A8D61A 
X-CRM114-Status: UNSURE (   9.93  )
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

Il 01/08/25 15:16, Julien Massot ha scritto:
> A recent commit in linux-next added support for key events.
> However, the key release event is not properly handled: only key press events
> are generated, leaving key states stuck in "pressed".
> 
> This patch ensures that both key press and key release events are properly
> emitted by handling the release logic correctly.
> 
> Note: the code was introduced in linux-next by commit
> bc25e6bf032e ("Input: mtk-pmic-keys - add support for MT6359 PMIC keys")
> and is not yet present in mainline.
> 
> Signed-off-by: Julien Massot <julien.massot@collabora.com>

Well, you are effectively fixing the commit that you pointed out, so this needs

Fixes: bc25e6bf032e ("Input: mtk-pmic-keys - add support for MT6359 PMIC keys")

and

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Cheers,
Angelo



