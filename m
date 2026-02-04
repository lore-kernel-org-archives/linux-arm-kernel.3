Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FE80E95368
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 09:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PWtAsLhTfJ+y5jHsYpWzRsgFbu/hEL4qAn8qo8Aj8hs=; b=NmTGqydtNKBtJPZEcecxfIPXrQ
	zJXRVRRUYzvl+ZnRXG/+M9G95UgKdtDV8rDcXdgUcf1Xw/RAzGXvHd2v+tM/F6AeL5iWnBHX4MCIe
	Z0TkiyEdxSn+QA81yLphm9U5UPs+foOeqa6SLFRr1FPO1OoHnHnY1F29Cb5YPOePe2y19Bosyi2iR
	ur/c5H4taCLBPIPfAGyxdsGmaFE3zlJF4eWQ3Vf9jvq8fpMlSbtYHP76eG8H7nzZ+4QnSRgLe3s49
	u/BhRj86fEUeJ2KQ8id4CdxG+vpHYLvaShVD3CR0Pr/kEMdVMS3HaM6q6fE1eTPfXxXYRLiEvcu0j
	ANAz4K0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnZQF-00000008EkL-0ku1;
	Wed, 04 Feb 2026 09:43:43 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnZQC-00000008Eis-0TYz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 09:43:41 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 53C841A2BE7;
	Wed,  4 Feb 2026 09:43:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 24DE960745;
	Wed,  4 Feb 2026 09:43:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D1692119A865B;
	Wed,  4 Feb 2026 10:43:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770198215; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=PWtAsLhTfJ+y5jHsYpWzRsgFbu/hEL4qAn8qo8Aj8hs=;
	b=Cg6QqlH5UgjplYLeJZvheJEIUH49IBNOZnNrsXDS75HuEkWxF+/u5DZjKduBiLw87Iyubm
	PnGEefEDF0WzKfvTR9sEbX1LPxMc/MTt98JHEmYvkZ/IrhNhMN+i1DtyRpS9VIRfpVK0/v
	EM4O+h5Td69BZpCB17TkwIr38kL/7z228stYxvCyrBqmfhqTyIQQHHUYx5Aaedg0hE0ibr
	eXCsYAl1+fK5VrsGUXY+POiVBJGb6HFdpNeRBsF9PJf9xKcI2zG6hTn53/Z8Lp0q7oUMoe
	NgRRYlDP35ZWPlLzcgS+l76RxObvn/sqs5CMdPiWkXqfmEmtlFb0UQCnyB26xA==
Message-ID: <85fe08a2-189f-4740-81e7-81a65e23fab2@bootlin.com>
Date: Wed, 4 Feb 2026 10:43:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 3/6] net: stmmac: rk: rk3328: gmac2phy only
 supports RMII
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Heiko Stuebner <heiko@sntech.de>, Jakub Kicinski <kuba@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>
References: <aYMN2gZMfLPKuukG@shell.armlinux.org.uk>
 <E1vnYxw-00000007hox-0DqH@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vnYxw-00000007hox-0DqH@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_014340_279025_8E649934 
X-CRM114-Status: UNSURE (   5.39  )
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



On 04/02/2026 10:14, Russell King (Oracle) wrote:
> As detailed in a previous commit ("net: stmmac: rk: convert rk3328 to
> use bsp_priv->id") rk3328 gmac2phy only supports RMII, whereas gmac2io
> supports both RMII and RGMII. Clear supports_rgmii for gmac2phy.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime


