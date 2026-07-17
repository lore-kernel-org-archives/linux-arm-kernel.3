Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 238ACC4451B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 18:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P1b9DeYrFDNJXSmhHkvkSVwxA9oSUUdj93hOLCrfhtk=; b=E5Epmqr4mkSJw9mB0G4mL23Vhz
	Z+5e2VevdsYI8YV3mgFOo0ViDz+miGnrKhHQ6DJSv58rg7SywlcVzFYhwCbov1j4AF/m6LN5EhfvD
	+A+m9wBdZFi7Iq1w8ucw7ZKQ3EMpxX2SHFPCqnghKcubn8lHDEYSpj/WikwfseW/PHGFvZnH37fKG
	SMrEMdfl+Yq7ZSUyM42hmKNIxQmDgEyJGsIFBMK8+GRsNSvyOb/oVE25NC8MnLUWGD7eab92Df+gW
	XPqjF8uitkutX6V1KD6iCYjiVZzMbn736LCmeJTemMQdQ4+qh5q337cpyUieLGmSdKNaRd5sV73v2
	AdoRwvrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wknXW-000000032Sl-0kGH;
	Fri, 17 Jul 2026 18:44:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wknXU-000000032SD-2lRf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 18:44:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BD43B600DA;
	Fri, 17 Jul 2026 18:43:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52B051F000E9;
	Fri, 17 Jul 2026 18:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784313839;
	bh=P1b9DeYrFDNJXSmhHkvkSVwxA9oSUUdj93hOLCrfhtk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MbJV9CL39vRQMy2v/CN3jcpLY6clKVcc/kJEtuwRWFP5I6XZWtmd0F374u+m0u0LP
	 Z8aSfnF6sBxzl9bNULI/oiKqnkmBZVMxLhQjV72/+84dDvvUAw+1eHq/LN5OqR1EOV
	 EOnDSqwZytgo1rXC2lnnrfPKOralZwgqYCb3jVbR40l2nfZWFPpri/Oc6CQqMay2Im
	 Ub6NfcUc0ehh9cqiA2a41ayCfi0/61486Qik2KE+VcxaKX4RGW3rc+u+2Z9FTCNUT3
	 tQqJZDgP7wS0kMUizFUS8PhNnhNo5vLFmSq+Mc3Ox45WkgQuOmKIA6rqXB08WBP7gz
	 tx4OqaF8o+u8Q==
Date: Fri, 17 Jul 2026 13:43:58 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank.Li@oss.nxp.com
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: soc: imx: Add fsl,eim-bus
Message-ID: <178431383816.1803857.6272472582726116965.robh@kernel.org>
References: <20260708-imx53-eim-v1-0-913b4559e5b5@nxp.com>
 <20260708-imx53-eim-v1-1-913b4559e5b5@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708-imx53-eim-v1-1-913b4559e5b5@nxp.com>
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


On Wed, 08 Jul 2026 16:00:44 -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Add the fsl,eim-bus compatible strings for i.MX51 variants.
> 
> These compatibles are only intended for existing legacy chips (more than 15
> years old) and will not be used for new device trees.
> 
> Fix below CHECK_DTBS warnings
> arch/arm/boot/dts/nxp/imx/imx53-ard.dtb: /eim-cs1@f4000000: failed to match any schema with compatible: ['fsl,eim-bus', 'simple-bus']
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  Documentation/devicetree/bindings/bus/fsl,spba-bus.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


