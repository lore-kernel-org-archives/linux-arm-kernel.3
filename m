Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0D69D2F7C7
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 09:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HuvQeFlHWA77KY2gJkBGKGEp/zwyGa+35X2c5rFcQJw=; b=r1Ur0opVauKO746LlppdAIyArr
	ltOQxt58Va8tAnyl6ctHHyXjiHd4oHxEdx2zJ4Oq+nZPXvyUrx1Cr4ItXCU3bdq5pVHeHQzJ3HojN
	lE5Sf4WlKNdah9JINc4D7mFaNVK08uPeBZ+ltRcKW+uNh0wr35zv4DEbjs7hl4GTrsTb8R7ylCOez
	6aa2WRQE0OSNcftWhv60QRu5fsVModlYnbr3wu3t4GeqA79nfgGrqJEDZIJbcQY+hRmOJE9AfLLF+
	2gnZpjE1m9PpyKSjb5+i7BtgUBkXTFRzoI2gdT/nQQYYHZuAuo3jKQd4/AZFJtmIPcbB57Rfb6INx
	Vi8wHe4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRRlC-00000009GVh-2XfM;
	Fri, 05 Dec 2025 09:05:54 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRRl9-00000009GPZ-1J9Y;
	Fri, 05 Dec 2025 09:05:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1764925546;
	bh=D7VL0jnqEcYIiXISGPI0STnm5YtEk74aTsL7Vqv/Nmk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=d03/E+VF1roJ9MVL/7hBfzZmNp2mVXq3QgIPXrzSp/xth+B5Bb5tGZKxFjZg7lJry
	 /2tXVPJHNECfVD7rKRr5E2amhEqivihl52riQWK38AiYxDk86CGY5HBCyMdQBDKs7j
	 NUrVPg/7wUfbpXQghw3LjzvyaNpbcNIRXg1nSzpyRKdnxmQr7DybxpAdw+grln2ioy
	 cZLXivMa5wJLH12RtScFLWnsV2jHH8v0ybLvzvo5lAp8bo2C2wYujpMF+FGT7IIBPU
	 EZkR/4+uJ/kC7cpI8LPGE2Ks6lUCyipMSguIhY09rMkw9yUxMZo4AkBWGwcdghpCXQ
	 tD6KRQZMZIoiw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 207F217E0483;
	Fri,  5 Dec 2025 10:05:46 +0100 (CET)
Message-ID: <ddad2f21-4853-41c9-acfb-1613f5000f0c@collabora.com>
Date: Fri, 5 Dec 2025 10:05:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] arm64: dts: mediatek: mt7986: add dtbs with
 applied overlays for bpi-r3
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Frank Wunderlich <linux@fw-web.de>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Frank Wunderlich <frank-w@public-files.de>, Rob Herring <robh@kernel.org>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>
References: <20251119175124.48947-1-linux@fw-web.de>
 <20251119175124.48947-2-linux@fw-web.de>
 <fc5c9829-96fa-4028-a642-0792699e92a5@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <fc5c9829-96fa-4028-a642-0792699e92a5@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_010551_564255_8C230F7B 
X-CRM114-Status: GOOD (  11.77  )
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

Il 05/12/25 09:10, Krzysztof Kozlowski ha scritto:
> On 19/11/2025 18:51, Frank Wunderlich wrote:
>> From: Frank Wunderlich <frank-w@public-files.de>
>>
>> Build devicetree binaries for testing overlays and providing users
>> full dtb without using overlays.
>>
>> Suggested-by: Rob Herring <robh+dt@kernel.org>
>> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
>> ---
>> resend of
>> https://patchwork.kernel.org/project/linux-mediatek/patch/20240608080530.9436-2-linux@fw-web.de/
>> due to discussions here:
>> https://patchwork.kernel.org/project/linux-mediatek/patch/20251117211306.725678-1-robh@kernel.org/
>>
>> changes:
>> - updated sd-nand with sata-overlay
>> ---
>>   arch/arm64/boot/dts/mediatek/Makefile | 21 +++++++++++++++++++++
>>   1 file changed, 21 insertions(+)
> 
> 
> This looks like still not being applied and now it is a warning in
> Linus' tree.
> 
> Can this be applied and sent as fixes?
> 
> Best regards,
> Krzysztof


Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Matthias, can you please take care of sending this?

Cheers,
Angelo

