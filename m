Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C816BCA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 07:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UOsdkvLy61rMHjBAk3FQt0XRiYDz8CC2+HPWjoWhpCs=; b=QVMDVBD1ONH4piOOIG16BCt29M
	4yI7tnBkd5/JvEEKG6/1E30RHDheIli/Sl5eLBIMWsn+WNNIYvFlVMstCc3urpKKqPsuNXWJKneKN
	btjgYo2o+kSxTm5DNb6GflF3lPQHjfeXEDuQKwrvFYvNcbzgyN3HuOhbYSBCnz5CmLtriUmegg1/d
	nDE1/On1wMizkVEAtswVw54inGVvzQf/0CLH0zKnu6eWo8btW3A9zTBPNh39ed/1RpFtIIRElCGuE
	Vv2LJL2z2oyfQltf2zx6rnkQEaC+R+v5qaSJLcfaIpNMQWru0CxDEb1aNRDwc0Kcc3nGIxFrL/39q
	Ey0eQT7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwxul-00000007ZF4-3eyc;
	Fri, 12 Sep 2025 07:09:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwxuj-00000007ZE9-331C
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 07:09:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1414A443C0;
	Fri, 12 Sep 2025 07:09:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84DBEC4CEF4;
	Fri, 12 Sep 2025 07:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757660984;
	bh=4AlYbUZqbeoGnHZ92DdTmZ5FEV+tYiDs7FOZ8YpY29U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E2uUG2diI3Zm5h84JEAUPN/VYN+T1o384EdT5mjkNcnGKKElEiA+X75BxRaieiVLH
	 nzXpIAK0bfxjhBqku0zTNcL4s9mf07zhnV4dlawdAkmcueJKwOu4ql/yW+f08huXjd
	 YSJyc/43tlOEORw99ZXvBsitrmzxArTfvGWxCXh7XQOrTBDPlcwZa0EbDEvpS+udRx
	 lBevJk/fJQcgLlpk5jYmzHK9zn9Y6xUtL29OHgrj1ZWEixm238y/kh0jz7psdpf0bW
	 OSvCwXcoLUjV3FZLE0gC+KkWgQBWN7wfNbgFxJIEF/YIQ4N375yKrwibeGXbWe+Paf
	 PMCzca9hZg2kQ==
Date: Fri, 12 Sep 2025 09:09:42 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: imx@lists.linux.dev, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 4/9] dt-bindings: display: imx: Add i.MX94 DCIF
Message-ID: <20250912-astonishing-bipedal-raccoon-4a9c67@kuoka>
References: <20250911-dcif-upstreaming-v5-0-a1e8dab8ae40@oss.nxp.com>
 <20250911-dcif-upstreaming-v5-4-a1e8dab8ae40@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250911-dcif-upstreaming-v5-4-a1e8dab8ae40@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_000945_783581_ABC438ED 
X-CRM114-Status: GOOD (  10.48  )
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

On Thu, Sep 11, 2025 at 02:37:04PM +0300, Laurentiu Palcu wrote:
> DCIF is the i.MX94 Display Controller Interface which is used to
> drive a TFT LCD panel or connects to a display interface depending
> on the chip configuration.
> 
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> ---
>  .../bindings/display/imx/nxp,imx94-dcif.yaml       | 82 ++++++++++++++++++++++
>  1 file changed, 82 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


