Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F330C43327
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 07:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4wbgSGMzk51jWa7D5Al9GIHHUrhtP24S99njJMENiMo=; b=LbpxrYfrNgi7xqYrd0nf4UAcOI
	iugL1GppDfWj6tdzrECLjawFTDpYZOTqauyE4YQpEqYlghlhZyOvkhq+TlYAnS8RS/Db0Sz4rOS2w
	CM6iKEA61vD0Nbnne6p9ON8kGmLhsbkBOBmngrs9JC3RpKl79FTGwXBH8Rb2OQIUA26HZzELLaEt5
	ojgXKTAGXGoIO2PU7Rcu4aUjVRxgukD8IFwQyP6rZC9lSdJ80VyTKT8yZUhEYft3+nf7ZVoeJX4EK
	Msb/Us2aXLJMUmmDtpQjJLmzIFPuWJ8WqNvwj0FhhLYGWxJLK/gFNBmtfexIhGwe/5LtUop6A4aTM
	DfiJ7m5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wepOj-00000000tzE-0Kdr;
	Wed, 01 Jul 2026 07:30:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wepOh-00000000tz4-3TKO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 07:30:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 28E2C40AAA;
	Wed,  1 Jul 2026 07:30:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25D831F000E9;
	Wed,  1 Jul 2026 07:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782891015;
	bh=4wbgSGMzk51jWa7D5Al9GIHHUrhtP24S99njJMENiMo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cGk7AI7olGcpxuJLbo1Q/3ImofMK81M1vwbCLh3Fehm2SP3iebK9OtDHlrjLSgWN5
	 8KRcgoIHuL+CCOeSw83MwUxcNJsVWi1cimBI/l7Z5mmm1aCDFEgkloyyFbnRBRtAZ7
	 cFvofc6kf7rbaVruhqtwIZe0CgBu/JAechpcPK7HYD8OMAiXEjjNtZSk/B3+u0UmNP
	 bmBdJr25U59Q0hdoSmBol8MbHqgIMyVLbvrj6ZfM0rCmGtM+9jGzk0/Ws1jw30nJgT
	 i5KbsLUsGuoYnbxKN1GqUhn9XglryEfYw7ewFfEkcyRTrn1FO40wOXICz9AQcXM7Sm
	 4HHOMJIwGFGEg==
Date: Wed, 1 Jul 2026 09:30:11 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, pierluigi.p@variscite.com, 
	Stefano Radaelli <stefano.r@variscite.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Dario Binacchi <dario.binacchi@amarulasolutions.com>, 
	Josua Mayer <josua@solid-run.com>, Alexander Stein <alexander.stein@ew.tq-group.com>, 
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>, Maud Spierings <maudspierings@gocontroll.com>, 
	Francesco Dolcini <francesco.dolcini@toradex.com>, Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: Re: [PATCH v1 1/3] dt-bindings: arm: fsl: add Variscite VAR-SOM-MX8
 QuadMax Boards
Message-ID: <20260701-smart-grinning-seriema-846d1d@quoll>
References: <cover.1782812572.git.stefano.r@variscite.com>
 <449840f7b6ffb71b677ccf814a0294c981854033.1782812572.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <449840f7b6ffb71b677ccf814a0294c981854033.1782812572.git.stefano.r@variscite.com>
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

On Tue, Jun 30, 2026 at 11:46:54AM +0200, Stefano Radaelli wrote:
> From: Stefano Radaelli <stefano.r@variscite.com>
> 
> Add DT compatible strings for Variscite VAR-SOM-MX8 QuadMax SoM and
> Variscite Symphony development carrier Board.
> 
> Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


