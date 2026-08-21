Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A3CEC5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 07:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ggncsFl+P4gYhgD6NGF6aVdrd2Isxhm9KFLNVg0s6ZA=; b=pZVAI1VcLY9FqW1/ws4km66C2S
	6PXsJ2dZZPSpisq9UgyjKvN1hjOcPtM2weTEtkR3krJeIjk14kgj5UpWz5ZPgIiQs1fTO43YxQFnF
	csSwaidX8Q9TO9qics4NUVp13jfmwSI5VpL+YRqAvwWaGLnnLG7sIi79TSIh0xvapMThKAQNJUNQN
	IpZOmTfmmOcg5W5cirKZoj4ah+gTOknT+EbA//4HQsK5Aau8FZch/uC4UZa5kaFeRbhKE0mRZbazT
	5b+s4IzY/uffRyT8ykZQk/aDlUqf9MxkMg8gUGGMW4I5Ie+gHPbP+tisR+px1AxLO7aMxnGigJ8Dj
	JpU2nHFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxK5z-0000000Cka4-2Wbl;
	Fri, 21 Aug 2026 07:55:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxK5z-0000000CkZw-0H56
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 07:55:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BABFC41436;
	Fri, 21 Aug 2026 07:55:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7D471F000E9;
	Fri, 21 Aug 2026 07:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787298922;
	bh=ggncsFl+P4gYhgD6NGF6aVdrd2Isxhm9KFLNVg0s6ZA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=j9lrqwmTCZ92FSDw0hL1RsBDQMIsVTp4wfsGe1iG7NqhFs8Yh8/jZUGXADUZmhCsK
	 PtqGLLSTRysk5QpnLjrPM84cqCL9dWRERHtS7bLAuc+RtSpGMBpr4UFlUrl54moj4k
	 dmx6MaNzoRmzmkr+3SV8T6+bcPkki49DajnFIuhUwIjPCNUSxd6srb1jHnz7O4fWxH
	 ll/xDflUUW181xC/QK29yf4hP0GC90ZMPLkKR2+KbUE3Fq0EMWghy3QO5UqyDBw4mL
	 8HPDRbCJ2hvtOPl5++OqjEYUNuvHlgZV5EmUd15OZyXobRa7mKwzSDz18bbfAOWsJZ
	 ySAZdCSmqCmww==
Date: Fri, 21 Aug 2026 09:55:18 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Aiden Isik <aidenisik@member.fsf.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Aiden Isik <aidenisik+git@member.fsf.org>, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: Add Exynos5515 SoC
Message-ID: <20260821-orthodox-lilac-alligator-80806c@quoll>
References: <20260818-for-next-lucky7-clock-v2-0-cda0cc80f158@member.fsf.org>
 <20260818-for-next-lucky7-clock-v2-1-cda0cc80f158@member.fsf.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260818-for-next-lucky7-clock-v2-1-cda0cc80f158@member.fsf.org>
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

On Tue, Aug 18, 2026 at 10:58:35PM +0100, Aiden Isik wrote:
> Add devicetree documentation for the Exynos5515 SoC's CMUs.
> 
> Add device tree bindings for the following CMUs:
> - CMU_TOP
> - CMU_PERI
> - CMU_FSYS
> 
> Signed-off-by: Aiden Isik <aidenisik@member.fsf.org>
> ---
>  .../bindings/clock/samsung,exynos5515-cmu.yaml     | 145 ++++++++++++++++
>  include/dt-bindings/clock/samsung,exynos5515-cmu.h | 191 +++++++++++++++++++++
>  2 files changed, 336 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


