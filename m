Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CE93C54EFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 08:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gUsBndRwmc1hZjQd9pJ5nwb3nA74hWaZOuUDifXoGHE=; b=d9snUFXhN7aXsAsc8jpQfLNy5h
	XyCMYHSCXQpdMKCq5059Wk1Cj/ZMzeYN5Lp+Ae4WoxsNWC3zlA++c1WB8HT28dkBC+2GfrNwQjoU6
	WG9966jnrcpJlCdHDPrY48//EpD3GMxMU9ArfkfnPu5xDfNSB7p5HvpItPiyo56scgXRyI86PVzHA
	jb/e7GRUbgqMDZQ0Gb7JC0UFlVvApnvcfW9M5IyLaZDcI9de9xt5oXTpeBaiUk+XxCdy/oejQHwz2
	w+t0HJ1n4oFh/fAG1xH+uM4l/ZRO8lQtGEi9AHCzSsrRjGqxxJcDm2TXLBnRFPAqbGn9BQX4oOuC8
	sMvp38hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wodNU-00000004jyA-2zt6;
	Tue, 28 Jul 2026 08:41:32 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wodNS-00000004jxf-1LhN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 08:41:32 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id BD0B94E40FB7;
	Tue, 28 Jul 2026 08:41:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8748E601BF;
	Tue, 28 Jul 2026 08:41:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0336911C13E89;
	Tue, 28 Jul 2026 10:41:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785228079; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=gUsBndRwmc1hZjQd9pJ5nwb3nA74hWaZOuUDifXoGHE=;
	b=AinXWGwXvCvlk7dT15nWX8YgneTLXKLjZjEV2bU1lfxDG3N0XQ+MyhZWbHXhEoEiWGAQ8e
	qUXn/Un1nSldg5d3R2zqAkQgQPweFDwYufgzSzf4xOm8k0wOElY4rALF1xe8+NJYMBxRD6
	egn0JjwaKx7aQmfTIUkMAQmPpo2c7OECHsbOGjwrVTApnmQNURvxIZxaJojDI7qyLLGmlP
	+cy6/avrJNJq+1GN3EKdXoWQvPztjm3rTX+2mcbbTU4MKl2sZGN2AEDcI2eCVETPOEQ77S
	QkeGO3D3tuW9L69oTKbZqEbdTW/Nduxls3xjHYhiuQpVib3goOnbrmo5WeQMgA==
Message-ID: <2c0c6864-99ea-48d6-a889-c886bb91c351@bootlin.com>
Date: Tue, 28 Jul 2026 10:41:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2] net: phylink: add phylink_pcs_loopback()
 method for PCS loopback support
To: Zxyan Zhu <zxyan0222@gmail.com>, andrew+netdev@lunn.ch,
 rmk+kernel@armlinux.org.uk, alexandre.torgue@foss.st.com
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, hkallweit1@gmail.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Oleksij Rempel <o.rempel@pengutronix.de>
References: <20260727120704.2319467-1-zxyan0222@gmail.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20260727120704.2319467-1-zxyan0222@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_014130_510963_FD30F387 
X-CRM114-Status: GOOD (  11.52  )
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

On 7/27/26 14:07, Zxyan Zhu wrote:
> Some Ethernet MAC drivers (such as stmmac) need to perform PCS-level
> loopback for selftest purposes when no external PHY is present. Add a
> new phylink_pcs_loopback() method that allows MAC drivers to request
> PCS loopback mode through the phylink framework.
> 
> Implement the pcs_loopback callback in the stmmac integrated PCS
> using the GMAC_AN_CTRL_ELE register bit. Add a helper function
> stmmac_selftest_get_pcs() in stmmac selftests to unify PCS lookup
> across glue driver PCS and integrated PCS. Update the selftest
> enable/disable paths to use the new helper.
> 
> Signed-off-by: Zxyan Zhu <zxyan0222@gmail.com>

I'm actually seriously wondering if we shouldn't just stick to MAC loopback only
for stmmac selftests. I even have a patch ready to send for that, as I've
been struggling with selftests in the past days because some PHYs will
either stop their RXC while in loopback, or bring the carrier down which
makes the dev_xmit drop the packets we're sending to ourselves.

Using an external loopnback (in PCS, in PHY, somewhere else...) doesn't
bring anything to the table given what we are testing today, which is
internal stmmac behaviour. The MAC loopback (on dwmac1000 and dwmac4 at
least) happends at the GMII level, so everything we are currently testing
happens before that.

If the goal is to validate what comes after (RGMII, PCS behaviour and so on),
I think we should instead add some other, more generic selftests that aren't
stmmac specific, that we could run on any netdev, such as the ones Oleksij
has added in:

  3e1e58d64c3d net: add generic selftest support

Maxime



