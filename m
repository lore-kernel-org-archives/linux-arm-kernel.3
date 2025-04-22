Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02F25C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 14:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tsL0b8LmQehY0czbqzK7Rw74/5fiSY16t6j1wxTfEcA=; b=GqHWKI/6BXb6hUZAF9Y+T4gjW4
	5v3362qJGo6QUkJwX6T9brasLLJoY56bqUBOaLwVuHiFcLOymy+oZbJFzS24b/mgwZci/3893ci3t
	p5lTcBJYAjRtj0sln1C0wbhRmFM6vtLhq9cmA27XU5kzfY/KD+D41DTsCYDF6R8IVnH9rPBUgI7G/
	2woyz/+PidnKijSPkAVO6B9ZtwRlyi68esmh1cuTbWCbCbPWOHeR3Qhr5ghh+RrEcFj5BhIJZwurJ
	PIKGvD9GY9CKu2NXW5AzdN2ZPMYjTngvYz6TXXNiHjbUkwx7q/6JXbFqA1+yw6plZ6VL5YXxpm0fZ
	Pvj+co3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7EZv-00000007U85-01bN;
	Tue, 22 Apr 2025 14:26:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7DNm-00000007F7v-3Yip
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 13:09:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5878B614B7;
	Tue, 22 Apr 2025 13:09:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7313C4CEE9;
	Tue, 22 Apr 2025 13:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745327390;
	bh=BEx2KaD/mS0zMAQs7LahMUkYPebN7yNtc+yXj3QXDNU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gZpXQOku0cTPUuOLSbem5KBzHMXQSFgGD8UvL8Bgola6TijHA8i8dI1fZdJa/SGrs
	 rJNrQ5e04CMvgjkjAhWWs0ec2zqbALFifzOWPV95KK5wCr97J1BrTHtDofRONx4BsX
	 /k2pnqBXqQdJ80q1fcKb1bnDtUITwsgQitg/KArtlIoxKMtp8Vu/QlFy2Stfo9Ft6G
	 +EGu0N0A38sFznGSmrzYK96HsDFWEg1i1PZkzCbOM5H7DpblLsTeadhI5mVAWoIdSo
	 eh42bm3b1zB0+lHI21J471ba+CWMHqvHQEerCjjuMc9OX7r8WwMJZb/285dET8PUwK
	 FZAh94y2wi5eQ==
Date: Tue, 22 Apr 2025 08:09:48 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: NXP S32 Linux Team <s32@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	imx@lists.linux.dev, Jacky Bai <ping.bai@nxp.com>,
	linux-kernel@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
	linux-gpio@vger.kernel.org, Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/1] dt-bindings: pinctrl: convert
 fsl,imx7ulp-pinctrl.txt to yaml format
Message-ID: <174532738787.1019688.10866076280609935749.robh@kernel.org>
References: <20250417152158.3570936-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417152158.3570936-1-Frank.Li@nxp.com>
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


On Thu, 17 Apr 2025 11:21:57 -0400, Frank Li wrote:
> Convert fsl,imx7ulp-pinctrl.txt to yaml format.
> 
> Additional changes:
> - remove label in example
> - fsl,pin direct use hex value instead of macro because macro define in
> dts local directory.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../bindings/pinctrl/fsl,imx7ulp-iomuxc1.yaml | 99 +++++++++++++++++++
>  .../bindings/pinctrl/fsl,imx7ulp-pinctrl.txt  | 53 ----------
>  2 files changed, 99 insertions(+), 53 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx7ulp-iomuxc1.yaml
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx7ulp-pinctrl.txt
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


