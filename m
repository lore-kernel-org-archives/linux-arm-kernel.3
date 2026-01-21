Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89167C4452E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 14:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m0Ii+3VnZ5jNPhJ71qkViiknFpVTHBELooQbA4tOd9Q=; b=19gBGqGpoPJsQxhoIIPlcqAoQx
	PH7M2TPLuFCE1FI7Sk0hWW/VIuTrFZ2JEeF39CVsTmZkXvgqjEQa4Qk71NEF84hI7xRh7n6Xf4BJX
	g2xFva4VmUxbjdceLW7o9ClT8LocnDdNHijvTGWAOveHq1XgE6lHd8tw8vLaiSrbShGilhpo1fkWS
	cIlygiWKQ90Zj7cQvZyKckhnqymMXE7/+OC5FDy+/57FyNnOotHU/90zxCHu2m8e6CTBQB17L68id
	1Q2OSVhTR9rl/ciRQX/OunBQ2ubOjx7k4oniM08ofaymbtjcsahJxln8pRFtdVvZpVJag2E8DNpKN
	Kz9eec8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viYlR-00000005Yzb-30rD;
	Wed, 21 Jan 2026 14:00:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viYlQ-00000005YzU-0Iyu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 14:00:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D88B960097;
	Wed, 21 Jan 2026 14:00:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0E25C4CEF1;
	Wed, 21 Jan 2026 14:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769004050;
	bh=4Y/dQQ9O27GubkCYAbiRqBKVCm96wWR3GWTuiKkCsSg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q3HU9LToG7OTdOJVNoG+A6HKVbEU/Y3S8H2JdtIh9/s5FaNvTbXJcQ0LKFMJynsNA
	 TTnbw5C9CiFYzqqHNx5aZ9fk5p3p3JyOBOOAziWBaqMJhJ3Kc4uOyNJuKYiNDJSH9k
	 OEkmJi+wEGhwSJkUB8DKbyYBpduRSVz1ILc5EUzMhYDtW5oRaPhRKC/ftnQWBibe7n
	 8SUybz+Ui2WLmB7nt6YEEeRgQJogsQVD6+3zMAkksDDz6vG5Qfp/7cE9vM8pwiCJ+I
	 5ni7CiR41EdgpiWJuE8MK/DcyhbeQWhkPfrJRD8CYaKNW4puYKVSNM7P0QAMfsshRs
	 gOMFOtDw9GMzg==
Date: Wed, 21 Jan 2026 08:00:46 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
Cc: bryan.odonoghue@linaro.org, mchehab@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org, 
	hverkuil-cisco@xs4all.nl, cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, 
	will@kernel.org, linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com, 
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: Re: [PATCH v8 1/5] dt-bindings: i2c: qcom-cci: Document qcs8300
 compatible
Message-ID: <wfkjfoaqgn7lyhtiojodjcaxyzsi75zszoxpd3o47p5i6l2eb7@gxmozuc2wh47>
References: <20251222095914.1995041-1-quic_nihalkum@quicinc.com>
 <20251222095914.1995041-2-quic_nihalkum@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251222095914.1995041-2-quic_nihalkum@quicinc.com>
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

On Mon, Dec 22, 2025 at 03:29:10PM +0530, Nihal Kumar Gupta wrote:
> The three instances of CCI found on the QCS8300 are functionally the same
> as on a number of existing Qualcomm SoCs.
> 
> Introduce a new SoC-specific compatible string "qcom,qcs8300-cci" with a
> common fallback.
> 
> Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

Maybe I'm not seeing it, but you didn't include either i2c maintainers
or the linux-i2c mailing list, so this is unlikely to move anywhere.

Please send this out again with the recipients that get_maintainers tell
you do include. (and skip the ones that aren't relevant).

And please adopt b4 (go/upstream tells you how) to avoid such (human)
mistakes going forward.

Thanks,
Bjorn

> ---
>  Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> index a3fe1eea6aec..399a09409e07 100644
> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> @@ -28,6 +28,7 @@ properties:
>            - enum:
>                - qcom,kaanapali-cci
>                - qcom,qcm2290-cci
> +              - qcom,qcs8300-cci
>                - qcom,sa8775p-cci
>                - qcom,sc7280-cci
>                - qcom,sc8280xp-cci
> @@ -133,6 +134,7 @@ allOf:
>              enum:
>                - qcom,kaanapali-cci
>                - qcom,qcm2290-cci
> +              - qcom,qcs8300-cci
>                - qcom,sm8750-cci
>      then:
>        properties:
> -- 
> 2.34.1
> 

