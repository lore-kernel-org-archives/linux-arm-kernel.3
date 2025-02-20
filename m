Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20446C021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 15:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=blR87zOJZSCLfkfi9UWh6XyMqpQ7ACy6oKBvJ9caTrY=; b=CePG9i32p1VetnQ41TZ1oImEfi
	IpBlFD2Rb9LFd2vynMGhW3A50hwAUrKfPsiQaA2cHtgIURY/qaIZtDbYa7kJhFVeKZ9US0sZX53SE
	asIl7DnNa0YRk6RQQGHrTZhdzrlGpVL+vaJTN2YDtxFR1fOEOBMghdSpGG3FvMbbVqBThQIKtL6RS
	VASZq94ZrrTniLDoDaL9Gip3QpCUNKxTP5fMFmerX79d/YqlTR+AeKDWvig7kcaGh9PH2dq2lUuPP
	kPve/NHfX9ruk2AAGUbuPtb7YezrfeVV5y9ksnrI2XvnYOgoZmoKiuvRGrPZn8NftrITjRx/TVc9e
	QK8HZdzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl8Mq-00000001Xhc-4AXv;
	Thu, 20 Feb 2025 15:21:36 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl8KX-00000001X0s-2oP1;
	Thu, 20 Feb 2025 15:19:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1740064751;
	bh=q+rI1MFGx1dmzUkCsd87R8AaxLfHoGvv+Cb6RXBBXvo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Fx5+gHuek4r6O15kJIdNiY8QLR8+QYAZewk/yQq9aAnvCyRYpmG/UWaON1i06z2aQ
	 TLUMvvJUzO6B7s46LFKcheLn4Z/EBXrD2IgUQNzDTMIVIv7DfMoP0uN6KXdHMUQyc9
	 /ByHxhbKp/hBSgmd+Vb67byCfX7kWU2krqZh9wHLN7p4BCGWIVer7E3tEMg4wB6T7d
	 If/ujMqhJAkOYxNDNHt1ga7g/am38tK4YmUwuHgSRTqzNjkv/H8ejvqeLQiuSUEGZN
	 CleBAjd3/4LTvz8zaqduKNZNzsFMSXZTFMXqT2hmMZ3CCnxyiu8EwdTiDb0AVk81b8
	 uUn3f8PFzlsHQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 60DC717E0E95;
	Thu, 20 Feb 2025 16:19:11 +0100 (CET)
Message-ID: <10d4c956-4f46-495e-b91f-adf69a1565ef@collabora.com>
Date: Thu, 20 Feb 2025 16:19:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: mediatek: mtk-socinfo: Add extra entry for
 MT8395AV/ZA Genio 1200
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250220-mtk-socinfo-genio-1200-evk-v1-1-a683ad028bc5@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250220-mtk-socinfo-genio-1200-evk-v1-1-a683ad028bc5@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_071913_894901_C0C317B7 
X-CRM114-Status: UNSURE (   6.38  )
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

Il 20/02/25 16:02, Louis-Alexis Eyraud ha scritto:
> The Mediatek Genio 1200 EVK P1V2 board has a different socinfo match
> for MT8395 SoC (commercial name Genio 1200), so add it the driver.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



