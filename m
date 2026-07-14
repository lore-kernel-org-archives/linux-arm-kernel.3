Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BECE0C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 08:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NKAwPN8QoyYVPc1mqDXv8X9IJQl60p9JrQkdmKBvfok=; b=etzwRDdhewQGWmeVDWtCXy9fJJ
	7lp5Ldk/jcV/D5j+hZIr8zornz9rxkAZAmENHgzIUVfRwXfPysz0nzpPNqawDnw+5C0seShEBPGAW
	VNOyY3i+Lt8ePBZv1Jsr6uiwiKShAclyr7T9XaufxPW9pwiZj/0ajKnT4Qd0cFz+DBR3dfpsZ/Tmn
	g1Edkj3x5Hbv7gmdnEJF7godT/EKBd2c3kJj1XPIOM0hBYvcnoQRsaLXVixutq5NJPIRyQ3hJHQgA
	BtzrzwdBxmDtWdNMsoGdUFr+uF8jf2svzwldfM7is5FE0+EeiAbqGreUBlPEZ5sAw9bPY8EpeUK+z
	r63no97A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjYQl-0000000BIN2-3hP9;
	Tue, 14 Jul 2026 08:23:55 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjYQi-0000000BIM2-2MN1;
	Tue, 14 Jul 2026 08:23:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784017429;
	bh=oFRTq4b5voEJqxJgna9sANZNAoovJN0WoH/xes8V0Kc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=St5oIaUhZcFpc4P3NLXsjrMgq49P8PiKUtjQ7t6YdtDl4YkxNBA/Dd/QIKZM5DLoj
	 1ABY+6QaJP3jupVTbAwDTNulrDya9AKCJBDkBQOZRhUZMae0bJ74ftxF5N4RDI9ySG
	 EHzW+gwDxJVFrrclWEFuAl5Iw1tCdJuo6vl7G55WGP8nYfegFGpy43yWww7onOdIQd
	 9tMj4mk7CzkwKyOPbp2T9KhhPz5hs058cU9yRvQbADigZnWfz5OOacqWHKdLLu+xli
	 /y8KwgPBV62Cd3leuq3iQYY2oNuB0hcE9d4kuwrREQGjHgpMUmIG+RZiNaI7TeOv0E
	 cyk/GjYqDxejA==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A354F17E010F;
	Tue, 14 Jul 2026 10:23:48 +0200 (CEST)
Message-ID: <0cd526b9-aff5-40e6-b209-750f83fa0fd0@collabora.com>
Date: Tue, 14 Jul 2026 10:23:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] pinctrl: mediatek: Add MT6858 support
To: nikolai.burov@jolla.com, Linus Walleij <linusw@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Nikolai Burov <nikolai.burov+review@abscue.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260713-mt6858-pinctrl-v2-0-1bd072e3206c@jolla.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260713-mt6858-pinctrl-v2-0-1bd072e3206c@jolla.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_012352_768829_E0BE8FB7 
X-CRM114-Status: GOOD (  14.19  )
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

On 7/13/26 17:06, Nikolai Burov via B4 Relay wrote:
> Add support for GPIO and pin configuration on the MT6858 (MediaTek
> Dimensity 7100) SoC.
> 
> Signed-off-by: Nikolai Burov <nikolai.burov@jolla.com>

Whole series is

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Cheers,
Angelo

> ---
> Changes in v2:
> - dt-bindings: Change reg-names and descriptions as suggested by Angelo
> - Remove incorrect slew rate field from register table
> - Fix hole in the EINT table by including pins without EINT support
> - Add missing pm_sleep_ptr() and /* sentinel */ comment
> - Link to v1: https://patch.msgid.link/20260710-mt6858-pinctrl-v1-0-f75ab558f0df@jolla.com
> 
> To: Linus Walleij <linusw@kernel.org>
> To: Rob Herring <robh@kernel.org>

-- 
AngeloGioacchino Del Regno
Senior Software Engineer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
Registered in England & Wales, no. 5513718
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Matthias Brugger <matthias.bgg@gmail.com>
> To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> To: Nikolai Burov <nikolai.burov@jolla.com>
> To: Sean Wang <sean.wang@kernel.org>
> Cc: linux-gpio@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-mediatek@lists.infradead.org
> 
> ---
> Nikolai Burov (3):
>        dt-bindings: pinctrl: mediatek: Add MT6858
>        pinctrl: mediatek: Add driver for MT6858
>        arm64: dts: mediatek: mt6858: Add pinmux macro header file
> 
>   .../bindings/pinctrl/mediatek,mt6858-pinctrl.yaml  |  190 ++
>   arch/arm64/boot/dts/mediatek/mt6858-pinfunc.h      | 1335 +++++++++++
>   drivers/pinctrl/mediatek/Kconfig                   |   10 +
>   drivers/pinctrl/mediatek/Makefile                  |    1 +
>   drivers/pinctrl/mediatek/pinctrl-mt6858.c          | 1407 ++++++++++++
>   drivers/pinctrl/mediatek/pinctrl-mtk-mt6858.h      | 2378 ++++++++++++++++++++
>   6 files changed, 5321 insertions(+)
> ---
> base-commit: bee763d5f341b99cf472afeb508d4988f62a6ca1
> change-id: 20260708-mt6858-pinctrl-917ad9097023
> 
> Best regards,
> --
> Nikolai Burov <nikolai.burov@jolla.com>
> 
> 

