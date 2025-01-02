Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DEA8E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 12:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NyLY+1vYq4chYZ6omlqn3g8Tr/hTtwD82rDA0WfE7B4=; b=x/mZpm9Pt8ZB6Y+BhjqInMFOMp
	XRQnSr8OHfJ3hnw0gWxG+iXdsmyTNRGWGn29NVrieZRSApX5ccmvWMx4mH1Uu//oT0HD5lDtWIzUP
	X37ix1B6ybO1ImWwfz3hI8zjsYC44PTG+MDe+hz03yvSH0XzmkdOq0e1TiBikAMt4ymKJEXwCy1pN
	S/OILcRyphaqt505QPmhaZQI+tx7lAFfWWfMEhDINKBCyNbvgzvQQvYQVNfmnhDM/xva5lBDwPDkM
	FeUh3G6Dp1fQrMSRb60BNRmjjVzNxdTVa1EJ1ZDgTvES8RprTOm7oI3hPrX4Edrg+88OtUKXcotXq
	5ZNEpJ1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTKjR-0000000APmi-44nu;
	Thu, 02 Jan 2025 12:55:21 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTKhA-0000000APDt-1akF;
	Thu, 02 Jan 2025 12:53:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1735822378;
	bh=zm43TYi4z+GwQwZRB2Q+5ZdBGmn9Rmo1nucOK3h8gdE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DABCNyMQZZNP5B5uxElY723LcC3CFpvBGbIFj3H/uzuKCKeMGL2ckKeDsks6NAKxK
	 p4T0C5m89z9fhqOJGKp9qq0z/B1nfhSRAg4ghdjfjgHaJe8BaQeBi+aRKzgmJYMZ2m
	 b1YB325qi2g430c4W5nycd+v47IEcVbeJyd1Iv8YNzkZKbMztDuKd9+OK+KZAbDf5Q
	 voWTWoLaBRRCvh9DkGs8G2hLQZDKHqlrcNn51at5hAl079LZ3pTLiAnh+hCKVD+cVL
	 a122Xf0hzI2okwxTVloWfV3lWMrUCYez+CnK451e+mtcOVLxBtVMm4K4RLPxcbZn2w
	 HahNEz0kbb91A==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C3E3A17E156E;
	Thu,  2 Jan 2025 13:52:57 +0100 (CET)
Message-ID: <fa2033e4-0cb5-47cb-bbe7-cbcdb9318c54@collabora.com>
Date: Thu, 2 Jan 2025 13:52:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: mediatek,mt6779-keypad: add more
 compatibles
To: Krzysztof Kozlowski <krzk@kernel.org>, Val Packett <val@packett.cool>
Cc: Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Fabien Parent <fparent@baylibre.com>,
 =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>,
 Alexandre Mergnat <amergnat@baylibre.com>,
 Amjad Ouled-Ameur <aouledameur@baylibre.com>, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20241225192631.25017-1-val@packett.cool>
 <20241225192631.25017-2-val@packett.cool>
 <2cikysv5mwmc4utckjg7iaqx66ncwu3nsxd4kqipj3gw4mymbf@3gipwanf44ji>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <2cikysv5mwmc4utckjg7iaqx66ncwu3nsxd4kqipj3gw4mymbf@3gipwanf44ji>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_045300_618009_862DBF38 
X-CRM114-Status: GOOD (  22.49  )
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

Il 27/12/24 10:12, Krzysztof Kozlowski ha scritto:
> On Wed, Dec 25, 2024 at 04:26:19PM -0300, Val Packett wrote:
>> Add compatibles for SoCs using this device (mt8183, mt8365, mt8516).
> 
> This we see from the diff. Say what is less visible, e.g. are they fully
> compatible with other variants? Partially?
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 

Yeah saying that they are fully compatible would be good here, but anyway
the change is self-explanatory (just IMO - but I know MTK SoCs so stuff appears
obvious to me from time to time, and might not be obvious for others).

Anyway, input maintainers, please let me know if you want to take this (or the
next version) through the input tree or if I should take it in the MediaTek tree
along with the devicetree changes.

Cheers,
Angelo

> ---
> 
> <form letter>
> This is an automated instruction, just in case, because many review tags
> are being ignored. If you know the process, you can skip it (please do
> not feel offended by me posting it here - no bad intentions intended).
> If you do not know the process, here is a short explanation:
> 
> Please add Acked-by/Reviewed-by/Tested-by tags when posting new
> versions of patchset, under or above your Signed-off-by tag, unless
> patch changed significantly (e.g. new properties added to the DT
> bindings). Tag is "received", when provided in a message replied to you
> on the mailing list. Tools like b4 can help here. However, there's no
> need to repost patches *only* to add the tags. The upstream maintainer
> will do that for tags received on the version they apply.
> 
> https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577
> </form letter>
> 
> Best regards,
> Krzysztof
> 


