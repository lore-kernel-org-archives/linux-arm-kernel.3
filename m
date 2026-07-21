Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD341C44529
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 08:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gEp+GbkZD41eG5XmcLmjYK9IEYFdhEokvcqQUSEZvgw=; b=chBh41hOULtmUs3fLozoYrNbwM
	sSapAZaLVv1XWrs5s+BqD0OxqwyFyou/nqDoDVQZ5xFhOoAjENpybK3/LWgsidNK4AA3M2HpL+NaB
	uXA2OiIQYA/fzmh/lFF7wU3MlSdFASGv7dK96Y10r5hknD0EHnIA42aMcIXJze0W13mZMbS8GQisb
	QM3Xo9lJhFfbAqZ8sV2mgvmUnJIpWoYmbqScsdnvC+IrruKv4zvqmVU9Q+sxyKTY9/C5nhZT0Y3Xf
	OpjzQNOKsCQDGeFP6StRKuAmqk6uOimkhWWVCKs2S34/Kvje2uHBYNz0bZcpugBDk7JE4FvR6DZbv
	/594BOlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5fg-00000008m7b-176b;
	Tue, 21 Jul 2026 08:17:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5fb-00000008m73-3iKG;
	Tue, 21 Jul 2026 08:17:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 45608432E6;
	Tue, 21 Jul 2026 08:17:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 277041F000E9;
	Tue, 21 Jul 2026 08:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784621863;
	bh=gEp+GbkZD41eG5XmcLmjYK9IEYFdhEokvcqQUSEZvgw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iQl5LnSIVpHkgpx1UKsBCW8fXeN0+2TX7rxQ6KJ/A2gGKrGXOPdhjfh4ZEYmpgKl8
	 i3R2Jic+M/PaEsogf3M7aLxo6gl8jBT1Jz6FSzC8gqoK3EiRE9UeGcHeBxFVD5cI42
	 F/3Jc0k3X4yqGWnpz/5NdeSzIu5rOVtvUg/q4o2avRihxy+2rPNVt1N7B6fqKNBvHw
	 ZXVGnhaBg8aJMjhvtNcZxrCJ3+b199SJLhKUssiBZMJeSC0jJiTwTXGV2TtFf1xBGf
	 PxuIXsoOAFgY4pX0RTY06Pg9ZnO5ukpxrS3BPvDkg1qmQJKK6iw9WRXV+/LvSCqTAX
	 j8Q7FNBH0mFWw==
Date: Tue, 21 Jul 2026 10:17:39 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>, Mao Jinlong <jinlong.mao@oss.qualcomm.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: add CTCU device for shikra
Message-ID: <20260721-stylish-dexterous-sunfish-1653eb@quoll>
References: <20260715-add-coresight-nodes-for-shikra-v2-0-ebd485e39a51@oss.qualcomm.com>
 <20260715-add-coresight-nodes-for-shikra-v2-1-ebd485e39a51@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260715-add-coresight-nodes-for-shikra-v2-1-ebd485e39a51@oss.qualcomm.com>
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

On Wed, Jul 15, 2026 at 09:16:14AM +0800, Jie Gan wrote:
> The CTCU device for shikra shares the same configurations as SA8775p.
> Add a fallback to enable the CTCU for shikra to utilize the compatible
> of the SA8775p.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 1 +
>  1 file changed, 1 insertion(+)

Please use subject prefixes matching the subsystem. You can get them for
example with 'git log --oneline -- DIRECTORY_OR_FILE' on the directory
your patch is touching. For bindings, the preferred subjects are
explained here:
https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters

And it should include useful final prefix.

Best regards,
Krzysztof


