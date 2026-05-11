Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10DF0CD37B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 09:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jx2/+k5Wa8zS0wl5jDt5pX7ToqvNsurkfM6xiapOE0k=; b=Q4MDpCXU+HQiQagUmwfDWItblK
	1rmAIESQ4c9utitYTUlh2tJu27oXp1nt/8v9/85kMcWZNh5FOvvIMAaHHT4r11qdShY28EfqFeP/f
	K+RkZJILo9DrHEeLi58Fw3Km/a1xBWeB45Do/HZqHNJLG8nRZJ5PIURAyB6u7azC7v8SyUFlpFH7C
	8ne7sFP05L3tjwUVFtQZgt2+KgWJ1rsmmrHgkQgvc3KSFbZoifZTl7cmvzj7dQGyZlEyq+rV/HGW0
	/4UzV6HR8tZnTEJvVkz7Zh1EkUlAD8lbIZ0khrIGKLrp3XrQC6l6j8EiI/BlWxJLfPC68wDmItXAS
	1l9I9sAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMMtI-0000000Cul0-09ln;
	Mon, 11 May 2026 09:25:32 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMMtF-0000000Cujk-3BUy;
	Mon, 11 May 2026 09:25:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1778491527;
	bh=pO/xrPSg65FYo/gA2pRRqpmuvg9jN8z+/J7WeN3Kn6E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LrM0grUDkRHlaY9gpXL0GF6fUb9FprNGIxJP6Lp6kB4aDWgC89gHTprnaKvxgyaLm
	 RBdWrpd7te9oxavQobVegnCxs3IV37LX9n8wVZ57j0u99Hq7XmFFkvWBjHPRjz/7iZ
	 9tr9inuglXvvcBy66acZN4y5XoX2RTkRbPyhfxIMRmJg5T20NCgAfLeWaMfWZs0TBD
	 IERHmfvvZLvQhui3laF7/hDxqn8erZ4teqxCh/cET1H6OBKzum0DjbWvZw9fYTgj5m
	 HdGBHB5ZVG0pkNV0pJtSgWcq12e5fn1r0DokGNP/gShjBFJw6qFS+/179xfUPq9tWR
	 ml9uqndWWb93g==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B6C7517E12E5;
	Mon, 11 May 2026 11:25:26 +0200 (CEST)
Message-ID: <d8aa4ab1-74c4-45b6-a60e-9ecce5d5e3c7@collabora.com>
Date: Mon, 11 May 2026 11:25:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/9] dt-bindings: iio: adc: mt6359: Add MT6365 PMIC AuxADC
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
 <20260429-mediatek-genio-mt6365-cleanup-v1-4-6f43838be92f@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260429-mediatek-genio-mt6365-cleanup-v1-4-6f43838be92f@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_022529_947646_73919B1B 
X-CRM114-Status: UNSURE (   7.00  )
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
> Add compatible string for the AuxADC block found on the MT6365 PMIC,
> that is compatible with the one found in MT6359.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



