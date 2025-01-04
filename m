Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA47DE77188
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jan 2025 09:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D66lKldlqY/lRvXpgksx9XpTtM9beeIE82TNkVjKxGk=; b=gSWlR4WGG/8KtWgG6tXgLHsG1p
	/xJPv3Xsp8n7vuuraKuZneVHdWK93MOhEOkEYebW3M3mPB+264VdfQKcw1wz64xypZwsJ1tDLPO32
	SbFiPoCWDqUQPciy+yrWUaVoBEHyqu0f18KSp3TagQE0oJyAbP9hfHmrXrYtXwChaoGEQZVKW5v/4
	P/b3+ZbPGhODpCKEQQoLhZIKKfZXFWGirKxC4L9pCqFBOQtq6zDW29gjtT6tlqrr5YuPultofK/xq
	/FCFoDJRjyBXvbknm3+coaG1T/nXLeFWvypmjcrdYSLqoBIAPHqJm5HTLeN0cyW8PWSvMUJFzW3zv
	ai2S9jgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tU0VQ-0000000EnIN-3F1s;
	Sat, 04 Jan 2025 09:31:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tU0UG-0000000EmzP-1jZW
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Jan 2025 09:30:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5A94F5C4DA1;
	Sat,  4 Jan 2025 09:29:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67198C4CED1;
	Sat,  4 Jan 2025 09:30:26 +0000 (UTC)
Date: Sat, 4 Jan 2025 10:30:24 +0100
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Lukas Schmid <lukas.schmid@netcube.li>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: vendor-prefixes: Add NetCube Systems
 Austria name
Message-ID: <pvbpqlejn6r7yjzufdmialyvjlmitusltb3ljhwstxbtoglf6q@7tvjz6neolnp>
References: <20250103204523.3779-1-lukas.schmid@netcube.li>
 <20250103204523.3779-2-lukas.schmid@netcube.li>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250103204523.3779-2-lukas.schmid@netcube.li>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250104_013028_492467_DF52A6F6 
X-CRM114-Status: UNSURE (   8.67  )
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

On Fri, Jan 03, 2025 at 08:45:17PM +0000, Lukas Schmid wrote:
> Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>


Repeating again one of my comments:

Please run scripts/checkpatch.pl and fix reported warnings. After that,
run also 'scripts/checkpatch.pl --strict' and (probably) fix more
warnings. Some warnings can be ignored, especially from --strict run,
but the code here looks like it needs a fix. Feel free to get in touch
if the warning is not clear.

Please implement all comments.

Best regards,
Krzysztof


