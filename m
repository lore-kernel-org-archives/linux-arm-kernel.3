Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 230FBF9D0F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 19:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H8MfICwr2hjm8yNDD+gPMRGp1paBMfjl9IKoequ74aE=; b=toQceJJVnS/ME/exAAw2nlmuL4
	lq7NKvB4M9X1UmH2/m796I2ivqGMoeyTIB3Bal2D9bvtRGC1UPX8jTA1WaR++yB+jF7kD2bAAumwS
	XuJhk234R2cljoMZ2IGxeLQ6puFJXEoiFEx48D3iTJgsrgVrMyyMgsoJ17q/DP3ZTzcLxlATE4dPu
	JoMiwbxTi9tJHJhdVO0LE5mGvO8lcamb9v9q4WBA33QT20p+fuOU7wzcOUgdSG+bbbI5RVoNbH3Rs
	dpXXGHkMUXcczv7quvhAe+O/l/zbCv+zxPbmgFrgDgRGsXnf9UcL1u6LmCwuLJf2swa3d6OmRtAS0
	GT8oEhMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCjL5-000000008qo-3oil;
	Tue, 14 Apr 2026 19:22:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCjL3-000000008qS-1zj1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 19:22:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E9B9A45D9;
	Tue, 14 Apr 2026 12:22:12 -0700 (PDT)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 96C3D3F641;
	Tue, 14 Apr 2026 12:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776194538; bh=x5OX5w4b8D1s3Zt7aKWBvgkILlntZjB6rqdS2KPLMNk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jvSB+Pmt8q9l0oCyRjfIhHND/bJrn2U3jBLf37W9IK9sGdWU/iBwJbAu5b+WVqhuT
	 KTnYnhmhDQfFf3D92AZ7b9O6ks7r6nNRAGcXAkR6X7WPNPzermWXePEguraVD2Brcu
	 sKQ79sk7+t59BEk5024xccJhltrPVzM4el2Zj2lQ=
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>,
	Mark Brown <broonie@kernel.org>
Cc: Marek Vasut <marex@nabladev.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64/hwcap: Include kernel-hwcap.h in list of generated files
Date: Tue, 14 Apr 2026 20:22:06 +0100
Message-ID: <177619452605.2125475.2986036149473022806.b4-ty@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260413-arm64-hwcap-gen-fix-v1-1-26c56aed6908@kernel.org>
References: <20260413-arm64-hwcap-gen-fix-v1-1-26c56aed6908@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_122221_639725_E8EA6D00 
X-CRM114-Status: GOOD (  10.35  )
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

On Mon, 13 Apr 2026 16:44:11 +0100, Mark Brown wrote:
> When adding generation for the kernel internal constants for hwcaps the
> generated file was not explicitly flagged as such in the build system,
> causing it to be regenerated on each build. This wasn't obvious when the
> series the change was included in was developed since it was all about
> changes that trigger rebuilds anyway.
> 
> 
> [...]

Applied to arm64 (for-next/misc), thanks!

[1/1] arm64/hwcap: Include kernel-hwcap.h in list of generated files
      https://git.kernel.org/arm64/c/680b961ebf41

