Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0E80C677C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 03:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3083WMxJGdhPVKDy85ET0zx3hT4Ci5C+5H2NzpkqlAM=; b=Hkv8E+IgFZh1z8SnJHrMCvxY+9
	eude/yZdCAYu2244zba/lq+or1vc8gtTwqi1G8/Bcml3J0nw/Z5JonrQkxG3BzaRoneD4gMoXaybm
	Lt5A8avnOuLcWhva6ISY3YW26o9hu1wEmNNzTx6ILT8WaSS9HfAaia5aeWamSkod6So51i65ASKxI
	4N7bkPfBL83mKQKYjlC7zVY9+AluSHSh3qLMvMYISmV02O+ixncRJz5joL3nfsXuEzh40imnbXA2c
	kBv9Od1C+WN45CXfO7ug6CQ9LnhATvUX8m00aPwzek7nF6E7Xzhw6gvAR02t6CTbWTqwgMxA0MbW3
	iFaAXjLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPCWy-00000008mOd-4C3S;
	Wed, 11 Jun 2025 03:53:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPCPN-00000008lSo-1PR5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 03:45:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C666B49EB4;
	Wed, 11 Jun 2025 03:45:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65B5DC4CEEE;
	Wed, 11 Jun 2025 03:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749613548;
	bh=qKFJzbosf4mDCS/14sJ3cMRoNH33yesUmP64ZdIXvEQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gc6KLZH1g42eYuB7liBv7QTxpqwUqA28QQ3XBHAYv7x1kovg/fSdVwWzJ3BMgDci8
	 IgEcPTMbQ2nGCGkH/j5+/zNgHHbElvkgHA8ADGZ54aXR+A8rbEKnprD+SkyUI36ZWM
	 qHme9Py3PsAx+VCNnd7Z7A0IzoAeLzOG+FgOGsEI3Xuo0hqPne+oohnfzsWMlU3FC1
	 AT2C+pPQjw+YTC0LiaHVauPoC1+UAQklbVfkKxWgPPSVzqFGF6dkk2M9wRuc18vZyU
	 GfP/hG04V+eR0iSW9q7ce2WDIm7iOyhgF0I6KkVQ8WtubsR9elFA8i5P5uC9efUOJQ
	 q6qqnE2x0jXuA==
Date: Tue, 10 Jun 2025 22:45:47 -0500
From: Rob Herring <robh@kernel.org>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Shengjiu Wang <shengjiu.wang@nxp.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, Shawn Guo <shawnguo@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH v7 1/6] dt-bindings: bus: document the IMX AIPSTZ bridge
Message-ID: <20250611034547.GA3317268-robh@kernel.org>
References: <20250610160152.1113930-1-laurentiumihalcea111@gmail.com>
 <20250610160152.1113930-2-laurentiumihalcea111@gmail.com>
 <174957889856.2397515.16063954809229071708.robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <174957889856.2397515.16063954809229071708.robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_204549_397565_5383913C 
X-CRM114-Status: GOOD (  11.71  )
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

On Tue, Jun 10, 2025 at 01:08:18PM -0500, Rob Herring (Arm) wrote:
> 
> On Tue, 10 Jun 2025 12:01:47 -0400, Laurentiu Mihalcea wrote:
> > From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> > 
> > Add documentation for IMX AIPSTZ bridge.
> > 
> > Co-developed-by: Daniel Baluta <daniel.baluta@nxp.com>
> > Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> > Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
> >  .../bindings/bus/fsl,imx8mp-aipstz.yaml       | 104 ++++++++++++++++++
> >  1 file changed, 104 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml
> > 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml: oneOf: Missing additionalProperties/unevaluatedProperties constraint

You can ignore this. It's an issue in the tools.

Rob

