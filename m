Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07F72CA0EE8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Sep 2025 16:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UP641094SIP2eOANugD4SfR6HRodCUe5JCOXYRQzkNc=; b=m/i9jnSRn/VDWleiNu3TsulNlx
	XuzNYkllKOh5MCLBfvSO+vBhUu4Cpy1/5EOVjAOmqOqTno6yBxHVk0k5++uQD0l9Usze0Th8GGXGh
	rOAdChGCX3QMz+mDSUcb02k0YwM/U8PPjL6nn96yEd85uB1YRG+pyJ4O9Rvozt+dV/kBKhdoGRFgi
	89kXXJlMTED3WOs/7rhYeOpifj3Uc/zMVKbacwdkDwIz+/aO39m3eEKxVuTcxINmmBDk3sKN/M0Vn
	RcWok1PwdsnmDmF8BKHRIXgiO9tJsivW+Brk9E3FrGxwqd8IlElFTf4aj7p13vMTdUqrMCFVU04wt
	os8XI1dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxpbx-00000001qjT-1GwZ;
	Sun, 14 Sep 2025 16:29:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxpbt-00000001qi5-22B0
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Sep 2025 16:29:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F0DBC44295;
	Sun, 14 Sep 2025 16:29:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4606C4CEFB;
	Sun, 14 Sep 2025 16:29:49 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id 33F675FDF8;
	Mon, 15 Sep 2025 00:29:47 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: Jernej Skrabec <jernej@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>, Chen-Yu Tsai <wens@kernel.org>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250913173511.4064176-1-wens@kernel.org>
References: <20250913173511.4064176-1-wens@kernel.org>
Subject: Re: [PATCH] arm64: dts: allwinner: sun55i: Complete AXP717A
 sub-functions
Message-Id: <175786738720.280883.7937974112078886568.b4-ty@csie.org>
Date: Mon, 15 Sep 2025 00:29:47 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_092953_553333_E3C89DC3 
X-CRM114-Status: UNSURE (   8.99  )
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

On Sun, 14 Sep 2025 01:35:11 +0800, Chen-Yu Tsai wrote:
> When the AXP717A PMIC is missing nodes for the sub-functions, the kernel
> complains about not found nodes.
> 
> Add all the remaining nodes corresponding to the defined functions for
> the dev boards, which have publicly available schematics to base this
> change on. The battery charger on all of them are disabled. Also add
> an "iio-hwmon" node to express some of the ADC channels as hwmon
> sensors.
> 
> [...]

Applied to sunxi/dt-for-6.18 in local tree, thanks!

[1/1] arm64: dts: allwinner: sun55i: Complete AXP717A sub-functions
      commit: cca07ac2b5f7838b8ff612b53b9f82ac8cb58312

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>


