Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 102AFC88E40
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 09:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HOCVCoUbZ3n/ApxFbJdyqu/tiiYlAtevu9P9fyqmEWo=; b=23+tEqmJllYtCnTqqacMPSNJfF
	0CSnVB0GVn1HXASLayRTNV9rpRAaezUfClJQtmPjMm7E+J5Crja1iLhIlGbE1rCS2TyNuSSgcmnUA
	jxPW38f/EkFchQ7Q3r4dimEclhmFM41o+kqSr9K+c9Bzn7wScmBay3FrwQSdhmMdO37rYm9DcXc+1
	Xuxg+b+BPG+ljzXLsU+GiuZUJPqYqfS/d7/qTh8aBVEfyRrSlx+EULelUkC64KAFhWEImI9Xvefaf
	u4QhJ9fx/XAmeYJdmbKH+TaABjXEpoDbiYIvwP73XCgfHsadA1YSyxPqpTnUW8sUGnCTQPCMHv9EP
	W9ahZ+lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5g7y-00000001XOJ-3ZHH;
	Sun, 13 Sep 2026 09:03:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5g7w-00000001XO6-088h;
	Sun, 13 Sep 2026 09:03:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7564543C0B;
	Sun, 13 Sep 2026 09:03:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDE8C1F000FF;
	Sun, 13 Sep 2026 09:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789290235;
	bh=HOCVCoUbZ3n/ApxFbJdyqu/tiiYlAtevu9P9fyqmEWo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DA8LP5lleW298yNT/I3q4vqLVtG60kVYWFGIdHbGeitPHZw3N5aKTd5JB7sIfLcjd
	 23xpU5kKtO2bqa3Ln4h+0HEQUHddp8GSNcvJ7kvJ9n+TiCkKQmKdLrkuWRU+LduKiN
	 0/P4yuP1kiB1cmlamRZbZQme2JRS7tIKOU+1wrPhzCRtpLfJh/28vGKBk3drZPkHlR
	 jqjza0d7Hs/rVd7dLsmqmDPuvVeAMHLze7SEp+fOJJvTly682/m6scTeR5d/V3GYNt
	 YJ5A0ytlK0m1B6rCm1CrazlfXBX8yMXN04s39tCVkE8LpMcFplVkQ6JMAlpx1FPeXb
	 ci2rgPu86TapQ==
Date: Sun, 13 Sep 2026 11:03:52 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/10] dt-bindings: soc: amlogic: Add compatible to
 support more SoCs
Message-ID: <20260913-resilient-terrier-of-sympathy-e50c85@quoll>
References: <20260911-more-socs-to-support-clk_measure-v1-0-940e269aa52f@amlogic.com>
 <20260911-more-socs-to-support-clk_measure-v1-1-940e269aa52f@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260911-more-socs-to-support-clk_measure-v1-1-940e269aa52f@amlogic.com>
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

On Fri, Sep 11, 2026 at 04:28:28PM +0800, Chuan Liu wrote:
> Add clk-measure compatible for amlogic A5, A4, S7, S7D, S6 and A9 SoCs.
> 
> Although the clk-measure IP itself has little hardware difference across
> SoCs, the clock inputs connected to the clk-measure block vary between
> SoCs. Therefore, it is difficult to fall back to the configuration used
> by previous SoCs.
> 
> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> ---
>  .../bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml          | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml b/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml
> index b1200e6940ac..125be01e3b2c 100644
> --- a/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml
> +++ b/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml
> @@ -26,6 +26,12 @@ properties:
>        - amlogic,s4-clk-measure
>        - amlogic,a1-clk-measure
>        - amlogic,t7-clk-measure
> +      - amlogic,a5-clk-measure

Why is a5 after a1? Are you all adding here to the end of the list all
the time?

Best regards,
Krzysztof


