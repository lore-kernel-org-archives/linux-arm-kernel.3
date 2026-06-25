Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94698CDB466
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 07:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=szlf9WMEbP6Ff6qejR6ZQRZMLqe4N8GVxyJBVP9cdAY=; b=G66vuGoIWZ0g+0fAp8q8yW9MpN
	S/+kZASXcvpMnr6AmblG1gp/ULLzW9URvLPGszdCMOXhJThD8uaHU4FzPhIxgq5htIKzt0dSjrh5E
	w8cCeZzgvjqUF4fOhqcs11qP1Kyh1WppkJ41RxM14sf5QFSsSvdPkhwPBZfkHNiRBDpDf9tavcORZ
	ekig/9K4oy4evF9EpvrbryL3asnQKG+LT5hzW6u4JP7CYq77JSqgDHneAk/vtBxIv5lxjtjtAycmO
	y6Qx4wav/YxEe17al0MpT/ayy9x86Dpu3UzJyA+eAvYkFqBKiPT6uuLCPDnucJu5BmY8sQ3m0cyyH
	1u95ebsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wceS2-00000008l2M-2Jn9;
	Thu, 25 Jun 2026 07:24:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wceS1-00000008l2G-29N4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 07:24:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9054260218;
	Thu, 25 Jun 2026 07:24:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 500E91F000E9;
	Thu, 25 Jun 2026 07:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782372280;
	bh=szlf9WMEbP6Ff6qejR6ZQRZMLqe4N8GVxyJBVP9cdAY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=C4E3+3x0VOSFH0dFkeBFT8LkX/oEbOZWh8QB6g2J+48cJA86FJuWUw/PeyuQdKB6l
	 5U3PhXyhJvCXBjIDYLF2FFD2C+RwMKtWXlRlqc5HhNFqDC9XugMnRhytbEfpAVxMp8
	 xTb0sAnGKkZM0TTrY2qRaK1Ug1stzt5Tn1+/o8j0v/afKTx7jQX9ZEG4xIHEnvk2FS
	 jemzgjl/9q5d7vNnpS+7VZRkwlxVwLJWpFjPhbNJHj6L+r9oDyfWaupf6n34P2rXsG
	 GJIZJqyhyBH/kOvsn7uXSsaExB/M/ejYuhEp09nLOVgZY3/vD46S2zB58Pjc2tPUDp
	 YOfJdJjtfIruA==
Date: Thu, 25 Jun 2026 09:24:36 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>, Jingyi Wang <jingyi.wang@oss.qualcomm.com>, 
	Abel Vesa <abel.vesa@oss.qualcomm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>, 
	Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: qcom,coresight-tnoc: allow
 arm,primecell-periphid
Message-ID: <20260625-strong-daft-pudu-21471f@quoll>
References: <20260624-fix-tracenoc-probe-issue-v2-0-786520f62f21@oss.qualcomm.com>
 <20260624-fix-tracenoc-probe-issue-v2-1-786520f62f21@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260624-fix-tracenoc-probe-issue-v2-1-786520f62f21@oss.qualcomm.com>
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

On Wed, Jun 24, 2026 at 05:49:25PM +0800, Jie Gan wrote:
> The TNOC device is an AMBA primecell and may carry the standard
> arm,primecell-periphid property, which is used to supply the
> peripheral ID when it cannot be read from the device registers.
> 
> Reference primecell.yaml and set additionalProperties to true so the
> binding accepts arm,primecell-periphid along with the other common
> primecell properties.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
> index ef648a15b806..9624fc0adfdc 100644
> --- a/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
> @@ -32,6 +32,9 @@ select:
>    required:
>      - compatible
>  
> +allOf:
> +  - $ref: /schemas/arm/primecell.yaml#
> +
>  properties:
>    $nodename:
>      pattern: "^tn(@[0-9a-f]+)$"
> @@ -78,7 +81,7 @@ required:
>    - in-ports
>    - out-ports
>  
> -additionalProperties: false
> +additionalProperties: true

Nope, it is not allowed. Explicitly mentioned in writing bindings and
all DT introductory talks by me.

Best regards,
Krzysztof


