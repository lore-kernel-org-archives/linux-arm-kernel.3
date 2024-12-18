Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA701E77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 19:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NTBZ1w2A4/OMF7++qFZpHOE+/Yr7dRTFL5zNyewIZYg=; b=nRSKyDYivEGrFyPB/34qCMW4g2
	IfUmEyy68fFVhoZx11iQ8YOOboblBqZTj3NaOryKCR2IfNgPaFhhHU18xsOnP9pt98DawZyQ8XzY7
	UrY3JARykiR1ti2FlmMr55HUR98+gI1GCqEFExdb6S1kN7q/18XhjzzObIJx2RB8SYhDUOYAJSQu4
	JuU/cOR9uI3GOtwYwS/z619kFFfOi2rSl5zD0YSnMEz1D47zaLYUr1CUgQ41FUetW5lUD0lbGSGG9
	RQMOBVTFPUJbozuf5UgBtcwsPkbtUi5pRtUCNmww1d/SDQetfv5BEv/gAPb0Nxce0n1x+WYcOR6az
	k8nb1/+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNzZI-0000000HWSa-3Anm;
	Wed, 18 Dec 2024 19:18:48 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNzXx-0000000HWEG-3c8z
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 19:17:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2B2755C6408;
	Wed, 18 Dec 2024 19:16:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88D03C4CECD;
	Wed, 18 Dec 2024 19:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734549444;
	bh=MMgWmbqg6K+lSyt/F3/mvnVPj8/GqjrXyOQNEHr516c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rZCO0kdcxw/9ayBBtj6A+YrvDLWywmSB2C6180mW9DTxuqcsu4OeNIsW8LSvURY1X
	 YtXAWomT/W9m5R2oB2N0mHq+2PUpyVVio0NwSIhErSVAKNusAP69lH8HSsDNlnwKdA
	 DMRdROeIsJw9fTpHO984NbJXYBRyteaSf2bwGzP8L2kIkXcng9oeQI600u1Gk7T59c
	 8DO3Kp3BFPhsuY2B35PunGtd91UzyPJECPT2LZ51/acwpOxrjOMxiyUVA0yT+4mFLq
	 zJbE0pGBQ7P/egJCub7l1JFOuApqlxL2/eYd1tOmy3JuAuShx/7/S5Qwn60O7v5aZy
	 xJFbWvpmcztMQ==
Date: Wed, 18 Dec 2024 13:17:23 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: devicetree@vger.kernel.org, Peter Griffin <peter.griffin@linaro.org>,
	linux-kernel@vger.kernel.org,
	Will McVicker <willmcvicker@google.com>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, kernel-team@android.com,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: Re: [PATCH 1/4] dt-bindings: arm: google: add gs101-raven
Message-ID: <173454944244.2180961.12803549865520284851.robh@kernel.org>
References: <20241216-gs101-simplefb-v1-0-8ccad1830281@linaro.org>
 <20241216-gs101-simplefb-v1-1-8ccad1830281@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241216-gs101-simplefb-v1-1-8ccad1830281@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_111726_001819_842FABCC 
X-CRM114-Status: GOOD (  10.51  )
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


On Mon, 16 Dec 2024 13:06:26 +0000, André Draszik wrote:
> Raven is Google's code name for Pixel 6 Pro. Since there are
> differences compared to Pixel 6 (Oriole), we need to add a separate
> compatible for it.
> 
> Signed-off-by: André Draszik <andre.draszik@linaro.org>
> ---
>  Documentation/devicetree/bindings/arm/google.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


