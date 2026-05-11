Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B72BCD37B7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 09:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ko0NwR71GgFyfW69qBRPgs5J8yt8QR8psEck4gkr/vA=; b=MrUvmrtSP/4K+zuNSsWwbU8iBi
	3IXz2snI/GNbVmOjyJnXgo30yhL8ha5Kic/BdUaeMzPpp7l9r/oNLIHvZQ2aZlHmDb6So8h3CdQ4/
	y/OKIdJYnRJtoZAXz1mv9sDDZeNiA/gbRvCxFhtp5QJ+5wnJooKT3ykpXrp+b/D46b/r1+iXdMpZM
	6KrEq2E3MvBkIx1pITy5vW3gImjFdQ7Izd37DAH5QC3LR3VW/s9gtgB4TaMaHGDKj9AZL2wn73q6n
	MjOhJcuDZwi+8dUQeXhzjaOfUhGLEK7bKTgF0ie9Owj7nJ05QYERTsHoRZSXtaaFxvh4R5iXnZzyp
	eMO9kV7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMMtN-0000000CuoX-0k2g;
	Mon, 11 May 2026 09:25:37 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMMtI-0000000Cukt-3LKo;
	Mon, 11 May 2026 09:25:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1778491529;
	bh=8PIQl5kfuVwdt+Cq8giu426qIR0fILebOJgQCKdgTVQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iqv1Ihmq5waow1+PsNta2unPX8dsTUvNCl4sbOSxHj1t0IJt2Mz1hIVxuSdJHqoGC
	 KM9DC1j9TqXzCJa8Z75IhkacpuA1x9kzXaoLvkS4Absp07V6naYUfJDeuz2tSECxsp
	 ha2lHQb9naIgbtuGvIwV7MyuvTpXkjg/yLt1NmFTOQ78iJ6QVMiT/7rg1IDRApRUsu
	 WGWpepR7HBy4zJswqhHyLxT3WH11Kz1xhDKhq8DOidR0MFh5srquI+U+u5/hxXXxrW
	 UV5VcFjRQ0K8g9879OMZsytWxfZX7yQgWL5j6TxD4+CMrBOMPBggiSfHC83Lfehgli
	 FIirnlbJVY+vA==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1A17D17E138B;
	Mon, 11 May 2026 11:25:28 +0200 (CEST)
Message-ID: <b3a07a46-ea7b-48f3-b7d3-0ec7f644a2df@collabora.com>
Date: Mon, 11 May 2026 11:25:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] dt-bindings: mfd: mediatek: mt6397: Add MT6365 PMIC
 support
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Chen Zhong <chen.zhong@mediatek.com>, Jonathan Cameron <jic23@kernel.org>,
 David Lechner <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>
Cc: kernel@collabora.com, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-input@vger.kernel.org, linux-iio@vger.kernel.org
References: <20260429-mediatek-genio-mt6365-cleanup-v1-0-6f43838be92f@collabora.com>
 <20260429-mediatek-genio-mt6365-cleanup-v1-2-6f43838be92f@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260429-mediatek-genio-mt6365-cleanup-v1-2-6f43838be92f@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_022533_009407_60643C20 
X-CRM114-Status: UNSURE (   6.03  )
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

On 4/29/26 11:44, Louis-Alexis Eyraud wrote:
> MT6365 PMIC is compatible with MT6359, so add the compatible strings
> for the main and sub devices (regulator, rtc, audio codec).
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


