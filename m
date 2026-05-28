Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 576FBCD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 22:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jJhHDmxLhgZYNTjpWb4+8eqAjhfnb3Kl6RH8rMjYoCE=; b=TYzfNheqkVa4oHIbAkVN6Tvrqq
	jl/DO08RZ1drZ+e48laPQk/97TWgzY1ZGVsYPcGuTQ0PDniZFulur0nHJE/OV0Y5XgGzJnPun/Jmx
	3FIJAus/6wNdrOuWYUnwdz0G8jGsB+htivDOK7uKcyjZgID+W4j59gSuLlbHSi5nJB2jG9854jsPA
	ZbhC/K3/ANZIxy36AtaduLienPGsBk2OqBH/k4F9F/pFcdodvPVfTh9mx6LRvuQY8KXqE7nxBIKVh
	MQyKePfV8s9SSPul5sJePflHV3dGt3tFn4TpDdlU+mqsVnBOEDivyj8QGyGLGjtAl6QPT1/A8+TOK
	XfKGqqXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSiuY-00000006SGk-35oL;
	Thu, 28 May 2026 22:09:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSiuV-00000006SGO-15SU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 22:09:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7E1FD40927;
	Thu, 28 May 2026 22:09:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA2CD1F000E9;
	Thu, 28 May 2026 22:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780006142;
	bh=jJhHDmxLhgZYNTjpWb4+8eqAjhfnb3Kl6RH8rMjYoCE=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=SJu+KLmh1pUFi2KSYJFnTLU6VVdagMEfRkiULnzSwF/FuOVe7WJNRRb4tthFZiqQp
	 D2/JrPEtkh7Q1NkKV1eWlPS55kUuyrt6EOJKz0idK748tmBmSGW+glLF3SWQQV3vQ6
	 P02762ppSco84Yp4PZZTNOdRdkNy7RllS+AEkJNGCeeEDhnbN3hrlh+Z8QYYtNmDD6
	 a/F75pLP68Jb8NQC6Q3dVC/Ogh06uYaIxEV292fL9Pv9G4JLsNr2M42MvIUB9530jp
	 HAMGCdk1mK7BQFhee5fbt3KY296UM8cD+AE/s6h2N5mbPpT/eZRNGXirtYus83t/JB
	 lcD/uUkDkYA1Q==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 1/8] dt-bindings: media: qcom: Add Shikra CAMSS
 compatible
From: bod@kernel.org
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Andi Shyti <andi.shyti@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, linux-arm-msm@vger.kernel.org, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Suresh Vankadara <quic_svankada@quicinc.com>, 
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>
In-Reply-To: <20260526-shikra-camss-review-v1-1-645d2c8c75a7@qti.qualcomm.com>
References: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
 <20260526-shikra-camss-review-v1-1-645d2c8c75a7@qti.qualcomm.com>
Date: Thu, 28 May 2026 23:08:52 +0100
Message-Id: <178000613283.4557.13678881798499721082.b4-reply@b4>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=1671; i=bod@kernel.org;
 h=from:subject:message-id; bh=F1eaxcvD7uA18QinLGLVPQXbeBjKb3fky0zy7KMPuuI=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqGLz3nZSWaVsF8eeq73xKqQ7S8O6ilhGBVDAdf
 N0AFLdxdVuJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCahi89wAKCRAicTuzoY3I
 OnilD/0VvN7QiGhRSN9fjcoHbubBHuShxHDOuwn29WlVCrfFCswj6z7u2AuNOBE5E1hYbfN/UtY
 YBrFWpC16ILLjohfxspa0iQhfiDC5qp8bLSzEawXRugok1P8NwHDXfJDW4jTbYSQcc2dHvTiXvI
 W7aOD8ykJchl/9O1R9iHM1eN84o8Ayb6xWmeRDgErCz9tE9caA+njm4jCcejvkWz8rR8+By1aXh
 9iDDHT4r18hkkM9nWYYGtFM67+B36Ket5pr/mRQEq6jGpSZDT9kvlih+1jfELL5+9svIjD55ESm
 cotzRA2E6GaoJr0lpX5tzKAt5DOJSgKHmyonr49W9lfFSo82i3uHEe9IZ8z7ipUBiqa6sRX+oyy
 XUTeAkSp4GuDZ6SMt/Qz2BnCQrEmhwRiPvC96Vfzd54VT90oLvtlgSjXBV91iuE797KOXpsRzmr
 1+/903UQdO7VX0Mx/naL8YIo8p0FjJh3NJMHEm0FdTFrcVeyu8SGYI2Cc9rHatXgSSSZEgpOpJr
 jx4arkCInxKF7R7YGgZNdKlI6QgdE6uksgXCVB9cXDIyTXbjtz5ohuM7nfI+9kJX1DDBa2lSeP6
 TXaa0F2u1slXqkJruvgyfgmOUu+2EuNAwkozHJnqke8A+QKy6fIW1YXi5Ek40/8Atup3JNv6+5A
 JuINw11ToJXDjgg==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_150903_360501_E0B1D81B 
X-CRM114-Status: GOOD (  15.33  )
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

On 2026-05-26 22:42 +0530, Nihal Kumar Gupta wrote:
> Shikra uses the same CAMSS IP as QCM2290. Extend the existing
> qcom,qcm2290-camss binding to add the qcom,shikra-camss compatible
> string.
> 
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
> index 391d0f6f67ef5fdfea31dd3683477561516b1556..7b1469d6a1601413a1a32dc452d7d1fc85aa9eb8 100644
> --- a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
> @@ -8,13 +8,16 @@ title: Qualcomm QCM2290 Camera Subsystem (CAMSS)
>  
>  maintainers:
>    - Loic Poulain <loic.poulain@oss.qualcomm.com>
> +  - Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
>  
>  description:
>    The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
>  
>  properties:
>    compatible:
> -    const: qcom,qcm2290-camss
> +    enum:
> +      - qcom,qcm2290-camss
> +      - qcom,shikra-camss
>  
>    reg:
>      maxItems: 9
> @@ -76,6 +79,7 @@ properties:
>        - const: sf_mnoc
>  
>    iommus:
> +    minItems: 1
>      maxItems: 4

If it uses the same binding then why does it need minItems:1 ?

Does Shikra have only the one iommus entry - if so why ?

If not then adding minItems: 1 is nothing to do with adding another
compatible string.

Either way this patch isn't right.

---
bod


