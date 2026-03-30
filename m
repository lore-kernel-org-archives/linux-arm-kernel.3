Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D1C61061B0A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 16:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A6sReMjLzSP9a3K+XAEcm0M2BlICzHIwZtGCaoPGUog=; b=Qs4pCSm4drXrngvH4OCvCQCpy+
	8b91uITvTZWl0busQScXqTZppVKR3Oqr4JNcL/rFbkAZC/cguO/tqdRmvlR8pqsfw8nbguwXDxzG3
	vs+MKSRcuyEMPgRpx8Q+AKvgGMxJqjYXZ2f5nx5JXdtUrEF+/rVeUuFN1IWwUwMtZROAW0yWEUeQi
	jAuys8YXz5lVuFcJyYvQI3w9BheYqqNq7aqW+mlTWrrU1jSR1IvGCBQZMDuhNHfPZWI/bSKUYbkxr
	cIy9YeWBHcCkkXzwh27bHqY/7//c5vemCEm7XmhX/cUmoGKhSoF6n0xdZnOIgPqBdwsxti9ntfArh
	Axvu9tHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7F3u-0000000Bbnd-2chx;
	Mon, 30 Mar 2026 16:01:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7F3r-0000000BbnK-3OSq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 16:01:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BD81B43DA1;
	Mon, 30 Mar 2026 16:01:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05D29C19423;
	Mon, 30 Mar 2026 16:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774886514;
	bh=2q05kcOGYH4miihvecwHGaShdUjVihansqExlAnDv9o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lM/I/ykY4Kx4d5k2NqwUGZEli9cwHyglf6BWPWaRYxVfG3dZc/hBmIrx4H0hSGLaj
	 lJrr7eFrLU95WuU3GN7kvfFf/RfbglHlJzP6CkFf3wXmbsL89MQa46TudaHnycLCFd
	 q7hGNNoQoSMaBfZ0hL/UqY84IMz7LW0xRmQEyvDf4wvPEc9wZt4+x3Sn1QpnXxXRIT
	 1gPeG3znhY+wbwzXQfHppfh6jAhDybITjlQ5g31PhVPr+m00hsS5E3YC8DEFuL0YAt
	 CH9Cusk4f7Vjwo7sSIW8hnVxLQaVD1Oozu8JwSo/tz4027AyK9j3L7OSSd9E3+fPrL
	 gHl2YLGnNSnIQ==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	Canfeng Zhuang <canfeng.zhuang@oss.qualcomm.com>
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/2] arm64: dts: qcom: enable UARTs for robot expansion board
Date: Mon, 30 Mar 2026 11:01:14 -0500
Message-ID: <177488647759.633011.5997983880216734366.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260327083101.1343613-1-canfeng.zhuang@oss.qualcomm.com>
References: <20260327083101.1343613-1-canfeng.zhuang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_090155_997080_31DBBB80 
X-CRM114-Status: UNSURE (   8.89  )
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


On Fri, 27 Mar 2026 16:30:59 +0800, Canfeng Zhuang wrote:
> The Qualcomm Lemans EVK and Monaco EVK boards expose a mezzanine
> connector used by a motor control expansion board.
> 
> This expansion board hosts an MCU running NuttX and communicates with
> Linux over UART, with all protocol handling done in userspace.
> 
> This series enables the required UARTs and assigns stable serial aliases
> to ensure consistent device enumeration across platforms.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: lemans-evk: enable UART0 for robot expansion board
      commit: 0be638f326c2015ae9406f4238d9bc54b5b7a584
[2/2] arm64: dts: qcom: monaco-evk: enable UART6 for robot expansion board
      commit: 74620bf0c3c6091ecd7972075f5ddeba29994407

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

