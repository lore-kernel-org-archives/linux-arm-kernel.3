Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ACE2C87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 14:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZzTxKIuYdP7hMBxOfOTkQ8a6o6svhcSrG6TjaNk3Qr8=; b=JIcCyNmuULR3L2FNTcF6/t0QhP
	5jQrhlHQ7MzmKTLxLyCrrEc5+L0GLtWsMhQo3FlhqfmT0iVzR8OHxbBoWKmjWisaC0oyOKSSGVlPs
	anuFOzpQ1VI3SkGMvgo/KUb1Tj2zs1tJrb6XkAO98+FTqtm33t0aA2tTfTK8fmI/DepfR/SYcfUpT
	f/GFyuTibApU+emfUPjnZ7jge6YNCn8gcmH/tkKf+splC5JNVqsFtFzgNrpM2PGBKjk5Se/5WZodN
	qeYRAZGNuFW7leQCLSW0QkQJUpJxd7sh+MYilwJ2eOUAkijoCVRq2Aiwx7Q8mNGXtrIzltMvCFtSM
	q4hRccdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhUDv-00000003pIo-2HVF;
	Thu, 31 Jul 2025 14:25:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhTfY-00000003jlz-1X6A
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 13:50:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D4F8D5C5B66;
	Thu, 31 Jul 2025 13:50:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 466DCC4CEEF;
	Thu, 31 Jul 2025 13:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753969803;
	bh=jawTeo3jrKl31BlPRVIr+R1PBzhaxmiMePBk8kxuwVE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OYvfVm/ZsnER1HAKkEC4ux4CBvQVHusXAIuQa7z1ZbnKXII3hVV0Vn6nrQDFfiX8s
	 IRdZpm0EQQII1M9WaXzoygW+pWRitgstvVXD/ZlpibPf1tutHLt/QsaliYM4OU3u1w
	 qBs4XJvMcr091e+bw3lFfjJr5tAIDLaOboOA8r+jbb8ev/LYEcDbA4keqduCjzqmdL
	 87p7crjoiKMwL4dJ7CAtIp7BJ8bfAGCAtE9FYCezeSVRHNfEcSxoPRB0kF+Mg8B3Ud
	 sHuncQm80xlb2D2GQQ2hL52M1WqmHfZ0HkZnwQ9KqTy5t+q6zDZXtJgCkz2Pu/yzqc
	 oyDag2pTvuaUg==
Date: Thu, 31 Jul 2025 08:50:02 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment?= Le Goffic <clement.legoffic@foss.st.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Michael Turquette <mturquette@baylibre.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>, linux-doc@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Will Deacon <will@kernel.org>,
	Julius Werner <jwerner@chromium.org>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
	Le Goffic <legoffic.clement@gmail.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Conor Dooley <conor+dt@kernel.org>,
	Gatien Chevallier <gatien.chevallier@foss.st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-clk@vger.kernel.org,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v5 02/20] dt-bindings: stm32: stm32mp25: add
 `#access-controller-cells` property
Message-ID: <175396980193.2134840.5721329894183158883.robh@kernel.org>
References: <20250728-ddrperfm-upstream-v5-0-03f1be8ad396@foss.st.com>
 <20250728-ddrperfm-upstream-v5-2-03f1be8ad396@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250728-ddrperfm-upstream-v5-2-03f1be8ad396@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_065004_455320_BC92C696 
X-CRM114-Status: UNSURE (   9.64  )
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


On Mon, 28 Jul 2025 17:29:33 +0200, Clément Le Goffic wrote:
> RCC is able to check the availability of a clock.
> Allow to query the RCC with a firewall ID.
> 
> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
> ---
>  Documentation/devicetree/bindings/clock/st,stm32mp25-rcc.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


