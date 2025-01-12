Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 638B0E7719C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jan 2025 17:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gcp02vfLN1uVTWXJ8UJ8BzKX5eeyuNnorXOtRkd8w94=; b=dN6pgfcT5DX/tdrf9XFn7nexR3
	Q1LEc4NsKH1Y6pcw0Rtc8L2zTUhhjuIEUgkGH3iKtXTeX3HReKMGTjorHnMhwWyuK2lzUordXlxvX
	/SZpfTCnDpOLEwvCsPGDdYI5M32hhEPOiQ7zr7xJUnsMbY1bkt/YqpZvhmZbdpY20gEW/eopelfuJ
	/QDKQ3lVsDNuIRQlpm/EMCbFkad1W8PYyUYLddhAlSuEww63SQIn7d0l/7B7zLl58lc3/LUzveuIy
	2chhsyGJpZDoSM/iN9dfWDRbW4Jk7Z1comhHx+PGLovC0E9vDtRK41GJp7TgcruOp/JKI3R04EGjU
	6DbuVHqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tX1Om-000000037Ps-4B7L;
	Sun, 12 Jan 2025 17:05:17 +0000
Received: from smtp-26.smtpout.orange.fr ([80.12.242.26] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tX1NQ-000000037BH-1p5z;
	Sun, 12 Jan 2025 17:03:54 +0000
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id X1NCt2XX5qZ5JX1NGt8sSO; Sun, 12 Jan 2025 18:03:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1736701429;
	bh=gcp02vfLN1uVTWXJ8UJ8BzKX5eeyuNnorXOtRkd8w94=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=fnH0iNQQzQe3piqBMIVE5d9BG6+w8xEgN2VBqmi8AXirOeRy60NrMR/v+/jXABh16
	 JpvenW7mQrRyQJNS7ODfCQud/A0sHpCYumL7Rxo4dvkQRkFn5Sq+X8YWWLh1l3Npj7
	 EKCh7IqNNNluOSSWpJWw/jeZKljq/zAdtpT71biBfD3cTuF1rjWn5vFZEgL0E6FQCj
	 rUQtMFXuQPg5CYG5zF84tPPtJtZ/Li8U3366GMCLOd/+RYloATVfvXiYux/yyQLhAh
	 h/GhbIjMLlosT95vg3PB740gtcl7sPYn5Kc0tMKx+JEYGR+BJ4RpBBEKNHbPCy3uh+
	 8FUFx8/CX7JlA==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Sun, 12 Jan 2025 18:03:49 +0100
X-ME-IP: 90.11.132.44
Message-ID: <05dfdd2f-e2c2-40ff-8a84-038c4da8385a@wanadoo.fr>
Date: Sun, 12 Jan 2025 18:03:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: phy: Constify struct mdio_device_id
To: Andrew Lunn <andrew@lunn.ch>
Cc: SkyLake.Huang@mediatek.com, UNGLinuxDriver@microchip.com,
 andrei.botila@oss.nxp.com, andrew@lunn.ch,
 angelogioacchino.delregno@collabora.com, arun.ramadoss@microchip.com,
 bcm-kernel-feedback-list@broadcom.com, daniel@makrotopia.org,
 davem@davemloft.net, dqfext@gmail.com, edumazet@google.com,
 florian.fainelli@broadcom.com, heiko@sntech.de, hkallweit1@gmail.com,
 jbrunet@baylibre.com, kabel@kernel.org, kernel-janitors@vger.kernel.org,
 khilman@baylibre.com, kuba@kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux@armlinux.org.uk,
 lxu@maxlinear.com, martin.blumenstingl@googlemail.com,
 matthias.bgg@gmail.com, michael.hennerich@analog.com,
 neil.armstrong@linaro.org, netdev@vger.kernel.org, pabeni@redhat.com,
 piergiorgio.beruto@gmail.com, richardcochran@gmail.com, rjui@broadcom.com,
 sbranden@broadcom.com
References: <403c381b7d9156b67ad68ffc44b8eee70c5e86a9.1736691226.git.christophe.jaillet@wanadoo.fr>
 <9dfeb860-3c0c-4f16-a150-fdce133281e8@lunn.ch>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <9dfeb860-3c0c-4f16-a150-fdce133281e8@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250112_090352_879874_2BE381FA 
X-CRM114-Status: UNSURE (   8.47  )
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

Le 12/01/2025 à 17:46, Andrew Lunn a écrit :
> On Sun, Jan 12, 2025 at 03:14:50PM +0100, Christophe JAILLET wrote:
>> 'struct mdio_device_id' is not modified in these drivers.
>>
>> Constifying these structures moves some data to a read-only section, so
>> increase overall security.
>>
>> On a x86_64, with allmodconfig, as an example:
>> Before:
>> ======
>>     text	   data	    bss	    dec	    hex	filename
>>    27014	  12792	      0	  39806	   9b7e	drivers/net/phy/broadcom.o
>>
>> After:
>> =====
>>     text	   data	    bss	    dec	    hex	filename
>>    27206	  12600	      0	  39806	   9b7e	drivers/net/phy/broadcom.o
>>
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> 
> Seems sensible.
> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> 
> Is the long terms goal to make MODULE_DEVICE_TABLE() enforce the
> const?

It was not my initial goal, but I can give it a look if you think it's 
worth it.

But some other constifications will be needed before that.

CJ

> 
>      Andrew
> 
> 


