Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03F9AC19777
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 13:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c9KTK3PCk9zQr5Q5V1XRkMx8DFn3Wt0N9AQJQGiMT+Y=; b=HivG/elLnEsUCjWx+qgrfi+ArF
	kuxdwoOEJ61YRGKFDRHHgKRcjNHBVH9JsRa7+FpuVTda5Z9YHpOO8nAnnjNHmVVTAt9bsobSKG5qd
	/oL3ibQ0N3hWfMos8eZ1mgRkwTlglNJsPeUEop2JYuxoGPsQTphLIbe5eKGIGFzXC4mqdY4aT9D7v
	8kAIXsYLGuBO241OPPIUYM1WtvFf0qOfnOqSWfVd8jrgTyi57QA9E8pz4AsSV/m+SBsQ2fzdzUhhH
	uUuvqiDGWtr1E7WwZqycxnuqOkHqbE5msNxcjikUXRtGId0TWuNLtI73pnXL3CM4UfXUGRSwqWS24
	XNB7pfuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnHQK-00000003rKC-1er2;
	Wed, 26 Feb 2025 13:26:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnFvp-00000003Xk5-2OLm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 11:50:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DB8D81516;
	Wed, 26 Feb 2025 03:50:44 -0800 (PST)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1B3A43F6A8;
	Wed, 26 Feb 2025 03:50:27 -0800 (PST)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mao Jinlong <quic_jinlmao@quicinc.com>,
	Tao Zhang <quic_taozha@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: coresight: qcom,coresight-tpda: Fix too many 'reg'
Date: Wed, 26 Feb 2025 11:50:18 +0000
Message-ID: <174057060414.1607370.3307069350698832445.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250226112914.94361-1-krzysztof.kozlowski@linaro.org>
References: <20250226112914.94361-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_035029_659231_A95CF154 
X-CRM114-Status: UNSURE (   6.53  )
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


On Wed, 26 Feb 2025 12:29:13 +0100, Krzysztof Kozlowski wrote:
> Binding listed variable number of IO addresses without defining them,
> however example DTS code, all in-tree DTS and Linux kernel driver
> mention only one address space, so drop the second to make binding
> precise and correctly describe the hardware.
> 
> 

Applied, thanks!

[1/2] dt-bindings: coresight: qcom,coresight-tpda: Fix too many 'reg'
      https://git.kernel.org/coresight/c/d72deaf0
[2/2] dt-bindings: coresight: qcom,coresight-tpdm: Fix too many 'reg'
      https://git.kernel.org/coresight/c/1e4e4542

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>

