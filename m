Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28181C3ABA9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 06:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e1XZzAelGg59OXYgUwWadumjNHVVLRvZFfU/XqwumSI=; b=TdJ75mA8hqSSh8yyxv8l7+sqRo
	faf14e9zsJwoeWuj2kFX0DW3npjsaOpUYcmmO9/DVLCt6unCW5D2Y9hAMjM9ELs8fALlGHvYQvoc0
	0vv84bv5l8Y7FipAXYhPcosF11YsNst4Pp7nQo8rfu17fHa4QraWOPrcHJk0hLHzy/rfNuhXkTR33
	Prid1bNrUoVtoA4RGM/6o1E2xTN1iuAPJVg2K1aX2rSB4SpKIeRw2nE8tz2xBuc/CZRWsnvEbyLpz
	a8pvl2nDXS16thYwWGVjeHgJPVCH8k8zXA5dGrTXKc+Gi8By1SXvao84PPI1+5baOkgNuU3siy3Sw
	5AYx4rDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAk9f-000000010jZ-46GO;
	Fri, 02 May 2025 06:45:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAk7j-000000010Ws-0tFA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 06:43:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 08F3060007;
	Fri,  2 May 2025 06:43:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74B57C4CEE4;
	Fri,  2 May 2025 06:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746168228;
	bh=BNeIriVD+Uk78B5K73mGwjQJ3XL7k7AuZMqD6Ps9t6E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o+vtIvnAfYip84JAymD4Mblyrfer/CJjrWWSEtCM38NzLGkdsCsXWoTLXtYwt9vlx
	 FfdZoVHxtUDjrXMvm6etjr0pMbqoiHnK6iW+RBfZP9Om0aB2zny/n1hu1U9xFUKcVG
	 3taFqslrWueauTtmSNlqPEQOENTlIokoPiTtb23TXQ/peM2oi2lOgDeP26RSlIDJEG
	 nFP1mqrGgEyoxpLqF1rlSB4lvVcWGJYtTWnycfawUv8fi9U5Bvr+rWICxCa9cPhbEN
	 HWRL29bb/UuXooS+EN9PplCVfagwIZmoiYhIlxTQd0mguZdnzoyRWqiksW0H0Q7Hus
	 R1GhC/EEbNSOw==
Date: Fri, 2 May 2025 08:43:45 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mao Jinlong <quic_jinlmao@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: Add Qualcomm extended CTI
Message-ID: <20250502-notorious-granite-gibbon-1abf15@kuoka>
References: <20250429071841.1158315-1-quic_jinlmao@quicinc.com>
 <20250429071841.1158315-2-quic_jinlmao@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250429071841.1158315-2-quic_jinlmao@quicinc.com>
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

On Tue, Apr 29, 2025 at 12:18:40AM GMT, Mao Jinlong wrote:
> Add Qualcomm extended CTI support in CTI binding file. Qualcomm
> extended CTI supports up to 128 triggers.
> 
> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
> ---
>  Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
> index 2d5545a2b49c..1aa27461f5bc 100644
> --- a/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
> +++ b/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
> @@ -84,7 +84,9 @@ properties:
>            - const: arm,coresight-cti
>            - const: arm,primecell
>        - items:
> -          - const: arm,coresight-cti-v8-arch
> +          - enum:
> +              - arm,coresight-cti-v8-arch
> +              - qcom,coresight-cti-extended

cpu phandle is not required? Or not even valid?

Best regards,
Krzysztof


