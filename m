Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EF74C02194
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 13:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WVqvXuJR/nMeKALGtWBObSDmWpMBdbeFKPbb6dj+QMU=; b=egfcnLH2ptWs8GsOfSsUbq2Ylp
	kSxeI3LSMbpBqBWbjolyK8W3Nnph9AWyU/a2UfSmUQOJto5dCh8h9VaIyZn1CEN22OLDtyXHgTPcB
	U/9L1hAprUvDaildDg6J6WKPfoe7XJZzYJt978glHMmtObiKKrXQnYSM0EhON6kfz6dn1zo46LVzA
	tjkEZXPGB483Gh2C9jMBNpMOO+CuOuwpZeqpGngVm7GygatMAf7ajA3eeJ9LfGjGutco8C7G9SUsx
	syWZ7cpHUYSAC+yJ8Eh0/qd2VJIKfkO6VnZ5EDIoVnEKpVewd/9iIjiIR3evF8jmsp0NR2HhhnpLN
	3ZSGzK7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfIly-00000000Vdx-3WQ7;
	Tue, 04 Feb 2025 13:15:26 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfIg1-00000000UmH-2CTj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 13:09:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7EF8FA424CB;
	Tue,  4 Feb 2025 13:07:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6DF9C4CEE2;
	Tue,  4 Feb 2025 13:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738674556;
	bh=vxDHz8ElI6Ex4LZgJZ8U26irCHGknU34NH8DsZG5iSs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NqHji4eix0w461AuS2feo2p8tgbNje2wDxWa5HEF7d/NWCIACk2U+fLFn8wTQHWie
	 Uhl6zZgZwS5LNVBtLAQawJyfwqde116QD9uoA8BxmvPwOanf7KMdck1cnwicLTd5G0
	 MsxFMpPa0iRi5EXCFbpdSQGdjjT6A/TL1RZbHfz3AYmfvpB6P41kR4fOUnWA9uJQx0
	 80SoXpiJD7mZDemrmta/lJLIpExMSROUootZ7GCERtJUit1hC0YDCM8l+nMq32U1/N
	 einegFkb/GDssWWEuFTZGTvT6CRKrBnZj7oAJwa8Dx2iu9sBESZf5BVu1wBP8N2+bE
	 +TBd+rkcwJF7Q==
From: Will Deacon <will@kernel.org>
To: Masami Hiramatsu <mhiramat@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-trace-kernel@vger.kernel.org,
	Lukas Bulwahn <lbulwahn@redhat.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	linux-arm-kernel@lists.infradead.org,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: Re: [PATCH] arm64: Kconfig: Remove selecting replaced HAVE_FUNCTION_GRAPH_RETVAL
Date: Tue,  4 Feb 2025 13:09:04 +0000
Message-Id: <173867195188.3988698.8446978312627999775.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250117125522.99071-1-lukas.bulwahn@redhat.com>
References: <20250117125522.99071-1-lukas.bulwahn@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_050917_623607_4BFB3D1E 
X-CRM114-Status: UNSURE (   8.42  )
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

On Fri, 17 Jan 2025 07:55:22 -0500, Lukas Bulwahn wrote:
> Commit a3ed4157b7d8 ("fgraph: Replace fgraph_ret_regs with ftrace_regs")
> replaces the config HAVE_FUNCTION_GRAPH_RETVAL with the config
> HAVE_FUNCTION_GRAPH_FREGS, and it replaces all the select commands in the
> various architecture Kconfig files. In the arm64 architecture, the commit
> adds the 'select HAVE_FUNCTION_GRAPH_FREGS', but misses to remove the
> 'select HAVE_FUNCTION_GRAPH_RETVAL', i.e., the select on the replaced
> config.
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64: Kconfig: Remove selecting replaced HAVE_FUNCTION_GRAPH_RETVAL
      https://git.kernel.org/arm64/c/f458b2165d7a

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

