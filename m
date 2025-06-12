Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85FC2C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 04:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/B+8RevM6Ofau8Z/9+qoo89gx+LXuukTjT6hC38HhEk=; b=c2HHx2OhLSEI0dFkhs/v+/wTVZ
	DtrE51Ri+5uBq1MY9nX1OWMQ+zLJ4Yckii9j0aGLXp/udReRnsXKlytlPT53xGEgdEI+Wo5iOFa4/
	f5eJG2qi9qt2qWrRxQvU0T8FSg6l8Iz5Vnq5Xy4Dxb2gqYx8pi72J7VAuJIMiL0Gja+JlcchoQuKq
	qtpsabkuznkIVmjLbr/dZ5mxL4SgFbix0kS4T/rBGxH0qaH31GSJOIvHsdngQ0jkRB2yXwUarihkv
	yuW238PXMDpORecASeCeUaYiU70bBtg+G8XWkFjtb8s34rwMSSUxAl+iFfPKRJ1WKvP7E5SsJYrRG
	jfWRY7wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPZ9h-0000000C73M-04s0;
	Thu, 12 Jun 2025 04:03:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPZ7X-0000000C6e5-3rML
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 04:00:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0FAD149EF8;
	Thu, 12 Jun 2025 04:00:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C361C4CEEB;
	Thu, 12 Jun 2025 04:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749700854;
	bh=mz2ucRVIwB/L/SqWdSybuRAOphTiphXBWZwiEvEMGII=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kvx+gSGjRIoWdvm8i5SbrmJAGs8P+t1fqoq5G6z952YQahbrdaUCKD4XCaFk3qQEL
	 mzMMrXgvUimUpcKl6cmkVvZu8w+6NiRGVWjJ/qky8z+DqLC0KWZUum+PFPF+3sAuJ0
	 xPr7ZstiL+rW8iOADVH/2JqQ6cXB1cxTwoUnPPbLidKTL8IEDsUYWQPxFrGbU4OJPQ
	 oZXr+bh26djhv8ZX/JlGoXWL1exM+GRboaeFYoaBs2l01Bc0hWd9AEdK693jg8V3bL
	 Dp3Dbjx4wcuhdRboFOBQoZM6sbYplbFAFxPfdAatfxNrbJ9T3U4YdTd2/9KGFjSZIO
	 MFPj8OLy1ltTw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: defconfig: Enable Qualcomm CPUCP mailbox driver
Date: Wed, 11 Jun 2025 23:00:34 -0500
Message-ID: <174970084177.547582.1881380220654294150.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605-enable-cpucp-v1-1-111ecef7e4c9@oss.qualcomm.com>
References: <20250605-enable-cpucp-v1-1-111ecef7e4c9@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_210055_976435_A1B29AD9 
X-CRM114-Status: UNSURE (   7.93  )
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


On Thu, 05 Jun 2025 19:06:06 -0500, Bjorn Andersson wrote:
> The Qualcomm CPUCP mailbox driver needs to be enabled for CPU frequency
> scaling to work on the X Elite platform, so enable this driver.
> 
> 

Applied, thanks!

[1/1] arm64: defconfig: Enable Qualcomm CPUCP mailbox driver
      commit: 3871b51a684275e3a47fbebf93c0a0e7a05d7f9f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

