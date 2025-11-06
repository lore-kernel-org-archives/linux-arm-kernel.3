Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 353C6CCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 09:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aA1Nh5vuzSHJhmK4d/Q7OkqDwftB9kBY44MgWQ5fnC0=; b=KfVnPUbOmgfrULZu/OJdrQ+JWi
	MLnyLPGUomn2N2lGFcnxLNywkT1EZWE6QE6fEcEFOpsljWxP71WUGByWJgNaFOwq2C4gEGfLwkwuK
	0n4aP52R2FwT9GsntB3hFIjgPq/THlpYwth9RlemG8Aovj8iQ7hAqS7mYIpV3iQSUchFcRTRq5+Ya
	CtJKOm4xgdRU/POh2SGhv8EUHdRuOIjIXjqek3AR8eGHltkt+kR26+ZvTZJ5wlDLthZyWOSlX1K1X
	1v3MsJKHmwI7iaAaQl8ZI0G0eBFjt4FLvX/XfMcdCmDtYlRup329hUxEw0R3kxxjvZK+O40fQ2LEi
	D5jwIMvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGwkn-0000000FDak-35A4;
	Thu, 06 Nov 2025 09:58:05 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGwkk-0000000FDaM-3T1L
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 09:58:04 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id EC8681A18F2;
	Thu,  6 Nov 2025 09:58:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B9C0C6068C;
	Thu,  6 Nov 2025 09:58:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 78B7B11850340;
	Thu,  6 Nov 2025 10:57:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762423079; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=aA1Nh5vuzSHJhmK4d/Q7OkqDwftB9kBY44MgWQ5fnC0=;
	b=lhRimDfJSU530Ra+0V83y5TFQDiqg/9/f8FnAk2IKLuWRO9dy+hm+9ADz+lW3upGtpklf7
	oc0k9xOyZw3gaBO0/RbKvc/arSMN0GsZnCYYN3Wl9ENtNXGgQvinAWn12keNsQljLWTxZA
	Go7AkNluOrGI4GJUTvLgOLTANpGbNoA85WTb/yhazPiDlD7B5e0SKc9PNWpj48ss/RpWnH
	bzqZKDlSVyEJGSVq/L6kPueEPsGFjk16uJBC6HdCBL8dO1KKnSJuoIq1KnVuVSUaGxcDfS
	6hTds9FbSa0y/flYWz0aEkjN7K1spVyR+RNtsC8O03HDCtUPstx6EybkOi3O5Q==
Message-ID: <6ad7667a-f2be-4674-99a2-2895a82b762a@bootlin.com>
Date: Thu, 6 Nov 2025 10:57:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 00/11] net: stmmac: ingenic: convert to
 set_phy_intf_sel()
To: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>
References: <aQxinH5WWcunfP7p@shell.armlinux.org.uk>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <aQxinH5WWcunfP7p@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_015803_003090_2D865322 
X-CRM114-Status: GOOD (  11.99  )
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

On 06/11/2025 09:55, Russell King (Oracle) wrote:
> On Wed, Nov 05, 2025 at 01:25:54PM +0000, Russell King (Oracle) wrote:
> Convert ingenic to use the new ->set_phy_intf_sel() method that was
> recently introduced in net-next.
> 
> This is the largest of the conversions, as there is scope for cleanups
> along with the conversion.
> 
> v2: fix build warnings in patch 9 by rearranging the code
> 
>  .../net/ethernet/stmicro/stmmac/dwmac-ingenic.c    | 165 ++++++---------------
>  1 file changed, 45 insertions(+), 120 deletions(-)
> 

Damned, missed that V2 and started reviewing V1... I'll resend the tags
for V2.

Maxime

