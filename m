Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED1E3CCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 13:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vS3mjcoHw8qIUxXCnOrDzk3YjU4JM/GYmhM3Hd6fsfY=; b=FZ4Qv80yxataqDhsAe5ghlqU1U
	Gy/FU4nB+l2kVRZO9K5gwifvnLWKLhnlzLxsGbSLgUQkIBI98ULZbQaHeW3d60ckHRuAppQzt52WO
	1yDM8sFh5g25TOIDHaEjCek/txIB0nkLUzhS+GKK/QVx+CGFH76xDmZkl86NOvd6M24fYCzOSVgwf
	VcuoXlWcOAS5uO30Pk6SUOXCTcuNvjilWAYz3ZbdTlB+qMLvgmK5uH/72zxtVvbUSdPvaf+SCzpIr
	gZ3o3VZ8JTJ07hA8yRamIyu/O4dxfiivU3DptC4ngsLMu52NuXmqdQL9WEg3rgIiWAnqHCQkT7OlA
	2rVw9jGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v91aD-00000001iKe-20bw;
	Wed, 15 Oct 2025 13:30:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v91aB-00000001iKC-1PvN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 13:30:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C3E824908F;
	Wed, 15 Oct 2025 13:30:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B283CC4CEFE;
	Wed, 15 Oct 2025 13:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760535022;
	bh=A4j7EyyUEQAH/++sFjjOscr7TYVqFzYtv6RZBE5pQNE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=b6ci1stXqNKhV16bQZUz2RKyXZlZu/XYFYpCzaE+LYx/QRiRt9Jy59YuGmxqUoF/i
	 sZQjJcJaIvwIy+xtYGruCM2hrR7Yzju5OJqzfVb/Q62yi6S5kJXs2GmmxDsPicrq80
	 z78Vm4Ikoezi+QIy4EMXK/VXJxVqC/p8oDMGG6sdPBDrbS8AEelVtc8aPNJoNgEy5x
	 srfEllTzNfWkG8OB/UFi7ZlQwxeoD+KdQUhR/rDUMaIBvEZhRfYKbEH6G/DWBmMl+w
	 SO98xbxHlaLZk4RMMSiNRAoHeYExrixS5LTfTnnMvizdwz6Qa9nAaMBFTz1VKDXMbv
	 fEhG9pPWVdb1g==
Message-ID: <9adec627-e3f5-4664-881c-9e93f029e189@kernel.org>
Date: Wed, 15 Oct 2025 14:30:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: media: qcom,qcs8300-camss: Add
 missing power supplies
To: Vikram Sharma <quic_vikramsa@quicinc.com>, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
References: <20251015130130.2790829-1-quic_vikramsa@quicinc.com>
 <20251015130130.2790829-2-quic_vikramsa@quicinc.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20251015130130.2790829-2-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_063023_425236_05A41BF2 
X-CRM114-Status: GOOD (  12.60  )
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

On 15/10/2025 14:01, Vikram Sharma wrote:
> Add support for vdda-phy-supply and vdda-pll-supply in the QCS8300
> CAMSS binding to reflect camera sensor hardware requirements.
> 
> Co-developed-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>   .../bindings/media/qcom,qcs8300-camss.yaml          | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml b/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml
> index 80a4540a22dc..dce0a1fcb10c 100644
> --- a/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml
> @@ -120,6 +120,14 @@ properties:
>       items:
>         - const: top
>   
> +  vdda-phy-supply:
> +    description:
> +      Phandle to a regulator supply to PHY core block.
> +
> +  vdda-pll-supply:
> +    description:
> +      Phandle to 1.8V regulator supply to PHY refclk pll block.
> +
>     ports:
>       $ref: /schemas/graph.yaml#/properties/ports
>   
> @@ -160,6 +168,8 @@ required:
>     - power-domains
>     - power-domain-names
>     - ports
> +  - vdda-phy-supply
> +  - vdda-pll-supply
>   
>   additionalProperties: false
>   
> @@ -328,6 +338,9 @@ examples:
>               power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
>               power-domain-names = "top";
>   
> +            vdda-phy-supply = <&vreg_l4a_0p88>;
> +            vdda-pll-supply = <&vreg_l1c_1p2>;
> +
>               ports {
>                   #address-cells = <1>;
>                   #size-cells = <0>;

This needs a Fixes: tag

---
bod

