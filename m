Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C387CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 15:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZWenX7slUx+XcsY6Fh7yBAqOQ7v6LzOAOCFymybKhSo=; b=3I271sgRmy08C5ZjwPV5Zb5KNU
	FEk/xjUoVTVdX7jabEbvapyMxQyEKaAphUd8FXC+OYnLnN1BRmilFt1Khc84s7TiJ3/kZtcJjT+J9
	49s0lEieZhA6Ypvmq4VoMPeQ+8Ubts0zXdeff8J7gbYbZFrEntauGhDDmHIMbUNN0zpPK0OHas7+V
	JCntzSvHNWzJODZbU7CJPzs3s+hxm52SC76c5A+Ymj8EezG3m7zPGkOITEYba4IsvZggwoGsnAwAG
	w4XNOzGGg1942jWryCUV/UPeV4Z06GmYiiXnN7Focw7k/+jKBBcrY5gT93DP3AfwDJK9ARgZuLTsS
	oZlCUHSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDOtu-0000000ECGv-3loI;
	Mon, 27 Oct 2025 15:12:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDOtp-0000000ECFA-3FyE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 15:12:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D7434602BC;
	Mon, 27 Oct 2025 15:12:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AC4BC4CEF1;
	Mon, 27 Oct 2025 15:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761577963;
	bh=Yuf62+vsNEYIGHU7qdiXEvN44cNtqtGLtjxwCQO14nc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PYhVnaCNQJppJbs1m33EOMJSII6FXJ54Q46WVqlhXycChK5DLlI8YfUIU9QAZwurz
	 4BEqIJvZdZ4SnKzNRp8Te8UCAa3mT0A1Mswt9AYhJ6jkGbEBeFsqfuXkoXXADqbNUU
	 2kVQbL2lmjYguuUGX3IF2MMD/oU/Vrvu0Dc13F0En3GT878JM3VomK87D2JkaadUby
	 6zkZ6EyXnqhh8nQ2mniuhnmFEfcEpfhSISYGxw1hGztu22f7MBn+J7f1yOuJlV+h8D
	 xdIdloucDWhxWGHTB+ilVpI7hBC2M3p3HdJt9h+SaylotYOK9ZA/mIDuK9NsnR8YTy
	 pSAW+22lO/dGA==
Date: Mon, 27 Oct 2025 10:15:36 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>, 
	Mao Jinlong <jinlong.mao@oss.qualcomm.com>, Jie Gan <quic_jiegan@quicinc.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: add CTCU device for QCS8300
Message-ID: <nvrjy4mqhuyngmm44l6lcst3kz7qejijvrflom2a56keqtr7zd@tu337zwgl3td>
References: <20251013-enable-ctcu-for-qcs8300-v3-0-611e6e0d3085@oss.qualcomm.com>
 <20251013-enable-ctcu-for-qcs8300-v3-1-611e6e0d3085@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251013-enable-ctcu-for-qcs8300-v3-1-611e6e0d3085@oss.qualcomm.com>
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

On Mon, Oct 13, 2025 at 04:34:37PM +0800, Jie Gan wrote:
> The CTCU device for QCS8300 shares the same configurations as SA8775p. Add
> a fallback to enable the CTCU for QCS8300 to utilize the compitable of the
> SA8775p.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
> index c969c16c21ef..460f38ddbd73 100644
> --- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
> @@ -26,8 +26,13 @@ description: |
>  
>  properties:
>    compatible:
> -    enum:
> -      - qcom,sa8775p-ctcu
> +    oneOf:
> +      - items:
> +          - enum:
> +              - qcom,qcs8300-ctcu
> +          - const: qcom,sa8775p-ctcu
> +      - enum:
> +          - qcom,sa8775p-ctcu
>  
>    reg:
>      maxItems: 1
> 
> -- 
> 2.34.1
> 

