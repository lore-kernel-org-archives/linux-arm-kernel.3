Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5093AC3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 21:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ybir7tfTAHb1IAwCZdx4uOJ0VlyfrS4XL0hUQYNhB+Q=; b=F4jUyiGGz3t5bcNCFzY2r89PqD
	eRwsYJEfKGHiTBHnHcYhtUOCNta+YqMNplnz9tBT3F9KYK1LpT4I+ZgZiPIkWpyWnSpSbW2+Wcbpd
	61xTGUzE/zBLvMGjX12B5PFlR/+2MbUWHm0/8kl5bRRu15/UiOCvLzWAWpNUQbTCiCHPGKG/CmADk
	unHnoZyigadOJliEHYE5gfqGOdsM1OmAXwHctOnbMtW/txidtTopDkiZIVdeWL9VHWq8EdQfDN6lY
	YM9f2+vxy3jknP6ZjhG7cEalwXkWlBtTQ7ZX8kcn+nIX0SNxI0ssBOwrvaeRUB+A9Owp/W24xbMhb
	0W88uiWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2z9V-0000000BsTH-1grl;
	Thu, 10 Apr 2025 21:09:37 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2z7B-0000000BsHz-3SoN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 21:07:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 664FAA4AA46;
	Thu, 10 Apr 2025 21:01:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69BBDC4CEDD;
	Thu, 10 Apr 2025 21:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744319232;
	bh=KwyzvKEFF2j5LkPa6b0yQ0XGOhj8/U4qBjPGsD96guw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rnE6spxUyg5djIvitXPXVeyRhdmU+5eVVtmfhMDcYPzjQCjBYBuwmHYxdZDyXNXAF
	 qQca0offnA82uwYeRkGXieqswdVKZC81jKkc8Dkchby+7RlejDCbc+ylspa+EJfKkh
	 qEEugRAAns2xCVAj26UkSsM8eWjBDVOrJemZ/MkDVpRT3OIS6JJCPNDrCX32wLZvA3
	 sqLKfbobB2UVWOfATbGFXrm0aduOrdPOBKPNjUDa2RP0iAwkcF1HddGiNIF1g25pOQ
	 nH6G34EiRLKcQgzyjvFZ8vx486JubmUpNq7JIyep8jU3IrIJSJ9Nssc965nvhwEK60
	 ocf/0iZilHBNA==
Date: Thu, 10 Apr 2025 16:07:11 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Shawn Guo <shawnguo@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, linux-watchdog@vger.kernel.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 1/2] dt-bindings: watchdog: fsl,scu-wdt: Document imx8qm
Message-ID: <174431923074.1071351.3036987096266250197.robh@kernel.org>
References: <20250407-imx8qm-watchdog-v1-0-20c219b15fd2@bootlin.com>
 <20250407-imx8qm-watchdog-v1-1-20c219b15fd2@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407-imx8qm-watchdog-v1-1-20c219b15fd2@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_140713_927676_FAF8EF48 
X-CRM114-Status: UNSURE (   8.89  )
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


On Mon, 07 Apr 2025 19:03:25 +0200, Thomas Richard wrote:
> Add an entry for 'fsl,imx8qm-sc-wdt' as imx8qm also contains the SCU
> watchdog block.
> 
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
> ---
>  Documentation/devicetree/bindings/watchdog/fsl,scu-wdt.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


