Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A253AE8FDB1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 13:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lXEyG7XuRrrAQ5eKlOG+sEEX9gcLORFX2JQ++QRTSXU=; b=bjLqet3yZKwfUG0bzEB3NlYuwr
	SN18oElfgOTWM99eFg4U3NKMy3EA16hOPjl9ISu64AVsi29giADMtuLJG6PIZQXmOdIdvpcUd8zK1
	G6oluILgzX2dfJiecFivu9H+UJsm1xCgH0eYAPKwwrSjex51OuoLI41PhqR7TO1OclrAijfVCeoCS
	AE9mJaU9jYhyxgcNqbDOL9Hss1b075lXKRezD27q2f6Hwewsox/W0AFj3ZPn+DeKZCahz16dW4Psx
	7bI4z24fjAQynINsYgHH+9T3+0Tg0UB9FDGX1fgAOOEGgnovRrpmTtnd6C7bKoeAMY+gjGmC72Sz2
	DOVQoWgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaD0G-00000003jFo-3Fuj;
	Mon, 29 Dec 2025 13:09:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaD0E-00000003jFV-2DIq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 13:09:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DE974440E0;
	Mon, 29 Dec 2025 13:09:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 441E9C4CEF7;
	Mon, 29 Dec 2025 13:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767013777;
	bh=nzLRz3vZ4BiKjALouM+hKrGdDvWh3eCUoAQRpP2rE5U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CDWPsXeZ2Peas+nu9CwAOau65ia92X2PM3VfKtU19Do75GQ+2kM6u7TJRqMFKcMz3
	 ogC4Nm8euvhyl4DIPPIv9yoLOVElnm7IjlPGi8dk5WjF3X4GxPschpJGJ9vEhzOMUh
	 RQtfX7rZ8loUVCGs81QzsvQHhFOON1q56JDEakYVUzE9wJIkEEAaWk+tR19TYMTsTE
	 xIemkEOnQM//LTT5bPq7IBal5izNYjwubyJ/FRtyeDfJN7GsRy6OFcB7gkTbfKm22k
	 Y2Jr8NxJiIlnUPIGrqfNdrYY3c7xsmqQ0FEGZbLTD/3tt0kYZx8Z8Ko7UT6BjoDw3k
	 nZy8xP+kRu4qA==
Date: Mon, 29 Dec 2025 21:09:26 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH v6 5/5] arm64: dts: imx8ulp: add sim lpav node
Message-ID: <aVJ9hngpYQg5c123@dragon>
References: <20251126124218.803-1-laurentiumihalcea111@gmail.com>
 <20251126124218.803-6-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126124218.803-6-laurentiumihalcea111@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_050938_588064_BFBCFD91 
X-CRM114-Status: UNSURE (   7.70  )
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

On Wed, Nov 26, 2025 at 04:42:18AM -0800, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> 
> Add DT node for the SIM LPAV module.
> 
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Applied, thanks!

