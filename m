Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B7EEC8303F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 10:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fe/YxVKoC2fn46SpQ1KgS3L3WodKPIMLOl4hzG83lAM=; b=0V0GoVMJ7N8eX1UqWOwq70tfIf
	Yx0tSedluacCejRKtN4fhtbt4G19OX16CUEmiLqnSyV4dleEaFWBq6Okjng16D5sg4dVosQUqKZIX
	Uan84BppF1qLeL0Rbut48scz+0lpHvq1SRMW9OIDXRYP/EVouHvlt+GKvRRR/MvoBfCIqLCsMEd8J
	AwxPuSLF8x34beBYUmO4vFaSLW8RiP0f+vNnSdThdH9zLzCpvEMqWHgDt7FOiaU4TsaTkwE7RB6U4
	W7CiFDTtb8nZ0u48HzrHTJmdmca7+bG1wcqRMOk1Q3tE+xPX4dosfwTxorjYpCvEodijTT8N2w/zA
	0epIjiyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWv7K-000000081TS-2aNh;
	Wed, 02 Jul 2025 10:55:06 +0000
Received: from mail-m16.yeah.net ([220.197.32.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWuKG-00000007sov-0CW6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 10:04:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=fe/YxVKoC2fn46SpQ1KgS3L3WodKPIMLOl4hzG83lAM=;
	b=gkqMxnx3uoIlJH5llmNZd4DLnuRBkeFsEB58E8+ZEbFfFGqBeCw4/sRbCMLM4j
	F9Y/qF4T8goy1lXk5MrOrLEoFE19j37iBv8UWFnZfWYL35QOEg4ZlYSsLBVZxUiY
	wrt9bgvtw8hviTdpfyXWHYWLzWFWIRbvsOm7B+UnD7K3U=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgC3tuPOA2VoldwpAA--.26848S3;
	Wed, 02 Jul 2025 18:02:56 +0800 (CST)
Date: Wed, 2 Jul 2025 18:02:53 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com,
	Matteo Lisi <matteo.lisi@engicam.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	Ard Biesheuvel <ardb@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
	Eric Biggers <ebiggers@google.com>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Frank Li <Frank.Li@nxp.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Marek Vasut <marex@denx.de>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Max Merchel <Max.Merchel@ew.tq-group.com>,
	Michael Walle <mwalle@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Primoz Fiser <primoz.fiser@norik.com>,
	Rob Herring <robh@kernel.org>, Russell King <linux@armlinux.org.uk>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	Tim Harvey <tharvey@gateworks.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [RESEND PATCH v4 00/10] Support Engicam MicroGEA boards
Message-ID: <aGUDza5XRGDqfz5n@dragon>
References: <20250620082736.3582691-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620082736.3582691-1-dario.binacchi@amarulasolutions.com>
X-CM-TRANSID: Ms8vCgC3tuPOA2VoldwpAA--.26848S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7Wr4kuFWkJF4kGF15Gw1fCrg_yoWxtFcEka
	1rGF48X3yYgrZIqw13uws0qrn0qw1rXr43JFWjvr13Wr9Fyrn0kF4rt3Z3WFWUJ3WYvF1D
	JFW8Ga4Sqr1DWjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUj73kJUUUUU==
X-Originating-IP: [114.216.146.217]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiAQl+ZWhkuzL7xgAAsr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_030424_420598_853E18B0 
X-CRM114-Status: UNSURE (   6.06  )
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

On Fri, Jun 20, 2025 at 10:27:04AM +0200, Dario Binacchi wrote:
> Dario Binacchi (10):
>   dt-bindings: arm: fsl: support Engicam MicroGEA BMM board
>   ARM: dts: imx6ul: support Engicam MicroGEA-MX6UL SoM
>   ARM: dts: imx6ul: support Engicam MicroGEA BMM board
>   ARM: imx_v6_v7_defconfig: cleanup with savedefconfig
>   ARM: imx_v6_v7_defconfig: select CONFIG_INPUT_PWM_BEEPER
>   dt-bindings: arm: fsl: support Engicam MicroGEA RMM board
>   ARM: dts: imx6ul: support Engicam MicroGEA RMM board
>   dt-bindings: arm: fsl: support Engicam MicroGEA GTW board
>   ARM: dts: imx6ul: support Engicam MicroGEA GTW board
>   ARM: imx_v6_v7_defconfig: select CONFIG_USB_HSIC_USB3503

Applied all, thanks!


