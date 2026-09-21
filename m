Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7404CC982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 10:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JYchMiREWowW3+mUg8h/Fng4wcnIcSeQ0Ii8DipHHhY=; b=lmJketoP/5SRgccqvOxjLbfPfT
	Nmg52DjIJtK2IL5bt05d14Gqmt8J5F2cjpLP8fhOfPs2iQx+lZkktYDmK8BEsgRs0Z27cYEnw4l9h
	s/dIgGj9tawoCiTqnmKDLwSbBdp9khvxa6F2YIkgrDD19ia4IQUEBEF2/CQioy5oR9xm+8zSvr1N+
	NDkgMUyXnANrRgYvZMJWctDbqVhbENJ3hAhx8gPilg4aR8U9e3GqT8+OpIvjs+o/aOIadAb0xT6FI
	d729uF/HUsDORyxO9itEYAq9JaoY3EBNYV8YaXEDoDYD1nKutVX6TyfCmd0t18wfo4EI9l0DDMu8P
	v5XalPsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8bUL-00000001jTP-3i4H;
	Mon, 21 Sep 2026 10:43:09 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8bUI-00000001jSi-46vU;
	Mon, 21 Sep 2026 10:43:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789987384;
	bh=Jgwpcker6k9rDea0kRKtirRFxf58xRqNK/1bFIhkyeg=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=oMTNaCUUQMOFVvWtgJ8FpNZ78+radWm4cFtglDxYayHg0KljOdwH8twiOXi86vS+U
	 P3VUGiXZmygGnudp9xbNeTLWgolxWIBtpw50uZp180Qt5J6bwhxGXRSHalytZTM+6E
	 2zxNom4zWTDpnpi/BFF1YgFfhfMoLnQE3suBwwbogv6IekEHfTDrFHDuJrXjjSDohm
	 6v50HbEataNqYDAVG6gHO69vfRYaEz3UtKyFlL7EmlZNEoGJ11fi/hJYypEtBORh4u
	 xNxx8Qt4b9iGK7fOa/1MsShkRNlvXC0pUMqKDGSQLNt3bI4p447TOs6WYGN4plBFxQ
	 2eNtJ8McJQ3/g==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3C7EA17E09D6;
	Mon, 21 Sep 2026 12:43:03 +0200 (CEST)
Message-ID: <bffc0927-26c0-4b36-9d66-d75dc5aa3b89@collabora.com>
Date: Mon, 21 Sep 2026 12:43:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: dt-bindings: Correct white-space style
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Keke Li <keke.li@amlogic.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Zhi Mao <zhi.mao@mediatek.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Bin Liu <bin.liu@mediatek.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Xia Jiang
 <xia.jiang@mediatek.com>, Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20260801195528.235230-2-krzysztof.kozlowski@oss.qualcomm.com>
 <1505ca0c-4a31-4673-bbe0-8474133fc504@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <1505ca0c-4a31-4673-bbe0-8474133fc504@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_034307_178407_3622642F 
X-CRM114-Status: GOOD (  10.27  )
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

On 9/18/26 12:46, Krzysztof Kozlowski wrote:
> On 01/08/2026 21:55, Krzysztof Kozlowski wrote:
>> Correct a few white-space issues, like double space after '=' or before
>> bracket '{' characters, which will be flagged by dt-check-style.  No
>> functional changes.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> ---
>>   .../bindings/media/amlogic,c3-mipi-csi2.yaml  |  4 +-
>>   .../bindings/media/i2c/galaxycore,gc05a2.yaml |  2 +-
>>   .../media/mediatek,vcodec-encoder.yaml        |  2 +-
>>   .../bindings/media/mediatek-jpeg-decoder.yaml |  4 +-
>>   .../bindings/media/mediatek-jpeg-encoder.yaml |  2 +-
>>   .../bindings/media/qcom,msm8996-venus.yaml    | 40 +++++++++----------
>>   .../bindings/media/raspberrypi,pispbe.yaml    |  2 +-
>>   7 files changed, 28 insertions(+), 28 deletions(-)
> 
> This received reviews, is trivial, waits on the lists for 1.5 monts and
> it seems people are repeating what I did.
> 
> I understand this won't be picked up by media.
....in any case, for MediaTek:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

