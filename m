Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48D0DC982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 17:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bw+ZaWVSjn9aV8DWYMQu9wB62I8RjQbusfdMXEpi7XM=; b=5DbEq0ShLzCkVL3GchhJsgFjuO
	QQ3JbKQ0ii3ZjVVJn0BvTUnnI140lfN93AmXSNSWnJK5S3CBKP1stO8c3auldQaQwioOGABqlEqru
	gD9Ru7ENZWWYM7QgAHSQhiYcrFWvbfHv7PrgJoqLmvdYWOQAwtzaV8+5xABt7tIlPsnfoOyX3rgt+
	ZySpKIrLIOLNgB4EcOTl2Fgh62JbSyXoAyu9/0k6ZEeYLDvxVR6kM4NYgNfd8VCRmTHOVApMsdsxg
	cl/+G5DwG9Qh7TyDOta6lHgSiGpn8QYAKbIgnTab9jadeWfK/dDIzKYIF6OnSzK0Xc1OkipnjsZtw
	1ZWEsCdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8hOz-00000002vHL-3abz;
	Mon, 21 Sep 2026 17:02:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8hOx-00000002vG3-30lS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 17:01:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B814060120;
	Mon, 21 Sep 2026 17:01:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F84A1F000FF;
	Mon, 21 Sep 2026 17:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790010118;
	bh=bw+ZaWVSjn9aV8DWYMQu9wB62I8RjQbusfdMXEpi7XM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KzYbCsu0P/Jt3i675Xbvb6phteMZPiWMHSGfuq+Wa2WbubZdeQaP6WikpBSW80u60
	 1pHIFNb/YEe5yPH/TEcrCaudmolpSRmhNYazNiE5XFpAyBJLBgpvSMXgcXEXe7dwdf
	 uXm3LNfTDQChIw+WsTc2WorlH+23r7qwkagfzQwS/baiRSFA4cHABrc1WkkRWu8nKf
	 zjtkSHUT9Pcyjc8/IPelCUbzHKv4mUsJSRpyNBSVQKcNnMDv244lhvZ4FAJfWIEQJP
	 SK9P7DAktY6mGZ1c/mVIO+2QFKBx3WCmsvi8GuMmkhdN1O6W5tyRVlF/QPYR/Uennp
	 Xak5XhuezCMrg==
Date: Mon, 21 Sep 2026 12:01:56 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Yureka Lilian <yureka@cyberchaos.dev>
Cc: Sven Peter <sven@kernel.org>, linux-arm-kernel@lists.infradead.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Radu Rendec <radu@rendec.net>, Thomas Gleixner <tglx@kernel.org>,
	Janne Grunau <j@jannau.net>, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, Neal Gompa <neal@gompa.dev>,
	asahi@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Hector Martin <marcan@marcan.st>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2 3/7] dt-bindings: arm: power: apple,pmgr-pwrstate: Add
 t8140 compatible
Message-ID: <179001011606.897140.14733096729138294772.robh@kernel.org>
References: <20260911-apple-a18-pro-initial-devicetrees-v2-0-08d06cf011d4@cyberchaos.dev>
 <20260911-apple-a18-pro-initial-devicetrees-v2-3-08d06cf011d4@cyberchaos.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-apple-a18-pro-initial-devicetrees-v2-3-08d06cf011d4@cyberchaos.dev>
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


On Fri, 11 Sep 2026 18:58:40 +0200, Yureka Lilian wrote:
> The device power state management of the PMGR blocks on the Apple
> silicon A18 Pro SoC (t8140) is compatible with the M1-M4 SoCs.
> Add "apple,t8140-pmgr-pwrstate" as A18 Pro specific compatible.
> 
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
> ---
>  Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


