Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 900A3C8303F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 07:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BzB3bveqwxOWRl0DZbW1Z2B2gSEQofGsqxwgxw3LERo=; b=RZX5NafkBBalHmyEEg7iyPodCi
	9ybf6bokFirZnOe3T+EWIcNJaLINgmIxdNIj6jBt3C3JTTxJMfn0nI13vU7vJ7zwPNl6V9jKP6KSu
	a/ZwvJbiXBPsU9phUobBWqyorZgiM9Ad5AgunaC20Wuc7uwKTjr68909eLnQOqq/XL3MdwbNOm62P
	YOxWf/BG2lPjmPI9E9n0LhUpyOaNiuawckfZ4Dr3U+dA1LmQ9SSFMNDOM2omhS7AMawZREzaajPHn
	Zc9/uRuLjFobrFcjzfRM0eFs+szowBPfij7FRQIJXWY+kqNSmIZXHphvhGtnt+xxPQPS7PgLHxp09
	AXBqpyGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urtvo-00000004pwU-1Jl3;
	Fri, 29 Aug 2025 07:53:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urtfW-00000004n2g-0Kqh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 07:37:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8077D60051;
	Fri, 29 Aug 2025 07:37:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F34FC4CEF0;
	Fri, 29 Aug 2025 07:37:04 +0000 (UTC)
Date: Fri, 29 Aug 2025 09:37:02 +0200
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Luo Jie <quic_luoj@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Varadarajan Narayanan <quic_varada@quicinc.com>, Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Anusha Rao <quic_anusha@quicinc.com>, Manikanta Mylavarapu <quic_mmanikan@quicinc.com>, 
	Devi Priya <quic_devipriy@quicinc.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Richard Cochran <richardcochran@gmail.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com, quic_leiwei@quicinc.com, 
	quic_pavir@quicinc.com, quic_suruchia@quicinc.com
Subject: Re: [PATCH v4 06/10] dt-bindings: clock: Add required
 "interconnect-cells" property
Message-ID: <20250829-ubiquitous-imaginary-mammoth-d52bde@kuoka>
References: <20250828-qcom_ipq5424_nsscc-v4-0-cb913b205bcb@quicinc.com>
 <20250828-qcom_ipq5424_nsscc-v4-6-cb913b205bcb@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250828-qcom_ipq5424_nsscc-v4-6-cb913b205bcb@quicinc.com>
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

On Thu, Aug 28, 2025 at 06:32:19PM +0800, Luo Jie wrote:
> ICC clocks are always provided by the NSS clock controller of IPQ9574,
> so add interconnect-cells as required DT property.

Does not make sense. If clocks are always, you require different
property?

> 
> Fixes: 28300ecedce4 ("dt-bindings: clock: Add ipq9574 NSSCC clock and reset definitions")
> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>

Fixes cannot be in the middle of patchset.

See submitting patches and your internal guideline explaining it with
great details.

> ---
>  Documentation/devicetree/bindings/clock/qcom,ipq9574-nsscc.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,ipq9574-nsscc.yaml b/Documentation/devicetree/bindings/clock/qcom,ipq9574-nsscc.yaml
> index 17252b6ea3be..fc604279114f 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,ipq9574-nsscc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,ipq9574-nsscc.yaml
> @@ -57,6 +57,7 @@ required:
>    - compatible
>    - clocks
>    - clock-names
> +  - '#interconnect-cells'

ABI break without explanation.

Best regards,
Krzysztof


