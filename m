Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D45B5C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 20:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NTelofPdfpn9laIMDBEqoLr8eSJo6yh1HnD/qq3Uaes=; b=X859hq1r3X7ndS6/A6YSiUvmT7
	niF+iYHv8IMzcO5FxgYCF6YtrrX1hENaLX2UFsuM6hvk1As+nOH7rt0jFrCtOMGVLaHq+QfJksrBP
	dgaztF3uNP3zt5sIgmNwimnYrDXZu9baa4LCcVjhpz8YEJ7bK+PCWMAXdNJ/CPkCK7btNGFhIcB/J
	uUfVsUJFHG11aa7uyGt61TTcM36OJC7ue0Ux8EvVqGtjFwE25wya0OhgmyrESXldF8ZS3PzYD/ATo
	+ICJ/mY9JCRlWNoW0g/6IBUdVeNUESx4r9E0tbELK1hvVO+/hvuc9Ig67Chc7OhumG5bD6Ao9pFtA
	ZnVI6Y2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVFjE-0000000Fl8i-3CYw;
	Fri, 27 Jun 2025 20:31:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVFcG-0000000FkJ1-48L2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 20:24:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A48DB43C29;
	Fri, 27 Jun 2025 20:24:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BAEAC4CEE3;
	Fri, 27 Jun 2025 20:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751055845;
	bh=70/EbRKDWwo2aeRNCfM/60F6mNHA//ryIMx908BwwzU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KmlTbSDvPR2NipM/ujZnPWtGoBIw/ilPGSJ6PfU/sR2J2393sPU8tcQgpIMINAGdt
	 oYshfyKMhnD/rcbMsjA6E0OIDFR4hgLDiGXxRZIanRFAPOkcYlL3yG6vI7nv1fLkh4
	 sNF81L5ochon2onMUdmQClX21/SjJk4TgLgbKAhERvcXpjWpGPqcDL9gQMLA8g+Ieb
	 7zfUuXMsqw8s3g+zS+HVOhOuRtY8dq8/7YXuGMYFFFBFfLTsTpJjbTq7fXkwVKyDLR
	 8m5PNHnqaxRTMdDF62EU6fB9BWROAjqk+8+RiIUK1z/84RRAqsvCV/WwqmS3s1Wgv6
	 u5D7Mlg3bvv7Q==
Date: Fri, 27 Jun 2025 15:24:04 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Harshit Shah <hshah@axiado.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Jan Kotas <jank@cadence.com>, devicetree@vger.kernel.org,
	soc@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Arnd Bergmann <arnd@arndb.de>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH v3 1/7] dt-bindings: vendor-prefixes: Add Axiado
 Corporation
Message-ID: <175105584420.24329.3649042034021574004.robh@kernel.org>
References: <20250623-axiado-ax3000-soc-and-evaluation-board-support-v3-0-b3e66a7491f5@axiado.com>
 <20250623-axiado-ax3000-soc-and-evaluation-board-support-v3-1-b3e66a7491f5@axiado.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623-axiado-ax3000-soc-and-evaluation-board-support-v3-1-b3e66a7491f5@axiado.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_132409_043276_BE1C4EB9 
X-CRM114-Status: UNSURE (   8.65  )
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


On Mon, 23 Jun 2025 10:28:12 -0700, Harshit Shah wrote:
> Link: https://axiado.com
> Signed-off-by: Harshit Shah <hshah@axiado.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


