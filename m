Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD7E1CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 09:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jSzy86/dhiFK6vR25ZTz1W6l+q2HyQFI7JqM/66h9O4=; b=kzwg4KYmJeABnf02NpVO9zPAv2
	Q7GovxuhIQ/ih5Qx+EeK7YHP6tSNTTQlnkoC5DSzI1LtBdZxlkqiPgHlBVO5VbH15XfmIjEnlTMaZ
	gjWmZpl5GVslFzydfqXLlQB/TtGLU77H6ljvco1Q5kOQ7o9a7oCJ56BI9+Fk9F+a5n5GfWNaNpB4w
	yI0Tne2GVu3pM2DJQcRqSwd3XaX5IWmjxFBHsQwQ8mSjZrNpqZD967h739kvifyQnbQUA8HE6MSgX
	C6CN+H1e9BYJxNqVrUeW9DpXWa2VpiXiCuwtURxe2SRkOsXj11kEjmyzCGWpkjXPoO/O9KbEsOdGV
	dzRjtSTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy5gA-00000003Uqs-2cpb;
	Mon, 15 Sep 2025 09:39:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy5g8-00000003Upy-23Uu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 09:39:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 925411063;
	Mon, 15 Sep 2025 02:39:11 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F33C73F694;
	Mon, 15 Sep 2025 02:39:17 -0700 (PDT)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Mao Jinlong <quic_jinlmao@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v11 0/2] coresight: Add label sysfs node support
Date: Mon, 15 Sep 2025 10:39:04 +0100
Message-ID: <175792909832.1970499.2776952836834595776.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250816072529.3716968-1-quic_jinlmao@quicinc.com>
References: <20250816072529.3716968-1-quic_jinlmao@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_023920_565367_21A1CF5D 
X-CRM114-Status: UNSURE (   7.05  )
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


On Sat, 16 Aug 2025 00:25:27 -0700, Mao Jinlong wrote:
> Change since V10:
> 1. Update kernel version to 6.18
> V10 link: https://lkml.org/lkml/2025/8/6/520
> 
> Change since V9:
> 1. Replace scnprintf with sysfs_emit.
> 2. Update date in ABI files.
> V9 link: https://lkml.org/lkml/2025/7/17/832
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: Add label in the coresight components
      https://git.kernel.org/coresight/c/37bad7e6d08c
[2/2] coresight: Add label sysfs node support
      https://git.kernel.org/coresight/c/559d6c380ea0

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>

