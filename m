Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 181A4C79F89
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 11:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G/2HjxRQLVx4ZIzd+9uQPx/YxtgBjjNF2hoUfh2eYWI=; b=nlV4iTG5RJwACAe9w0t7KE0e+A
	9l3w2pnRhhE4xUGF4bhn2s2kXf42KvJ3dH+ot53qSBDPPQs2KRPy1i+SUz63BngqA4tPpSEIv+zhf
	jeZWT3GG1Yf1U12mxTgwvjXCs0oQujNjRoIChDz7Z765jC3viq79LmDrf2Uny9CIJKdUPfp/q5vVb
	YXhUtJ924bH3B6H9Bn48l3gxjCdMrWxv+RIPQJbU6hpBl/nW5oxldMLsEWFBrGod6xO2OIrvSJHS4
	mZ5akMQdkXvtt7plWKHarpl5llqWSZagYJdJtThwFuB7YBtVEyvjU/c7gu1OLmdeElpWEB80TB7Ot
	XfU2+7Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3XoL-00000006hs7-2UZC;
	Mon, 07 Sep 2026 11:46:53 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3XoI-00000006hpP-3WOQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 11:46:52 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 4AC591A1A30;
	Mon,  7 Sep 2026 11:46:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 17AA460383;
	Mon,  7 Sep 2026 11:46:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E5D0411C79C68;
	Mon,  7 Sep 2026 13:46:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788781608; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=G/2HjxRQLVx4ZIzd+9uQPx/YxtgBjjNF2hoUfh2eYWI=;
	b=Qi35WIgGFkYfNOA1MoQiPmFgq1xHgqBj4Xo7MGjEOC8AdWELyANs5M6LXLU02RKnc1XIe0
	+g7n+yJjb4FsZsTnTf0rXyRNqGtWgL+UPYPePBSfB40pE+i7q9E2XIdd2LE0IFhcxVHh7e
	NQXv3egZ1ofjN4N9DlhiEN0H1g5bKd1RFQdTrwWf8SOoiQhVIuwiHvIU93gwNxcL+q+7nD
	UHWlaUdk1xTqL1n27Vf27w+BwmMaeWXpiZVq3hwv77z45b3b5o9VTgT86masdCH0dUcMvF
	p6y7cOm9kBosqi2AvOd6RumrkqZM1fjQazpEmGsyxAUfcC3vyqbwwGBcAUgWNg==
Message-ID: <ed05c706-8370-43cc-ae04-b479a28de9d1@bootlin.com>
Date: Mon, 7 Sep 2026 13:46:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 3/5] net: stmmac: eic7700: Use common RGMII
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
 <20260907-dwmac-ultrarisc-v2-3-9a39bf8db313@ultrarisc.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20260907-dwmac-ultrarisc-v2-3-9a39bf8db313@ultrarisc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_044651_025048_FC73513B 
X-CRM114-Status: UNSURE (   5.23  )
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
> Describe the EIC7700 inherent TX delay through the common stmmac
> platform data and let stmmac_pltfr_probe() adjust the PHY interface
> mode.
> 
> Keep the existing programmable TX and RX delay configuration in the
> EIC7700 glue driver.
> 
> Signed-off-by: Jia Wang <wangjia@ultrarisc.com>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime


