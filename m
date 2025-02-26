Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 204C3C021BF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 13:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nq0mEjqxqU7zuP3BQJkMKtMLbWP9fFUnx5a8VzSdVLg=; b=rh0hMovFW77YehZ/538HzclzQI
	dsvrJxIc39sSrsU48rdWruv1CKu6ShXC5RVm3FQPKSs0NxoFxB0dXpdMUKZbZjDxi2ReRrtU9EqDq
	kGbQAPPj6wtACwJCOpNkOycp2Fpuc+hmxO+lJr0fo0f7xnMgSGHMCiuYYpNpIKUxsbxMQB7XvLL8V
	Ekghi/ykmDBREUnqEkAd+40c9EHbTJqgTL/rkNAa+EOn64gr/e+/bymR0OnOhK9eSZhzPus5wP/+k
	bFlEE+CO7HSh6DkPUVCpiBPVx5N3r2UD+XYYEjdzC7FVCf+0tqJreKob5S7wmEoIejriY7liC/dKY
	SJRol9fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnHPI-00000003pix-25Ds;
	Wed, 26 Feb 2025 13:25:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnFZQ-00000003TPH-1X3X
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 11:27:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 761611515;
	Wed, 26 Feb 2025 03:27:35 -0800 (PST)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4F2783F673;
	Wed, 26 Feb 2025 03:27:18 -0800 (PST)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Mao Jinlong <quic_jinlmao@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4 0/3] Add support to configure TPDM MCMB subunit
Date: Wed, 26 Feb 2025 11:27:09 +0000
Message-ID: <174056919426.1604150.1643186333953518995.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250226064008.2531037-1-quic_jinlmao@quicinc.com>
References: <20250226064008.2531037-1-quic_jinlmao@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_032720_449274_97A65697 
X-CRM114-Status: UNSURE (   8.86  )
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


On Tue, 25 Feb 2025 22:40:05 -0800, Mao Jinlong wrote:
> Introduction of TPDM MCMB(Multi-lane Continuous Multi Bit) subunit
> MCMB (Multi-lane CMB) is a special form of CMB dataset type. MCMB
> subunit has the same number and usage of registers as CMB subunit.
> Just like the CMB subunit, the MCMB subunit must be configured prior
> to enablement. This series adds support for TPDM to configure the
> MCMB subunit.
> 
> [...]

Applied, thanks!

[1/3] coresight-tpdm: Add MCMB dataset support
      https://git.kernel.org/coresight/c/ee39dbe9
[2/3] coresight-tpdm: Add support to select lane
      https://git.kernel.org/coresight/c/07f7c217
[3/3] coresight-tpdm: Add support to enable the lane for MCMB TPDM
      https://git.kernel.org/coresight/c/0c0b6c05

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>

