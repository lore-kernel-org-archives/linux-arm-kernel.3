Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC173CAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 10:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HkPZ0thlY+2xfAUc6YweOnf0L2U5PNyKNeAI+ZAfz0g=; b=kWLwrLJeI1giOlEIH4tgt5Jyai
	fEd4bpKFgkM1wJd0RWecHZUUhK23t+NlkLsfPaOXf3XThL+UDea4/GZSlfQX2ScS03dYqM21rDY9y
	VvKuxDlgPZX18oJbSpNlabGNpwjn12sTaKglsus+WORNL4LwFa14OrUPGe4/LaODrwufRgSS2R9/0
	QrGVJl6AvBW8oUBtMGY6XshIcr9HQYzbwq4YcZhxdVrLlFbkJEE6y4i4CZHckRyHPNzHtBqNIRcRr
	AI48E1IUH4utBlShM4RRB0Vt2XmcOcas2xT1yt5AA7WpftSEp/aDYRgxDE/rG/2/eimaCBul5JEgQ
	t1/S0QbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3AwJ-0000000294p-1sDN;
	Mon, 29 Sep 2025 10:17:03 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3AwE-0000000291A-0SPl;
	Mon, 29 Sep 2025 10:16:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1759141015;
	bh=gFFRfxU0C4D89u0f4bM0By/gaq3tBosyxmopf1mr5K0=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=h34c09nJnODV8gvef0KmprNLPW3Zw3bVD3YAxen9qwBKeVY8tmInOKqqP9ecxW3bD
	 qfIJFLAQQUMer4lcfscKlfJQ4jtWBwvCXeknCjY9kHj+8PGlqQZR85UkVpc3GCXXfU
	 er27tuwf8YfMdPcZ0fsMcjyalysTZlq5BzLGgOP2a/usa5Srp934Jw3qxMBcjKaGJx
	 G5sSKkmQXyImv3XcR//ErA4gx3f44M+l91Q0wA7ZfW8pSkJMLDY1M/2PpNWnb9oP3g
	 HDHUFe4WrZ9s78gSuOUiMmJgobh4VPgx//jpQRzJraSfhQlv8Wq7ClobVcBqGwjWdt
	 q4c1BE7rIDYAg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 83A2A17E108C;
	Mon, 29 Sep 2025 12:16:54 +0200 (CEST)
Message-ID: <d02f8264-e437-43d8-8d4a-215f2154ea15@collabora.com>
Date: Mon, 29 Sep 2025 12:16:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] dt-bindings: crypto: Add support for Airoha AN7583
 SoC
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
 <20250925164038.13987-2-ansuelsmth@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250925164038.13987-2-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_031658_305101_24A8C6E5 
X-CRM114-Status: UNSURE (   7.30  )
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



