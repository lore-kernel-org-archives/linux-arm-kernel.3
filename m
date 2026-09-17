Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47FF9C982D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 19:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z07HpcYlhwHodL3ye2mQgooQL6Uz9WogsMUi++p1LaA=; b=WNwuugUfmR/jOsvn9q0UpzmnPu
	LhMW0hXeoCGrgaCsje7OTi9b44XOtLyBHuTnHc5wXMtOIQuKtjQVM0Dp/covf4AsXsQO9cMVTYXnE
	lmmGAuq1qIohQ+Z4Ndfxq9E5+/9Cc3LURBU3zOasNPdPVi3qGoHvzwf8jsWFkTuM9QjTN+N3EwFLu
	qjUGuHBrbqajiPGOHPm44Ct2991y5lZorCWykQ5MYFiRjxPeXFyLdXe4P3SmwUoNd4wEyJinxlEBI
	YBwSa3WHpgYLynEDFfB44aX5+MKAwy5E0/vtP5fZLxtqXd2+/xwKkOOBQE5emHudvqzhDc+5ee+D5
	jHNZbDhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7I2J-0000000CMKf-16Y4;
	Thu, 17 Sep 2026 19:44:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7I2I-0000000CMKT-2Yqm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 19:44:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BD09B601EF;
	Thu, 17 Sep 2026 19:44:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F8041F000FF;
	Thu, 17 Sep 2026 19:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789674285;
	bh=z07HpcYlhwHodL3ye2mQgooQL6Uz9WogsMUi++p1LaA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LqqcNAmNWvu7NbTwoSvEh66Rea+4ZghlnyP0HFQoU0gzVEN2UZ6GV1IYz4jWhJv6c
	 XLvzky5mU1vPuAWcSWzmU57Bp/DNc9+OrYQaFu5i6EhYbSBSpsUxMRWu/zqD5FgK7Z
	 s6bzhKtIYm4ndidctAiZGS0MrXPG2wpuoJdFx7E0sRak6n9O1vhCFs3rTtBztF1bYI
	 KgaOTONmvV1NlbQQWa5sZSpEthvn3U5tP0YSJVBPMpUomsg/Ta45pVMI8iHmSLwFLj
	 h9lnGOjdoF9fx7cow20c8mBW0hnnl2T1BJnS7VoXUjs/+KbK0DH7663g0eu1PxIQ25
	 qVrxFmL13L97g==
Date: Thu, 17 Sep 2026 14:44:43 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Bhargav Joshi <j.bhargav.u@gmail.com>
Cc: m-chawdhry@ti.com, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lee Jones <lee@kernel.org>, devicetree@vger.kernel.org,
	Santosh Shilimkar <ssantosh@kernel.org>, mfd@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, goledhruva@gmail.com,
	linux-kernel@vger.kernel.org, daniel.baluta@gmail.com,
	simona.toaca@nxp.com, Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>,
	Nishanth Menon <nm@ti.com>, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v4 2/2] dt-bindings: mfd: ti,keystone-devctrl: Convert to
 DT schema
Message-ID: <178967428309.3457234.10592434687912307277.robh@kernel.org>
References: <20260901-ti-keystone-devctrl-v4-0-2922f2a44792@gmail.com>
 <20260901-ti-keystone-devctrl-v4-2-2922f2a44792@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901-ti-keystone-devctrl-v4-2-2922f2a44792@gmail.com>
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


On Tue, 01 Sep 2026 05:08:13 +0530, Bhargav Joshi wrote:
> Convert the Texas Instruments Keystone Device State Control binding from
> legacy text format to DT schema.
> 
> During the conversion, the following updates were made:
> - Add "simple-mfd" to compatibles matching existing dts usage.
> - Add required bus properties #address-cells, #size-cells, and ranges
>   which were missing in text binding.
> - Document child nodes gpio, interrupt-controller, and reset-controller.
> 
> Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
> ---
>  .../bindings/mfd/ti,keystone-devctrl.yaml          | 90 ++++++++++++++++++++++
>  .../bindings/mfd/ti-keystone-devctrl.txt           | 19 -----
>  2 files changed, 90 insertions(+), 19 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


