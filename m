Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7FE0CE8E6B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 12:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3bHfXmVZsYx2YC0JptjQKYyuHEPX1WBZ1HcXVdTwOEY=; b=FEGpers15DIuEOZdl/gkKiae1u
	uZU24Sm2aWqlnGryzEpCZPdyx8+1sF2EqD0TGTIWmv69ZFzaL1PbGDMnGd9iWibYwxThcoa+uIrr1
	hI64mmyFrJflfW4okgAyX8o1v8wPxPLEuL93LUd+pjv7BJrtkP2A+xvDe3WevvStJAaTApvYpNPsm
	Ljti4jsGUlFr0Hq/51zuIttJ+Ja+zAiEsToiUrM9Aawj3J2q8bf6M4zQVUcsKhltIx/DgSQgpkVTm
	ox6dGoVGYQn9D4DUPpTdEUk6wxEK0dXRvTA2is7Yzjlzs+6VUL+gnFRIsen/K3nhCaS9bRiyMYGN6
	Xs0RzDmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3wyq-00000000LES-0zj0;
	Thu, 24 Oct 2024 12:30:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3wuQ-00000000Kjn-4AKy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 12:25:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E65BC5C5EC5;
	Thu, 24 Oct 2024 12:25:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 238C3C4CEC7;
	Thu, 24 Oct 2024 12:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729772743;
	bh=IjwkqMzdt6nNRdPNA6WvCMuffGMXH/yBD4kBHf+UQKg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Nn8YD/0eu/WrApoW7uoZH05/vt26Rb2afHr7m40kUPmlp4p262X7y96yUvo67KeUp
	 UDHqrq1dWBmR3E4qJyAOzC/j+ko0Iz98s67Jwn4abEeg2gYS+q88i4gH5iiHWVA+yN
	 wHvGanO1owD0jWlqxQhHJZVZhcx56ZiaegIrv8G6Zxkbut9ulibJAYV3RAumYvn6Ss
	 WEG9/p56Yb/2/hT0O5C26mcJ5MeaahBMBujwpeR8wlJEVgw1xJV319UM4H0zy9ysQX
	 KDmheu7UFseYy+LPfO3+yljIQTCPBkEXpM5Ur4X4qgXBmkQDKIIKDbsXJktraIfl6J
	 cNX0712ZLKi9g==
From: Will Deacon <will@kernel.org>
To: Frank.li@nxp.com,
	mark.rutland@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	john.g.garry@oracle.com,
	james.clark@linaro.org,
	mike.leach@linaro.org,
	leo.yan@linux.dev,
	peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	kan.liang@linux.intel.com,
	Xu Yang <xu.yang_2@nxp.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-perf-users@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: perf: fsl-imx-ddr: Add i.MX91 compatible
Date: Thu, 24 Oct 2024 13:25:29 +0100
Message-Id: <172976962763.3759096.9371300350428892441.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20240924061251.3387850-1-xu.yang_2@nxp.com>
References: <20240924061251.3387850-1-xu.yang_2@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_052547_113384_903CD444 
X-CRM114-Status: UNSURE (   8.62  )
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

On Tue, 24 Sep 2024 14:12:49 +0800, Xu Yang wrote:
> i.MX91 has a DDR Performance Monitor Unit which is compatible with i.MX93.
> This will add a compatible for i.MX91.
> 
> 

Applied first two patches to will (for-next/perf), thanks!

[1/3] dt-bindings: perf: fsl-imx-ddr: Add i.MX91 compatible
      https://git.kernel.org/will/c/0263a1e4f5dd
[2/3] perf: imx_perf: add support for i.MX91 platform
      https://git.kernel.org/will/c/44798fe136dc

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

