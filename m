Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 423A0CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 23:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6ENsL6htK6ZWX+IdyWWiSP7NNrrmo/YVwOzqCpgdxLc=; b=dWr1Ki9FIqIaNAygVdE7tEln3B
	0fs/jQmj33Ee15xXtjDGCUXYfij7ZOTbGoejdRjMkMIPRN6RfT6DLEoPW4mTAuua/QNb/Et4AdB9P
	qaKh8LYuKCB2co28A2EQv7HfuKfhXlPYNBLIyghgw3NgtgEzA714Lg/rlVK7y0X6dbYYwOX1p0mZ9
	6Im4rYE/Ra/UoXvdANARjAo/AtYknW/8QoVQKJieUyOCWLVqfyjgrhQnT2N5tURwXLrIo+tNth5U2
	ulAGz9BnXLmUbW+JtMOqTjzrJ8OLOUcCVy46yh0S99lhvRrxvUvG5nfOAvxYhIDw2MZnOU28aQ0jn
	qyc8Lcwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNItr-000000041I9-41mj;
	Wed, 13 May 2026 23:21:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNItp-000000041Hj-0GZK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 23:21:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6BF9F417C8;
	Wed, 13 May 2026 23:21:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9CD7C19425;
	Wed, 13 May 2026 23:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778714516;
	bh=ll5Eobp7inAVZ69eRLBCF4V+h4LoqBc/5CUIOgWoCSY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ND0YnUaO14pMN8SMpuyphae5nfJMuisjOGeeLLsawE15whYkXNLfE+Z2RjNUB4Vv5
	 dd+rV6P0mom6X149j4Eo6UCSvcr3rTngnYUtwScuLnGMniqYpPCJ2Eo7mfqeRkihVH
	 quU/ViyYOaAg6L7LfvxnYd4zBTiBS3oEQQmub4fYjbwMABFzsZHajCC4s30oT/EvKL
	 aSlIPfgnOpNeTdQFH65DoaY5NlIAgX8IH6wfd+JQzIz+OTnyHePpidETY1nN5YoSYm
	 agi+nU6E3ozWy9cRxDBDv7uTUOpA9+c1tNPbeUlSnX6DRvdUZIlJToKlUBKfUzKrWu
	 2+2FhJ/UOuWNQ==
Date: Wed, 13 May 2026 18:21:53 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	Todor Tomov <todor.too@gmail.com>, linux-media@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	devicetree@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>,
	imx@lists.linux.dev, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-arm-msm@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v2 2/7] dt-bindings: media: qcom: x1e80100-camss: drop
 src clock
Message-ID: <177871451261.2293485.3028106268219428837.robh@kernel.org>
References: <20260508-hamoa_evk-v2-0-3ebdca3e4ae2@oss.qualcomm.com>
 <20260508-hamoa_evk-v2-2-3ebdca3e4ae2@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508-hamoa_evk-v2-2-3ebdca3e4ae2@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_162157_137565_D0DF9676 
X-CRM114-Status: UNSURE (   9.14  )
X-CRM114-Notice: Please train this message.
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


On Fri, 08 May 2026 19:39:58 +0800, Wenmeng Liu wrote:
> The src clocks are always-on parent clocks and do not need to be
> explicitly listed for CAMSS consumers. Drop cphy rx src clk.
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


