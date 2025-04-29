Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CE0CC3ABA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 17:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XXaskdWMqOpFIh0FVRKVOtPXDhGqdM8JztECsXlSsZU=; b=yMjCRxOBy3SaPgu4IBbQedfKVF
	LNppenR7B0eSxdWbQCfGPBq/GAbOl2czYIGr0ufmy4M+y+INFrL9+RLrKpisn9KB6zBx0km5lkTch
	4XQLc3LICnet87IFxsoYkOcSSwZxkQS7df6n9xPSoWASHI0gT4qSyqsofYY4gg/5ZzaWbxZ/a7L/l
	7OJNjhRUruJJzodyO3/D+RGZ3ixpkBa9VU2Wd6AxbHYNmBTmc3+IUBZUPorqkqSBbUBunsfvAFqIU
	EOfIOmRACjcHjIEF3M2Ak65DVXgIq+Sh8OMeauEUPGicrUMQcs79/PFcv9Hm6lqmw1ZCnjV9G0QMe
	wXdKD9Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9pBK-0000000ASaq-1GYd;
	Tue, 29 Apr 2025 17:55:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9p9M-0000000ASNd-1bUr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 17:53:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 80DD71424;
	Tue, 29 Apr 2025 10:53:34 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EB1773F66E;
	Tue, 29 Apr 2025 10:53:38 -0700 (PDT)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Georgi Djakov <djakov@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Leo Yan <leo.yan@linux.dev>,
	David Heidelberg <david@ixit.cz>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 00/11] (subset) ARM: qcom: fix APQ8064 schema warnings
Date: Tue, 29 Apr 2025 18:53:22 +0100
Message-ID: <174594908195.12068.1450761238932704587.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250425-fix-nexus-4-v3-0-da4e39e86d41@oss.qualcomm.com>
References: <20250425-fix-nexus-4-v3-0-da4e39e86d41@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_105344_462115_FA25E310 
X-CRM114-Status: UNSURE (   7.02  )
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


On Fri, 25 Apr 2025 20:47:00 +0300, Dmitry Baryshkov wrote:
> Rob's bot has reported [1] several warnings for Nexus 4 submisson,
> however none of those warnings are specific to that device. Fix all
> those warnings for all APQ8064 platforms by extending existing schemas,
> adding missing schemas and making APQ8064 DT follow all the schema
> files.
> 
> [1]: https://lore.kernel.org/linux-arm-msm/174221818190.3957236.3364090534153729086.robh@kernel.org/
> 
> [...]

Applied, thanks!

[06/11] dt-bindings: arm: arm,coresight-static-replicator: add optional clocks
        https://git.kernel.org/coresight/c/13e3a882

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>

