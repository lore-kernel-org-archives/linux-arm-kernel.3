Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4310606A333
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Oct 2026 12:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2k0WWUeG;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bTNSBKQE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=p+SP5aC6kFf2m6+Y0UAcy1XbuoZimqxQ+Qboov/RQdw=; b=2k0WWUeGmWxLHH
	Dib2vFbv1aGmlemezDNiNJCq/YPztJHy0Q4bnuV8haMvVP9SpCNCYMo85XhVCaPHabf9trkdTeuQr
	zaN4xrh21/FewWFwww3PsB6hB/FvhMwJXr3QDeyDYSeypF7IE+E1UgPfK3AmE8aGwDu2QVRpNf51R
	C5Xb2/h5DbDNnO9buOZ9y79nQLM+aZn2/QNu7OLMdLfap2UeDuLCqCSgRmwpyQs5t3XfDm62GiBPc
	Am3jA8BXiOgNKzNAexfb/WkTYj9Axip+YWhVyK2N86AhC+d9reNZSkjlm7FVlmuj+fN2oN+T6AVjF
	9o90PUsvjhbHuzjCIJtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN8Mk-0000000DJp9-3Anj;
	Sat, 31 Oct 2026 12:39:22 +0000
Received: from mail-dy1-x132b.google.com ([2607:f8b0:4864:20::132b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN8Mi-0000000DJop-1nzc
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Oct 2026 12:39:21 +0000
Received: by mail-dy1-x132b.google.com with SMTP id 5a478bee46e88-36a2551d7b5so3419497eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Oct 2026 05:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793450359; x=1794055159; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p+SP5aC6kFf2m6+Y0UAcy1XbuoZimqxQ+Qboov/RQdw=;
        b=bTNSBKQERJzNCHaoIdKyD8xabuQGOriI7vBUzHJVlElUdUfWZnwdKoKR+Hvi3pzitA
         9Gg1xq1tMT5PuJo7p+RAxeqRE2JWH1VY85Ng64jLtciXFdjVaFIjZ0U92tZCz166rEjB
         fBFVWAb0ls6VQskEQDh3F9fHOiPNZ1CRRkyuQqBP93HoLusxdJzSK9Zt9XLMbuxtKk7Z
         unFt+1A7e1EYZGpxkwx8jEEiiWpsqvnPqduDj8vkEahjPByi/RljCoKx5OV210C4sUkw
         zHIJMEqTUfsD/m5dfev7pF5d+Q8bs4C+oAKMxio/Wq57lTfeC2wYlzm14T/5P0kQVVoE
         Rg8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793450359; x=1794055159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p+SP5aC6kFf2m6+Y0UAcy1XbuoZimqxQ+Qboov/RQdw=;
        b=Ta7Euol6LHrmcmu3Y+FxMVkFVH1C7nshXZUOdhPyn58KhTbIDW27+u7buWCLxOqRaj
         0VUmphe2vCafZtiTsIWA6vb01G6ZPRTsm32roztMsHoz6tMgcIITSmOvtzIlmTMp/6fX
         rCZj3Nbl/KPqY+hc/UiIDXPdc2fb3ZpMbKiQy2dC7ohoIT/0IurxKNZVzwB34gXzHMN8
         L5lWcDI6nR9qHrYYoBUyv/BBjGOoPUHdKumPeuyysCQ1ldEKcvbhAkFm6+ANfLXdgciP
         a7A3BeogjxbWBDMoBsvb9c6ABWlnFzqrFv8cW7uOA+vG7dWG+axOkCAdPkq3FI0pY2VX
         Q96g==
X-Forwarded-Encrypted: i=1; AKwUvByBzyElmfm4NT7NuSJc+U1ll4dIQl8k8u5UzLvSMOQwEIwS1+Ag/SasSUCQ9IfvshsaCDN8c067q5fL/PWO+c7O@lists.infradead.org
X-Gm-Message-State: AFq9FYKgNlwUCWzZ6FJQS+qn8LmqIXsxohB9/33x+hvhFbYilGP+AAXY
	rX2gqSvkejC38sJjbIzWwwWBK0kJmW574HQggHjNd7iWas1SUgDftrDj
X-Gm-Gg: AYBFou3vxPRwjZI1CoLyg9slHaTD7PWHKw/+bRUtWaAhU+fvxEj8/eRdWNnRRAjxx4u
	AOg0tfMhevIXX1Nnjxr+gxpoQrP9U7D+hmyOXWOFinNR9VycVnOOkYc2uN3rFcIjOxrBuI/C9ZR
	YUfo+e1ISVyWQ5x9MIPdE17/IUpN6S5T6p5IE1v3mm+Au8+HVOJtD2zeH+C80bw+QGa0e/VEnAi
	TDyG9DOJ5cQ2roXIMYzsvZdjBrflRNlAxj7uukO1S+fmgai+SmgS+sRd13OZqGgRuUtdttrVSdK
	Lx0fiYyE/vPvmHHrVNqQcTcIEuS/7GRY1M1qW3idVH8+9gOIeNQfEucALvhKVSO4MO1joypErVW
	Dcwd1UhyaM63R2ysX01EEtKt4EUL5Bek7jHNEbvEfLWZecnIf2XArwn0M0Qix3eWB64jQC5jUHC
	jCcVOBXqMpT9wrYUwrDlpA4K9Pdk/TtahEDSwew0ePNUuN+fgSgFXLozgRIvCbcZ6Ny5OCq7MAV
	3C5tGCHaumHTzMG73hC7M4xM2NS2XrW2Q6OPZU3zNPLJ2eLtChhCw9q6IV2wEdGaykKcDyguPMh
	nG9LVVmkrW3gI5zaUVy43+H4FxcO31Y+/QSeofWpBAgrfImu/c38oChiyC0HztrhzfIK5AY5Qva
	NloeQUOpxzzn6utxF2F506ZOFrxkuvnNilxh8ciO0fei/8Hza59k7f78JJpjr0rFhTNFoxHyUZM
	aU/EWokUlM3uxBnQ==
X-Received: by 2002:a05:7022:f507:b0:1ab:90a8:87a2 with SMTP id a92af1059eb24-1ad1077e9a6mr5123543c88.11.1793450359362;
        Sat, 31 Oct 2026 05:39:19 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1854da78sm21566039c88.6.2026.10.31.05.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 05:39:18 -0700 (PDT)
From: Samarth Narang <samarth.colleges@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Samarth Narang <samarth.colleges@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	linux-serial@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] serial: fix TX kfifo underflow on flush in five drivers
Date: Sat, 31 Oct 2026 12:39:06 +0000
Message-Id: <20261031123911.3784690-1-samarth.colleges@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261031004733.3345841-1-samarth.colleges@gmail.com>
References: <20261031004733.3345841-1-samarth.colleges@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261031_053920_469343_80769047 
X-CRM114-Status: GOOD (  15.87  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series addresses the TX kfifo underflow reported in the parent
thread, where uart_flush_buffer() resets the transmit kfifo but a
completion callback from an earlier DMA transfer may still call
uart_xmit_advance() using the byte count from before the flush.

The fixes take two approaches depending on how each driver manages its
TX DMA mappings. In samsung and tegra, which map the TX buffer once,
samsung's new flush_buffer() terminates the outstanding transfer, as
tegra's already does, following the approach introduced in 8250 by
9e512eaaf8f4. A completion already in progress skips the kfifo update if
the transfer has since been retired by flush_buffer() or stop_tx().

In sprd, msm, and pch_uart, which map each transfer separately,
terminating DMA there would leave the flush hook to unmap a buffer the
controller may still be reading. These drivers therefore leave the
transfer running and mark it as flushed, allowing the completion
callback to unmap the buffer without advancing the kfifo. This means
that the data already queued for DMA before the flush may still be
transmitted.

All five patches have only been compile-tested with arm64 defconfig and
the relevant drivers enabled, including pch_uart through COMPILE_TEST,
using W=1 with no new warnings. I do not have access to the affected
hardware, so testing by someone with suitable devices would be
appreciated.

One race remains, which is also present in the 8250 fix: a completion
may already be running when the flush occurs but acquire the port lock
only after a new transfer has started, potentially mistaking the new
transfer's state for its own. Preventing this would require tracking
individual transfers, for example with a generation counter, which I
have left out of this series to keep the changes focused.

Samarth Narang (5):
  tty: serial: samsung: fix TX kfifo underflow on flush
  serial: tegra: don't advance the TX kfifo for a flushed transfer
  serial: sprd: fix TX kfifo underflow on flush
  tty: serial: msm: fix TX kfifo underflow on flush
  serial: pch_uart: fix TX kfifo underflow on flush

 drivers/tty/serial/msm_serial.c   | 19 ++++++++++++++++++-
 drivers/tty/serial/pch_uart.c     | 27 +++++++++++++++++++++++++--
 drivers/tty/serial/samsung_tty.c  | 22 ++++++++++++++++++++++
 drivers/tty/serial/serial-tegra.c |  8 ++++++++
 drivers/tty/serial/sprd_serial.c  | 24 ++++++++++++++++++++++--
 5 files changed, 95 insertions(+), 5 deletions(-)


base-commit: 36aad21d50d1af3f6954bb0c988257a908202477
-- 
2.34.1


