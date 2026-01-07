Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63478CF6C00
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 08:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gR/y6Uc5IExI1wlxJ6ehnKNiWxH7FKN74OHl8YN3mA0=; b=yP83lyTfQyjIlx37D++V7CZwuv
	j+ZbS9eyMND335a1PMJBOvOV05JUznButcVP3Xrucm8VBD43dnvvhVCNdPMeNdagcmLZ/DrUDnJ33
	PXUCiEVNpFz9fs7T61JnI43W3CpsvYb5rmXfSElDjC+gXFpLZQDFCCvgieOGzZe01SKnPAKsAy+0q
	9eyqAxMguah6/R4QlRBlcKfrzt9uaRTEeLVn237mIxvc/3brc7XemiQLoPdmmL7xgfLlB1zm1+1Nn
	7jANWueXF6nFipRSlG/IpjLxY08Og9oJUQCCUQMDA0J4GPXs1X60LfibWDIoANkkDy1NzbjPLp6Zk
	i9Sjx8zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdOq3-0000000EOtV-0fEq;
	Wed, 07 Jan 2026 08:24:19 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdOpz-0000000EOqx-1HeK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 08:24:17 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 3EE2EC1EC8D;
	Wed,  7 Jan 2026 08:23:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 45FAC606F8;
	Wed,  7 Jan 2026 08:24:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 25FF0103C8597;
	Wed,  7 Jan 2026 09:24:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767774249; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=gR/y6Uc5IExI1wlxJ6ehnKNiWxH7FKN74OHl8YN3mA0=;
	b=fiTzTVNNLJb0Uw8Jv0vWqooScqqTYklPwX2Dhw4LZBn3N80l/kHhwqLjkryGv/ra9alaiB
	5hv+9pfn0gAF0m83ZMFWxvwjGo0458GDt5VYm4lzj/pgzWNe3M+Z7IuRety+tknX2BpJ6U
	5Jz5fWyaN6UPog10egFN5FOUqYk2HxIoJI9Ugo7+kAr1h6HSlp5UTHazRvw6VKglEMzMNE
	AyGlZZY6qGFqrlimOoFxFktvinoNbv/LuufrkCd+ODTwwLYasOj8MMmeA+JOvlAwZcW6hA
	aj3E8kgxhy8EDcTrgSozdGroxAfS0I/iwML02iDoa+qLt9WD/kP9ZjoZqaLFmQ==
Message-ID: <74c648d8-ab86-42b4-a20d-aa0e5ab6f57b@bootlin.com>
Date: Wed, 7 Jan 2026 09:24:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 1/9] net: stmmac: dwmac4: remove duplicated
 definitions
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>
References: <aV1w9yxPwL990yZJ@shell.armlinux.org.uk>
 <E1vdDi0-00000002E1J-1SNG@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vdDi0-00000002E1J-1SNG@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_002415_839021_38A03EDD 
X-CRM114-Status: UNSURE (   5.74  )
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

Hi Russell,

On 06/01/2026 21:31, Russell King (Oracle) wrote:
> dwmac4.h duplicates some of the debug register definitions. Remove
> the second copy.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Nice. I was able to confirm with 'grep define dwmac4.h | sort | uniq -d'
that what you remove are all the duplicates, and only the duplicates :)

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime


