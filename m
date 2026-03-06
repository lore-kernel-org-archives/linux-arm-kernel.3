Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA7B8F0182F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 13:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5qjLEAIOM/x5LTkseOtlz5V4adYllqJnixHsyNEVKMk=; b=l++eP+B0ZdlWKgsohWzLRgJC4i
	uqwUzI05mSuMjV4/QtLzDdI7tuVUAOpc5n90zRarxkWh4IWAyp0x1U7/pEgLr1O8S2wGng4WIdrpP
	sFFQW/TfbS30ybz720uewBHfRafTZg6YZ2198jp5RPR1Vn7sNBkeuCTD27tG9xixVl9uOhj8tTPey
	+6fv4ZT6ZmqfqXalhlbMdrG171/0jm4NE3v8/5HrM2Sw70Hm4c8HZJYYPvi4dVwrYDAzamRMmbaeV
	eGzlHt1Qz58DpRjOuTdUbHDYfjAuVssAaN8DlmmoLehZB/ZYKpEYR43pxCr/ioWimYDN8nOpb5vUQ
	ZareDLxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyVH8-00000003nsl-3EpW;
	Fri, 06 Mar 2026 13:31:30 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyVH7-00000003nsG-0DP5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 13:31:30 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A88F51A2D49;
	Fri,  6 Mar 2026 13:31:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7F07D5FF92;
	Fri,  6 Mar 2026 13:31:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6BA61103699F4;
	Fri,  6 Mar 2026 14:31:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772803886; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=5qjLEAIOM/x5LTkseOtlz5V4adYllqJnixHsyNEVKMk=;
	b=dSp9M74cgTh3Myvz930z+Pkb8FeyXYlq/Xbl8c9f07aZ4QW4SevEdAzFaAMH0nhC9N7PwR
	/Grp2B+bQXDwC4xqRIFmrJBeDK0YDV2TCsmPesgfAzOTXPQQg6iwoCtcJ/LguHRXl4SXlJ
	ky5CVrr7zFu6ydudEUBsM4Y+D+J219l3yNE8GJqMyMMVNuAT53GO6NSX3V0EORX4QyK+n+
	aQJvzszeUnoBmiXC1udTHzI4SnjhlTGMqkLnPDbnT8luMdezeKY69ONQvyLNKyoeRkGgvB
	4+4Tft/fcFOWW7BhMqUwS/pVH//zfnermFLGlObfDxKkeZJoANyzJxQwUZErug==
Message-ID: <310c465e-0956-48ca-9887-cdd1ad0db58d@bootlin.com>
Date: Fri, 6 Mar 2026 14:31:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 7/8] net: stmmac:
 mdio_bus_data->default_an_inband is boolean
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Chen-Yu Tsai <wens@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 Samuel Holland <samuel@sholland.org>
References: <aald--qJquWGIvmO@shell.armlinux.org.uk>
 <E1vy6AT-0000000BtxD-2qm7@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vy6AT-0000000BtxD-2qm7@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_053129_227394_DA4A5894 
X-CRM114-Status: UNSURE (   6.59  )
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

On 05/03/2026 11:42, Russell King (Oracle) wrote:
> default_an_inband is declared as an unsigned int, but is set to true/
> false and is assigned to phylink_config's member of the same name
> which is a bool. Declare this also as a bool for consistency.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime


