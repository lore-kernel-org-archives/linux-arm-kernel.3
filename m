Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91862CA0FE8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 Aug 2025 18:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bXyO5/oYhnJR0y4bbel0y9/KAIGH5qbVDwIP+gHMAwc=; b=Ztz+47NjfrgS2VXQjuXgt8fdhg
	AbL/jnGC4ZLoUGz4RwqUA4eVy4s+P/GUys03wWzgkcZMnwv0wKwHfo8E7QbjTXVS3dX+GfYIGwqS2
	0U8vV6ql8Sq3EGY8ikzgGLCBwPz68Oq4QsXca0PoBVEMARMtQV4qwblOYKztDg7iHCBWH6mUYXwOR
	6k0+KE9WYA+dGep6nDd7csazYO624WmHlWUFDXdF0/Lg0uBjHjUZGFN6m5C6ow7snzCpzxlDB6je0
	ozc1lZ56H7Sv6PdPqsGgb33cCjYHKOqWqzRUcnXQvdgQgzWbSMUMDsCp4uPr9w9yfH1BnTbIm0wuE
	iDjY6PTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usmqp-0000000AXqj-2DA5;
	Sun, 31 Aug 2025 18:32:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usmo7-0000000AXef-0OCo
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 Aug 2025 18:29:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D19EE4492E;
	Sun, 31 Aug 2025 18:29:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B92A1C4CEED;
	Sun, 31 Aug 2025 18:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756664977;
	bh=KjHhTkMJ/HyvpaGMX1/ZuMt5yAN5aupaBijM9djMns8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gSEDxVVczmhv2xuAzK34rJ5E5uA+Xm1tulv+ccO7aaAOptE1pW0c8yGFnDxnfoqmR
	 im7cXuWUPhKPazxsUFcXgMKgjJFkyx1mREeNOan/R/gkC7wOb6Bf648aqlbaLDJb5h
	 UbIsnFB+qCh6awlRcCtrghGsQUYTXKVFz6ZvaM+J3h3IeqffyKqjE/D4IuSA+66Fg9
	 avdjLzqnpcABliDLLX1xAUSRl2PWit7bdXtdgG53AqHA5sH6GfLLIWgWrRKnB6q34a
	 i9CDmzRryyL1MZqdZqPokrtGlqAg83aPmJQAtfuCoV8AnC2sACOROSvZ4uXLn7ixKe
	 JdjAtoAhc6pcg==
From: Sven Peter <sven@kernel.org>
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mark Kettenis <kettenis@openbsd.org>,
	Hector Martin <marcan@marcan.st>,
	Janne Grunau <j@jannau.net>
Cc: Sven Peter <sven@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] Apple device tree sync from downstream kernel
Date: Sun, 31 Aug 2025 20:29:28 +0200
Message-Id: <175666489772.4936.11580561887424147768.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250823-apple-dt-sync-6-17-v2-0-6dc0daeb4786@jannau.net>
References: <20250823-apple-dt-sync-6-17-v2-0-6dc0daeb4786@jannau.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250831_112939_156588_64CA06CD 
X-CRM114-Status: GOOD (  11.57  )
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

On Sat, 23 Aug 2025 11:49:43 +0200, Janne Grunau wrote:
> This series pulls changes from the downstream device trees which are
> supported in upstream kernel.
> Most importantly it fixes the PCIe description for a specific iMac model
> (iMac M1, 2 USB-C ports, 2021). This is worked around in the downstream
> kernel by not disabling the port. In preparation for submitting M2
> Pro/Max/Ultra devices trees I investigated the issue on the similarly
> affected M2 Pro Mac mini and fixed it this way.
> It completes the Wlan/BT device nodes for t600x based devices and adds
> the missing 15-inch Macbook Air (M2, 2023).
> 
> [...]

Applied to git@github.com:AsahiLinux/linux.git (apple-soc/dt-6.18), thanks!

[1/5] arm64: dts: apple: t8103-j457: Fix PCIe ethernet iommu-map
      https://github.com/AsahiLinux/linux/commit/6e08cdd604ed
[2/5] arm64: dts: apple: t600x: Add missing WiFi properties
      https://github.com/AsahiLinux/linux/commit/3050713d84f5
[3/5] arm64: dts: apple: t600x: Add bluetooth device nodes
      https://github.com/AsahiLinux/linux/commit/c34e2ec6a84e
[4/5] dt-bindings: arm: apple: Add t8112 j415 compatible
      https://github.com/AsahiLinux/linux/commit/efad8eaf6f2f
[5/5] arm64: dts: apple: Add devicetreee for t8112-j415
      https://github.com/AsahiLinux/linux/commit/273be31e5afd

Best regards,
-- 
Sven Peter <sven@kernel.org>


