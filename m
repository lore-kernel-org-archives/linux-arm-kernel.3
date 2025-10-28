Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4698CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 10:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qYkSNjVRC4huW3BOIeZ7ligdjSUf5E+H3Pi1sGaKGTU=; b=MMs5xlDDFU/Mt9o6Rp66CWpD6e
	WSuiWXnk7ipfEqZxyiQWXjg0AX6zumutMHg3wRWwzcBsmDcqjQ4HUrSrXm2lJyZqAJ3gsqjRnCbaU
	L69Zq9zxDf2ZdzPkba7SSxWKpNUabRgkHSiofNkosbIheMLZEDpZoKbIIOBpKkt3/aecXfEB6ybXh
	/pvNAPT1KziiUvhzjZ//j5xMpe7U/1rqtbp2eTXZYJCOu5SofQd2I5QFxVkmtuvBlDZ7i7FP1YHO7
	wlqMmt8NIcAZawn01kewit4R6iw+CJBKlFzguzANd3QsfOKcUsb32lH9exkZVLugs13lG2YIosKir
	kAVVLO1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDgko-0000000Fjcf-0Zje;
	Tue, 28 Oct 2025 10:16:39 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDgkk-0000000Fjbk-0knj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 10:16:36 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id AAF79C0C408;
	Tue, 28 Oct 2025 10:16:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C3F8E606AB;
	Tue, 28 Oct 2025 10:16:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B7D061179B09A;
	Tue, 28 Oct 2025 11:16:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761646587; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=qYkSNjVRC4huW3BOIeZ7ligdjSUf5E+H3Pi1sGaKGTU=;
	b=ZE6JGDOoX/OJXZ0LOEM3oy69yMuQAYK5M1YXgue5oYH7XCOttwhDf/7shVjzM0SdXm8+Y/
	hgJl5upKofTjs1nPPeCSZMI0w8W/bWyYCZsHzRc3+HasMQpH1y6E91LjVGmZ1G1AAZxx15
	hRZGUGv/VQ6fDfuVF7azTAiIBjrBC/x9XllDyp+Fwg8i6Ys7XnxMwCz4u+KInwxcIn9Yz2
	Db9c4onUPoBG+GVDsrFLGJbNWr2kpHUGZbtxGajI53YPSaUi8EyWJKlXiElJ1vgHhawgVn
	/H69KBXCwRSFqJ5H4K/R/Wq9gtHsM0SbutsmVmBSwIDJq4SE8h0CF74QvLROjg==
Message-ID: <604b68ce-595f-4d50-92ad-3d1d5a1b4989@bootlin.com>
Date: Tue, 28 Oct 2025 11:16:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 3/3] net: stmmac: add support specifying PCS
 supported interfaces
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Alexis Lothor__ <alexis.lothore@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Boon Khai Ng <boon.khai.ng@altera.com>,
 Daniel Machon <daniel.machon@microchip.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Furong Xu <0x1207@gmail.com>, Jacob Keller <jacob.e.keller@intel.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Yu-Chun Lin <eleanor15x@gmail.com>
References: <aP03aQLADMg-J_4W@shell.armlinux.org.uk>
 <E1vClC5-0000000Bcbb-1WUk@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vClC5-0000000Bcbb-1WUk@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_031634_380426_A3559525 
X-CRM114-Status: UNSURE (   4.58  )
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

Hello Russell,

On 25/10/2025 22:48, Russell King (Oracle) wrote:
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Maybe this needs a commit log, even a small one ? :(

Maxime


