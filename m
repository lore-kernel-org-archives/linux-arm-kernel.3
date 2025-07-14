Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D45AEC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 07:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pCEVx10bN8PLCvRcPxiOtgajJZ0RiJzTpcnLUOUWcxo=; b=aOxe9pfqqJ0Mu3aJaw+Jv1fVT6
	IN9OhRTFKo5lV6zSzsN4oPKQS8MR252++GyoNnNLJrCjsLkfAEFvkUXaeKxxoCeMYuXfZfJWPv4ZK
	x04xOyfdrQ/KpCRJG3T/FMm4NupxdzUvIz7lqN26RpEbAC/rYLi++Zb+gEA+qV4ecqkKuGTpkVhnU
	d5xcMJm470yzD6lO5m6tdIexYRq4VV+2tG92fe1xCpCN2eA2U3PwIr2dou0nAHvDmU7rvo36dM4jh
	5FtJzsXnG/CBCiBvevTjlRWA8FB3kpvj2WxzUZutimZ5Imkpj3o5ZXPNIYmm2TmFOyzYdpUA7nm4A
	41qjrFlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubDeX-00000001ThO-1bKS;
	Mon, 14 Jul 2025 07:31:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubCyW-00000001OV2-2V2g
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 06:47:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F06A45C5A80;
	Mon, 14 Jul 2025 06:47:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18B2CC4CEF6;
	Mon, 14 Jul 2025 06:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752475663;
	bh=Hmw/tp+sBdq2ziMP6TR3hCzb9wJ+2WfBgsvg4Va7Ya8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=le8BHDbiG2aNfWCfPAs1SYVdSi/No69Ukea+4UI/CVmXsBPV1fsrOfDgFf31EBQAg
	 Cz4RygdxBaiiY08F20J/SHhs0KO2/O+8xOgZg6FiJAaqq38UMlpJy/cwRiggXyAZ86
	 /c/eBIvXDYoJh2461Ei/gL7tqMjeUg43L9aKbCkSqoxNKcD2XV0Hhly4QRTCEZPbC6
	 Da7H5nIW1rzLZ/VXZneJ5pRr1S7m2PNwTSL3ADjJUsOKxu8I+QdO/IH6WIccO9bgM2
	 Q3K1d7wpSK/bn/ydmEEqb38XV9hOP+68qVyaF8tlZW/7nNPZatOMEi0Z+FFi2jSzJn
	 JVnVKf06MyJ2A==
Date: Mon, 14 Jul 2025 08:47:41 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mao Jinlong <quic_jinlmao@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/5] dt-bindings: arm: Add qcom,qmi-id for remote etm
Message-ID: <20250714-true-pistachio-peacock-53da1b@krzk-bin>
References: <20250711094031.4171091-1-quic_jinlmao@quicinc.com>
 <20250711094031.4171091-4-quic_jinlmao@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250711094031.4171091-4-quic_jinlmao@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_234744_677488_66DC114A 
X-CRM114-Status: GOOD (  14.27  )
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

On Fri, Jul 11, 2025 at 02:40:29AM -0700, Mao Jinlong wrote:
> Remote etm binding change was merged to fix the dt warning. Driver
> changes were not merged at that time. qcom,qmi-instance-id is
> required for remote etm driver to find the remote subsystem connection.

Again, driver... 


> It is the instance id used by qmi to communicate with remote processor.
> 
> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
> ---
>  .../bindings/arm/qcom,coresight-remote-etm.yaml          | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml
> index 4fd5752978cd..bd78f6bc2fdf 100644
> --- a/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml
> @@ -20,6 +20,12 @@ properties:
>    compatible:
>      const: qcom,coresight-remote-etm
>  
> +  qcom,qmi-instance-id:

Don't come with another, 20th property for your remote proc
architecture. Use existing properties.

This pattern in qcom is extremely confusing - similar thing for remote
proc called 20 different ways, just because in downstream you have 20
different drivers.

NAK

Come with unified schema for existing and future properties like that.
Assuming this is NOT FOR DRIVER in the first place.

Best regards,
Krzysztof


