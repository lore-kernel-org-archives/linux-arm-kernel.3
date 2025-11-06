Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4D91CCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 09:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N4WxcesU0P/TXv3TRmPG2ZHWmOrkgPcSkuPcx/Ca+2Q=; b=j4SqGymtxGBeahND0wBgwlC6OW
	eipu2fMrL9vDbnOs6Ea56TZ//vik6xtxDDG3dmo80RVbx+cPIHyi7jkUBOBdILwfInc2e1bO4GeJy
	cm4COjEnxbD4pGS3xloMrFcDzINp8dP+bW5Z2v3ZKJQbTr2SVaayJ1KMIGI21uF9/WqIoPwnIYCl0
	T7fqtJIvnHzvkyW5IJdPwn532EiTIX2BXT1AC2dh4fx4liqe8wHPTbGSDv6UmOU+d0EWccbi6JyMO
	3T+DLDSb5oXE5SHR0OEbhLYDBgLWyGbQ+tblXh2JYA5GdOPRNNTYIP1DCgNIVm6x8CcQ3xXUuDJ8h
	flGv1zpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGvsK-0000000F7MJ-1AWd;
	Thu, 06 Nov 2025 09:01:48 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGvsH-0000000F7Lc-3kEZ;
	Thu, 06 Nov 2025 09:01:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1762419702;
	bh=QcB4tTj1Ktd6oFfnLlrC9HHYo8w5fqDcLZG41VSOuC0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Jk22pwidtbtK/X3DkNJMhIA7sOVgGiU9p7ziVD72TsI/vSwcl5AaKNwrmC8xKpWHu
	 WNWctcbuVnJyYugfkekvTiBAIxghyHtCoHkJaFfrLhZ8ITFVyRhK2vtPwTspll9XOy
	 3I7r3iEne6g5YlLN7oqIyzuDcSAQMSqZII28go1oss41qUd6ioIHGxmFwKlscN58P1
	 V1gZ2BYfkWwJ+KQZWHssJk1BfSU16tC4IfibnmtOv8vQXdcPSXOhVsUOl0FL/IBnwn
	 H5IBBdTYqRV3g/jvpRn2K8WaU4UYWMCDnwcQ6uJsbq5TB1ECwzH/K2SJqNThBXg+tE
	 AahLN65keuQ1Q==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id ED3BC17E090D;
	Thu,  6 Nov 2025 10:01:41 +0100 (CET)
Message-ID: <1af7077b-42a3-4efe-a8cb-6117136c8f2a@collabora.com>
Date: Thu, 6 Nov 2025 10:01:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] dt-bindings: pinctrl: mt7988: allow gpio-hogs
To: frank-w@public-files.de, Frank Wunderlich <linux@fw-web.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 AngeloGioacchino Del Regno <angelogiocchino.delregno@collabora.com>
References: <20251105195007.199229-1-linux@fw-web.de>
 <20251105195007.199229-2-linux@fw-web.de>
 <5DB7D99D-A30D-42A1-8E3E-B0204A1E6E6D@public-files.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <5DB7D99D-A30D-42A1-8E3E-B0204A1E6E6D@public-files.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_010146_081518_3600D185 
X-CRM114-Status: UNSURE (   8.68  )
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

Il 05/11/25 21:01, Frank Wunderlich ha scritto:
> Am 5. November 2025 20:50:01 MEZ schrieb Frank Wunderlich <linux@fw-web.de>:
>> From: Frank Wunderlich <frank-w@public-files.de>
>>
>> Allow gpio-hogs in pinctrl node for switching pcie on Bananapi R4 Pro.
>>
>> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Reviewed-by: AngeloGioacchino Del Regno <angelogiocchino.delregno@collabora.com>
> 
> Seems Angelos RB tag is missing "a" in "Gioacchino" in email
> 
> Got error:
> said: 550 5.1.1 User does not exist -
> <angelogiocchino.delregno@collabora.com> (in reply to RCPT TO command)
> 
> maybe this can be fixed while applying?
> 
> regards Frank

Eh, have I typoed my own name?

So cool. Lol

Just in case it's needed:
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Cheers,
Angelo


