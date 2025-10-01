Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6170CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 11:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xNr/jWgqfmSazXCL9X1SBSjsmyKknvXDl82SYxLMcyA=; b=uInJfscoJFq4rXEqsd1Mhhtpwl
	4KQM5lHaNjvsFU/93P/rfpZ6AawubVFYh2ji30hp9g86Aej1k7Aee1eD1aGeYBsbQsR0hAnjMHbrg
	BKTBn8Op5FKYIpRPsH8EPc8A3OCi7IKINjMSTQCxvX+qMc3Q/hS6zxJliNdulvr+0N5OXVqmQO2wc
	tWfcj5+m6qxvIiYLDafvpB+nYAQbGyUrAeNmUZF0bsOJQc2XaR6kFLhBgzc91ddQz95xPYVfah0GD
	k4919NbpZ9LqfECISIzguSzIJHrjVjVJg96HmeTtB/yHEgcyo0vNnu9XvqpN4WCX2v7Mo/55wBPbe
	Gx0oD/pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3v6G-00000007PI1-1chX;
	Wed, 01 Oct 2025 11:34:24 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3v6B-00000007PAC-3WMg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 11:34:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1759318458;
	bh=4ekgiOSsVeMhFoaUOo+lKCWR44dDBKV2EZ5bN48Q60w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gPr8JM0ruBY4wWi/iSWIIPvJoU2xO1lRiMTt+vNgbQ+1L7o9kbgAIq7E4xBFaUS/D
	 6QhaSisJf+XRrYGX/6zCstIWnoEB7+DjHMfP5xQYYmJcWWy2zLQ+7FPFwZcqTEsCO7
	 HLtZxf2QiQCpRprcpmkn0vWnj7VWj2DW/32r0y5TUOTj378rnup9DhHLZ0dHr4EW5P
	 iH1y3xaDf5OeHJ056UtGat/da7188J6Y/ZiJxtKBp0sRcPYInYmJ2qt+c6oKbyx3ol
	 RcswwCKOlnlAavYAZ8MQC5vJvs0wEp5Dm2sRO47pMbkk3TsKOD1YYtJF1byS5ZiP6w
	 D3E2rrTMA2ufw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C516917E120D;
	Wed,  1 Oct 2025 13:34:17 +0200 (CEST)
Message-ID: <ff5feacb-6393-42b8-9134-46e22991e7d9@collabora.com>
Date: Wed, 1 Oct 2025 13:34:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v5 01/13] spi: airoha: return an error for
 continuous mode dirmap creation cases
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Ray Liu <ray.liu@airoha.com>,
 Mark Brown <broonie@kernel.org>, Andy Shevchenko <andy@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Andreas Gnau <andreas.gnau@iopsys.eu>,
 Frieder Schrempf <frieder.schrempf@kontron.de>
References: <20250930022658.1485767-1-mikhail.kshevetskiy@iopsys.eu>
 <20250930022658.1485767-2-mikhail.kshevetskiy@iopsys.eu>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250930022658.1485767-2-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_043420_023693_2E773511 
X-CRM114-Status: UNSURE (   8.65  )
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

Il 30/09/25 04:26, Mikhail Kshevetskiy ha scritto:
> This driver can accelerate single page operations only, thus
> continuous reading mode should not be used.
> 
> Continuous reading will use sizes up to the size of one erase block.
> This size is much larger than the size of single flash page. Use this
> difference to identify continuous reading and return an error.
> 
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
> Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


