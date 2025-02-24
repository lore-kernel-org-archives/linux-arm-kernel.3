Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AABFC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 20:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EaEXuJNcncHOcGWj8qeQ+RW04q3o7JCg5gwYChdS6KY=; b=asaI/+jnC7XWhzNkcGxPbKdpdD
	WCjXFCvtwTbs+wJV0hlPvUvJWxvb7mzvxMpqXH18hY/e4ZH2t/Ahooxhl/hSAYFXq1xTk68rsvoif
	FqVlql6jUHsWu/GCCIn0p+Ln3mbLRyVzfI4iQ1QIOxCqLw9v4x7BtM9kfx4dX3bfZqoeRquf9NwbV
	/tfO5Giv4m4OynNY4E08qwtuCAekUF6OPNhht3weJoxGjZ7mtsyCyGUbCwrHOLmmgkuUMPmXzrm6g
	HApDkoxMxWmVTk/dlgOcLM8a+ZVUqcxSyVHFc5U/LbCyyDrkHQGZnZzgwp45FsGQbTI8GUkFuJtoC
	C8POWL5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmfC1-0000000F77X-3AiT;
	Mon, 24 Feb 2025 20:36:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmf8Q-0000000F6UE-3XIT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 20:33:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4322A611EA;
	Mon, 24 Feb 2025 20:32:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD4F5C4CED6;
	Mon, 24 Feb 2025 20:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740429181;
	bh=GkLISPYYv7MHf+2XRcdkauAMMfvihArhSS/JM26Wlk0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SpPUC/MNxb4S9qhxCSK6x4tUp63wfrH1fgOsvPNILny2LanDLJyZTIgrgiu7/xQtX
	 O5aUVEUcqlyG4BMcNvDLCYINAv+uLxhR4/dhnCRpdc6wQfI4YD92xr+BhVqJ02Obvv
	 wLF29hb5o1JX+bhYumNmpjiRWxJE40eWYOcQtCTiq/9P+lFUWDZPEkACHcQLlwiLOk
	 HVdfUdoFZ1YdJeWXMtZf+z43+iW7xslG3ueuc/GqMEH6I8mB2M4ORJVg1m/Wc2xeoh
	 +nTUgVlmlMqq2kapHvxa6cgiMKWo6bxnCncKBKPTy18xQZBAQElatFG3LBz1k96W97
	 tBV7fCVpjQ9dw==
Date: Mon, 24 Feb 2025 14:33:00 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Maud Spierings <maudspierings@gocontroll.com>
Cc: Fabio Estevam <festevam@gmail.com>, Liu Ying <victor.liu@nxp.com>,
	David Airlie <airlied@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, Simona Vetter <simona@ffwll.ch>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	linux-arm-kernel@lists.infradead.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	imx@lists.linux.dev, Neil Armstrong <neil.armstrong@linaro.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH 03/14] dt-bindings: arm: fsl: Add GOcontroll Moduline
 Display
Message-ID: <174042917969.4048644.15922990848676002211.robh@kernel.org>
References: <20250224-initial_display-v1-0-5ccbbf613543@gocontroll.com>
 <20250224-initial_display-v1-3-5ccbbf613543@gocontroll.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250224-initial_display-v1-3-5ccbbf613543@gocontroll.com>
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


On Mon, 24 Feb 2025 14:50:53 +0100, Maud Spierings wrote:
> Document the compatible strings for the Moduline Display controller.
> 
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


