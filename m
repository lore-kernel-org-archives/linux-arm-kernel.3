Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D21A5D0BB6A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 07:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ygHpw3WhegX0U1BPMZYYHF3RJODgNnLkDjVHj83gCo=; b=L7AvLnJ9btIo0mt200gVsRKgnR
	owKYeYGZqUHSJnEmkKgYu8Cks9U3yEVjoHxpDvdwrz+06o/0s4CUO5T91yOVXDC0nZbVFgU0AOUp+
	J+aDFb0zMwAcz7LmMKv0HFFohKatilopshfmOWMPXpWHG2hkTldkdBusknogRxyW6pc3+ZgxPDHKj
	InzvuuEZ3djua3Mbh1g5/LgQiq/PbY7z0+WTqgeJWcu87jy8wDz0dVXSdaeQlD8GeRf3043fMandO
	+o9CL1eUOaoewIrvZ0V+VgfJIDfWKs+05igQ2GA28PNw7zHuJiSFC5rG3noKXNh9h1EpmX3XDxHTJ
	fGeZIAGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3sCF-0000000H55N-0wxB;
	Thu, 24 Oct 2024 07:23:51 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3s1T-0000000H2ti-47t2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 07:12:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EEA33A45163;
	Thu, 24 Oct 2024 07:12:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9AFCC4CEC7;
	Thu, 24 Oct 2024 07:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729753962;
	bh=ivHa9mrhegtxO3Q7geXr2Oyyb9aQ9mAh7cMUAd0X9aI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PpZQNcLSEE5cjifNukT7Vu7Fb6Ll7qVRDqojODlObL6Akfm2A3+KYVEcGbcKcot/C
	 f0xFrQi9+q1IIDNkgZDFYYqsUwvhnLXeMW2YbSxxUMRNfh+8RANVT/xbdQgb9UX8t5
	 4SLMU4fOLNiYH1XmjC/7Ufpz2eFt3JXNKmGAcU5oQ0PMcnEOMES9iWMfEjvKQa0CVW
	 2kQZy1sPwQEGDIQjLEXc9ZTqt8NltOqb39KFFUwsKCD6R4lVQvb9hy8qAgSGlOFq6J
	 c4IMCap3ohH2TLcF4fPl1g3ScS8Do+m7BE4yaqhICZQClo0qzLiwYhvWtX1RmOgXZ7
	 XSW0B1s608Y3Q==
Date: Thu, 24 Oct 2024 09:12:38 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tao Zhang <quic_taozha@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4 1/4] dt-bindings: arm:
 qcom,coresight-static-replicator: Add property for source filtering
Message-ID: <raa3otr6kmiq72qjb5rnqt5cluqw627jkfbvkxqi2vbjpbwpsb@v64xvghgxx75>
References: <20241024065306.14647-1-quic_taozha@quicinc.com>
 <20241024065306.14647-2-quic_taozha@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241024065306.14647-2-quic_taozha@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_001244_104360_ECA8B6FA 
X-CRM114-Status: GOOD (  11.65  )
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

On Thu, Oct 24, 2024 at 02:53:03PM +0800, Tao Zhang wrote:
> The is some "magic" hard coded filtering in the replicators,
> which only passes through trace from a particular "source". Add
> a new property "filter-src" to label a phandle to the coresight
> trace source device matching the hard coded filtering for the port.
> 
> Signed-off-by: Tao Zhang <quic_taozha@quicinc.com>
> ---
>  .../arm/arm,coresight-static-replicator.yaml  | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


