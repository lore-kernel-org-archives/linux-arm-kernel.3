Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F254C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 11:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:From:Cc:To:Subject:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+3o7HWVkKjJogRj6j5cSiH5Bcbs0MxJWW9dNId5hUvI=; b=07Q5EwXM/JATDdWiN3zb8oV+P5
	/Nn3ggGxrWHN5hkm17m1QODm+UIggfQ4Aj9HtBYssoBDLL3A9ruPLsa0eJI8PuWrY49T3Wn6/X6qb
	fVHTDNnBe9NCp/Hj2/JvKlxtKyt6BmHgqpCW8xGbvwpsZRmeevQhJZjENMn/AK/y46zFOa9wKQbvd
	ymOWd9Ec3FOag8Xn02dbKJw27ljnj2SJ/B+e5uDI7guaKKy+6781Jd3W4ScGgmWy8IZEZIFVNasmK
	bwv15rOAJ4zBhaL55dkVQokxkm8jU5gzTv3jwTSHLoXOUWOFnqYiKKcOKicYRgXtG8MOjIGrVUqFz
	rukYqwYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5NUq-0000000CoIb-38QG;
	Thu, 17 Apr 2025 11:33:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5NSj-0000000CnsP-3KQt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 11:31:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4574E60010;
	Thu, 17 Apr 2025 11:31:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67760C4CEE4;
	Thu, 17 Apr 2025 11:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744889480;
	bh=Fqlce3Jcg7CbUMFOSbwDSSHaq5SBKeqGbBUTBQEEXhw=;
	h=Subject:To:Cc:From:Date:From;
	b=yzdwvkS5g1CTDBScQk9NrwSgoCNw1b18TtxCIzCDXtio3HvLdL6adDyk6XJls+rE7
	 UdpArBQ9Ktlh6v/00hNsaE1FsHjESuioZsFQ747fGgnORpo25n7VJErHJDGKUUP27S
	 dLFU9ZamaQ78xFhuWBlTP8jEXJCZY657NZsDh1yw=
Subject: Patch "arm64: dts: exynos: gs101: disable pinctrl_gsacore node" has been added to the 6.14-stable tree
To: alim.akhtar@samsung.com,andre.draszik@linaro.org,conor+dt@kernel.org,gregkh@linuxfoundation.org,kernel-team@android.com,krzk+dt@kernel.org,krzysztof.kozlowski@linaro.org,linux-arm-kernel@lists.infradead.org,peter.griffin@linaro.org,robh@kernel.org,tudor.ambarus@linaro.org,willmcvicker@google.com
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Thu, 17 Apr 2025 13:27:27 +0200
Message-ID: <2025041727-certainly-rebuttal-17b5@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
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


This is a note to let you know that I've just added the patch titled

    arm64: dts: exynos: gs101: disable pinctrl_gsacore node

to the 6.14-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     arm64-dts-exynos-gs101-disable-pinctrl_gsacore-node.patch
and it can be found in the queue-6.14 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From 168e24966f10ff635b0ec9728aa71833bf850ee5 Mon Sep 17 00:00:00 2001
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 6 Jan 2025 14:57:46 +0000
Subject: arm64: dts: exynos: gs101: disable pinctrl_gsacore node

From: Peter Griffin <peter.griffin@linaro.org>

commit 168e24966f10ff635b0ec9728aa71833bf850ee5 upstream.

gsacore registers are not accessible from normal world.

Disable this node, so that the suspend/resume callbacks
in the pinctrl driver don't cause a Serror attempting to
access the registers.

Fixes: ea89fdf24fd9 ("arm64: dts: exynos: google: Add initial Google gs101 SoC support")
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: tudor.ambarus@linaro.org
Cc: andre.draszik@linaro.org
Cc: kernel-team@android.com
Cc: willmcvicker@google.com
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/r/20250106-contrib-pg-pinctrl_gsacore_disable-v1-1-d3fc88a48aed@linaro.org
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi |    1 +
 1 file changed, 1 insertion(+)

--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -1454,6 +1454,7 @@
 			/* TODO: update once support for this CMU exists */
 			clocks = <0>;
 			clock-names = "pclk";
+			status = "disabled";
 		};
 
 		cmu_top: clock-controller@1e080000 {


Patches currently in stable-queue which might be from peter.griffin@linaro.org are

queue-6.14/arm64-dts-exynos-gs101-disable-pinctrl_gsacore-node.patch

