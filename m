Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5638C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 09:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YdZDRVKPRJnM6bMhkKAe136v5iLTjMpExrfXyqbjbXY=; b=ElA6ad4jqrxBIyHVnpBDETAGOt
	tOePXeNdJbvfGR8s8PubbfrnCPsoK0gq68MRMSKgpQrJBns+TvIEOMU/BZb2eGJYpAOHGizfYAkyd
	gL82Yka+0rZu7TGTf346kB7TrDj9jZkVRGnfRtbJhzj+4MWgDB5NQB1LDrtO6yznXQdmSKSwTniiA
	+X3SeoIijSpvOl2z9HtWcXO6R8QR83Gys4Pe0+t0235nJ7nVmVWgyr1+Fc6bN/6ny5UcauM/4FTej
	3XYE8ceD3njnRPYmXYn72Dv8NS4dNi2+ccazRMl9uBSH7eJipn2ltoJVYoHUUuvFa0LUV8aOn4QrX
	8zgoFGAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHfkO-0000000FJTA-0hjA;
	Wed, 21 May 2025 09:28:24 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHfYl-0000000FHGx-06bQ;
	Wed, 21 May 2025 09:16:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 577A1A4E7DC;
	Wed, 21 May 2025 09:16:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65F6FC4CEE4;
	Wed, 21 May 2025 09:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747818982;
	bh=YdZDRVKPRJnM6bMhkKAe136v5iLTjMpExrfXyqbjbXY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lDC5FeBYzkfOTxctuEWJFzsysW85GdkXbucVPeAeFcT3r86V+qIe1Ey+ddKED3/2X
	 Pnj5fU78RgQifFoSa4aR0LcB/aLF6vstearUjI3Es7B8WG40PFOD/10z5GgGpXEFVl
	 BqqJnjgYX8YKNCzkG3SG8sV6mS9Zq5p2Uq23ThRJFlu9CQPl4hLavfafa2qwzA7kvM
	 3xhhaYkAZF1rNYXgUoKmXO0yHZnQV/9nrFcg9rzO0msicWQyuOObv14/sk+64sZ5Mo
	 KM0lu6ayEy2W1AOE3hYrZKUO7TRFpXZMsYF/ZvD4DjowKHvacKXS7ftCTiE45Qvmml
	 6L+CvnDxtOL6w==
Date: Wed, 21 May 2025 11:16:19 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/8] dt-bindings: pinctl: amlogic,pinctrl-a4: Add
 compatible string for S6
Message-ID: <20250521-foamy-strict-tuna-3ffad7@kuoka>
References: <20250521-s6-s7-pinctrl-v2-0-0ce5e3728404@amlogic.com>
 <20250521-s6-s7-pinctrl-v2-3-0ce5e3728404@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250521-s6-s7-pinctrl-v2-3-0ce5e3728404@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_021623_128868_935916E0 
X-CRM114-Status: UNSURE (   7.39  )
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

On Wed, May 21, 2025 at 11:19:57AM GMT, Xianwei Zhao wrote:
> Update dt-binding document for pinctrl of Amlogic S6 SoC.


Just squash it. Three one-liners is pretty close to a churn.

Best regards,
Krzysztof


