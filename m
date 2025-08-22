Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC98ACA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zQUkrl8rtsJPM0ktg3z7UidtTXFrompQhmxTHdzewmE=; b=w7DIm6O2vKjvKI2vTH+mKf0BEp
	k5wBDbIBXASlQPxx9yBgeBfw+RCDwQyUoEQc2OAy3316mckO8u1pTM5jJCAcuouDHJWHk1J1pR2Pi
	J27GSAGYhtkXsARAgNaRdXkh5uW5TNj7/NpAEL65Kl3YiKSpq940BI4S3Jdmb8nOD2Gmc5gkvjGZu
	A8WNRXExSLqjNb45+kmif23twOcwmgl+0rn1sSBp6G4p08L2jfN7rDVB0X/o3/vlC28RHtao2Fyi0
	xNvJh2fFxXR+UvOeIl6BXsD7ATECW5sQuUYi8cggps5SOZBbgUXG3cmLm+rhSbgZ7wcbznh7g5NSD
	hb0hNCcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphoJ-000000042ZB-0QMB;
	Sat, 23 Aug 2025 06:33:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upTPp-00000002xXU-2v20
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 15:10:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8DC075C7043;
	Fri, 22 Aug 2025 15:10:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C07BC4CEED;
	Fri, 22 Aug 2025 15:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755875451;
	bh=qBAyRodyfRh78G2uxakZpehoj7ao6KSddD/e4iAX3sk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ndsnKge/6j/Z9BWT++REFN7u9tKc0uGX6xVqKti8YWkC5pta0hltDhTEfpFvObz7t
	 I7p/IoRdh/tQt8wPXqSjEW05GDJLBKPsVh8pYocv0mpBFdC+3GQeaAxgKtx3hzVm/S
	 K7VMIoNXDcum9s3cmJDwO3zk4Cuy4N6XdR7uyZbqajfcna2zj7VrVvInUAnA+xmJiU
	 Yy/+sfL8Cb/ZFPF5z5eGSl6xmjiQJDcp4PFcOej9ezDiMLS/1SFexRoCt1DuiEaqNq
	 +7Xn0hZWhcqRDIZ3H6W+Awnth0kL0A5zy3JLRf1pqbJssms1xD5c+6T6HyJnaHUZBT
	 /Tw+cGl0a1MJA==
Date: Fri, 22 Aug 2025 10:10:50 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH v2 1/1] dt-bindings: gpio: Move fsl,mxs-pinctrl.txt into
 gpio-mxs.yaml
Message-ID: <175587544961.3817064.4646134256095091634.robh@kernel.org>
References: <20250820164946.3782702-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820164946.3782702-1-Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_081053_775282_E3072F2F 
X-CRM114-Status: GOOD (  10.92  )
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


On Wed, 20 Aug 2025 12:49:45 -0400, Frank Li wrote:
> Move mxs-pinctrl part into gpio-mxs.yaml and add pinctrl examples to fix
> below CHECK_DTB warning:
> 
> arch/arm/boot/dts/nxp/mxs/imx28-xea.dtb: pinctrl@80018000 (fsl,imx28-pinctrl):
>    'auart0-2pins@0', 'auart0@0',  ... 'usb1@1' do not match any of the regexes: 'gpio@[0-9]+$', 'pinctrl-[0-9]+'
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Changes in v2
> - Add more description about over 10 years devices.
> ---
>  .../devicetree/bindings/gpio/gpio-mxs.yaml    |  80 ++++++++++-
>  .../bindings/pinctrl/fsl,mxs-pinctrl.txt      | 127 ------------------
>  2 files changed, 75 insertions(+), 132 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,mxs-pinctrl.txt
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


