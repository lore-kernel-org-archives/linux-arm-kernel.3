Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C795BF4369E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 13:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F0cuNn+7Cw+AZ8bkjjfmvttTnU9EirNcnNgtvx97n8s=; b=foBUfg2fpJAkzyZmTMxdW8oUjV
	+6pHpI0L6LNXRyEg3gVK3OUGP5HdUVJ+rAznXCh34rpAlhmo5+pnUqgxbkNxNFCVBRvqq1N20HL1M
	ULGHcqX6/oUIUld8IAs4eiPt/uF+PZ2HrMeseVc+395HPHUyKDDqU7M1gdsTJi77LE4Cvn9QQ7M8N
	ZO3B7B4BFRGq/ugl+gBX9hKOXt3oGKbF277vJuMnPLXQgrKu8fApT95goJ/y6XESOCqEqSCKRprEK
	KinlHKu2ibr9jkcQyeyk8sKabcs2kAzdEVCQ7Oayb+Tk8mAYC9tnd8ncWrLeLXwHkeUF+0FH8YfI5
	aemxoTtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDj3D-000000044b7-3JiW;
	Fri, 17 Apr 2026 13:16:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDj3A-000000044a7-28WL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Apr 2026 13:16:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C22D060139;
	Fri, 17 Apr 2026 13:15:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 266BEC19425;
	Fri, 17 Apr 2026 13:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776431759;
	bh=3t8CdW+2lbkqrvxvlVhufeih1j58VNK7Gp9uCsojClc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UVbqZkQEN53h7akJNXk0j+ukEncZxIVmMr39H0JMt4EnZrnvgAvMcWbdTPE8sEgCo
	 VVg4LEWgAVvd09IV4ADTUmZMGVCuDxQkefWwciaRfMQlRtgGtDOY5SIWgAtDf90SMN
	 4UYl0y9UVy2CWHtZ+COl6V07Ob4WBKZ0DYfpVLo/5yM84Gs67gklmCinv6Qu9m7VgP
	 2knHhAT4cUe7cVDLyhcxCov0g15C0s30is4RkHhmRbQyyesFNKD0RlQD+0lZeDD71p
	 EASAEbI4aTmaf+cJunQsXB4ZESNHabuvmWqb35FM78tS1pEKAhTM2AKT/nuyzs0+tP
	 rLZZGIKztzPsg==
From: Thierry Reding <thierry.reding@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] Documentation: ABI: Take over as contact for sysfs-driver-tegra-fuse
Date: Fri, 17 Apr 2026 15:15:47 +0200
Message-ID: <20260417131549.3154534-2-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260417131549.3154534-1-thierry.reding@kernel.org>
References: <20260417131549.3154534-1-thierry.reding@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Thierry Reding <treding@nvidia.com>

Peter sadly passed away a while ago, so I'll be taking over as contact
for this ABI documentation.

Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 Documentation/ABI/testing/sysfs-driver-tegra-fuse | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-tegra-fuse b/Documentation/ABI/testing/sysfs-driver-tegra-fuse
index b8936fad2ccf..47d5513100f6 100644
--- a/Documentation/ABI/testing/sysfs-driver-tegra-fuse
+++ b/Documentation/ABI/testing/sysfs-driver-tegra-fuse
@@ -1,6 +1,6 @@
 What:		/sys/devices/*/<our-device>/fuse
 Date:		February 2014
-Contact:	Peter De Schrijver <pdeschrijver@nvidia.com>
+Contact:	Thierry Reding <thierry.reding@kernel.org>
 Description:	read-only access to the efuses on Tegra20, Tegra30, Tegra114
 		and Tegra124 SoC's from NVIDIA. The efuses contain write once
 		data programmed at the factory. The data is laid out in 32bit
-- 
2.52.0


