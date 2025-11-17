Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A0ACCEBF61
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 12:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dKBB8ir4kdpPzDqwAj7GC3Bir9GDgvESFkL63xLs3rc=; b=VGWj79VsU5qjE9NoSS11incTau
	HJjoPShqfC+3hM2AquVPGbDYm4ZHX5UK8Yfr2Uy+S6n72O+Md4fiPHgLOSkryrJAz/Btu3it5SKc5
	xUnRKsIuAz+Oq0c7TeDWVsuDNYI0t9cAF90biiHhxrFB9XM9J6TSBoO0rpW1pdZFOSIKfm6LghxYn
	6mhCqmR5KLSDcNwbJP4suYXJrKpJmsdVKZw1ZuLej+QL7ulC0gRZyyp9Y9jMTINbjoFn2uf2GBIXL
	88DoMfWUoO4u32ouaJL7qcWlpX/Gn2HPcUjMoql8qGzKIgPHijZ2cK+TzunyiszL+6nYoAnXLDuBZ
	QLxui2tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKyeU-0000000G7oO-3tpf;
	Mon, 17 Nov 2025 12:48:14 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKyeS-0000000G7o0-039S;
	Mon, 17 Nov 2025 12:48:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1763383689;
	bh=+MFGG8MAg9lirzqKLV5cI/CokpPWWF061SoFUkLSFvo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kJYyrBuiQNyFB//1l745/976UtuqtR7p5FmlRqy2doCi1+pFFhoVZoUgpiPrKjPt+
	 KKeooJsIqn8uN3FtztwGpGkYkwMhw9SbTbx7+vXuJVfqNSjWOORQoMQ6uEl76V3zF2
	 /aB8ZY3aeo8g4dZ0YMXjVh/1fe5n4bQuYgFFzhWPqJIPT15lnNVc5LKNJmzPinaqjQ
	 W2ZhpVYBkY4YxGg0y3Iz9ahgw/9CUC51zIBDX3qd9A3tc7WHAmKzKOLwZF9otYCIM5
	 a3O+KPIqDwujmoElsPEEFaizeFoK2yVXP68gVQkfWpSQaNxxV/KJ91g2TBsJPCIxdc
	 cHMGWZ37THYOQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B7D9117E0B85;
	Mon, 17 Nov 2025 13:48:08 +0100 (CET)
Message-ID: <8bbb405e-203a-44d2-8f94-6b7cbcf1589d@collabora.com>
Date: Mon, 17 Nov 2025 13:48:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/13] dt-bindings: soc: mediatek: dvfsrc: Document clock
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Henry Chen <henryc.chen@mediatek.com>,
 Georgi Djakov <djakov@kernel.org>
Cc: kernel@collabora.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org
References: <20251114-mt8196-dvfsrc-v1-0-b956d4631468@collabora.com>
 <20251114-mt8196-dvfsrc-v1-2-b956d4631468@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251114-mt8196-dvfsrc-v1-2-b956d4631468@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_044812_196987_A5E7A00F 
X-CRM114-Status: UNSURE (   9.66  )
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

Il 14/11/25 17:53, Nicolas Frattaroli ha scritto:
> The DVFSRC hardware has a clock on all platforms.
> 
> Instead or proliferating the culture of omitting clock descriptions in
> the clock controller drivers or marking them critical instead of
> declaring these types of relationships, add this one to the binding.
> 
> Any device that wishes to use this binding should figure out their
> incomplete or incorrect clock situation first before piling more
> features on top.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


