Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93C43CF857C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 10:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9gf45mYfaRlXXpu2SC8VCbJBju2iVk2OljDQ3cQcbL4=; b=YM6OtrAXxwgwjqMnU7H00SYo1m
	lUEXbRuoRQxtB2NONHNZvo0qVnMZy4OtoflXgCK4WEJhcF0O8D/JkpPbUlislLZR65iAQH7mDvuZ+
	Bmz0BQsF14dRSSiAXtbUiVVj1zi86Xx3QLmARwn04yxgQqjfBSMJP/rNz0WcFNAscPCaJ4OVOVXc4
	lIYwr4XXf6W6VV9yxirakR3vb1HdyGT3z6/72vId7SYkeN6h0DRYyE+9ti77P2YhgzygSZgcEqDS/
	fs4OO7BrkjibeiLdlbT+7gE8oVDmmn4l7KfOjQJJblR/vLzK/DvfewYoQKANIBVbEuHXCl+L//JEc
	eWO1G0sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM1jU-00000006UyG-27bA;
	Thu, 20 Nov 2025 10:17:44 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM1jR-00000006UxB-37mN;
	Thu, 20 Nov 2025 10:17:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1763633857;
	bh=oj3XXa4I6VaWw2BCv50Gz8e0+tE79Q6lQpDSY4nSM5Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=U9FGjQGUwWioE5NB9i9posewenwjNK4FZ5Mu9/mNuWXlRKzgqes2ELoDnW/EhfUE5
	 RdP8DsB2Yn86UnI1qjLSWfZipqfgORbNt08nbGjPCJg2KhLcTA6B6+vWXDQn58aZ3O
	 fTvRT+yaUX95valvaxU1vbcXPZbyYMfpKbgOdNUSLfdlVOQS0jXgUWREX8VcDFxI3T
	 PJbRwA8MzcZVnzynZairjtvr2YWRWPM05EuDiC/8BZ3BfSrBKh0/GVbz0rj9B5vu9e
	 USNly/whU5958/E/Q8Ushx0gBPGyVoYlkmPvpwPRXTvHR9utL3PH0Vq+GcDAMhG1Li
	 ZHj5TnFFqIMIw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C1D1217E0CA1;
	Thu, 20 Nov 2025 11:17:36 +0100 (CET)
Message-ID: <18d49588-2c1e-4546-a258-7b063ac64b36@collabora.com>
Date: Thu, 20 Nov 2025 11:17:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] dt-bindings: spi: airoha: add compatible for
 EN7523
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Ray Liu <ray.liu@airoha.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Cc: Andreas Gnau <andreas.gnau@iopsys.eu>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20251120042753.640492-1-mikhail.kshevetskiy@iopsys.eu>
 <20251120042753.640492-3-mikhail.kshevetskiy@iopsys.eu>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251120042753.640492-3-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_021741_953710_E46F62B5 
X-CRM114-Status: UNSURE (   5.63  )
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

Il 20/11/25 05:27, Mikhail Kshevetskiy ha scritto:
> Add dt-bindings documentation of SPI NAND controller
> for Airoha EN7523 SoC platform.
> 
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



