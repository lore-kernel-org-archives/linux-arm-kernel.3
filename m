Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42507C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 09:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=woJdgi171I2DFxNF/hley8mR74iv4xldo3ZHKauQR9g=; b=1xyLjSjODgpqVUZ0RmeacJiyFp
	cr9YmWFW3knBGNdVEkGmWliF62s+nFqcjVz0L6R6BvZzy4UsCOPpUOYeWtpT9EH4KGjbLAM/ss4Ff
	Isw1FzROQsUPSz0I2aluFH/wjwPNI9yqmiGxwaNj3eI2qf9Xz954Rm41Dx0/p4275yogS229WHJ8y
	C67tUY3jp1kd5asPFjGWCoNkxMShNmXif5/GRaI+QVoE6XYdrcRaol5Rz1a3qN7Iw4ruwJM7y2R7j
	PRKbQ7vRyV0f7sV1W8QndawX2KfqrQH6GEqm4UdeJsJjpWyQ8lnjE9YXK4u9oxH2oiY8TOw1Okap/
	P6paXcHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmVEM-0000000D11G-3GTN;
	Mon, 24 Feb 2025 09:58:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmV7i-0000000CzHY-3Ne6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 09:51:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7E9A61FCD;
	Mon, 24 Feb 2025 01:51:51 -0800 (PST)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AA6673F673;
	Mon, 24 Feb 2025 01:51:33 -0800 (PST)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] hwtracing: coresight: Minor const fixes
Date: Mon, 24 Feb 2025 09:51:26 +0000
Message-ID: <174039066430.1495447.13273959809148103257.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250222-coresight-const-arm-id-v1-0-69a377cd098b@linaro.org>
References: <20250222-coresight-const-arm-id-v1-0-69a377cd098b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_015138_883290_1A05D105 
X-CRM114-Status: UNSURE (   6.35  )
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


On Sat, 22 Feb 2025 12:38:56 +0100, Krzysztof Kozlowski wrote:
> Just few improvements.
> 
> Best regards,
> Krzysztof
> 

Applied, thanks!

[1/3] coresight: catu: Constify amba_id table
      https://git.kernel.org/coresight/c/2ecdbebe
[2/3] coresight: tpda: Constify amba_id table
      https://git.kernel.org/coresight/c/7b6d52e8
[3/3] coresight: tpdm: Constify amba_id table
      https://git.kernel.org/coresight/c/2197cbc2

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>

