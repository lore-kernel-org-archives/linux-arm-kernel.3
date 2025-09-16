Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7464ECAC592
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 02:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SGvPEh6adUQ9XEa0jZOHz7Ezb3Hwi7fsyJSW9ys+H8k=; b=RlLE7zrjKOC+lleaQFvMirg1Pd
	c9eKLxelJYtXpDlNlY6SXan9ll2tFEjG31wYc6U0xYhdobhKHLtAIelopfRfWjLdbnvSKCHVHPgSh
	5TFtJ9fi7nYoaasEYAWzX8rBvpWdP5jKiJz193cpJUHXAJsNILfYZx3rFuxpd0l5DugDRvylzWzHX
	M9f5AYfZSUiqE4P8lMiqRCzCDfsqbwwalLApEm/AY8A0B8cNGTMezUtEhVMLS9Ir7WCFjBh6ZLcM6
	I4fPupayOWLT5X2oEHr0L2H2ZrD4Uzd09SPLCRUtwX1rjhNGxIJgMFLmtqSENjc/BBf7HNe6oyd3K
	hk7ORbfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyLkd-00000006Wzt-0A3L;
	Tue, 16 Sep 2025 02:49:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyLka-00000006Wzh-3LAB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 02:49:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DFB7D60054;
	Tue, 16 Sep 2025 02:48:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 644FAC4CEF1;
	Tue, 16 Sep 2025 02:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757990939;
	bh=hJOD7/Gxus8N7T/NcIWI9aLJmKggbpx+22bjHzbhIMs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ogHSnETMdsDLnn8+t/s/0j0+1PwtHU+wjL2SkSHN5VLKbaTKgDy23lMiWuU15HQK+
	 eyLydqI98LkI7qjq7bmexhtZuYxax/BgxLwFRs1bNkf2b46MTJVLBf3WobCAo0ZOw5
	 OzQ5sYAqRbdNGPJzdW+dTC5B+Ud4is+2xZQQ4BJ3rDp7C5ffs4E0wBlQorDmDhZRsr
	 RtYvTalyURMMmmaTr9E8OENKivW1PoQ5HV/AiCjvBd/X5MXvpepcj5qIPJThJLqiSg
	 SfBO85uuPheejlvdxauWrPjTAh1VEM+uEA8iKjrtVeEQ+OWhKV6SurLAaeDnnfis25
	 sc9VGnxqYteAg==
Date: Mon, 15 Sep 2025 21:48:58 -0500
From: Rob Herring <robh@kernel.org>
To: Vikram Sharma <quic_vikramsa@quicinc.com>
Cc: vladimir.zapolskiy@linaro.org, bryan.odonoghue@linaro.org,
	mchehab@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	andersson@kernel.org, konradybcio@kernel.org,
	hverkuil-cisco@xs4all.nl, cros-qcom-dts-watchers@chromium.org,
	catalin.marinas@arm.com, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, quic_nihalkum@quicinc.com,
	quic_svankada@quicinc.com, linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: i2c: qcom-cci: Document qcs8300
 compatible
Message-ID: <20250916024858.GA3574831-robh@kernel.org>
References: <20250912141134.2799078-1-quic_vikramsa@quicinc.com>
 <20250912141134.2799078-2-quic_vikramsa@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250912141134.2799078-2-quic_vikramsa@quicinc.com>
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

On Fri, Sep 12, 2025 at 07:41:32PM +0530, Vikram Sharma wrote:
> From: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> 
> Add device tree bindings for the CCI controller on the
> Qualcomm QCS8300 SoC.
> Introduce the "qcom,qcs8300-cci" compatible string.

Wrap commit messages at 72 chars. And explain how it's the same or 
different from existing SoCs in the commit message. Don't explain the 
diff. We can read that ourselves.

> 
> Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> index 1687b069e032..edd2e77d717b 100644
> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> @@ -25,6 +25,7 @@ properties:
>  
>        - items:
>            - enum:
> +              - qcom,qcs8300-cci
>                - qcom,sc7280-cci
>                - qcom,sc8280xp-cci
>                - qcom,sdm670-cci
> @@ -223,6 +224,7 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - qcom,qcs8300-cci
>                - qcom,sm8550-cci
>                - qcom,sm8650-cci
>                - qcom,x1e80100-cci
> -- 
> 2.25.1
> 

