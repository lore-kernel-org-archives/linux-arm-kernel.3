Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0833EC35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 08:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j2waa+c2a9sF2Sb3Uro5Qk5j3MHrknurw1AWhOvaEok=; b=wmorpIHxRGflMUdgaiN5mOcklH
	ZRvadw+YUaB4SX7Br9guvPmtjfFSmcyrtaoOwhRBLCGZNj4y4uB6wb2GKUPUCYgbQtbkIt30icNkv
	4KqOX+gh2Ve5oK+gF79cdAggA9eETPc8QOf4w+KtSeYl8tu6ndrJfZhepqMgtOM2u+5ZF3/spbkap
	QPBhCb2gve8QJv7uvdtKToDKLeOtrCzpDShzKuaaPwpp/dhuyik3QSXFVuz/hWTyQenzgVOrcpM2C
	l9muvvsSjnnPCNH+r7ftwIn6XWzaa+JHDtbus3NrC2FncIdk8XNXa0S1PqxwFcNYlWe0kS9q5at/1
	IAKQ2sdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuokD-00000008LAY-0hPZ;
	Wed, 19 Mar 2025 08:25:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuohe-00000008KiM-3ZoO;
	Wed, 19 Mar 2025 08:23:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EE636615D6;
	Wed, 19 Mar 2025 08:23:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08D8CC4CEEA;
	Wed, 19 Mar 2025 08:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742372585;
	bh=it2hB6Qpnfpwmus4HAxB8waVLgv2/xDPUXA+bYmeDWs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kxgSgvvr+AxIdcW1pLBUzbPsszc6G2Jt7fN4hByJdp/Pvg/0qhNc8qOjIAihamn9O
	 K2BZN2WOY33xnEz+8zx5GE+0PLFWXsWVvmH8vrgrQHHL6xjEanXg7/26SBeOpeQ9CT
	 ohl0x28d6SfzHRjillUCsiy1BSHfdufjf7b4eQWwXepP4pZeoMZYDTZqZUlPCN1/9c
	 tdHcXJT3yVuPgdXUK5a9WU9vZ9HTdeV4TIkXfdaKnO6mwUVJ0dObx+qVEXMZDG62gb
	 U4s5FACE6LNofAfg32bhrFe2wPNYGvnARLhDoKMdieutACuTddYF46igopjHw1Rjl8
	 t8n29ob65S0Xw==
Date: Wed, 19 Mar 2025 09:23:02 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: jiebing chen <jiebing.chen@amlogic.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, jian.xu@amlogic.com, 
	shuai.li@amlogic.com, zhe.wang@amlogic.com
Subject: Re: [PATCH v4 3/6] dt-bindings: Asoc: axg-audio: Add s4 audio tocodec
Message-ID: <20250319-panda-of-unknown-wonder-236812@krzk-bin>
References: <20250319-audio_drvier-v4-0-686867fad719@amlogic.com>
 <20250319-audio_drvier-v4-3-686867fad719@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250319-audio_drvier-v4-3-686867fad719@amlogic.com>
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

On Wed, Mar 19, 2025 at 03:04:46PM +0800, jiebing chen wrote:
> Add the s4 tocodec compatible
> 
> Signed-off-by: jiebing chen <jiebing.chen@amlogic.com>
> ---

So you just ignored everything you received?

Best regards,
Krzysztof


