Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0B95D2168E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 15:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z/BQK2iZrqyycXvR3Q6BbNBc2ewHth0aVsGEpo8l2mo=; b=W/oNs+hXYWIiET8kzTB6Nz6Dmk
	YMT1Zl4CIt9j6nxeRE6SphXzCXG76x9gqazGKQ1B4xHmKxn9+MMyn3/0hnk4kthgJhXXTCXXB9jpf
	RVaVpgIr1WKIphXnzS3Z7kcxaBWNWAKP8dr7pXFUyeszwHI9+PEvaYfkg6Dvz6R5cWaSYB5zqPvb3
	UL7hWmh6Ip6JpT8yqYyvk5ORqaa76QVaPmUggiUYuQz4ZXGHa211GlgPSXIXy8g6MlWVMqtPLUlHc
	OTqiKkrdRm15PpUOaV0TeZhy46q8lxYzKwodPZrQAN6xpr3IsxcmjNbkJcKuY7fJU4rFoxXZJSfTG
	F8UMry8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRBOF-00000008DUg-1gUg;
	Thu, 04 Dec 2025 15:37:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRBOD-00000008DUL-2Fqb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 15:37:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D639F42A07;
	Thu,  4 Dec 2025 15:37:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79090C4CEFB;
	Thu,  4 Dec 2025 15:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764862624;
	bh=BGS0FZcNwAT4kN84K1EFaxAPrUGjGKfhVBy6CiQEox4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lTA+kkLd3VW7hsowY8sH2q2mgTi7/M3Nkz1kuK4ILH0Br6TKK09/opjnzdYB+ix74
	 S7MaJWbmq0O7fG1JGlH5IJyEILC5lSPVXbpJs+OECIsD5xRhozl4tsv4WCbmDZqm0y
	 BeW04I57dfv2WO038B4KRB1AoSR89rwV4AOsj1TnkqzI+ZBhjA9i/s2F16SSxK88EY
	 v/wKzfBJeo4o1eNTkcZbUKY2nWd1/QGFM5n3H76q77rhn1ePTzmf3U5Y0c2yDFZIaA
	 d4mjjpeFORlWYMnJSV4RdHq+a07NfZwIpaMkilKYadFbuDBwcbOqKmwwyczrHkZHm9
	 WUE6YCmQWTCDQ==
Date: Thu, 4 Dec 2025 09:37:01 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Raghav Sharma <raghav.s@samsung.com>
Cc: sboyd@kernel.org, chandan.vn@samsung.com, krzk@kernel.org,
	conor+dt@kernel.org, shin.son@samsung.com,
	linux-kernel@vger.kernel.org, dev.tailor@samsung.com,
	devicetree@vger.kernel.org, karthik.sun@samsung.com,
	cw00.choi@samsung.com, s.nawrocki@samsung.com,
	alim.akhtar@samsung.com, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	sunyeal.hong@samsung.com, mturquette@baylibre.com
Subject: Re: [PATCH 1/3] dt-bindings: clock: exynosautov920: add MFD clock
 definitions
Message-ID: <176486262088.1527918.10847897816665673488.robh@kernel.org>
References: <20251119114744.1914416-1-raghav.s@samsung.com>
 <CGME20251119113927epcas5p15154cb4a7824e9ca65ac18842b68d785@epcas5p1.samsung.com>
 <20251119114744.1914416-2-raghav.s@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119114744.1914416-2-raghav.s@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_073705_615986_E008F29C 
X-CRM114-Status: UNSURE (   7.58  )
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


On Wed, 19 Nov 2025 17:17:42 +0530, Raghav Sharma wrote:
> Add device tree clock binding definitions for CMU_MFD
> 
> Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
> ---
>  .../clock/samsung,exynosautov920-clock.yaml   | 19 +++++++++++++++++++
>  .../clock/samsung,exynosautov920.h            |  4 ++++
>  2 files changed, 23 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


