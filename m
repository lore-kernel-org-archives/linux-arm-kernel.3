Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72F5BF01835
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 13:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MtGSXQd1rJ7F7WpffOYtsvHkK2yZmux9XID3eldxZIU=; b=USrBZBZpOmdBOFmuYg+kuBAJri
	QFrrmCOj2nHcdawmnbQWq4l2Rau1fwOJlRGouhyKnDuWZ2jlFe9LoD0aE1OSAw+5UsOCkcXpc/Bc7
	ZITodYgCfgmsPks5jokX79iIZOH5PZ2MZVi+04yf1N4LZugR3BHGeJ5B94NlNhcfwLZNrR3tGK4Xg
	nS63kvGrjf+JYLh4KnRpOrOvVSaQurYKqLD/MM1FTASVbTilIg/BdIHMdSLbv96Ngt2GtoPb0F0MQ
	T/CZQpB5xmj+hmaLGUaXnEN7iXT3GQH43qskoaSIoLhNLo4Jw+2nhxbLyNHwOneLaVWEWC8MzLXq2
	nFJpjIGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyVI1-00000003o2S-0U5u;
	Fri, 06 Mar 2026 13:32:25 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyVHz-00000003o1e-0HAm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 13:32:24 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 0DA25C40437;
	Fri,  6 Mar 2026 13:32:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 05F5E5FF92;
	Fri,  6 Mar 2026 13:32:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 78C9E1036994E;
	Fri,  6 Mar 2026 14:32:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772803939; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=MtGSXQd1rJ7F7WpffOYtsvHkK2yZmux9XID3eldxZIU=;
	b=syuwf17OBQRSlsgCUAuuSAuSoqGuBwfoHBbK9g4Bh9AQzCvKCyDFKN8bmPdlRnKdOk2aA5
	VB87AhBHBpX2LO5ODAZrlnihKEnT6E4qGUIBbmgJG+GU9TaDwiiVp4DXTEFjl1l3ZNBkmB
	DWbv/EG5B41lrbD3F8ZQpXF9BKZEDeD1S7Kz/AgXstteX1JnGIygade+ftEaVahkmKSFMs
	SjnnmLlvC93omtAOC+oJX7rh0eLn65jRgr8dw5WmzANFwfDlriHcxzeNK4eOdNFrqDYGmR
	VWfJdHlegT6ZvN1nCIzgcsemxAf3jSE5a2s9VVh8cop3kGZpKDlGdzWtPxlSJw==
Message-ID: <065b3dc0-b092-45c5-b7ea-e0a54264558e@bootlin.com>
Date: Fri, 6 Mar 2026 14:32:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 8/8] net: stmmac: make pcs_mask and phy_mask
 u32
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
 <E1vy6AY-0000000BtxJ-3smT@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vy6AY-0000000BtxJ-3smT@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_053223_247468_9A7BB480 
X-CRM114-Status: UNSURE (   7.59  )
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

On 05/03/2026 11:43, Russell King (Oracle) wrote:
> The PCS and PHY masks are passed to the mdio bus layer as phy_mask
> to prevent bus addresses between 0 and 31 inclusive being scanned,
> and this is declared as u32. Also declare these as u32 in stmmac
> for type consistency.
> 
> Since this is a u32, use BIT_U32() rather than BIT() to generate
> values for these fields.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

