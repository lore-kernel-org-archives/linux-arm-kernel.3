Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4A26C02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 13:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z4oFHXHx29Qg7053vOUzsNdaD5NZqjXMjU19+Z9WIxw=; b=cyElLxXxeq65vig72VML0t+lQJ
	SQv804s+Jy6DWaumm4oznqTP1srEDA16RzytrKnJnCPn4qDEViYpdgBQEcNZxhmLnTrP3A+DgClU2
	pSOvaRcqPwafx2MsRGGRRF+auCYBCO/gQSg72YdSdJFi7ddRGLk2zjp34DWNxMuF1GMD2z+wMCOTG
	TZT4SXQZL+xZlR6Owm/tOfNaugJyQFg50N+yQYcFwTO2s1GGeNwLIwiqRbPV9PnhXKwp9KFbyZiN+
	rFlq4W43q18f7OPOKtslVRlGAq2oL19fCAUvpKw2WlHvWL64Ar+Vuck+/Q0DNG5cGIKq8MyAkBhvL
	9jtbpDew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tewEv-0000000FTxc-2MFL;
	Mon, 03 Feb 2025 13:11:49 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tewDH-0000000FTfD-2Con
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 13:10:09 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 622D3A0A06;
	Mon,  3 Feb 2025 14:09:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:content-transfer-encoding:content-type:content-type:date:from
	:from:in-reply-to:message-id:mime-version:references:reply-to
	:subject:subject:to:to; s=mail; bh=Z4oFHXHx29Qg7053vOUzsNdaD5NZq
	jXMjU19+Z9WIxw=; b=YlFNyO7YaQTlGuytcsi2Rwplw4nDKUNoBAx6JMxM3KfW6
	ABjHntaHoehXkdW+A9Ey155y1ZgHcy8ic1ur5PFI+BdxlX8OX00FQJokEWOspEWE
	RtsOVUm1tgayB3N44JZti4wAF3xyBpJQEHpF7El4SPQR+frJ/KhyHguBtbaj8jR8
	3lkeDy2QkBeW0O9JMR5biv8H09tPoIa1bH+E8wqBvc6K6/2OrGqKmJoyH4BAYOC+
	I2134J9ZTJ0Rc4kIQ/MPZhGlCEfrBRtwlMyVQGbKGTlPCBEgOPwOuNhEqX0paHl8
	gngerSOUZrhCcR0M2L0QOPyDyat4cz2tfZB5DB/9cycUEw/XnE42xoj5rdlFI5e8
	KRbmgzCxE2dqa+VIENJ3rhpmhgaNG1AJGtSPGxI7MyxLJVre+YSHUk/Vauoo+ji3
	eaereyKyLr70MZbektMbmGZLK4l44AB/y0hYfJOh+krWuGpPGkdqTBUWZDVK/Jgq
	REbJJZnkqNoCUljd3IqcBqDj6lKAJhVowMsaRLtSfY+j0y7Ek4nLJiO1NVu4frtL
	lBpiqYal7w6OhCqjPvzcv5bDPdUL0++phhhxD5P0w7JOChGml/Ep+oMcfLGGDEA1
	AJJ77bcpYN7CA8ZXLRNGMQzNtMkKs/nU3BdjvmoHQIBbCa7oTX/+9fQbyRlLo0=
Message-ID: <9354a990-b4ef-4ca1-8666-6c5905eaf86d@prolan.hu>
Date: Mon, 3 Feb 2025 14:09:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dma: Add devm_dma_request_chan()
To: <dmaengine@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Mark Brown
	<broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>, "Rafael J . Wysocki"
	<rafael@kernel.org>, <linux-spi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-pm@vger.kernel.org>
References: <20250124085221.766303-4-csokas.bence@prolan.hu>
 <20250124085221.766303-8-csokas.bence@prolan.hu>
 <20250203-chalice-ninth-8235590e29d2@thorsis.com>
Content-Language: en-US
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
In-Reply-To: <20250203-chalice-ninth-8235590e29d2@thorsis.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.254.7.14]
X-ClientProxiedBy: ATLAS.intranet.prolan.hu (10.254.0.229) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94852667066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_051008_033936_80D08918 
X-CRM114-Status: UNSURE (   6.57  )
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

Hi,

On 2025. 02. 03. 13:27, Alexander Dahl wrote:
>> +	if (!IS_ERR(chan))
>> +		ret = devm_add_action_or_reset(dev, dmaenginem_release_channel, chan);
> 
> Why not using dma_release_channel() directly here?  What's the point
> of introducing dmaenginem_release_channel() further above?

I followed the existing practice, used by 
`dmaenginem_async_device_unregister()`. I suspect it was done like this 
because the devm callback function's signature takes a `void *` and not 
`struct dma_chan *`.

Bence


