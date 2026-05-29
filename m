Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A843CD6E49
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 15:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eb8nb8fScTBwcXSgw+9Ix5UCDWfyVmuJGL2kWpyLZjY=; b=yeHoeDCklwASZYhuCyJn5okL0x
	d1JX1NHVMdRydytoeRuuZiRYZu/Lcz27CKuzDAwBEvq2htBr9N/Ruqu65VGQvUKjDhuS/OC1lF+Zc
	t+PuEgPRj2pkgqOoxytqu30bOIE7aUhrFskG9b/OqA4wxmhvfk6K7WB+kK7wKDZ8SYpCkrIC7vPFE
	avXSCQyQtt9PsWvX4qKjibjMQDjhf8mNECaiiC5VrpuvYUTMsBFmXyZNY+mRV3O58nbnuzKl8aH6/
	mtsg5TPp7jHpmLmf/wJSdxeMeX9TjxThR7ssEfegDT5fxiJxVv9yowPVjilEP6P4ZzEq12t4OfpJx
	phEY+UZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSzPG-00000007j9V-2CF4;
	Fri, 29 May 2026 15:45:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSzPE-00000007j9I-18fo;
	Fri, 29 May 2026 15:45:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 309E1605D0;
	Fri, 29 May 2026 15:45:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55D491F00893;
	Fri, 29 May 2026 15:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780069550;
	bh=eb8nb8fScTBwcXSgw+9Ix5UCDWfyVmuJGL2kWpyLZjY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AbOO1yPycW9O3NJSH2EN0ltj3+bAVSFepl38eCrMztR7HEPcDhMdHnk9RF3JMRt2Q
	 CcptiCk7B9RnAMPrxYLsGVS7lQ2TnNjQieYhfu3EsGjBiqR8gNHkFifOZwgybVES9O
	 WtlWUwP8cbvXqTkV3LTqBFOyeI1qQ4RSOQfqAY7txpWrWD5A4Z1FtpJkiaXzrN0sMV
	 XWpJB4AbhiTi0bJzCFQVGn04HOuFFgMvfujIQEbRdweGWJh97JpBn0cR9Le+c8s296
	 RKzAG/gnfEE/dKtM3ceHxIerCdOPdl1yr/sdLyRJCyfZTM4ldxmaZ5KCMGQPTTQ/DV
	 H0Zj2qBkCT1Xg==
Date: Fri, 29 May 2026 17:45:48 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, Ying Liu <victor.liu@nxp.com>
Subject: Re: [PATCH v23 3/8] dt-bindings: phy: Add Freescale iMX8MQ DP and
 HDMI PHY
Message-ID: <20260529-aquatic-industrious-lorikeet-b81aaf@quoll>
References: <20260519-dcss-hdmi-upstreaming-v23-0-5615524a9c63@oss.nxp.com>
 <20260519-dcss-hdmi-upstreaming-v23-3-5615524a9c63@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260519-dcss-hdmi-upstreaming-v23-3-5615524a9c63@oss.nxp.com>
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

On Tue, May 19, 2026 at 02:42:26PM +0000, Laurentiu Palcu wrote:
> From: Sandor Yu <Sandor.yu@nxp.com>
> 
> Add bindings for Freescale iMX8MQ DP and HDMI PHY.
> 
> Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> ---
>  .../bindings/phy/fsl,imx8mq-hdptx-phy.yaml         | 52 ++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/fsl,imx8mq-hdptx-phy.yaml b/Documentation/devicetree/bindings/phy/fsl,imx8mq-hdptx-phy.yaml
> new file mode 100644
> index 0000000000000..b544c260aa073
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/fsl,imx8mq-hdptx-phy.yaml
> @@ -0,0 +1,52 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/fsl,imx8mq-hdptx-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Cadence HDP-TX DP/HDMI PHY for Freescale i.MX8MQ SoC
> +
> +maintainers:
> +  - Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> +
> +description:
> +  The Cadence HDP-TX DP/HDMI PHY is a child node of the MHDP8501 bridge,
> +  sharing the same MMIO region as the parent bridge node.

As commented in bridge bindings, I have doubts in such case it is a
separate component.

Best regards,
Krzysztof


