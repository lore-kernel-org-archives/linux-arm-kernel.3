Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 404E8C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 08:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qth+j747jBoq5VBoP8yma7YMe69CaY8iHA5fYyTB/Zc=; b=TCf/QrL7cBFc99YMViH8DWvH2F
	Vff3CgYn/jfwv33JoToSt3tS+oJR/Q6oFs/G7L5+61CgeqLjXSdpx0mcKAGs0OKF/Zv71M1E3cFnS
	EnsTaRoAXuq1h93iwFpPLtVUnrm53qijfGxu4iRVsASyuvGvVb4mItaXCYP0PG2bOwIuV+e/HQjxs
	iZzgBGmnwIRhTPbxRHVfeeZgl8wJb9/QpudytmEktjp+wsPYY9rGg9wrieB4lRKGFtEdsbyzU4Mj/
	aXEHIjOYsFik8CTblnfstzA8Tnc6HgT9NPFo8WhmJ4EfYgZ/FUtou/B5gDRakSVWW/aLojJXevY1m
	MFGAQ0AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjBiX-00000008Wzr-03rx;
	Mon, 13 Jul 2026 08:08:45 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjBiT-00000008Wy2-3Ep5;
	Mon, 13 Jul 2026 08:08:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783930119;
	bh=iMeBkq+BFehTOuRVhF7MS22BjrjNDLvRuZ8Ypb/TMeI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pXmO8CRaLIihv6hY/BZTjo7vZcXaY/tWdrZ/3b8oREJ8Gt9k1fggi+RXp6XoakMpL
	 qZbygS3xz1g4ueiqNIbnS3pF1Wc/JEr3wXGMeyjGzCj73TgAsdK2EhwSlCiciFnJRo
	 orR8QFit8rcCDOWFFsxzWxjotryLavtET+O24MdtEN5dQHxDy3yYQkQO2fP8RGJ6Cf
	 ZAz/m7rOCgYjMhNfaxandd45al7JH3FkRT/wJQXkz4NHGidAH4awQq6rwytkzrmtbv
	 UtlaTeKiz83H2eZW1tgCGwtXJ4BDi+0Ay5R5xQT8dJbwKqRXatXbR0m8pxrhCqcC3O
	 qU/4aIIVFCjmQ==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 975F617E00F6;
	Mon, 13 Jul 2026 10:08:38 +0200 (CEST)
Message-ID: <e28ceff1-a75e-4b51-bb79-1d92daa0cada@collabora.com>
Date: Mon, 13 Jul 2026 10:08:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: mediatek: mt6858: Add pinmux macro header
 file
To: nikolai.burov@jolla.com, Linus Walleij <linusw@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Nikolai Burov <nikolai.burov+review@abscue.de>
References: <20260710-mt6858-pinctrl-v1-0-f75ab558f0df@jolla.com>
 <20260710-mt6858-pinctrl-v1-3-f75ab558f0df@jolla.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260710-mt6858-pinctrl-v1-3-f75ab558f0df@jolla.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_010842_081322_8A69D579 
X-CRM114-Status: UNSURE (   6.52  )
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

On 7/10/26 17:00, Nikolai Burov via B4 Relay wrote:
> From: Nikolai Burov <nikolai.burov@jolla.com>
> 
> Add a header file providing macros needed for specifying MT6858 pin
> functions in device tree files.
> 
> Signed-off-by: Nikolai Burov <nikolai.burov@jolla.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---

