Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FC14C83F25
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 09:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wMXbMf5qgozOolSCgikP3V4rvJ/9Vyx9zQpEEleuu3A=; b=t8j8pQtp3MmA6YG4TfS7QUlT/t
	rjyiZhOY0D4ZvrVKUmVvFIf+LkQsZVesgZxJd+oH+bNPAO63EcfoVcuOmonyrhSQo7IbFk0t3UNXm
	ORs4IxNSshNQYJrwJuE/yGuid4xBEkFdAxYHcYd0WxuATDVoNYb84AYXrQ5VJzfM63xiyJ04R0eHt
	mmz5TcdHYy4O+ZmeGGb73ZvBE6FU6+xoVWOx8jrFvFkoED2n7AFWQ1tx/eWHd+tx4odifWmP+VHsK
	WNvdknE5NrBaa7698wv7zOSCHbGtEeuDpJXerSBpIgd6ZHNX++dF8v+L1mVhtLdUXRszv1KP0hn0b
	MbTIa3Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue9Lx-000000021Ln-1l7b;
	Tue, 22 Jul 2025 09:32:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue94u-00000001xyp-0pz1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 09:14:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E237F152B;
	Tue, 22 Jul 2025 02:14:21 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 002423F66E;
	Tue, 22 Jul 2025 02:14:26 -0700 (PDT)
Date: Tue, 22 Jul 2025 10:14:25 +0100
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Mao Jinlong <quic_jinlmao@quicinc.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Yingchao Deng <quic_yingdeng@quicinc.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: Add Qualcomm extended CTI
Message-ID: <20250722091425.GH3137075@e132581.arm.com>
References: <20250722081405.2947294-1-quic_jinlmao@quicinc.com>
 <20250722081405.2947294-2-quic_jinlmao@quicinc.com>
 <727fa9f4-fe25-495e-9d8d-48e504fbe6b0@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <727fa9f4-fe25-495e-9d8d-48e504fbe6b0@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_021428_280524_A11F05FC 
X-CRM114-Status: GOOD (  19.28  )
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

On Tue, Jul 22, 2025 at 09:49:28AM +0100, Suzuki Kuruppassery Poulose wrote:
> On 22/07/2025 09:14, Mao Jinlong wrote:
> > From: Yingchao Deng <quic_yingdeng@quicinc.com>
> > 
> > Add Qualcomm extended CTI support in CTI binding file. Qualcomm
> > extended CTI supports up to 128 triggers.
> > 
> > Signed-off-by: Yingchao Deng <quic_yingdeng@quicinc.com>
> > Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
> > ---
> >   Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml | 4 +++-
> >   1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
> > index 2d5545a2b49c..1aa27461f5bc 100644
> > --- a/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
> > +++ b/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
> > @@ -84,7 +84,9 @@ properties:
> >             - const: arm,coresight-cti
> >             - const: arm,primecell
> >         - items:
> > -          - const: arm,coresight-cti-v8-arch
> > +          - enum:
> > +              - arm,coresight-cti-v8-arch
> > +              - qcom,coresight-cti-extended
> 
> Why not call it qcom,coresight-cti ?
> 
> There are no other "qcom,coresight-cti", so "extended" is not required.
> Is this specific to CPU (i.e., CPU bound) ?

I roughly went through the second path. Combining two patches in this
series, I am wandering if can directly check registers (e.g. PID/CID)
to find CTI with qcom extension. If so, you do not need an extra DT
binding, right?

Thanks,
Leo

> Suzuki
> 
> >             - const: arm,coresight-cti
> >             - const: arm,primecell
> 
> _______________________________________________
> CoreSight mailing list -- coresight@lists.linaro.org
> To unsubscribe send an email to coresight-leave@lists.linaro.org

