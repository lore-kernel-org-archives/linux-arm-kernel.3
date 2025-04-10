Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D32DC369A6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 11:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X+6oOFbL97PVhu+3roS8xR1S38jqeKi1omG0NadMlHo=; b=tcztK+A2qqZnhdMNSXMReaA4Wr
	tm002ho9oLdKjjrGNAiVkwFwL64IpEd4aSUVBFtk5835mkSvv7bn9sZEqWK6KggzdbMk7qjuWzGI5
	tfhXE6upKDGqR1cGGJNH9dTWMdC16lDHrwLCvmW9/ZC+UwhdTnkerdTWZpVti7j70Y5GxQaI/LxA1
	nM4fAISkezi2y0HwIQb/05XevUs3N9kzF+MFnoIQATjgbrFyDU/8KdG+0Z4qelV+ThIidi5M3pvH+
	ip84IwMEoGcvSy3b6Oc/7TeFRrVX//tn0qJJTX0NI13Qj29me2BnRIIuwxnmQfuQPUEYSC036kFG3
	BbdBuRsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2psl-0000000AB1b-2yp4;
	Thu, 10 Apr 2025 11:15:43 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2mXG-00000009bYD-3tWy;
	Thu, 10 Apr 2025 07:41:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744270876;
	bh=3IfBQopd+IoX5ie8Gxg6Qto+l9rvuKK7VsSNYjenPVA=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=EM6WTXBVfEYoJNmePpaZYrZ3vcMu47q46T6ArViFMYcz63b119GUaJSGSFAEdEc9o
	 hRK+m0ROmvDIU7uR0rRoDWXaxl6pcdfThEGNQOxEzqsD0Wytw2oz0PxbcfOAzOOd14
	 LAJdKTf7fjrQDkJaaPoc6E8OlDuJcKj8UpvnKEfrim4guhAj5/c1yRuLQ5vRzLC+V9
	 0atHJVVa9x1ERppvZErxuZRjJiScUesuEe6dE9nKx+2Krq8rOd5ubwrQK3jzhf70xp
	 47NsaraJllSDi6ICdB69AbXnRYzdNMZn4lS1A7BbyuXEAn0o1UVwwg8AQLCBcbm8/6
	 mNlGMiKNEafnQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AE33C17E0402;
	Thu, 10 Apr 2025 09:41:15 +0200 (CEST)
Message-ID: <b96286ff-f232-4ca7-94b2-8b7b671edc62@collabora.com>
Date: Thu, 10 Apr 2025 09:41:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: mediatek: Drop unrelated nodes
 from DTS example
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Andy Teng <andy.teng@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250324125105.81774-1-krzysztof.kozlowski@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250324125105.81774-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_004119_119299_36C449A2 
X-CRM114-Status: UNSURE (   5.21  )
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

Il 24/03/25 13:51, Krzysztof Kozlowski ha scritto:
> Binding example should not contain other nodes, e.g. consumers of
> pinctrl of, because this is completely redundant and adds unnecessary
> bloat.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



