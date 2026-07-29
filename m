Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB04BC53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 08:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lgVUcD8CFwoIBIUfkRSTzNndhdC7UEOcfo40aszScmE=; b=ijRyxlUX7dS9iBXJaJpRrDulw+
	WV/9ihWQxZyrUCI5AFDZNY0DKi14Kc40KRQVcvZpygIM44Or10nLVyzBQg6BP6/aM8rkhr1j/ez3K
	bYLm2MH4UELQ4cUj3GhnOIR7bBCsQnl28/9un7vFvNa5whLwNQlO4WZWkwOrGFe7uBug3c6zCGRJN
	XN982uiHS8S9F0j0XnT2JU9lM0fpyRvDFoEF3WLLnI7oVj/egZNlPkEOYPyaSuf4FYLSqkuKQcGkd
	mjS9Zn1wATlp9eXf68vAs4gVtIilDjHwx4QqJ2DtYypVjF9uIUjqy/0FSFTunA/CRb8pz9oE31bEw
	8E/6zZKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wozpu-00000007G04-1743;
	Wed, 29 Jul 2026 08:40:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wozps-00000007FzT-3EKs;
	Wed, 29 Jul 2026 08:40:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2C49B60A5E;
	Wed, 29 Jul 2026 08:40:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7D8F1F000E9;
	Wed, 29 Jul 2026 08:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785314419;
	bh=lgVUcD8CFwoIBIUfkRSTzNndhdC7UEOcfo40aszScmE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Pz3hMM0FQ5je3tz4sXl5/T3mPU0zNBSa2Py+tDu8Qs8igIipFWRYPF5MZ2HoMGvRX
	 CB/vkkqC4ujVZQNEiVFZf57ir88xqMZaRs3HC8VwSTiNltd+at5OXBwgP2yJjQDr7c
	 HGc9K2WcB2SuFKQpQYzWjbKGzTDO7x+0XKS0n2/hwpEobpgGQeEN544xBG/O7ernDf
	 sRrk1XUElCsE/RrXaV4jCYC5y758UxEsg/BvJ41BHbqcvNp5zrjjkTcn1QMNrL2zVZ
	 AQ+uYQx6paUeg8abmgjy+bLMUFm9By9A3/S6yhkbJQJxfI6kLKZ+H85y5ET6n/uSvd
	 p2krLy7KGT4TA==
Date: Wed, 29 Jul 2026 10:40:15 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alberto Robazza <robazza.alberto@proton.me>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, 
	martin.blumenstingl@googlemail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	Alberto Robazza <robazzalberto@gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: vendor-prefixes: add Orbbec
Message-ID: <20260729-unbreakable-observant-clam-ca4f6d@quoll>
References: <20260728151636.236393-1-robazzalberto@gmail.com>
 <20260728151636.236393-2-robazzalberto@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260728151636.236393-2-robazzalberto@gmail.com>
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

On Tue, Jul 28, 2026 at 05:16:34PM +0200, Alberto Robazza wrote:
> Add the "orbbec" vendor prefix for Orbbec Inc., a manufacturer of
> 3D depth cameras and embedded vision boards. The prefix is needed by
> an upcoming board compatible string ("orbbec,zora-p1") introduced by
> this series.

Drop the last sentence. It is implied if it comes within this patchset.
Are you using it in this patchset, though?

> 
> Link: https://www.orbbec.com/
> Signed-off-by: Alberto Robazza <robazzalberto@gmail.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


