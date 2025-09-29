Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCE3CCAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 10:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HkPZ0thlY+2xfAUc6YweOnf0L2U5PNyKNeAI+ZAfz0g=; b=CfMBfFS6HSrL6iCHaJlY/oJvSZ
	4dwvNb0iOxATC1LvRzo1At40vaa2tpoDZ88wE7qPgZ8hs8rjh4wrwXra6+LLMdBfnbPNzDTbKggfQ
	7BZvT3edEmE4rNWxm6sswghxbMq+EiZG2NQNUwDnQgGrWFk9r+ywHU3cWAYDlpfTwjvJO4oe9Mp+v
	1HaQEWY9waDJHfOgQ3mQ8W3nx8IVBBN2TvwfL2csgF4F2J+oVhxsYu+zeoAEArpFohxYr9siEmufZ
	kwsIkvHtIz1cU75bF+TxlIAZH+shFJWajJkuFZr8jAvzynu1AXLhz6Sw+uuZTTINsBU5iq8i0pC1w
	pHyRTLOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3AwJ-0000000295T-46oG;
	Mon, 29 Sep 2025 10:17:03 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3AwE-0000000291N-2Lxh;
	Mon, 29 Sep 2025 10:16:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1759141016;
	bh=gFFRfxU0C4D89u0f4bM0By/gaq3tBosyxmopf1mr5K0=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=WUC9/Ngkd/07HEYXLlEz5Yi8hfBjhKsC56RBiI1T79cwtzQl3n2eAdJtoeDBH81tx
	 X13ajlzJrgwkByssvOjhrwIYh5WHSGtGWr9GIJ7G89KUEoDn2GeWdhGEWJ1x2wYD9H
	 kloSZSqhs3xnujYQmwsRIhN2+lR6y1hxVAulKUFER2QVWXd22+Efk4zHvYMf4QO9sY
	 C5uufMLLl0is97pZZOE5J+40teVdC6mtumDIT19WLo5JZ8N8cERaVtR7hSml5AQOwO
	 11c62ZNviRXlS6gYLVdPyY1reA2kxy9SQeJkncIoz/AsegSWqps2+Q10QmKhyu3QLx
	 RShiy6FC+eB/Q==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A7EA017E12E4;
	Mon, 29 Sep 2025 12:16:55 +0200 (CEST)
Message-ID: <8780b731-950a-490a-9dd9-7ec916e3f992@collabora.com>
Date: Mon, 29 Sep 2025 12:16:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] dt-bindings: watchdog: airoha: Add support for
 Airoha AN7583 SoC
To: Christian Marangi <ansuelsmth@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Matthias Brugger <matthias.bgg@gmail.com>,
 Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250925164038.13987-1-ansuelsmth@gmail.com>
 <20250925164038.13987-3-ansuelsmth@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250925164038.13987-3-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_031658_758039_91359509 
X-CRM114-Status: UNSURE (   7.20  )
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

Il 25/09/25 18:40, Christian Marangi ha scritto:
> Add compatible for Airoha AN7583 SoC. The implementation is exactly the
> same of Airoha EN7581 hence we add the compatible in addition to EN7581
> ones.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



