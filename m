Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C883DD29C2A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 13:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KxedpuQaJ1XVwtqrotV402P4SEf92fFjf3lBHShSz7o=; b=SKOCwrm35NyYsummNbBL2NleFg
	tP+H538cPW7OGOYM5yZlRJn6Fw1A3RmIXK+PfYDuxIPtBmjFedDSVEuHJdlpqb4GjwbED+L6+92Tm
	/zdu+bXD9t6CW71MuGvetNqR1YuZZRJgiNbNwaNAz/Io0Ry9Cv5L7bKV/INNCZethOwKvlZ5FgKJP
	t8cKnprOLyJZSpn7h/ANbWZb1ydbjB9RzhP2mk+7MLzLu5GQLw+ZM+fhr/i52ao/5bO/tI++ZIZm/
	S922iqgaB9QyCByVqsu2vCMSNYG7ywmQM17jIyGJD3OsuFfCi9kT7rmbQl+hcabsnTOYudOwAuwCJ
	Ae0Oq0Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhpEC-000000029iI-2eWa;
	Mon, 19 Jan 2026 13:23:32 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhpE9-000000029hr-0hXF;
	Mon, 19 Jan 2026 13:23:30 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 046A4C214CA;
	Mon, 19 Jan 2026 13:23:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0CEAD60731;
	Mon, 19 Jan 2026 13:23:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8E70110B6AFE5;
	Mon, 19 Jan 2026 14:23:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768829005; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=KxedpuQaJ1XVwtqrotV402P4SEf92fFjf3lBHShSz7o=;
	b=ESSnzD+eNodO3pGQ2VSksmhDzLtD7Haf02tWs6UM3s/aJs+45FX3aI+D3WUocDRTjKq7Md
	8QGsn5A52b5/RW7IDBhL914t4h1n2Z/srz32S8oyBhriGrlU+VjUZSirqC0AJmnvg92bRl
	BzuT/6IaT9Hz2v9w4Sen77kLVMmJnVn+scvXb/5Hum5EiJCM8o07ElwOV8p2eGGfIpi0+9
	+lbbbKgtI4C53cf/Irpq2USu1GgbzJPfcqrvdKgsX+w7uNE5nPEoJMKC06UcyQNhELg26X
	XeqYLxf8d1c8+pvLsbp6FFEorRAqk8M1gd4aocJcRV7DCpLu53w+fHmBpJ+Fxg==
Message-ID: <2c5a7b0c-b58f-4b6a-9669-fde434f995e6@bootlin.com>
Date: Mon, 19 Jan 2026 14:23:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 11/14] net: stmmac: add struct stmmac_pcs_info
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
References: <aW4kakF3Ly7VaxN6@shell.armlinux.org.uk>
 <E1vhoSm-00000005H2F-1mve@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vhoSm-00000005H2F-1mve@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_052329_348275_7F00C2F9 
X-CRM114-Status: UNSURE (   5.55  )
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



On 19/01/2026 13:34, Russell King (Oracle) wrote:
> We need to describe one more register (offset and field bitmask) to
> the PCS code. Move the existing PCS offset and interrupt enable bits
> to a new struct and pass that in to stmmac_integrated_pcs_init().
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime


