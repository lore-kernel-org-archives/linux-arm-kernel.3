Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A32CCAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 21:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N4fsZlqgDn0s+Mqns2+SCWJmqdzbbo3yrekY+LSsELk=; b=mdU9mOuUBdGndq4SzhkxQjgCed
	nueRu1bBkA9bRz9r4xaOfbnvH/xIURUgAls5tWp+gV4ldEiaEtUCc5z0ux52+7muuOKtjtYSv+ZFC
	xVq81jXDO1qzN+1JH5UhcVDNnLZ9GNxfakY+RXiIG2zljqWX6+BdRWCSzSSNIjPiwr2REDf+T47sK
	sfmzIQjvpZBve/kjnklqMz/VSGC2DS9YqZ58QjjL4NVCZCz9HskYsFU1Div1yeVVPZvR3OmcdkZmN
	Z2fGpHmyR+hM4rPw0HFR9GF9Lj1qaeeh1kS+Urw4AcvI0IK25DBpG6CWn3qGrARzEJr6qh9W81bUG
	Qdt+9mzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyGKX-00000005eOm-3dpO;
	Mon, 15 Sep 2025 21:01:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyGKU-00000005eOF-1DVh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 21:01:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0761D41B70;
	Mon, 15 Sep 2025 21:01:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC465C4CEF1;
	Mon, 15 Sep 2025 21:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757970100;
	bh=xX1+Xzo/jnAGqPyi6iInTfds1bV2ZowlmfSy9qbmmH0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hJkfs+JIKfs5Jf8AGEvLxosKPDC29qQYBhJpbj/7gDmI0w1JtX6lFdxC+EqxUjiur
	 w4ConOZpT7DRJzawNlbc3+1s3G5WHKlGGp7v8MFu8uGlUFa+5BKydGw7uGCWqNuGgb
	 tXKpxDwfkKoyjICqOIdo3nyAcumGzXLDH/JKwAE0nOzo3We8LIHST/uCQe8nQhy7YJ
	 wXTj7Cye5eguUl8fUndI318DYAo0jjPL2GQMR3S7oAaB/psB/HgcKuJ/hfu7IOtRo8
	 4t5Rv9dj7yHIBRs8G2lK9VE93Sso1E1T/NitRsT5w0Pv6RfHMPRazZNP0hFSybkkZJ
	 7X33ctnoqRx0w==
Date: Mon, 15 Sep 2025 16:01:39 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: =?iso-8859-1?Q?J=2E_Neusch=E4fer?= <j.ne@posteo.net>
Cc: Conor Dooley <conor+dt@kernel.org>, linux-sunxi@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
	Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
	Samuel Holland <samuel@sholland.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: sunxi: Add Amediatech X96Q
Message-ID: <175797009935.3384023.4009992725320048640.robh@kernel.org>
References: <20250912-x96q-v1-0-8471daaf39db@posteo.net>
 <20250912-x96q-v1-1-8471daaf39db@posteo.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250912-x96q-v1-1-8471daaf39db@posteo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_140142_348911_F84DDDBB 
X-CRM114-Status: UNSURE (   9.48  )
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


On Fri, 12 Sep 2025 01:52:09 +0200, J. Neuschäfer wrote:
> The X96Q is a set-top box with an H313 SoC, AXP305 PMIC, 1 or 2 GiB RAM,
> 8 or 16 GiB eMMC flash, 2x USB A, Micro-SD, HDMI, Ethernet, audio/video
> output, and infrared input.
> 
>   https://x96mini.com/products/x96q-tv-box-android-10-set-top-box
> 
> Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
> ---
>  Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


