Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04887CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 07:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DXSbtNa/8HGcN26NDfFmNPbrsVA0ceNG7FgLoJ6Ziys=; b=KYmJAigQRHeUUWpG29/ag9vq+3
	uTQ0c669PCnXNYbPADUC2e1OLkZIoLrghPY5lVmMhchoelXMS5OIIhw8yr9FzYHP9TBv7LFq5dG1X
	KeL4+JG7zTxQlOsVi5xFzY+2ls4mHhhaGAnAftoN1UwmQB3RYfcI0z3Qx5xjzwxPzEI6N3GcYYtC8
	3lV0BEid+la7+saaGDdaZgge9b1jWmewxfZMkBP2PWD5Bl9EyMfiXjMDhbzY6BwpffmkEvQ7oCtNo
	EFJlmZ4+B3cU03y6xpw6gVVsC7DPvl1iw+6MGLKvTu765KJxazuCz7v5/X6zn3oPrJIqZWI4YNbpM
	xmYmDdmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIil5-00000006gR6-01K2;
	Tue, 11 Nov 2025 07:25:43 +0000
Received: from mail-m16.yeah.net ([1.95.21.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIil1-00000006gQn-3CHg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 07:25:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=DXSbtNa/8HGcN26NDfFmNPbrsVA0ceNG7FgLoJ6Ziys=;
	b=kuZ/33BO1A5NZNYEaLRHjhouKPLdrH7xX6pZHYgBgZKhpT/Q5SoGP8/CZTh+SM
	R81shMTV6w0+O/8jxL4woap2+7cqN9vGzsuIal3uN0f9yT8voCbd+dX7O+mHUhZs
	eUon3+QD+qriOHSny9y3lZ2pD8SGBR6HLIFbjaAp3h1VM=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgAHhmfi5BJp+fTBAQ--.5059S3;
	Tue, 11 Nov 2025 15:25:24 +0800 (CST)
Date: Tue, 11 Nov 2025 15:25:22 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Richard Cochran <richardcochran@gmail.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH 0/8] arm64: dts: imx8dxl related fix and minor update
Message-ID: <aRLk4uAnXFyMAzEf@dragon>
References: <20251022-dxl_dts-v1-0-8159dfdef8c5@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251022-dxl_dts-v1-0-8159dfdef8c5@nxp.com>
X-CM-TRANSID: M88vCgAHhmfi5BJp+fTBAQ--.5059S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7Jw1rJF45trWfAF15XFWrXwb_yoWxKFg_u3
	90gF1ku3yUtr4fJw42van5u34UKw48Ar1DWryFg397X343XF15ua4vv395W3yxXFW3Zr1D
	CFyUJw1xXa15WjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbzVbPUUUUU==
X-Originating-IP: [117.80.155.87]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiOQVRtmkS5OUapgAA3d
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_232540_119072_EACD96DC 
X-CRM114-Status: UNSURE (   6.76  )
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

On Wed, Oct 22, 2025 at 12:50:20PM -0400, Frank Li wrote:
> imx8dxl dts some fixes and minor update.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Frank Li (7):
>       arm64: dts: imx8dxl: Correct pcie-ep interrupt number
>       arm64: dts: imx8dxl-ss-conn: swap interrupts number of eqos
>       arm64: dts: imx8dxl-evk: add bt information for lpuart1
>       arm64: dts: imx8dxl-evk: add state_100mhz and state_200mhz for usdhc
>       arm64: dts: imx8-ss-conn: add fsl,tuning-step for usdhc1 and usdhc2
>       arm64: dts: imx8-ss-conn: add missed clock enet_2x_txclk for fec[1,2]
>       arm64: dts: imx8dxl-ss-conn: delete usb3_lpcg node
> 
> Shenwei Wang (1):
>       arm64: dts: imx8: add default clock rate for usdhc

Applied all, thanks!


