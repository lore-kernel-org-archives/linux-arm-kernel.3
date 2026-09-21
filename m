Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AAE4C982E6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 17:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LSoPUiNFV7sDPwgktuLCo3QMbLsdxew16T11Y37maic=; b=BtfpD7JExXp+C0uU0Zh3jCn4Mx
	6MITwVQ0SGtAhYKn2cnBYymR3cRh67OCcP8XldgoRuhCgL7oqnrKmaCKGiMjx5yaoZbDq6WOj71J8
	7+5/v3UVFGjmD3al5vp3jtlcP9fBh+A8gnejyBHtxwzlP3NyFHNTux9FVw98mTFhbwgMpBSjKEqur
	mm5RKuTl4ObP/hraN8pOdeXZX7icjg23g+QPkI9FBoCGaMQ3vlPKQG62D8koTn/6m1k/80xgBg93I
	F7KEQhRcLumzZPDh/y5Bfuhhr1TAOKZQWUL/nTcOqX8w9VsNQ0lSa2jabqMM3FV8aFBVLct7IiRsw
	ctrLy/kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8hPV-00000002vUO-0JPg;
	Mon, 21 Sep 2026 17:02:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8hPT-00000002vT9-1afX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 17:02:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 809A260008;
	Mon, 21 Sep 2026 17:02:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0867A1F000FF;
	Mon, 21 Sep 2026 17:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790010150;
	bh=LSoPUiNFV7sDPwgktuLCo3QMbLsdxew16T11Y37maic=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fTtnJOeSE02PG9l7tC/sMv1gvjCtvpABc2hwUlkbhhQYFe00oCpVtnLyBY0cS399k
	 aQSiGrKH9hU3dHEfyy6eJ9TnFnkXuKZARrEINuMCS1BIgx3kqm013+Ba76X6+lX1bj
	 BI7dLBEogEihhGtxTB83Kty9dbBhLuf4cvsRX/utiX969ly43k8+XpSPbh73Pwxyni
	 sWNFJxIzJt7YdWRmMpu+RemxXBTEvG/L7RF/2jSzJMR5b9dVH9dRCPTH/RO1NfpoUk
	 3h7wNQDwYiGSeGx+XcoVtnfzOo2U1lOisSDTXGymvzidPI2TeuaqdVA0tSPqFZRcR6
	 u+9iohDWmwW4A==
Date: Mon, 21 Sep 2026 12:02:28 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Yureka Lilian <yureka@cyberchaos.dev>
Cc: linux-arm-kernel@lists.infradead.org, Neal Gompa <neal@gompa.dev>,
	devicetree@vger.kernel.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-watchdog@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Hector Martin <marcan@marcan.st>,
	Guenter Roeck <linux@roeck-us.net>,
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Janne Grunau <j@jannau.net>, Sven Peter <sven@kernel.org>,
	Radu Rendec <radu@rendec.net>, linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@kernel.org>
Subject: Re: [PATCH v2 6/7] dt-bindings: arm: apple: Add A18 Pro based devices
Message-ID: <179001014799.898882.8311603733010649075.robh@kernel.org>
References: <20260911-apple-a18-pro-initial-devicetrees-v2-0-08d06cf011d4@cyberchaos.dev>
 <20260911-apple-a18-pro-initial-devicetrees-v2-6-08d06cf011d4@cyberchaos.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-apple-a18-pro-initial-devicetrees-v2-6-08d06cf011d4@cyberchaos.dev>
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


On Fri, 11 Sep 2026 18:58:43 +0200, Yureka Lilian wrote:
> The MacBook Neo is the first MacBook to use an A-Series Apple Silicon
> SoC. The MacBook Neo is overall similar to the M4 series devices.
> 
> The iPhone 16 Pro is based on the same SoC, but Apple does not allow
> users running a custom OS on this device.
> 
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
> ---
>  Documentation/devicetree/bindings/arm/apple.yaml | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


