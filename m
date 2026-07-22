Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27813C4452D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 07:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pUBOybuaQ4oLhv5gpLAxGaNiHUDAVsgBLzkdhW8dxfI=; b=vMq32RWDL/BAvLGVCI551OoPaV
	J8VpUu3RbkC1NCBgdZBBp2pM84Giocvtg7V8OOhpY7IqZp5RwoK6696xtORzqvEK+rbuJQLRAKiH+
	R98VwLWme7+J9Adk1U0cuMTfL3c3y9Bx0sLqa+2NS+HpTiVdneLcuusYNV9bxTzG+IvClsQJPtck/
	Aeu4PX9mwRb7Yggur6oVn2GrfzpM1NCh1kQv2UI/Yj61Mf5mm0NDHQ+s+jEYc3UzcZT5MwhNgxUaS
	uvF6EDT/BDH05yEMilJzfqE4BkGpKUCL6nIdKnlHapGQtPsN4GztZUwvHmrTnkRUiM5rGh5VA/Cpa
	hS5dAaUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmR6T-0000000B1xa-3C6m;
	Wed, 22 Jul 2026 07:10:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmR6S-0000000B1xP-1wCS;
	Wed, 22 Jul 2026 07:10:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AF96A60A67;
	Wed, 22 Jul 2026 07:10:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A15371F000E9;
	Wed, 22 Jul 2026 07:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784704251;
	bh=pUBOybuaQ4oLhv5gpLAxGaNiHUDAVsgBLzkdhW8dxfI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KpBaUoOJSGKMnsiMgykFnlLyGr0UYTSYsafvK5qGTdkU37nmDEYxE+aytF+Q3r7mw
	 DlpaIYcllglU8Et2PTZ24NNkhmQDxHrizvXN4pKAaccQIPo9BBZRt/p3q7Y3KDgWVC
	 wQFLmdiKPFmhYvU/onvqomIE1e9VdSSPQtIvgFqhLgtLrVaHUfq1QeIrnyhkS1GA6y
	 +SXvguG/AXyp9VnBSv0pemkG0gVkwevBxFGrQCcIgt/uZigUZv8F8i4dVJrd1of1ma
	 /R4/qXbiJRlnj3F6vHIGn6CUYKMVkskalfeL6hTqK23goD67ZpGPEv34kFXTWHz7Mb
	 Bwd8Lr3hZhegQ==
Date: Wed, 22 Jul 2026 09:10:48 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Igor Paunovic <royalnet026@gmail.com>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, kernel@collabora.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] dt-bindings: media: snps,dw-hdmi-rx: add
 #sound-dai-cells
Message-ID: <20260722-gabby-active-seagull-5aaea6@quoll>
References: <20260721064115.64809-1-royalnet026@gmail.com>
 <20260721064115.64809-2-royalnet026@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260721064115.64809-2-royalnet026@gmail.com>
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

On Tue, Jul 21, 2026 at 08:41:12AM +0200, Igor Paunovic wrote:
> The HDMI RX controller can expose the audio embedded in the incoming
> HDMI stream as an ALSA capture device. Document the #sound-dai-cells
> property so that a sound card can reference the HDMI RX audio DAI.
> 
> Signed-off-by: Igor Paunovic <royalnet026@gmail.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


