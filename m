Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D42EDCAC594
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 07:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GSJnG+mOn4oUqsdk4wAC+cv3DmsbKH7N5G5wpl73Prc=; b=h+NmK4TLwk/60X835GAj68z7TC
	+7cHtnwWDegZc8x7k1dYt+7UKdw8CXft4P4+bhHp7i4JN+dYvaZO0rKJ9SS99lwxHRwGnT5S/92iB
	yA8Qn7TZIp9Q/goZLhP0bVUOA5ivm3jdTDtcOMUOUEx4NV2lefc904N+szfy1cP1+up83hkUTv6OC
	3k0tROUw7Yc/c7i3ih4pqTdIR/DtpdbF5aT5pfcoLS2Wm1TfWPk9Mh+RKQLXjKzwrlRYW4Hipflmr
	rB/bnhMqXAZM2r1DJybGFH2SkzTbhaDY46xcgLSBtqg/CNNYnwgjP902jm5yg+TcGeJ1RXCQdNky8
	rbJRb+Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy3ch-000000033Ab-1k7G;
	Mon, 15 Sep 2025 07:27:39 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy3ce-00000003395-21v6;
	Mon, 15 Sep 2025 07:27:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1757921253;
	bh=M9uRHBVQjbcQZwFaS3SR7Cc0Lfk9UitjiDDfq0gdR4o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qCkLz9h6x77R1URoPthisXQeCpycq4VF8ofNdhfw/bTD5AyyAMz4JQTkXuIMfH6D3
	 CIEgArtS1E9nb24BeMtukQnXG0JEa+ce1MF5b/K1bKXZrXNVw6iLGjITKA75CDWOPi
	 715+SWZwIAoZ7p4BUPzJQtOIr5lK6/OlQMTS84EWs2uhfMIMsA28bcBfyxPbzeLvJ5
	 oL1S9uT8LdUTdWWd03u4RQWl7YaS4OqMtTQa/84ooNBZKJRYNwstCkNR85GCXCV5JI
	 +9/sxNqUyjMaTWZL+99exOF6h5iuJI2U9ARuw+aVkRx08V1/Dg+UOeKql+ui+mdltN
	 0CmM0i7PkoywQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E415E17E0AC3;
	Mon, 15 Sep 2025 09:27:32 +0200 (CEST)
Message-ID: <1186197a-8c72-4055-9096-79b469055b1e@collabora.com>
Date: Mon, 15 Sep 2025 09:27:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] pinctrl: mediatek: Add support for MT6878 pinctrl
To: Igor Belwon <igor.belwon@mentallysanemainliners.org>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250914-mt6878-pinctrl-support-v2-0-254731aa3fc2@mentallysanemainliners.org>
 <20250914-mt6878-pinctrl-support-v2-3-254731aa3fc2@mentallysanemainliners.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250914-mt6878-pinctrl-support-v2-3-254731aa3fc2@mentallysanemainliners.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_002736_684680_B7384F35 
X-CRM114-Status: UNSURE (   7.75  )
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

Il 14/09/25 16:52, Igor Belwon ha scritto:
> Add driver support for the pin controller found in the MediaTek
> Dimensity 7300 (MT6878) SoC.
> 
> Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



