Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E09D6C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 14:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SSoTjrrwIc3ukAcmXUT2cBVEtVG9xqr+z/uig5uW1fk=; b=nYULIH3Vrszde9RAkN8HdAjUtn
	lulfk0Z9z//igsGCQWhjAQGVJLQ7oGFx/QxjDmsEzwfw3IgD2/i3T63a9tZkg3ND26n8rx1AgpA5u
	at/K6KADr9+wf71K8KJtCIcaP5uJPkAdDGIh13lIed9tgGhqaioySCNCXTPNYGP8ceL0ubk1bsG/x
	1BMCx9GXHWIrw/rjBe2Q1IyAOs0xXIRvc5g3Cg1ZrpeCJprxoXmerWZhxisQTfTv1avWtSdmwDgGP
	OsoSl6L54f4c3f9OgvjPtdLYb2Lf8mHEKorYFG/L/DNMj/USGYDK5tiVT5EM188waa3rz/4cIVbW6
	BWBdpqkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts15B-000000063Sv-3TD9;
	Tue, 11 Mar 2025 14:59:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts12t-000000063HH-4C3F
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 14:57:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EE202152B;
	Tue, 11 Mar 2025 07:57:35 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 795583F694;
	Tue, 11 Mar 2025 07:57:23 -0700 (PDT)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: coresight@lists.linaro.org,
	James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	yeoreum.yun@arm.com,
	Mike Leach <mike.leach@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Leo Yan <leo.yan@linux.dev>,
	Namhyung Kim <namhyung@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] coresight: docs: Remove target sink from examples
Date: Tue, 11 Mar 2025 14:57:11 +0000
Message-ID: <174170501277.145861.13343578930961537547.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241210144933.295798-1-james.clark@linaro.org>
References: <20241210144933.295798-1-james.clark@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_075728_081467_24196BB0 
X-CRM114-Status: GOOD (  10.09  )
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


On Tue, 10 Dec 2024 14:49:28 +0000, James Clark wrote:
> Previously the sink had to be specified, but now it auto selects one by
> default. Including a sink in the examples causes issues when copy
> pasting the command because it might not work if that sink isn't
> present. Remove the sink from all the basic examples and create a new
> section specifically about overriding the default one.
> 
> Make the text a but more concise now that it's in the advanced section,
> and similarly for removing the old kernel advice.
> 
> [...]

Applied, thanks!

[1/1] coresight: docs: Remove target sink from examples
      https://git.kernel.org/coresight/c/4a29fa26

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>

