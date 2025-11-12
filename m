Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D0EBCD1297
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 15:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cF0rJjJI4tWYdSogXLc0tqn+luRhJBK7q0bCFBP3A48=; b=NsW7ntlPPsboklfWUfYXi7+mRd
	Rl8lEYzJInVBeUGlWTlATTB3QxIW+CiVkRIwvpXDCNfEI7GdvFfU40chISPMj6zDjqIKFfR7v4k0q
	KT2I1rXbsqyb07ESZCWm21QFLEHRzik5uX8PDHhsba+amK0SdCMMj5L6FyWlmC6VV3eSMZLBHrn+H
	rgZcsNmhE+XdHOht3U0SpZIq2LUwMtKVe4wPLqaZ9koUPmyJlYQ3dyf7Eq3aICG4iKk59bcY4CGQn
	Xucjkh7ZaxHfnOC+Mx8p8sxZFyzH7iNJUg84ErhmHJEI5zkU/qE8bB7/ZKe8UczzmzWli7vMxRHGS
	jKI41F7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJD3W-000000095X6-3euO;
	Wed, 12 Nov 2025 15:46:46 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJD3T-000000095WF-2JLn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 15:46:45 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id EFCA34E4167B;
	Wed, 12 Nov 2025 15:46:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C0E456070B;
	Wed, 12 Nov 2025 15:46:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1946C102F1C26;
	Wed, 12 Nov 2025 16:46:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762962398; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=cF0rJjJI4tWYdSogXLc0tqn+luRhJBK7q0bCFBP3A48=;
	b=eySDEjQmTYwi4hV/GI8oe0oOfuB4w3piugQQhn9HLSJu/iIGECK1sH2BE9C3rJNffTJTkS
	IyslYBrFKrZ80g7jNfIIaJO0QAMy7wZbxcN17QPI0An42QRnJQ39wT+DjOUqxGia03tNbh
	VK97KbTslzXausYPB12MP7d3Z9n7UiY73Stixcd9TQrcJ0Jw/L8cNY12+gBXxNROw4hsjU
	mZ5hkD+8XkOtqTb5FdZc0tFFxfqBR/T14zMRm5qBcMzoBNVnfuBtaxRjt/7L75gWB1nsV6
	TZIImkkN9DcrJeV9TivVQcashNB7Foo33z33h4aShVHWH59Ef01FB8F3pLDfTg==
Message-ID: <7243ff3e-839f-4ea4-9470-1a16f506b4bc@bootlin.com>
Date: Wed, 12 Nov 2025 16:46:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 01/13] net: stmmac: loongson1: use
 PHY_INTF_SEL_x
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "David S. Miller" <davem@davemloft.net>,
 Emil Renner Berthing <kernel@esmil.dk>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Keguang Zhang <keguang.zhang@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Minda Chen <minda.chen@starfivetech.com>, netdev@vger.kernel.org,
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
 Paolo Abeni <pabeni@redhat.com>
References: <aRLvrfx6tOa-RhrY@shell.armlinux.org.uk>
 <E1vIjTf-0000000Dqt0-1CZg@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vIjTf-0000000Dqt0-1CZg@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_074643_715023_6566F345 
X-CRM114-Status: UNSURE (   5.03  )
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



On 11/11/2025 09:11, Russell King (Oracle) wrote:
> Use PHY_INTF_SEL_x definitions for phy_intf_sel bitfield.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

