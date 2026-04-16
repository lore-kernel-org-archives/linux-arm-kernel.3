Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 278F6F8A167
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 12:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gi5rEYKdQ+sGgzEhk1XyhYY3eUzbRcz4/tH0/fRc2io=; b=sxght/e4MrIPHaYVP2tlTg3d3k
	JWM9mIL2Op7Y+8DKSfUqu6aoVkZMkTUngnKN63RNn/b8ja1JVoCP9nNCo7H8XuBN9T6599Rpb7cTZ
	BAoQp2Vwkan1K6+JbURL6q0FjRlzYG0q9CWj9gNMsM8vNGFNA5iYN259g5cNG7++atRiK7T8YD932
	O/AOS9U6lzknXbrysllHQ7jsjbDrmkZtAHivB8jEexKDJ+fTVq44Ei0mLV+dnTaAzxClpnlJEtS/R
	/euTPSimlU4jqpI75k7ny5YfH0xGNS3RLqo17bOpeV7I/6sBn2zVnFy7TBdjMVfIRgRYulLd0I7WB
	AYYAVRMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDLRv-00000002Q22-1yd9;
	Thu, 16 Apr 2026 12:03:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDLRu-00000002Q1k-1Ul8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Apr 2026 12:03:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 501B960126;
	Thu, 16 Apr 2026 12:03:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5B20C2BCB3;
	Thu, 16 Apr 2026 12:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776341037;
	bh=RV/pVm8MsCdGAJco1670hjDP15pZoTBL/ZV1sRrirzI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R9QIbwsPOe2YCFQmPMnCippjkeP6Qa8MUXuAuHnnykuDdh5djsmYku/XiSm3Y1tyM
	 dqk+v36Fo2mWS8tUD+QFV2NQ3scIPDihA67UqQEnpiYzW4PK1PdHbf0nlHMzcXPQtO
	 rayiv8icPm/+SCIC/pF8p5IM8MzYMSkR1pK1dxS+niYSdHx47yCzxWGH4lDOQe71aA
	 3oANnkpcSaIOdS+DHmOtyc8YS2x3FoDNod0Uurs0Nay6qQRaaL43zshyIplICVSXVC
	 NrKsslIZPaMKN5LJLbyGHp9tryjiqe/E+PPQW1b8FBmH3VNSLn8fHxnXtpb39wDTDU
	 Q9E1BDptW8yWA==
Date: Thu, 16 Apr 2026 07:03:55 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Kevin Hilman (TI)" <khilman@baylibre.com>
Cc: devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: power: Add power-domains-child-ids
 property
Message-ID: <177634103449.2736751.6317268015188601498.robh@kernel.org>
References: <20260410-topic-lpm-pmdomain-child-ids-v2-0-83396e4b5f8b@baylibre.com>
 <20260410-topic-lpm-pmdomain-child-ids-v2-1-83396e4b5f8b@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410-topic-lpm-pmdomain-child-ids-v2-1-83396e4b5f8b@baylibre.com>
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


On Fri, 10 Apr 2026 16:44:36 -0700, Kevin Hilman (TI) wrote:
> Add binding documentation for the new power-domains-child-ids property,
> which works in conjunction with the existing power-domains property to
> establish parent-child relationships between a multi-domain power domain
> provider and external parent domains.
> 
> Each element in the uint32 array identifies the child domain
> ID (index) within the provider that should be made a child domain of
> the corresponding phandle entry in power-domains. The two arrays must
> have the same number of elements.
> 
> Signed-off-by: Kevin Hilman (TI) <khilman@baylibre.com>
> ---
>  Documentation/devicetree/bindings/power/power-domain.yaml | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


