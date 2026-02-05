Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37A31EC1EBA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 13:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dOex+/fVt8wX7IYG5ScZ+XrnFa+0RHec8yDUzp7ApwU=; b=5AupYpacpC69Gu8djHfZsFg4Vk
	s/fh8XJCefQvicZgXlXsLQxdJTx9vwnqPFPrtAQsTIZjpSuJ2fkzwkGgfbwqwbK6bvvxurS1qVwK2
	DaG13BIdv+9jvROHEh383msMPJWFbmKEkfrj07CKHEhgPooWZ8F3MVQmBZhIh5sIzPompBlGGm591
	dYTl2Jx++a+cWTfPruELWXsdrj0tjqTi6kAtD4HhnLJlJ9yir6Ncad5Tl+uoziAE9KhhXrfs7ulh+
	0pQYyfk54hKag1Fm9V0u75WvG7JM/Du32xROGXumglB9CyJ9EMyuSVYTkcNtlSOpywu0l2mvaSnpj
	tF4J7EmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnziS-00000009yWK-2Tkj;
	Thu, 05 Feb 2026 13:48:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnziP-00000009yVX-2dDN;
	Thu, 05 Feb 2026 13:48:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EB33E42DC9;
	Thu,  5 Feb 2026 13:48:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 446D9C4CEF7;
	Thu,  5 Feb 2026 13:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770299292;
	bh=1wC56N7As0NIexxSGFO55ZSK9LgfEt1xFbSYfs02cRY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pi8S1yMLdcEKbNNY9SnG+1h6Kbwq9byZUFHW6n/CD9CYTV0kw46EfkKx9q41HStAs
	 tzHRWBQPkub/Oq+YJA6na7mchjYKBupWIWvuylOZBi/IQKGJaJjfSpjKWmfMWwm3RK
	 LuPvXyEwXKWf04TcMzv5dOI249QK3ZlM3VizBz6AZ3ijlbmrlZBaWwX41vZ/JaNCGZ
	 1necQQ+mB90VdPc1YuNs4DpfOiZz2qfFq6PiPhe6LtKbX9y07Kri/wPtkUFE3USld5
	 2gf8SRtKCM2EIkfeLPD/K/ww61PXu8rf2mIVURDUdFabGjF87qgGqUdVEosrhm+efl
	 QewgdMY2XEMOQ==
Date: Thu, 5 Feb 2026 14:48:10 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: arm: amlogic: add A311Y3 support
Message-ID: <20260205-abstract-oriole-of-purring-316531@quoll>
References: <20260205-a9-baisc-dts-v1-0-1212b46f95a7@amlogic.com>
 <20260205-a9-baisc-dts-v1-1-1212b46f95a7@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260205-a9-baisc-dts-v1-1-1212b46f95a7@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_054813_711642_9E232DD4 
X-CRM114-Status: UNSURE (   9.01  )
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

On Thu, Feb 05, 2026 at 06:04:02AM +0000, Xianwei Zhao wrote:
> Add bindings for the Amlogic BY401 board, using A311Y3 Soc from
> Amlogic A9 family chip.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>  Documentation/devicetree/bindings/arm/amlogic.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


