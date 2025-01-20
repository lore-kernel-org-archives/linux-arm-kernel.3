Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42CC5C02182
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jan 2025 12:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SyKvAs4M1JCBbf2bf8AVNrrZhsYbXTCiT7iPWwU+l50=; b=fGjftWjkJdrCsr6INXec28EX+n
	Ct66xEp8Ol+gQ0vE8lt1tTF66kTv6ALTVapf3jDEyf20nGiMieRIuv1D9cLdQB9rl/LmLGNDzH8Nn
	AtKXH8oKukUA8aFW1aXAaghpzvUPU5EiEsgJFYQrP9QzJIx6XnhVSpJSvHGuUVTnOPjelACnKnBN3
	JwAnRbbZPf0ule+XZDhMGetE4bBzJvNgPXVm8/+N0xsMKH/1TDIDJ1kbrIimLuBglIYU2iBshOGiE
	5eRR2qxxKVLlU1RRdj3A9pUXHq4wX8Q8XPw7kXZnYn4Cy1wEKUWF42tZy7cj5IfEuOduyBqUdngBd
	uJ4ao0mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZrNa-00000005avE-1OZU;
	Mon, 20 Jan 2025 12:59:46 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZrMJ-00000005aot-1ggU;
	Mon, 20 Jan 2025 12:58:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1737377905;
	bh=DD53uhNj6LwdrJl6hL2eBnCsm6oKdkojK2oOswBhZrI=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=MzUKpUy6eAO9Low0cid5YvDD3L4ML3IXM5S24O4r8b6/xPEp8BF9F3Em3HVEC1+1/
	 b0QxzWngOiybOrbuPs+oMxvmjRPwOfPpaC/VCDPvjgq71U6uZQBDxBCWtIEtL/ak9p
	 A6cWA5G5cJYNCc8Kcpr4fswHhuRza5GTZrqeGk0FuBbAo2QH9RZi9YKpPaqUlyHjhu
	 h/BPUh+3o6oMsG+tUpHiAp3mvft4uFFZ7G5cRxZlpqkacIx7ZsUOLFCJ80mruuYLhC
	 KL7ajupU9cUAHZmHYk1Hio4yeD0D4EoK3qL4vH+qT4Vv57ZkfvjItlfwjrdSs+JgTW
	 mPSc0iWf9PUFQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 04FED17E0343;
	Mon, 20 Jan 2025 13:58:24 +0100 (CET)
Message-ID: <15006d4c-81ac-4691-b817-d6510992a14a@collabora.com>
Date: Mon, 20 Jan 2025 13:58:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panfrost: Drop redundant Mediatek driver data
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250118160645.78473-1-krzysztof.kozlowski@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250118160645.78473-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_045827_597239_23724527 
X-CRM114-Status: UNSURE (   8.92  )
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

Il 18/01/25 17:06, Krzysztof Kozlowski ha scritto:
> mediatek_mt8192_supplies are exactly the same as
> mediatek_mt8183_b_supplies.  mediatek_mt8188_data is exactly the same as
> &mediatek_mt8183_b_data.  There is never point in duplicating all these
> structures - it only raises questions or encourages bugs when someone
> updates one variant without changing the other.  Drop duplicated code.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

The reason why these are different is that 8183 and 8192 have different
GPU architectures, where the former is bifrost and the latter is valhall.

Regardless, even if there actually was a reason for that, I agree about
this deduplication here, as the architecture is anyway made clear by the
devicetree bindings for those SoCs.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Cheers!

