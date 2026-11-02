Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB49C606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 10:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fPFed5dP;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T8/tG+f2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=uHmEJGXHxdyRRkaTDdUcwnltGXq6VvTgNHAfkKWQvLU=; b=fPFed5dP0Ln7Zmm6MzW3H4I/T8
	wXXLEPIJdgwSgRIcGhllixl7M1dfaHVWm+RLmjmEMqW+7torLEigTMp04IyBWkfpBK67KkPVtal8/
	6U2lPXwfXXrrwXfcJaWISm9U0XnH+rcJzde7VTRgVoLYcx8CZZln8cVGM1PVQTEddZ72z68yjRKw6
	7Gz0ITGdVMnLnDWy0RAhriNFsKdRUpx2tEck1hbjCF3icy1tuUVS6PpdYsE3b15DJH4kNVoDW4MXi
	8DrbZSijaa5KyHkQwVZZucuWdo5E2QkAt9RdPcDYw55gMlSiQQCXCqupYJV8uBh+OghhrPsGXZHU5
	901vrKEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNpBy-0000000G9hg-2Vvr;
	Mon, 02 Nov 2026 10:23:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNpBx-0000000G9hM-0U9u
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 10:23:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2CB046021C;
	Mon,  2 Nov 2026 10:23:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB00A1F000C1;
	Mon,  2 Nov 2026 10:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793614983;
	bh=uHmEJGXHxdyRRkaTDdUcwnltGXq6VvTgNHAfkKWQvLU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=T8/tG+f2YOeF3Mw6lDP3Rlz3rKXh0XcxjQBkjwJU63oWJkC3/pGxwQp4uikgaJuwl
	 riR9/w0M6+ikY2O0XID1ErYUwNzm/Nc8NTk7RxiTM1csM696sQbkZgszxhW7VXleWV
	 CozLsa3w7aWvJqp6Mj62ToDJaewuakYSzZ9E1IJscKPFLxLjoS4JKDAH6fHczHYy8a
	 DbsgpGBbadsMrG1b3a2vc1qqa2V+yVAy3G9cyCc86Qx5tm/WbLs24h0v82TG4SSqha
	 +CRolsMrwLOPgedT8mnqxeE+TIPYVZbwObIUZ1TrE5pokx424gB66ZCnm2DbiKDnl8
	 SQywWiF2hMCKg==
Date: Mon, 2 Nov 2026 11:22:59 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/7] clk: stm32mp25: define the number of clocks in
 the driver
Message-ID: <20261102-righteous-visionary-smilodon-10b72d@quoll>
References: <20261023-ups_mp25_clk_update-v2-0-398d348ea8fd@foss.st.com>
 <20261023-ups_mp25_clk_update-v2-1-398d348ea8fd@foss.st.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261023-ups_mp25_clk_update-v2-1-398d348ea8fd@foss.st.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 23, 2026 at 06:43:17PM +0200, Gabriel Fernandez wrote:
> The size of the clock provider is given by STM32MP25_LAST_CLK, defined in
> the binding header. This is not part of the binding ABI: it has to be
> updated each time an ID is added, and the number of clocks handled by a
> given driver does not belong to a binding.
> 
> Define the number of clocks in the driver instead, as done for the
> STM32MP21 driver, and drop it from the binding header. Both are done in
> the same patch as the macro has the same name in the two places.
> 
> No functional change, the value is unchanged (344).
> 
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> ---
>  drivers/clk/stm32/clk-stm32mp25.c            | 3 +++
>  include/dt-bindings/clock/st,stm32mp25-rcc.h | 2 --
>  2 files changed, 3 insertions(+), 2 deletions(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


