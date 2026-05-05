Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CD3EFF8855
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 15:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t0wX1znEUiUMUYC01FbAaFW4sQTQIIBKhb0kBm+92kE=; b=ZDJQBhdUdCasmoCOcTl6Xi+guY
	1oWY+5hZio6xCGL3flCzl0tjspXIWMA++uSwUX9K2dTRJNEeMqI6ZLaUEP5Fs2D/YfsQmcTwb/659
	+lP3To7/3OoQKw0tmDbp8dVV58TnXfXAkb6hcrJQ2463zoyF/wulQoSCCO0nKbeGeidM/6Gz183BG
	fun0Z66Rp+b7GlQJGL1S9f68BYc3cIPIcRvx61uqYyskt770nvZu4vSidDU/uVc8gd6utAqGpX0de
	Une4unwjuCsRQ77sqqS4o/ZicmswOAkY+DUZrj60Gh7v+gD9XVSoT17gu27Eo73PXuwm4rk0+XbzC
	tCitRWbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKHps-0000000Gfoz-182k;
	Tue, 05 May 2026 15:37:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKHpp-0000000GfoK-1yF9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 15:37:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1DA4340162;
	Tue,  5 May 2026 15:37:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A47DEC2BCF4;
	Tue,  5 May 2026 15:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777995441;
	bh=q215iWUMbXp86E5trCc9BqE+TbdpfYR9pjH0bK8ACX4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lx8GCC+QcC/Jt7eypkdc5f0X8D1DJ8Bx9CC6AD+iLfnZKS+mJmkkaINCKj3mT1KKU
	 8EYZi6tr97PWFJKG5NEHZRPVkfucSEXqv+YPGlUvXyxYXjQxoOZGX8K3Jt95BipM3h
	 Q852FL38q1KEBJIcnEi+9pig3eaAT5GA8UWGoIZBoGXYh8iq3Vv7a6bojCo+FpvT8j
	 Af7blbePLSbRn9kpJ4sN0ErsG+j25PDLF6C0J6Ad2XNMTWyJ9NBwDQTrQwbBF4ZbpI
	 iLGZlwjskDeeSGVThwHJFJ0AsOg7B8t7KN+K93iBVLxqWJ+PAJllkds9bsw0I8zghZ
	 DG6LaB/zxusfQ==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: arm-scmi@vger.kernel.org,
	Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [RFC][PATCH] firmware: arm_scmi: Rename struct scmi_revision_info to scmi_base_info
Date: Tue,  5 May 2026 16:37:15 +0100
Message-ID: <177799542159.2897058.8611655484605854510.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260406155343.72087-1-marek.vasut+renesas@mailbox.org>
References: <20260406155343.72087-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_083721_525585_5796813E 
X-CRM114-Status: UNSURE (   7.63  )
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

On Mon, 06 Apr 2026 17:52:54 +0200, Marek Vasut wrote:
> Rename struct scmi_revision_info to struct scmi_base_info , to
> accurately represent its content. The scmi_revision_info is no
> longer accurate, because the structure now contains more than
> only SCMI base protocol revision, it now also contains number
> of protocols, agents, vendor and subvendor strings. All those
> are fetched from the base protocol, so rename the structure to
> scmi_base_info, to match the other scmi_*_info structure names.
> No functional change.
> 
> [...]

Applied to sudeep.holla/linux (for-next/scmi/updates), thanks!

[1/1] firmware: arm_scmi: Rename struct scmi_revision_info to scmi_base_info
      https://git.kernel.org/sudeep.holla/c/0c6eb5d019c1

--
Regards,
Sudeep


