Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06576D3B7F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 10:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nFEisarEAGDUDjXFoCu+t0IDnmIBUm72XkHEoSvtvic=; b=AGJ3f0qRBiCYg0JCArL1wxRsYx
	pkPbZKSSJfUvXkzC8D/r14Xfoj49jKYeZOy3bP6j8nscwS7Gsx/TZ0IqrQtqyzlR6ChpjzjtUuu7u
	J6OlCta4WCCqf3hTEo9IpBIqlS+JWWK8Lo756gG5aMg6dfEv4oCC156/EE3W7IgVRQgAt65o+enEw
	+aVlJeAp0/8ReW8DBmbhPgSY5yFu+bJfNGiKK+FXpWKT3hBkVqDPpje8IWRNhrCKHH2YHenXwCq4e
	9YiKFev/Y+mXodtnr6sfSGynA1yW6lpAiHeqqo27+1OpD0u6dhd383Yf5OJ8RCbZg6kB7DgYlkPcj
	Kx3N4D8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFW9n-00000007hfy-2lfh;
	Mon, 25 Nov 2024 10:17:27 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFVZy-00000007bxe-2BKX;
	Mon, 25 Nov 2024 09:40:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1732527623;
	bh=d9COl/HNryGOtsnndDDZCpiMYa8ON1Clq6F2gVqRaWE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iqaRCXmAPGiFTo1xKAHvs4MZJXM3fxG9nD+pGnOJH7t3F8fOjFY1lGQaL8bKiloKf
	 ZdPABCbAi2V2rifIE0bqa0vz0fP8elp3cdd7f/HN9SAXqMUBeGahFmPOuoFmKyjy3a
	 plnUOVhIR9yAiBt2DMkkop93hprpv1YhrmQB8cOXVfHfG06To05w69kjaWHUFq9oXS
	 FqkF9KSjpOacEuIf9Tsga2hDnDt0P6BK8EwICMxz86CDJi7vro+JIKolJkPLzI/23H
	 l2fp8cnzDXAeg/gEYfUt2HIJp13OUUrgHH8sBH8TCvJQDAa5QG5V+XwC5dFGk3nb1U
	 KpR10zPAMkeew==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2B51017E1411;
	Mon, 25 Nov 2024 10:40:23 +0100 (CET)
Message-ID: <03b5a671-e0c0-4d18-a103-e7f0ab18e20e@collabora.com>
Date: Mon, 25 Nov 2024 10:40:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 7/7] drm/mediatek: Introduce HDMI/DDC v2 for
 MT8195/MT8188
To: Maxime Ripard <mripard@kernel.org>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, ck.hu@mediatek.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com
References: <20241120124512.134278-1-angelogioacchino.delregno@collabora.com>
 <20241120124512.134278-8-angelogioacchino.delregno@collabora.com>
 <20241122-cobra-of-authentic-discourse-e2c5b6@houat>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241122-cobra-of-authentic-discourse-e2c5b6@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_014026_762875_63304684 
X-CRM114-Status: GOOD (  11.57  )
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

Il 22/11/24 10:20, Maxime Ripard ha scritto:
> Hi,
> 
> On Wed, Nov 20, 2024 at 01:45:12PM +0100, AngeloGioacchino Del Regno wrote:
>> Add support for the newer HDMI-TX (Encoder) v2 and DDC v2 IPs
>> found in MediaTek's MT8195, MT8188 SoC and their variants, and
>> including support for display modes up to 4k60 and for HDMI
>> Audio, as per the HDMI 2.0 spec.
>>
>> HDCP and CEC functionalities are also supported by this hardware,
>> but are not included in this commit.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> Just a heads-up, you should really be using the new HDMI helpers, it'll
> remove a lot of boilerplate and potential bugs.
> 
> Maxime

Hmm... the state helper you mean? Or the inflight series from Dmitry?

In any case... yeah, you're right, let me check which helpers I can use: that's
going to be done for v2 :-)

Thanks!
Angelo

