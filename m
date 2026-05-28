Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A33FDCD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 22:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=05Fjs2DL+9vxiV5y/LCBbl1ALfZ8hCsRr0lZ9oL+5W4=; b=cw2tp+2nTqfTSniFCGxlLzIzTp
	L027NlyJ5mRpf2Df9ByAB+G/8Qh/km9LN/HTa8DE6vM/Rdj8KpIsDCVwpLdWLhdL2TGLDSDOUUbHy
	myFuDFDEdhADwJ81UwLkwTdIrTDOY74MZFT5oAek3zjoRx5Vg5C7lDy0c3P5TqVxTcU876Vr2VVez
	YJOveum5b3wHwi0roOJIKh3ipWX9Gq0I9p70Fu2Tuouxvm1F0XtDvCdTTTT5IyAXrOjiYLy2yz7tl
	GIKOP10AGHT9Bx6kMlxW0L/1/fhecSHO1oOQyeUcNmtqZE94em33/iVgD5LwW+cq27sarqYv7R61k
	zxQI+R1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSivg-00000006SSx-0Pyv;
	Thu, 28 May 2026 22:10:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSive-00000006SSf-3UHJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 22:10:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2B4536022B;
	Thu, 28 May 2026 22:10:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6522F1F000E9;
	Thu, 28 May 2026 22:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780006212;
	bh=05Fjs2DL+9vxiV5y/LCBbl1ALfZ8hCsRr0lZ9oL+5W4=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=X3eNxy622KawA+UMRK25fKZXbeYjRpt2wycO5udJnsrB+JQQ+84/D40OFZ4JSRd6N
	 XdCxfdEjF4ri5uwYdyq1qYg86lFFFvnYmI1PpuJ+sEKrNFRHEqa5cy7oZINQRBizes
	 vwncmphA6KLc8WPE6zn6OyI+nP1YPOsJ2/+cUMxh4LZdjutuLDJmYTsmyA80G8IS7w
	 PSoUJPChrcFruCakIvA5jc3NhlPoGb62OQ6U29gZhBWPuyRnu7ePnavVi9ahmIQ4Kc
	 UR04QTUN7hU4U3LjnVrxamfXGIiSFxWK+lic16PXndEHiHBmmw2rIYWLDbMDf37jax
	 ya0ovTtFw8FlQ==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 2/8] dt-bindings: i2c: qcom-cci: Document Shikra
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
In-Reply-To: <20260526-shikra-camss-review-v1-2-645d2c8c75a7@qti.qualcomm.com>
References: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
 <20260526-shikra-camss-review-v1-2-645d2c8c75a7@qti.qualcomm.com>
Date: Thu, 28 May 2026 23:10:05 +0100
Message-Id: <178000620521.4557.16545657820275121091.b4-reply@b4>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=1333; i=bod@kernel.org;
 h=from:subject:message-id; bh=J5scpgrWEV8v3ZkZukcBHbuLGOM5+s7yXvHrVZukmLU=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqGL0+7oHZF3maEgTkIpDvTVT7jL4hCCk8OPpdp
 NxPVN+4COaJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCahi9PgAKCRAicTuzoY3I
 Ok1+D/40P4KYWUOoSIL6eJT58LVSpLsDoH1gHcxsqYWXaSQK9wXhZA9iyq8M7NtY859aBaQvtYr
 fP/amMA7/K9wXho6R9Gz+hrdvANoUOokQWMsgY6TfvZ3tvgjSH0mAqtwptG9b4WvS4KrIIeW8XW
 k/+JLibvrJi1jDIM1YxTCbcUHNRKel7xRMTurZAMnndH5vDAwG7BK2UorZoe5wRqLHNblXC/drY
 qYA+OC0q+xz6qvSq3H6wnWL85i0sCqj1ocvaSiL4KOUpEj028bTs6JD0kzvfrkMeJ8xElspyGB1
 EsFUvN1SUfIloGiyEDWQNnHDB4PQ0FV8PAHaeRfvQVSw7u1m33xVlxLj0na47TFUIS7qhmr/EXu
 y6bxlEqbhiRSwZARRFohLUVtkBktAlP5UScmBDKSSlnxXG7lL+GoCWScbItldMDJRVXexzGCUbB
 IhwxfUHaSMK5P6pF1hBzHDYfEBxaQbV8dt0kbWRNY4pVhF35mbwF8YS0Q6+0E0ydM/fD6Ltue4C
 2PP66P6ttvMQfUrmmtmPKphvX3mGSnS+H8y+f0ay3UbzX3kDku+Q5SqYXkaTaQkfKBN1AihHchN
 0SuUnByg3bRL0VSBr2Og1BC9wJc4E7ahU0DOL+UGhjTNOQ8YeIIitxGNuJ+8ehJ10RcPYX8dITT
 a1PYg6eGbVfSDww==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
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
> Add Shikra compatible consistent with CAMSS CCI interfaces.
> It requires only two clocks.
> 
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> index 7c497a358e1dc8cec8b31c17bfedf315e4e00606..c94069afd8d06dbb08ddd6b49e2de7dc7acdc29a 100644
> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> @@ -35,6 +35,7 @@ properties:
>                - qcom,sc8280xp-cci
>                - qcom,sdm670-cci
>                - qcom,sdm845-cci
> +              - qcom,shikra-cci
>                - qcom,sm6150-cci
>                - qcom,sm6350-cci
>                - qcom,sm8250-cci
> @@ -137,6 +138,7 @@ allOf:
>                - qcom,kaanapali-cci
>                - qcom,qcm2290-cci
>                - qcom,qcs8300-cci
> +              - qcom,shikra-cci
>                - qcom,sm8750-cci
>      then:
>        properties:
> 
> -- 
> 2.34.1
> 
> 

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod


