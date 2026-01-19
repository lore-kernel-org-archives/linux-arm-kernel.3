Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D59FBCCF2F1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 11:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=94h3Dz8+LRMp6LfNvZ51kpnEBmSuP0r5Z++mScwlpRk=; b=SM8cEatRe/kfRrUBtFA24fyX+X
	C+gz0g3T6KWllI0QMk+aVjNd2+bnf80eY+vc801SuhTKYhAphFoy5pxmlsnq5sgw1bBQNU5Rx6o5i
	rSwAiClbtaGWBBJqMsZoiAPwefo3uHb9fuwsjvIeNm5RQ2lT3EIERI9ZrzrRp2GmvtTmmgdpqXRd1
	ICI7/coQoHzpLZ0cofKRpOaWnRkA8CQa1gK3a0bvRuK0hvDAKmeVn3N74nQrH8ZG4s6B8PxXKBaEQ
	Iw9Zg8TpjzYL7xMpZC4jvmJL9kFbFcTal6PndkplTp9bqfpgK3rrEkRMBznF4XAcuTmQ+Mo7qJwUU
	YMXFukWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhnpi-00000001vJi-2fY2;
	Mon, 19 Jan 2026 11:54:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhnpP-00000001vGv-2MTH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 11:53:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3EA41153B;
	Mon, 19 Jan 2026 03:53:42 -0800 (PST)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B58693F632;
	Mon, 19 Jan 2026 03:53:46 -0800 (PST)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	kernel@oss.qualcomm.com,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Leo Yan <leo.yan@arm.com>
Subject: Re: [PATCH RESEND v5 0/3] coresight-tnoc: Add support for Interconnect TNOC
Date: Mon, 19 Jan 2026 11:53:31 +0000
Message-ID: <176882354703.1800388.16602778597439476199.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251203-itnoc-v5-0-5b97c63f2268@oss.qualcomm.com>
References: <20251203-itnoc-v5-0-5b97c63f2268@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_035351_963158_097ED1C6 
X-CRM114-Status: UNSURE (   9.66  )
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


On Wed, 03 Dec 2025 20:43:06 -0800, Yuanfang Zhang wrote:
> This patch series adds support for the Qualcomm CoreSight Interconnect TNOC
> (Trace Network On Chip) block, which acts as a CoreSight graph link forwarding
> trace data from subsystems to the Aggregator TNOC. Unlike the Aggregator TNOC,
> this block does not support aggregation or ATID assignment.
> 
> 

Applied, thanks!

[1/3] dt-bindings: arm: qcom: Add Coresight Interconnect TNOC
      https://git.kernel.org/coresight/c/2b3625a83245
[2/3] coresight-tnoc: add platform driver to support Interconnect TNOC
      https://git.kernel.org/coresight/c/5799dee92dc2
[3/3] coresight-tnoc: Add runtime PM support for Interconnect TNOC
      https://git.kernel.org/coresight/c/4d9024d14d1b

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>

