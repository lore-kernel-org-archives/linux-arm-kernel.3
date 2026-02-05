Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C769EC1EA4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 11:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eVtiS74pSuf29O2vhaVz8eFqY41Y0UH0S16vZTcr3XQ=; b=iuQP0K42fJpcDYmFR3Mi1/7L1v
	+fm7nLC1Mr0JuAwuFiSzzXOCxzdpiUNMcHZmEzUMxXYxSpd97LYzDScSLqZVEeW0FHWUXF+5ns3W6
	feFgyOR1aYyt8YYfEwNgzFuaXsahoPV/1dWFoMu2Q93Ncfh5wcZvU2S7Rn6ndl6l4lmkBljNC+OWX
	GDkILPx9XUXqts06i8dsOmiCpN42C4MWf9P7VNKEvqd7kQ4AxH0IZrjB5QgVGEnqVWbaQZ8TFbbxz
	njWPk8PfV1xDdFv3+wrq+pbOj1o8htwV0KK+JKxXL4lma1zYmtrPrOnKnP/AU67R7OvAfnAvpLFO3
	T5Qioyqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnxt1-00000009qfq-3hGQ;
	Thu, 05 Feb 2026 11:51:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnxsy-00000009qfX-0QPQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 11:51:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 63CEB44032;
	Thu,  5 Feb 2026 11:50:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB5F1C4CEF7;
	Thu,  5 Feb 2026 11:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770292259;
	bh=s0TY+ETNO5SgCu7+hJkJzb6eBOIIUu8aGp++nONFUpg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hd8LqQn2DgL5+rEFXZ/nAwZeramaXpQ7VpMEZf4/G/rDzqCO74Cs6Ntghgi4mwQyJ
	 p/J4orXdmFCw0NCmKrf6TOzk7NN5WWj0I4g7K/0Uh7bVEmTOf9F+BOtvdB0JFtWvhX
	 wjKLWxxi1dVLb3ax+kxvJuw5JQFxflkD0ViO+cTsyJMtkGbsj6bDdUHLy+cS9Gf6/v
	 dS4K18eQjkaHA5TRahrRCgf564eNgOyjY3S7V6a8U18G3i2Ky4RJC3eYfydkzgmrl5
	 MrMxdTLcAVWWusHiqjeyvasAE06eyaMqTKOKrOSt3QH3I5MQk46hhhplpKgNwQTJxr
	 U1GcZGpG2lZVA==
Date: Thu, 5 Feb 2026 12:50:56 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-binding: document QCOM platforms for CTCU
 device
Message-ID: <20260205-hungry-kudu-of-maturity-aa0dbe@quoll>
References: <20260204-enable-ctcu-and-etr-v3-0-0bb95c590ae1@oss.qualcomm.com>
 <20260204-enable-ctcu-and-etr-v3-1-0bb95c590ae1@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260204-enable-ctcu-and-etr-v3-1-0bb95c590ae1@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_035102_084296_32926E57 
X-CRM114-Status: UNSURE (   9.68  )
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

On Wed, Feb 04, 2026 at 10:22:01AM +0800, Jie Gan wrote:
> Document the platforms that fallback to using the qcom,sa8775p-ctcu
> compatible for probing.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 4 ++++
>  1 file changed, 4 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


