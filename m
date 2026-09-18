Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13B5AC982D2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 06:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b/kwg8xPzvU7ZBW6GaseA/nQW9nV0VK1cq3pTvwDMsI=; b=XqBOV7aC2FUBASognfgzbvpXI9
	U5gx+X2h1rULEuj/FsbOcfSiLCCUKTxQnTC0txa4ZcOFOU2uADIt/p5GsdBVrAvhHtd0S43x9ML3A
	FprfbZO3brtjQ/ws+/TCk/hzqZ9OzAzaZyLlCHmiXS/1IBudK4d1diNLxNcd8X44/hv5p1kIIv9WH
	HtVBZGoB+4Bpzf0XU99zIj/eK5ccp8LPp6tn4OO3t+vwvmpfIkwj6mkENJYK6RhZBDAGROCmJedcZ
	M2fuWXdXVj7sns/10moWtNZPm8HNTJoXiCXkA7nm0QP4M+1QDqZxfyqskxdOk9La2U8UNzGW/wzTc
	F8g+qp5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7SDV-0000000DaZa-2ylX;
	Fri, 18 Sep 2026 06:37:01 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7SDS-0000000DaZ6-1IDq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 06:37:00 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0D6C91A0975;
	Fri, 18 Sep 2026 06:36:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C239260649;
	Fri, 18 Sep 2026 06:36:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B918B11C7B021;
	Fri, 18 Sep 2026 08:36:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789713414; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=b/kwg8xPzvU7ZBW6GaseA/nQW9nV0VK1cq3pTvwDMsI=;
	b=AQNRWxM8MSps0slHhOxR5WAwPa4wIYOQiM7D/Z/E7cAcmFmQ06vOBeqH96ZAsj2QT6KAak
	SVIa9tT/KfgEUoyBGjjgNCV0blH2+c/gYJg/GX3myRvkO/2M2UXyDV4cpMpEBqK15tB9hi
	vhGELJV8XKPegOPsMzraCmFhnwrVaZJ2rCXqQJktbRj8h2URJsTPbE3FIlY5VzlaVtVqhh
	L2uOHoiyES021YhiuDepdnZBuuqHZJSmX9gH7DrayLW9M0s9qhjG77e1pSZBlZOcP5NTam
	Y8Dilcw/R/IkeukLXLMCJ7NCfMMDlNAvpNCv+9gtsW1nzklG5T/CbjX/5bSBHQ==
Message-ID: <7023523b-fcca-401d-a876-18960a9d75fd@bootlin.com>
Date: Fri, 18 Sep 2026 08:36:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 0/3] net: stmmac: add Allwinner H616 EMAC1
 support
To: Alastair D'Silva <alastair@d-silva.org>,
 James Hilliard <james.hilliard1@gmail.com>,
 Richard Genoud <richard.genoud@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20260917-submit-h616-emac1-v1-v3-0-62cb8316e19b@gmail.com>
 <9cd900993fc385ccffcf743f629e87071be9820a.camel@d-silva.org>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <9cd900993fc385ccffcf743f629e87071be9820a.camel@d-silva.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_233658_489801_C09A5727 
X-CRM114-Status: UNSURE (   6.92  )
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

Hi Alastair,


> Confirmed working on the Mellow Fly C5 when brought in as a module and
> backported to 6.18, tested in the Armbian environment, along with the
> recommended PWM patch:
> https://lore.kernel.org/all/20260804-h616-pwm-v8-v8-0-db37ab8624ae@gmail.com/T/
> 
Thanks a lot for testing, this is great :)

Can you add you Tested-by tag ?

Thanks,

Maxime

