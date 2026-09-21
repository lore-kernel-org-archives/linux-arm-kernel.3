Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02220C982E1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 10:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W9+XC8xNZLM4/e2/e890m0kUZdEbrymiobkoh/RIakg=; b=wUrt/tI8VtMV3QgNi7F6Rf1P/L
	8Mtk3QKbodXxqX0Mx4GbJqDsCgUxJlItcT772PLJHmGXB6j2kdGerS+hvryTnvkSocNS8VXg+T/83
	Xj/DIuKIQLqcxjzc2dGFRwTb55IjzqTciK5jN4yZMz6P1CmQ3FG/e04ndNzsDAexPcarBzr+J9g7O
	VZ40ocSn3zbU1Iikygxr5+KZ+jcu0dwIfaSGF4yQ1tc6p8KEAJKr6rjT+e9E4H2f7o5o+EMDOXoRr
	8xtzZLivg7S1yYoV7SqYKfKPKFqLNUJeJjcsn0sjoYqlNN5DQ7xNvgCgkpfKU//Nn8Vv5/XvMigfp
	f+GOcWWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8bP4-00000001igI-3TzD;
	Mon, 21 Sep 2026 10:37:42 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8bP0-00000001if5-0lGh;
	Mon, 21 Sep 2026 10:37:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789987055;
	bh=nJ25MVo0NGw9oiXZTAgE6pclgPjvVnOwEl7ePi56428=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=H+ekNY7fV7oFE4VG7Txu3BCjGpCaDF/UZ7SxcomhIY1K16HQz9T9VNqF+n9UMZ7TY
	 /Iq5+9schdw8mgrT1S9yhJrqklfjSdeps+b40cmQ+UuYwv4LMnTfjde6fhxg52Ww99
	 uTD1SJOfkQHFOgY92A2DoMc9BRmDf4Obz49LAuXnO8j8pOoSpuFQOZk5sG0tH9NhU4
	 hBD1wRi8pPkIPb0GlitTHFx9qYfRlVi+skTqy4NuFEucGje8T9ZazsxuOrR3dtDFCr
	 CztICHoZ73lrai30xkbcGAU3uChsT8SrKRIVo1B55/K1HqjQVDm3/uLT4Scwr09xHt
	 NLHOdtxW5KAIA==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0CF9817E020C;
	Mon, 21 Sep 2026 12:37:35 +0200 (CEST)
Message-ID: <2d9a1df3-6cdf-4d82-b2c8-907964711104@collabora.com>
Date: Mon, 21 Sep 2026 12:37:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] rtc: mt6397: expose the spare bytes of the alarm
 registers as nvmem
To: Ryan Brue <ryanbrue.dev@gmail.com>, Sen Chu <sen.chu@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>,
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Eddie Huang <eddie.huang@mediatek.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-pm@vger.kernel.org, mfd@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-rtc@vger.kernel.org
References: <20260917-rbrue-suez-upstreaming-mt6397-rtc-nvmem-v1-0-558b8f95cfbc@gmail.com>
 <20260917-rbrue-suez-upstreaming-mt6397-rtc-nvmem-v1-2-558b8f95cfbc@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260917-rbrue-suez-upstreaming-mt6397-rtc-nvmem-v1-2-558b8f95cfbc@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_033739_770534_C54049D0 
X-CRM114-Status: GOOD (  16.19  )
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

On 9/18/26 06:57, Ryan Brue wrote:
> Each alarm field lives in the low bits of its register and the driver
> masks its writes accordingly, so the high byte of four of them is storage
> the RTC never touches. MediaTek names these RTC_NEW_SPARE0 to
> RTC_NEW_SPARE3 and gives the first to a fuel gauge, which is how its PMIC
> battery drivers carry a state of charge over a reboot.
> 
> Offer all four as a battery-backed nvmem provider, so that a consumer does
> not have to reach into this block behind the driver's back. Doing it here
> is what makes it safe: a write lands under the same lock the alarm paths
> take, so it can neither be lost inside mtk_rtc_set_alarm()'s
> read-modify-write nor fire the write trigger in the middle of one.
> 
> The nvmem core does not range check a cell against the provider size, so
> the callbacks check the offset themselves.
> 
> Tested on an MT6397; MediaTek's spare map for mt6323 matches, and the
> alarm field masks are common to every compatible this driver binds.
> 
> Assisted-by: LLM
> Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


