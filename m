Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8F6DC87FDA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 08:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=16vTn1aadnS1C+L41gbd2MsFhWdvbr7zwZ4GD8BmAII=; b=NAB6IC3alsDPi/tOFWgV/ZfyhV
	Oj/2dFQ7BZPrWsmetlafwpVoof+DDkknEXP5bbpU8+f8oojatYPhGghz9PmBUSRF7dK3QgauARrF6
	buCMizCc4ajzgoomZAEWzSkolXNFMzIbtYPsf2yhSUAxJUfAHBevz3+8ql6TAh02LtzlgtekvUqZO
	cwGJKEKmPGlxqvmSJXZ8FeqFwtFBso31ea4aJqCaCIEP3z9tTeC+6O5WR0/jTChVaK/9J8QJ2hGnX
	NwXPWXCCS6AoF0GMIffYQ1NaUY1F7f8T+LB/6VyMnNYete60ndQ1lLIcoGfjxXTUo8KBY5lIQV1Z/
	vF95UbpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiqb2-00000009x1H-0oIc;
	Mon, 04 Aug 2025 08:31:04 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiqC9-00000009tkU-3sQM;
	Mon, 04 Aug 2025 08:05:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754294720;
	bh=S+PqPv/59aRdZ+m3YatdQ4jD8LmxVEOwCVFI2KZi+lc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oBRfKqPU+GZqk6Re0ppKUER1MI815o2Fic1CxK3vW8YVkkmSAgZ/ZXn63bWRvwrlq
	 JRYjvgE/iKnmYe0QBdzOh3K/E5WvDS8FWhraEnEQkPmnZdJ/t0v3p84QHdC7IjV0rc
	 fr5/JEjQiJkOmMrPbY4MB63W5eHbY5NTZN0MjqjVnnN44HU8Bl8N3YV8rJrkLyTCkI
	 2q9fVa5YbTw2vaVGtoVLKGmHu6L9Z6TtagZ55lDirCqtZvIEBauyygKy5t5y2NRkvH
	 ++PNMp9+h9+2al1ksA796P2Ia/Mlr7/Hv/zPI0TC+6hftabJ/J3dzpbGiDtGz42ZmA
	 e3Jv8Jc//5BpQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 052CF17E0593;
	Mon,  4 Aug 2025 10:05:19 +0200 (CEST)
Message-ID: <9fa71ab9-cb25-4db3-b1df-2da6a292f246@collabora.com>
Date: Mon, 4 Aug 2025 10:05:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: mediatek: mt8395-nio-12l: add PMIC and
 GPIO keys support
To: Julien Massot <julien.massot@collabora.com>, kernel@collabora.com,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org
References: <20250801-radxa-nio-12-l-gpio-v1-0-d0840f85d2c8@collabora.com>
 <20250801-radxa-nio-12-l-gpio-v1-2-d0840f85d2c8@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250801-radxa-nio-12-l-gpio-v1-2-d0840f85d2c8@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_010522_122381_643223CC 
X-CRM114-Status: UNSURE (   8.11  )
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

Il 01/08/25 15:16, Julien Massot ha scritto:
> Add support for PMIC and GPIO keys on the Radxa NIO 12L board:
> Declare a gpio-keys node for the Volume Up button using GPIO106.
> Add the corresponding pin configuration in the pinctrl node.
> Add a mediatek,mt6359-keys subnode under the PMIC to handle the
> power and home buttons exposed by the MT6359.
> 
> Signed-off-by: Julien Massot <julien.massot@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



