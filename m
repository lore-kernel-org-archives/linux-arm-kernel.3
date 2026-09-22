Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58C92C982FF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 13:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nmNg/7yNiyHCpTaffEz86tC403fYQxzrM4+1NqBtFlk=; b=izy/edbSK3zZlExqpVmD82B6SJ
	moxvFCP0siRQXUq1WDwhnYc4zQGJt9ujVDAqSeWuqFAKJK8Z7JbshJu93ug5SuAKx40MMULeYNaEd
	dONC61IPHrxIaC+cY3egJCuwoRA5tbkxRHZvEmIpj8nGmWO8xdsWUFzz6AOLqjwrEhX7M/x0X+rUW
	FJEHO8GmVR+wc1c8sjE5gCKew2YAqOKGu6lFknviluhREqfXP+rqsi3qDGOfA+y4AUHP2bX9GTv1U
	dVNmUeYdQhfAp6u9fK70UKuJ7MmMQpdZw7XR2ueXwAZ9jo9gArl/ItGoel0Ev1oqYOBJgHBzJhUUy
	tQCf0yWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x90DA-00000005QZI-0PB9;
	Tue, 22 Sep 2026 13:07:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x90D2-00000005QXg-3fWv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 13:06:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5D11F42AE4;
	Tue, 22 Sep 2026 13:06:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1ECD1F000FF;
	Tue, 22 Sep 2026 13:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790082416;
	bh=nmNg/7yNiyHCpTaffEz86tC403fYQxzrM4+1NqBtFlk=;
	h=From:To:Cc:Subject:Date;
	b=DQ38gUXOHTJXF+4OxYYh5GYRffcJUaQ3EHttkwbDl8o2/vt3+9dxOU4TEbWQd7gNw
	 3HBqyJFoOlPWKRw2jud7SdO/1Cv8uixnnSQo0hkkBS4SgDdFEgOUOQK5SRKjzw3mNN
	 f+//ZFDyJqswm+zvSpNz6TyW5qVjGrXNn3qzkRP7Ps2q01gHdEgiMpX/acmrFFbbZO
	 T0OrkX3JqofIO4faXji9+E9hV6+j7fwJeDBBCtxBQ4arGOGUOPBZ89vrhG7EReUSEv
	 Czv2EkuiJE57ifAliIzTT/iIncC6OMg9ohHPLT6M3T4f2fa0lMH8V63kFclNXq9HX3
	 J5eQ0kKxKVG3w==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: [GIT PULL] Qualcomm driver fixes for v7.3
Date: Tue, 22 Sep 2026 08:06:53 -0500
Message-ID: <20260922130653.357615-1-andersson@kernel.org>
X-Mailer: git-send-email 2.53.0
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


The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-fixes-for-7.3

for you to fetch changes up to 3eda4fa73e30207eb7afedde6987f7f321f74fbc:

  firmware: qcom_scm: Remove SCM PAS wrappers (2026-08-31 15:35:06 -0500)

----------------------------------------------------------------
Qualcomm driver fixes for v7.3

All clients was migrated from the Qualcomm SCM PAS API to the Qualcomm
PAS API in v7.3, remove the now unused direct API.

----------------------------------------------------------------
Sumit Garg (1):
      firmware: qcom_scm: Remove SCM PAS wrappers

 drivers/firmware/qcom/qcom_scm.c       | 143 +++++++--------------------------
 include/linux/firmware/qcom/qcom_scm.h |  29 -------
 2 files changed, 29 insertions(+), 143 deletions(-)

