Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AF61C54EFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 08:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/MYMVfnD2UGMAplCQcXJZfwGhkMUfgH8iCVLmSkxxLc=; b=wLYtSm7hT4CBt8wSFp4cfqfxF6
	0nrvzEDE7WI8EwYLRXnV5UJVS85XUHNDkEtlMOF79g24mSxCSpr+ThTgCmWjC/I1q4LtxRg7ksOe8
	z6aTtiiywJZAnvmgT9EsviV42Q/B+zWMEuwAUNyXHXML4XRsqnCQEFetzKQCkkN5FEUFiqQLYOSCW
	IG5gdy3mSXkWncAuaEkKjSlX5TEbzus/G8hihGTatDThJ2kDWMXOY+90MHjo6VNCpwXKRqyuo1+7R
	5GibZJrOeckkuLMCELdLAFCQ9R6vUueGoA3wKoF0koIiWZfq+YWeZm3f+t1Rgcs2eFyoMI8B6ssrK
	8xM/D3rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wodcb-00000004lGD-3Qph;
	Tue, 28 Jul 2026 08:57:09 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wodcY-00000004lFY-1WKD;
	Tue, 28 Jul 2026 08:57:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785229023;
	bh=Espnjtem9bvcKUaeF4V7sJlCl/16E1+vcH39OyQyhxA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hPJBJS7QLi4Vjmi7xZtFmjRuReuaYGx0yP6leV84veSFvdQe7ls6qY16trOVe9Odf
	 0YJPqyKfVzbzdMurUm6FypTE/868DSpVHeZ+m9ZOG3nN6o9kYXNaY2a+osDazQu1hW
	 7QejtWtQQZvLhDrb+LAM+sh0tfUISgkU1qfe+0jU0cZ5cdGw1R2gdc+uqZ/NJWgEU4
	 yaxi3Q3jEGzKG5TbAp+pEhAeVpZlStbKksKA0LA4Pq0ExPj0KGPdqJCi7/mSWrxnvb
	 QtWbrcTPqvibMbRTwJC+BPMLW6TZ2gqfIXjKitFHIsNjn1eiOh1g1XJN2nAS0o/d35
	 n8KmDlshds6CA==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0CC2917E0676;
	Tue, 28 Jul 2026 10:57:03 +0200 (CEST)
Message-ID: <0b63e6e9-2a0b-44c7-a0bf-66a5aac9610c@collabora.com>
Date: Tue, 28 Jul 2026 10:57:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/4] AUXADC driver for the MediaTek mt6323 PMIC
To: Roman Vivchar <rva333@protonmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Lee Jones <lee@kernel.org>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Ben Grisdale <bengris32@protonmail.ch>,
 Conor Dooley <conor.dooley@microchip.com>,
 Andy Shevchenko <andriy.shevchenko@intel.com>
References: <20260709-mt6323-adc-v5-0-d11b8332a735@protonmail.com>
 <f2d5801c-1d12-4a61-ac23-aa24dfd0ee5c@collabora.com>
 <20260710005424.5c559b5a@jic23-huawei>
 <c11705b1-fc46-440b-a27e-0cc38f3b2d69@collabora.com>
 <92F7jsoczEi2TOWKT6Qqmppk-KE3uJjCKASTXa0RPV7nJZVfXhxdbuP9RptMsvV4_dnvJAlCh9NYvmiiO2mDGQojZoCozVKhXyOJmp2x6AM=@protonmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <92F7jsoczEi2TOWKT6Qqmppk-KE3uJjCKASTXa0RPV7nJZVfXhxdbuP9RptMsvV4_dnvJAlCh9NYvmiiO2mDGQojZoCozVKhXyOJmp2x6AM=@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_015706_581555_0427C16C 
X-CRM114-Status: UNSURE (   8.28  )
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

On 7/28/26 09:58, Roman Vivchar wrote:
> Hi Angelo,
> 
> Could you take a look at patch 4 (DT)?
> 

Yes, I already did, but then I forgot to pick it because ... reasons?

Thanks for the ping, btw.

Cheers,
Angelo

