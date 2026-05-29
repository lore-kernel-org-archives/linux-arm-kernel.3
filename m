Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07801CD6E49
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 17:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0WI4qQyv1EBpPKFRUbV0AQ8EnBM8UW7h22nNav4ht4s=; b=EPaKB4E9ee7qpb2VPlNUUkRhq2
	un/X6DxntybChWvxndg6TrBvZRvSK7hw6+Cd+rgN3IARWkohKFy5J/b7VytltLpFeEZMO6M3pSzsp
	TYaqaYXuzm7N3KLmkX8CMJW+6Avkau8pUbzQiy57vST6qjDao2vBm2S2tvfTKqFTmbZle1cd1kNkg
	nacuIBjUMkbuDaYZA+oaZEXNewMa7Ul47YlHvDyg5qmo9M2eJMHLd/S+xBxG3vQMe+itKjo3AceVg
	ATdjy2/KDt/H5x61mHTfDhvbKxf7kU/wJfid7j7OzruHgmgouo9BFrlD/7vgioVL4JFVUEB7Et9hd
	T6IKDgiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT1B2-000000081XH-0Sbo;
	Fri, 29 May 2026 17:39:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT1B1-000000081XB-1q0m
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 17:39:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C5A53605D6;
	Fri, 29 May 2026 17:39:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F22C31F00893;
	Fri, 29 May 2026 17:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780076358;
	bh=0WI4qQyv1EBpPKFRUbV0AQ8EnBM8UW7h22nNav4ht4s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Z310wI/JnTJ55UPI2NaUhuoQKsf2EhdkhQdN8jU3oDCtKPpmWt+FK14n2kUk9JHRF
	 j0m5swxjsiuXc7sIomdwRUXJAQKApd8tESOB2MaBefqP2BZ1HgZZP434x1eA9BEySw
	 pJFHz2nsjpLZWLfqlwcXBzgXGJVyvznOrcxDKoCyL6eKfilULbvurOgoADNF1SfYpx
	 ASmT5Ks5kF+CwQkdtb7304ywS0f6XQaUpdCaqZ1kOIYPV72AUOMbaQ9VfNiGV1jWf1
	 C3FWloTyFBPzluVScwSsbiQ0YfgNM3LKilJncymHrSsdRd9HTpdGbrQYPHzoaeC+Ao
	 Pb63skQKRLliA==
Date: Fri, 29 May 2026 19:39:16 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Luca Weiss <luca.weiss@fairphone.com>, 
	Ajit Pandey <ajit.pandey@oss.qualcomm.com>, Imran Shaik <imran.shaik@oss.qualcomm.com>, 
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 3/7] dt-bindings: clock: qcom: Add support for CAMCC
 for Eliza
Message-ID: <20260529-jade-weasel-of-perspective-c2e0aa@quoll>
References: <20260525-eliza_mm_cc_v2-v5-0-a1d125619a5a@oss.qualcomm.com>
 <20260525-eliza_mm_cc_v2-v5-3-a1d125619a5a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260525-eliza_mm_cc_v2-v5-3-a1d125619a5a@oss.qualcomm.com>
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

On Mon, May 25, 2026 at 04:16:05PM +0530, Taniya Das wrote:
> Eliza camera clock controller is on CX and MX rails similar to Milos.
> Add compatible string for Eliza camera and camera BIST clock
> controller to the existing Milos camcc binding and add the
> dt-bindings header for Eliza.
> 
> The camera clock controller provides power domains, so 'power-domain-cells'
> must be present in the device tree node. Add this to required properties
> to enforce it in the binding schema.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


