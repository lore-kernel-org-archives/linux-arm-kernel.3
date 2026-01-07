Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FA31CD5822
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 09:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3hqTdpXOizZ/e9efl1zQ2snYZOE+pxVId2PVKDUTgJc=; b=V6qD7ylhF/Q8JDSxu77QKQcXgH
	YurUA1BqfHw0r7C4vwc8DX2eo12+bpUeR9EIM9GHlLuAxXxxBdirttE3yDpkXUbhVTpvVCAKAWmIg
	SgCCeffRE9Yo2YlaTlHv6IVWJLFlSsUj70iIm1dU49QmZeR4Khw6RlLxNF+tkQcEPV6yEOku4N/lk
	GeTlRQMfN9mxleD54CYTy1QlgfXjWAkwuHG47hoyjQuhM4HaFonGQuzrEMUF8uEmIvN1/ZVmAwKoO
	HsmKP89stOdEEqhWo7Bky2dvXB2AQUzy6mXESKWjsNV9VIh6eg6BWyMQHot4cNMzBrC5p7n8KHy0r
	ruam7zSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdQJb-0000000Ect3-2JUK;
	Wed, 07 Jan 2026 09:58:55 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdQJW-0000000Ecrp-3yde
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 09:58:52 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 84B874E41FCE;
	Wed,  7 Jan 2026 09:58:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 57452606F8;
	Wed,  7 Jan 2026 09:58:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2C1C8103C870F;
	Wed,  7 Jan 2026 10:58:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767779928; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=3hqTdpXOizZ/e9efl1zQ2snYZOE+pxVId2PVKDUTgJc=;
	b=BEHEs6r1YL8i+F08IwjLuqAouIREj5O/2e9GWe4vgGbbEyhzWkbr64R3BK2pzfTioswwXs
	U+Zys/9/TLtk2lV08nZX3Z0xw4ok1YQpSCtd8hddmGsy1Ndyc7+OJ6XFPsohj4Rb2pNztb
	YNlaAW2nn2P3qT1WkJdDBdAZA0wYpJtuljWX3mX8+NLkm6ebxl0z+fBgOqCfcOyM+1QRR2
	3Ff7+5B129SsxIepu3zGbxaHN0rJT8Vb7KTcDh72efCpEXpiTWXEn9wOupMWKA9R9WVfFp
	mJLnLWJ+Xbte0JvJegJNZFXJvNsr3ri8RLgJruiOoMkjjodCCJehDNjQufnaLQ==
Message-ID: <02415558-ef2c-4b49-8be8-997376d1ecc0@bootlin.com>
Date: Wed, 7 Jan 2026 10:58:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 5/9] net: stmmac: descs: use u32 for descriptors
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
 <E1vdDiK-00000002E1j-3xlF@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vdDiK-00000002E1j-3xlF@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_015851_120352_0D9774B9 
X-CRM114-Status: UNSURE (   5.92  )
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



On 06/01/2026 21:31, Russell King (Oracle) wrote:
> Use u32 rather than unsigned int for 32-bit descriptor variables.
> This will allow the u32 bitfield helpers to be used.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime


