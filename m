Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 943DFE77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 07:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FRJ1r6p3PY+gK/6c31fFEKWt+bknQ7dOy+PeLQJzeYM=; b=47fJpWrx9tL5px5cpuRw2qMYgF
	lni6Cb6+N1tLYj06Ld/OglK+u79Xj5bpu14vnbp7NqyGPnvKpoDHjVub1UAdW/HPX9tBxvMeqZZMZ
	QDVSuSVYesOG/CUFfGuXIgHB5JmCdYpaSvOUIJys/XkNE1kdqUut2B2RdRXleI3HWJ6NzIMvaXOpv
	zYBXExuHKHtd99m1c4VXetFywPTqEfQcy6TDlwssTG4Vn7n4OmuDyTGXMGK7CjSRacA7fqYdudO30
	AqfYT1sY6rTSgTAlMlA1ldG2R2l1VPRTWUST6QU2syWOU9CnwQerFEHcpLCsdNr3XkbiwtDmdcHO1
	Cugj60EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUhSj-00000000Od0-2vjR;
	Mon, 06 Jan 2025 07:23:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUhQt-00000000OMN-01Sq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 07:21:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EBFDF5C5579;
	Mon,  6 Jan 2025 07:21:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B093C4CED2;
	Mon,  6 Jan 2025 07:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736148109;
	bh=Z0Wk35+tGl/QBB1rWY7uIN47MRruJiSyWdDTUtrLcYM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R1fGTVcdsjRaZtGGJVvqAgZ6nshb7+HPYRXiogbi3MWDv9UX2F32HRz3ablznrzBe
	 6faWiRQll411RYkkh9TfqvzdQDGdvWDELTMEG3vwhhyeK+m2WBRaGbFr8eVXHAAIoz
	 ou5CBXaaK8J0X2fukZbfb9jK4vKp8OtHbvp/9Qn4NHA0WEXE1apknZ+wxgn6naAwM9
	 FYoONhONDv9GKCRqw3exeSUMA4CZApQb4at4S5vqzvaYn1bVYhGWrK1twIywzoyQ+O
	 LPw1/lysTmHBRi3a1u2cgrY5AlDbdq84xIFmbh4G6ghwlJ2UE5L/5Hb+4fcOPXadDJ
	 lbw254AeHIu7A==
Date: Mon, 6 Jan 2025 08:21:46 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 3/6] dt-bindings: clock: stm32fx: update reference due to
 rename
Message-ID: <ozqeggxydhuiddnxkkftu2xeqxp5omoluada5ra5aecieuwc3n@njhepvhd3y7x>
References: <20250105181525.1370822-1-dario.binacchi@amarulasolutions.com>
 <20250105181525.1370822-4-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250105181525.1370822-4-dario.binacchi@amarulasolutions.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_232151_103531_2CD5E443 
X-CRM114-Status: GOOD (  12.13  )
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

On Sun, Jan 05, 2025 at 07:14:15PM +0100, Dario Binacchi wrote:
> With the conversion of Documentation/devicetree/bindings/clock/st,stm32-rcc.txt
> to JSON schema, the reference to st,stm32-rcc.txt is now broken. Therefore,
> let's fix it.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
> 
>  include/dt-bindings/clock/stm32fx-clock.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

NAK, you introduce bugs and then immediately fix them just to have some
patch count?

Best regards,
Krzysztof


