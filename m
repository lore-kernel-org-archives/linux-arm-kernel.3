Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 655CBC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 10:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WOQcoLa0TeXfQqDpPcuJqNfnBVUBPwCoam5guNlX7xU=; b=fghwuRz5SRhKzx+FQTI28f8bLD
	WHIJJ2Wqzlr+eSaL7av9is02ygIQ0XRuqKcXnXt0CtV9YhQY4VNI6kd2gt63MU4mcm0vSVNg+mGno
	jhl5pv99RSJBLwXbDkhdm0t5hBgQyKQHMY9jX2FAv9rdWMflSIEL35b2Qscjct6yQxIi+k9jYOqqD
	T5wrgJTUzgynW6BtVDqkGUTElKkpSltnVIn0M4l5mYNQHe/A2sN4Vserp5QdaBtBs1DoTxTyhudz1
	I7AT8UtFOQcSxG8by9RQdh3p+3pIqaXoYwVVbbYoWpUeDSvTLmXzcl07LO3kC8MxdvZL6/b69AUQq
	RKKiPgqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsJUs-0000000886H-0mNH;
	Wed, 12 Mar 2025 10:39:34 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsJQZ-000000087Vl-0cTG;
	Wed, 12 Mar 2025 10:35:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741775704;
	bh=DaNSPhjsIutc4H0j8tAHVR2G8WRt9pYokVOYxoyiDd4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=I3s6/PP1ZINlZ2BzZTd6ikvg+HjxK/0CB+7Tkq4fcW8Nxi2shCqyNEfCLnqoXadQu
	 GoymC5Ab9D6iB55hp3nnJr5CcIgg7/E9ka0CujN8hGtginUuphL6DUYZ4dza7WAOGb
	 YUlTMMnAGGUkfoe/z3gMqf+ltnxSdvTKQfybiFEleeg2UgS4biTttuGi5i8iR0X4ar
	 6tpgJ33Wev7vQ8Ol/unn9yTiCR4y7sC2AS+Ik4AkaAsqguRZO+WSeKClhLQTOfydZm
	 lh+txk4jN1GMEpumdnN9TiRItQoED1A/VBwQnF2O6Hd/aoMCOuf7reWK/mEZR00/9M
	 weOaSzZC8WAtQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 13D7B17E0B12;
	Wed, 12 Mar 2025 11:35:04 +0100 (CET)
Message-ID: <16a54f79-2c0c-49b5-82af-9538ef43abd5@collabora.com>
Date: Wed, 12 Mar 2025 11:35:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] dt-bindings: memory: mediatek: Add SMI reset and
 clamp for MT8188
To: Friday Yang <friday.yang@mediatek.com>, Yong Wu <yong.wu@mediatek.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20250311122327.20685-1-friday.yang@mediatek.com>
 <20250311122327.20685-2-friday.yang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250311122327.20685-2-friday.yang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_033507_353103_A23F3C47 
X-CRM114-Status: GOOD (  16.83  )
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

Il 11/03/25 13:23, Friday Yang ha scritto:
> From: "Friday Yang" <friday.yang@mediatek.com>
> 
> On the MediaTek platform, some SMI LARBs are directly connected to
> the SMI Common, while others are connected to the SMI Sub-Common,
> which in turn is connected to the SMI Common. The hardware block
> diagram can be described as follows.
> 
>               SMI-Common(Smart Multimedia Interface Common)
>                   |
>           +----------------+------------------+
>           |                |                  |
>           |                |                  |
>           |                |                  |
>           |                |                  |
>           |                |                  |
>         larb0       SMI-Sub-Common0     SMI-Sub-Common1
>                     |      |     |      |             |
>                    larb1  larb2 larb3  larb7       larb9
> 
> For previous discussion on the direction of the code modifications,
> please refer to:
> https://lore.kernel.org/all/CAFGrd9qZhObQXvm2_abqaX83xMLqxjQETB2=wXpobDWU1CnvkA@mail.gmail.com/
> https://lore.kernel.org/all/CAPDyKFpokXV2gJDgowbixTvOH_5VL3B5H8eyhP+KJ5Fasm2rFg@mail.gmail.com/
> 
> On the MediaTek MT8188 SoC platform, we encountered power-off failures
> and SMI bus hang issues during camera stress tests. The issue arises
> because bus glitches are sometimes produced when MTCMOS powers on or
> off. While this is fairly normal, the software must handle these
> glitches to avoid mistaking them for transaction signals. What's
> more, this issue emerged only after the initial upstreaming of this
> binding. Without these patches, the SMI becomes unstable during camera
> stress tests.
> 
> The software solutions can be summarized as follows:
> 
> 1. Use CLAMP to disable the SMI sub-common port after turning off the
>     LARB CG and before turning off the LARB MTCMOS.
> 2. Use CLAMP to disable/enable the SMI sub-common port.
> 3. Implement an AXI reset for SMI LARBs.
> 
> This patch primarily add two changes:
> 1. Add compatible for SMI sub-common on MT8188 SoC.
> 2. Add 'resets' and 'reset-names' properties for SMI LARBs to
>     support SMI reset operations.
> 
> Signed-off-by: Friday Yang <friday.yang@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


