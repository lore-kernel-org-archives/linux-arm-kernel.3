Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4449BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 11:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9meEpFul2zTVt7w1Px+sUe1v1uUmskX3j+X0HA3AglU=; b=mu0TVfZ3TOnM7tMD75w1pgq4GR
	FE6xjBK6T5VdvKoQV5LiEU98uC44c8ELdO0MnYhk9G8MYb0Gz9hJ10NXQuct6Gyv2m7/cgXDVKtRm
	5HyVKEUq41ihkNlqQNe7Mz/bDh+bhGyF4ec1HIPpjsnWWRMj9k38pX1KPnhSTdjlZ6DHsc+FcF7EX
	8jAwNRWhNR+b7+5dqDn4jqWEBh7uIgn1ZKfKA18Fl8kDnUavwBfrMp3UnJAW3GPkK0VTcjwngbr5E
	HMwm0DOfPypV/jdKfGaQ8u+PvFXL5+qm1z2W7k4Ryonnh49md9uiqeC+XZk0/SMtSKOYoiKGmnTxJ
	QV1oqcFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whn0r-00000002DIT-0SUu;
	Thu, 09 Jul 2026 11:33:53 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whn0o-00000002DGr-2BCu;
	Thu, 09 Jul 2026 11:33:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783596827;
	bh=2thS+JuQWS1aHyOnhwwCjgcgqnGH2cFOBsnA4gBpAxI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FQpMwqAdRIn3M0kP6/OlbiLzjT0si4zJbqCPojCKm6ZSeftfVNy88DMWBPStVuMf1
	 G53rubUvC78GfVJTwajO0SwFxVeyHIZtXWJwd170pPBi6oPvfRRFF0u3NsXOq/6roy
	 KwUfmbktZibJ0la8/V2E1ev0x0R8h4oMmDoRVHiXtwzDLYIgecsHWMSupBpNVZ3975
	 145ng3SJPo4HJPXr2PoyPVykbDENKpUHmX5bSAZDChYW05n9xZySGrvPv8Caq5YAuP
	 u8kXXOwhgRou0GjEup1OXYtpARqme7HT3H8i8YxOfWUK7C1tYpKa6TYzvoCqVU/WIm
	 jZulT9VDU7KKg==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id ED4F717E079B;
	Thu, 09 Jul 2026 13:33:46 +0200 (CEST)
Message-ID: <f2d5801c-1d12-4a61-ac23-aa24dfd0ee5c@collabora.com>
Date: Thu, 9 Jul 2026 13:33:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/4] AUXADC driver for the MediaTek mt6323 PMIC
To: rva333@protonmail.com, Jonathan Cameron <jic23@kernel.org>,
 David Lechner <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Lee Jones <lee@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Ben Grisdale <bengris32@protonmail.ch>,
 Conor Dooley <conor.dooley@microchip.com>,
 Andy Shevchenko <andriy.shevchenko@intel.com>
References: <20260709-mt6323-adc-v5-0-d11b8332a735@protonmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260709-mt6323-adc-v5-0-d11b8332a735@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_043350_714675_B9EBC429 
X-CRM114-Status: UNSURE (   8.66  )
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

On 7/9/26 12:52, Roman Vivchar via B4 Relay wrote:
> This series adds support for the 15-bit AUXADC hardware block found on
> the MediaTek mt6323 PMIC.
> 
> The previous version of the series for all AUXADC, EFUSE and thermal
> drivers was split after Krzysztof's comment [1].
> 
> Tested on the MediaTek mt6572 and mt8163 SoCs (Ben), both paired with a
> mt6323.
> 
> [1]: https://lore.kernel.org/linux-mediatek/20260504-mt6323-v1-0-799b58b355ff@protonmail.com/T/#med30fad67a090be35f549231336b2dec295233f6
> 
> Tested-by: Ben Grisdale <bengris32@protonmail.ch> # Amazon Echo Dot (2nd Generation)
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>

Whole series is

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Cheers,
Angelo

