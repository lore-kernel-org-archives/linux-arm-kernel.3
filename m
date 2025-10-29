Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A950CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 15:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kMrJceTWmN53UT1PewSFVb4RviFH0RPzPzL22omqM6k=; b=ZBkREkQSAlMV7SLUsYZBv8lPY9
	qhs+TYQCziYN4vf0/YowqaXp2eb1BLc756AiduX9/heFnKRWZ20Rnso799rxZi+rkMZolTciaenLj
	QGoe1J1h8e94LHaYygoudQgBkTI3V5XyyUs4Owu+RFlkZjT9a0z5SuHsD35xCIeIc5Nlv8DyrvhWG
	qXea94NNKuLBFQRE0D+4NHmEIVlyTbX1Efh7l7uEVnqq2senRT0DeW44RSWmHf31fg6OuWuFDXIOt
	BlTJ/quxS6fZvqzC9dFihBb2OD0mY9M9s8GuJQGQ1eawpOxxSGEyTD0zm6axVM5XWNAdHVz5GLlsw
	b1FfIXXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE89y-00000001o2T-3yty;
	Wed, 29 Oct 2025 15:32:26 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE89w-00000001o18-22Xj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 15:32:25 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id EF69D1A1748;
	Wed, 29 Oct 2025 15:32:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C3712606E8;
	Wed, 29 Oct 2025 15:32:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B2E1C117F8299;
	Wed, 29 Oct 2025 16:32:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761751939; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=kMrJceTWmN53UT1PewSFVb4RviFH0RPzPzL22omqM6k=;
	b=txNTXsun1RNXE5oMhI32sx086EmmN/aHvNbQnBpoXl7AK4QbUQXEXBBNgqrfQw9zFIbdrN
	PX1LK3Ri1VKMgACDqen+T9kHRu2KJgZYbrRJXI+ga2qcV4P7wFLfnNb6+IGDeFhvva4O2T
	v/0X17NXSAOkbciY7T3+/0fRQq8cZzYjCQ6okWlw4ZGOi+jhGs1Pet0789auvh8JCg5gmi
	MhRl2YnCVf21nk8jtZHbqzIthM8w6wgLyXXyR5j9BxGzXH2poy/omzMcIuM66+Fd2SqK9L
	m+2r074paejLimn5tH61qhFJy6hx8rF+t54mXUQzIgM1XfK7gtoAoNTufq5h2A==
Message-ID: <7ba29151-699e-4e69-9826-9de05714a380@bootlin.com>
Date: Wed, 29 Oct 2025 16:32:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 1/4] net: stmmac: socfpga: Agilex5 EMAC platform
 configuration
To: rohan.g.thomas@altera.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251029-agilex5_ext-v1-0-1931132d77d6@altera.com>
 <20251029-agilex5_ext-v1-1-1931132d77d6@altera.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20251029-agilex5_ext-v1-1-1931132d77d6@altera.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_083224_662060_4BCE9BC0 
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

Hi Rohan,

As this patch also impacts other socfpga variants, I gave it a try
on Cyclone V, all is fine :)

On 29/10/2025 09:06, Rohan G Thomas via B4 Relay wrote:
> From: Rohan G Thomas <rohan.g.thomas@altera.com>
> 
> Agilex5 HPS EMAC uses the dwxgmac-3.10a IP, unlike previous socfpga
> platforms which use dwmac1000 IP. Due to differences in platform
> configuration, Agilex5 requires a distinct setup.
> 
> Introduce a setup_plat_dat() callback in socfpga_dwmac_ops to handle
> platform-specific setup. This callback is invoked before
> stmmac_dvr_probe() to ensure the platform data is correctly
> configured. Also, implemented separate setup_plat_dat() callback for
> current socfpga platforms and Agilex5.
> 
> Signed-off-by: Rohan G Thomas <rohan.g.thomas@altera.com>

Thanks for your explanation about the TSE PCS,

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime



