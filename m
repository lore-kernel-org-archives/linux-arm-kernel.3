Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32289C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 11:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sxv31U6jkbIQSVrhi+bLgpRYB+DgONn7t4yPRpXECq4=; b=VfMO35VUexhsnbdCaRzZoIuvsQ
	7xEICUx7rx8d0X4WoVxB5IYMoJT3MbPbXsjqNFHRqIqhp4poQTGTIUOsZ6o4E93OXlNoHVd5lOYZt
	aHlAR/Wn1KKFI3b3/YM9jKsjJlgysOLup75pojzbftP+Kml7TiHqj7DvVfLLqq70jnWNZS/nDB9H5
	eJmVhQdAErq82NuGNA7mKLxO1t/mePDHGjs9hndXP3rCsBO1cM+goWMmgXJOl2LmeuQ//APd7DMWq
	diB6Ic6RRnV2ZqbTTWZKVIoX/TDaH70c/SCWakk3C1YlDW/8nA+hmxaMaEup+fFgch/yVrJCUvWcE
	IEy109rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnFGp-00000003QY3-0IOu;
	Wed, 26 Feb 2025 11:08:07 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnEtq-00000003LOH-1VfH;
	Wed, 26 Feb 2025 10:44:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1740566660;
	bh=eNYaagGBQl3zI4PG/iw1/+t9855oK/Pqf/7j9jiqRWg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=U5FQXFP/5o25fTSqQ0Okey4UykTudRi0qQ7P8qymo77inRkdD/U+d9xv+5nNtxrSX
	 24uakRMkjyasTEvwf4YvO3IPgBI7E2ReaQVYYbRcGGI3oMed3HTVqUkThm0QiQ3iH5
	 8S4s4fmUijpB5GH/IFg/o15X2fX/hOnIzKBP5mqNf4OYDBsmh1wGt0QUhHs5J91L6n
	 xzIAJwCdJsO1lKq0z5cWNQ67al1Hrpc90icq0YPZmC5bZTnxyvATwp2UsL/MHUBWz/
	 mWfjY3gHNbk31sowpKkr6WRVdKD35P6Nd8yFBoYcSdjOfpy4WdlBsQuViN3xMl9Luy
	 UIlgFnqKzUAiw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AE57317E0605;
	Wed, 26 Feb 2025 11:44:19 +0100 (CET)
Message-ID: <ca325a7f-fdcf-4561-9e5b-8153ca7b8f0e@collabora.com>
Date: Wed, 26 Feb 2025 11:44:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: display: mediatek: dsc: Add MT8188
 compatible
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
 pablo.sun@mediatek.com, Rob Herring <robh@kernel.org>
References: <20250218090427.20318-1-angelogioacchino.delregno@collabora.com>
 <CAL_Jsq+4+=3ccuwa1whv+UQ56H6ueia4Mqy2z73M-5D15zZw=Q@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAL_Jsq+4+=3ccuwa1whv+UQ56H6ueia4Mqy2z73M-5D15zZw=Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_024422_551372_39D6FD2E 
X-CRM114-Status: GOOD (  11.14  )
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

Il 21/02/25 18:08, Rob Herring ha scritto:
> On Tue, Feb 18, 2025 at 3:04 AM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Add compatible for Display Stream Compression (DSC) IP found in
>> the display controller of the MT8188 SoC.
>>
>> This IP is fully compatible with the one found on MT8195.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   .../devicetree/bindings/display/mediatek/mediatek,dsc.yaml     | 3 +++
>>   1 file changed, 3 insertions(+)
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>


CK, please don't forget to pick this patch :-)

Cheers,
Angelo

