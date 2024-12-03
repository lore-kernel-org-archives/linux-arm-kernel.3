Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D089E64AB3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 14:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M8uyWrRzzEAVXoENQCiyJ4GB9jG0a0mzNVvUDFjMzUk=; b=aCYV+pncrprN/bVW2mJpi09nH/
	/DXvB3uqrkd+4v4UK+MgqK2DEBsOikxTiszKmR599MJUJsxI/hYKjSctLU3KtNkyq9KqbKu79j6vQ
	11kyTZn0C0y3oFm2D8dM7TjtUCML/OkocrYVp6902hRN/vggN2OpaJ21IhcSnU9yhrhGI76T6jcdZ
	BCuylepdR5INgdROlnsRbjTPmuJnZaJiKN6mM2PSmKYmOrtqYQq7VvBawrxY39mRKqVHxfyDxa2S6
	frG+I3Uan4SFueDLJU/KNoLdcTgGxKASG3QMO8o5x4fKNMHo5Zdv0+liGyBxxgaE3yEd6GcM3twVZ
	HqcHzrTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tITpc-00000009lSn-0aLt;
	Tue, 03 Dec 2024 14:24:52 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIToa-00000009lEm-3ogd;
	Tue, 03 Dec 2024 14:23:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733235826;
	bh=iUYCthuBSmOjrDmuj+W4FEtenoQajCGj/nGcHrCp+Y4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HDHGIQr4ZOP+6nOkv9NiLDKRLFN6dAlvE+LiEiArCuc2pwc4PJxfifRwd/H0l+aOp
	 xl3UdXx7s/BRwqRPH+fZUkxHhYyBqHjVgvVAzjKJXfdsnb/8z+FMvCbT7BvLsOsCiN
	 fnScm7AdEeAZN1lRaZN/YdWTd/ozIK2qmRU8wsHvQyevysrNgS1UftlaLrJc8WxO0D
	 5JfSWj27FNx88mUwpo2OdvlQZo4rwBxtU0jdhkqJuFDsmRF7ojCgkp6sGUyT6Gezk1
	 uiXAf8CEm/u7wKYtiGtYlPlU13NFbP8WMGNsCCciKdZj4xQH3inLfGbNIjlIjh258Q
	 1hKZ/TuOSSCKg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2536517E0E37;
	Tue,  3 Dec 2024 15:23:46 +0100 (CET)
Message-ID: <fea3783a-0ca2-4a46-8b82-ef1156dc8f3c@collabora.com>
Date: Tue, 3 Dec 2024 15:23:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/18] arm64: dts: mediatek: mt7988: enable serial0 on
 bpi-r4
To: frank-w@public-files.de, Frank Wunderlich <linux@fw-web.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20241202122602.30734-1-linux@fw-web.de>
 <20241202122602.30734-11-linux@fw-web.de>
 <32ef5ab8-a163-4fdc-8603-f5a6f0e8526b@collabora.com>
 <6964E096-7C19-450C-8434-6A4456AFDD55@public-files.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <6964E096-7C19-450C-8434-6A4456AFDD55@public-files.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_062349_092702_06E88625 
X-CRM114-Status: UNSURE (   7.86  )
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

Il 03/12/24 12:27, Frank Wunderlich ha scritto:
> Am 3. Dezember 2024 10:40:45 MEZ schrieb AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>:
>> Il 02/12/24 13:25, Frank Wunderlich ha scritto:
>>> From: Frank Wunderlich <frank-w@public-files.de>
>>>
>>
>> arm64: dts: mediatek: mt7988a-bpi-r4: Enable serial0 debug uart
> 
> You want new prefix here? That will change all r4 commits,right?
> 

Yeah - that prefix should be shortening the commit titles but mainly will
make it more straightforward when reading the commit history with --oneline.

Thanks,
Angelo

>>> Enable the debug uart on Bananapi R4 board.
>>>
>>> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
>>
>> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>
> 
> 
> regards Frank




