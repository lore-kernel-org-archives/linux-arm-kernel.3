Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 811F5C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 08:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UNw8lfYw5CguAxe9kCqcELMNep8+0JFXvI1hEyLHAB8=; b=nF1VyWQ2ZWWMUPC5PD5MO1333U
	UOugnY5Qy+3b/eUvrr35UYuFu4OQnSRyMojghrKpps31OV4c88J4HxRYiW7/1vEe9FIu8AOtlAA0m
	RKW0MyJrkf14hU+FU32lfl28yeVWQUpQjYrW5ESa4cGz1GZwW44L1cXgL4QOVxr/WkdbOU7/s/w6l
	27qDqP0DntkpWvdV5ggqT4J6F1JGokUCJxyWxEzl2SlcOgUcEjoX+e+T1EGGXRhwF7ZX/2zWAyGC2
	hkR+dhIHDdgro3ctVR/l9GrqQpeb3MOtXvjHNJXJSzfSTICiq8Xz2FtPHkGsCUklT66m2ZJXgDPS3
	AwKQqAhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTciZ-000000021pZ-0z2B;
	Mon, 23 Jun 2025 08:39:55 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTcdw-0000000213C-1npc;
	Mon, 23 Jun 2025 08:35:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750667706;
	bh=VwC3o9nmLlXzHPPAlg+0xEd8Tk3pdHX/MZbDjVfbK0s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mQwacOW5Xf3+d5X4mSOolPyXeTp1VB9Cn3VbSe56iQGOptXa10E1mCqWOkBCJFQ7n
	 pqnkatAeUqWjibQaNvImQAVQeZYI39TNn7P67R2U12rMCXqbxZmcRTJ/x7c/oqR49H
	 iQcME9hdrlytJS9HxWY8Im6i/YkwjCEc8ZvfIka0Anj7Y9LbFuLn7rJ8nZCT/eseth
	 LOlvizUvDUi8I0SOqcf6GGpWEF7LG1Q6QbBh46otgb2y6JeINt28FR3OHK1XDikY+M
	 Z43QNllIK4VyjyCf5BLf0SVjXoffcVdx2PAAhsEcFCCzyiz7wG8z3d39WI3SgnYOrr
	 Fj3ZGuajHppHQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3237917E090D;
	Mon, 23 Jun 2025 10:35:05 +0200 (CEST)
Message-ID: <d7c4404b-0a29-494e-9432-352a80934270@collabora.com>
Date: Mon, 23 Jun 2025 10:35:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/11] dt-bindings: watchdog: mediatek,mtk-wdt: add MT6572
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
 linux-mediatek@lists.infradead.org, linux-watchdog@vger.kernel.org
References: <20250620-mt6572-v1-0-e2d47820f042@proton.me>
 <20250620-mt6572-v1-4-e2d47820f042@proton.me>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250620-mt6572-v1-4-e2d47820f042@proton.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_013508_632155_2F4B7D1F 
X-CRM114-Status: UNSURE (   6.48  )
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

Il 20/06/25 17:40, Max Shevchenko via B4 Relay ha scritto:
> From: Max Shevchenko <wctrl@proton.me>
> 
> Add a compatible string for watchdog on the MT6572 SoC.
> 
> Signed-off-by: Max Shevchenko <wctrl@proton.me>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



