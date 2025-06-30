Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2852C83000
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 07:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vkm7ndSyWEiHKhQCrUp4v+h+OKVyKKcagg7tWrQNG9g=; b=QKfTcyLcyZGaZ1gO6RvmkbjFqX
	6RoY6HOHkeyM8NrPGVOWkeENulppzVm+M1WNfZDsFQn3GfJ4ua3jUDxxHgFOTa+XnJq1wAKViWjA/
	ryFUm44js9nyQnP3Vsh1vI92RJC27p6lX2A/m2HNLXBBcNLXlsxqlydFYnaqCyMYnwy/jwgcWa/Vo
	ZIfjXw0CKRUkw9x1FA+yqSmE1EqGGXkKZMJ/9vnMI7BxBPrnnO/85bbC5TuH2mgVTU00gMpO5VYlH
	fELc0kB2i40KSrMKE1HmN5Ec2wy+RMUTiXiQZK4GtgkN2BCVbSpaQLBLy3Y5WWWjKcWKDt1ObKI9K
	FS7/4Xyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW9Db-00000001UaD-3Yqe;
	Mon, 30 Jun 2025 07:46:23 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW97W-00000001Tam-11kS;
	Mon, 30 Jun 2025 07:40:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751269204;
	bh=iH1qk3TEX8/F3Emk7ZAE9XR+BHZMvxK9JDSs6Kw85jc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gr5NT1if6XlCE2qsdH9o0xepxlYgTTZ4D/QniOhC0dV3fBtRw2Z2dgnCV+3z1DPeK
	 AnyCSJ0TME+k1kBS6+GBAtc0LhBcpvltE2znV2MYcbk5t7KO5evyGZ/Ur5OkJH8Ou9
	 Kn/ciSR8yQUnQAPVDNqgckO2/YdiYNVQSODq/DU4gGCXkNl9u+f9Iib5XPF9KlKQAY
	 5JXxy/yZZk0M//UtjclBY8vlpg26YjMXnZ7mp0fNKRmOgrNVQrdjuZrtxTE2vrR57i
	 p4JJFRlKQ8CoUc5814rgVPAPjtZuw61FmRSRLMYv//7Ncxr/tFpaVTFIuV/0OaBRza
	 1T4CORk31jDRw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A9D0817E0657;
	Mon, 30 Jun 2025 09:40:03 +0200 (CEST)
Message-ID: <5177a9cd-7ba1-4697-89a1-1ecae7b0a28a@collabora.com>
Date: Mon, 30 Jun 2025 09:40:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/11] dt-bindings: serial: mediatek,uart: add MT6572
To: wctrl@proton.me, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Sean Wang <sean.wang@mediatek.com>,
 Russell King <linux@armlinux.org.uk>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-watchdog@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250626-mt6572-v2-0-f7f842196986@proton.me>
 <20250626-mt6572-v2-1-f7f842196986@proton.me>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250626-mt6572-v2-1-f7f842196986@proton.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_004006_435398_8A9B11DC 
X-CRM114-Status: UNSURE (   6.89  )
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

Il 26/06/25 10:53, Max Shevchenko via B4 Relay ha scritto:
> From: Max Shevchenko <wctrl@proton.me>
> 
> Add a compatible string for serial on the MT6572 SoC.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Max Shevchenko <wctrl@proton.me>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



