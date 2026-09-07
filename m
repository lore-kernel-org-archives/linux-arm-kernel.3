Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9D8FC79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 11:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xyGVHRE2Lj8Q06pn5MxlowgRlFrHPBGoWeD1pOntCVk=; b=HHfxpSIMUixfPj1LopEESeoBFj
	pwm18GoNfzDav9GLUdWMs62DDqDckZHlydyaoEG2KU/jV/6Y91Rsw9lbVh5NX0hRZFnLwNvkcEswy
	lhd/X56nxP6vWkgeaQtMG3yJXtb+p1PjKzD9CIfSfVvLWAfGYF69q5HcQSmUINWJxMpeSSDYiKAKG
	OE7pvFxiL9knfwju02YqKUaDDhYhtdo9dazLikGmK8k4zdRNfVBSTeb/PFnBRsOjVLKHWPudQ+FB8
	93sgg/IyEkxbZ7VCcMdlG5OFBTz4U0M/Wnn5FPDNi4m3oD+OduuqBIZO20v6CBJEg6QYz/n9pG6Qc
	hYAZdexg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Xo1-00000006hiZ-24WG;
	Mon, 07 Sep 2026 11:46:34 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Xnh-00000006hdn-3OD1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 11:46:22 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 6DF611A1A30;
	Mon,  7 Sep 2026 11:46:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 40D4E60383;
	Mon,  7 Sep 2026 11:46:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0B15A11C79C68;
	Mon,  7 Sep 2026 13:45:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788781566; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=xyGVHRE2Lj8Q06pn5MxlowgRlFrHPBGoWeD1pOntCVk=;
	b=M2+lfUYQI41WktDF9HcR2BwikwvYg6/iHy6KkNmZBdChPMMKWJbwyE2qWT1R9L50uSBR98
	/oMe/VGO0pKjGt1bLRpfb6gQsoXIwj0MpGv45HpVQF9cy8s2iVw2fLB7ier/RGpmFEne7U
	Q8UURb0OnfbfdkvCNnoFgHu0aufWzn1e2EMOV74Pye2Zj7K8vPVlnHqbn9Mu3gZ4FoQHA1
	I8erHIC6WviSkmqWFo7iq5cKlNCISiue9yGrmazgzZ+6uzj2+gKWFuTYHWI+m4sOmJQxYs
	Xmipw9mJq1CdNOuvIgZwph5fh1Fz2EFXpGO2gA6kEmvp6LuGVubOTtLGgbcmyg==
Message-ID: <79175f89-a513-4fd3-81a7-52c019039897@bootlin.com>
Date: Mon, 7 Sep 2026 13:45:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 2/5] net: stmmac: sophgo: Use common RGMII
 delay handling
To: Jia Wang <wangjia@ultrarisc.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>, Chen Wang <chen.wang@linux.dev>,
 Inochi Amaoto <inochiama@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, sophgo@lists.linux.dev
References: <20260907-dwmac-ultrarisc-v2-0-9a39bf8db313@ultrarisc.com>
 <20260907-dwmac-ultrarisc-v2-2-9a39bf8db313@ultrarisc.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20260907-dwmac-ultrarisc-v2-2-9a39bf8db313@ultrarisc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_044620_883932_6CB29B76 
X-CRM114-Status: UNSURE (   8.15  )
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

Hi,

On 9/7/26 09:46, Jia Wang wrote:
> Describe the SG2042 internal RX delay through the common stmmac
> platform data and let stmmac_pltfr_probe() adjust the PHY interface
> mode.
> 
> This removes the duplicated mode conversion without changing the
> hardware behavior.
> 
> Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)

Ah good :)

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime


