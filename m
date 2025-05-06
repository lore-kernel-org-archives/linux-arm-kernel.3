Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B92C5C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 12:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C3FaoFU14PW+rNOhnwf0Pi5TYAewyK6FE1yGwFuCRzA=; b=BH2rJ+KR2wcKs8Hoqp+RLWuONK
	CTqW5NEJkpgs4kH8nN0Izr4c9Ih14JAXqUKPSluXjuLEwqjDztqpNARwpzXYpzreKJh9GUf2xWfYc
	akalkT3vHICeRp8cqjHKO3Q9FTHjz9LK2HEJts8+CgIfNrp8hpc7INJpxDy5T6ecvU0k7Wqi+REE/
	RP7Scx2tWrx5oLeOd71uLeJvW99zrII4ggvXb02N7KNwUkf0bunkn3KCiJJsaLkpbNWQ4kXmnvKhb
	OmdRyxmTDqYfRaFR5+HFhQHATGytlNT/jMW1jtjml2LQSR98a435NXh/cvY0FfIQtY6DTPUakGpy7
	zSVHQ7mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCHDv-0000000BsDF-2ZzU;
	Tue, 06 May 2025 12:16:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCFJI-0000000BXBW-1bVA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 10:14:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 04E80113E;
	Tue,  6 May 2025 03:13:50 -0700 (PDT)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 528053F5A1;
	Tue,  6 May 2025 03:13:57 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	quic_sibis@quicinc.com,
	dan.carpenter@linaro.org,
	maz@kernel.org,
	johan@kernel.org
Subject: Re: [PATCH v3 0/3] Introduce SCMI Quirks framework
Date: Tue,  6 May 2025 11:13:51 +0100
Message-Id: <174652639726.3776516.14512391795874302742.b4-ty@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250429141108.406045-1-cristian.marussi@arm.com>
References: <20250429141108.406045-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_031400_460284_6870FAB1 
X-CRM114-Status: UNSURE (   7.16  )
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

On Tue, 29 Apr 2025 15:11:05 +0100, Cristian Marussi wrote:
> with the increasing adoption of SCMI across arm64 ecosystems, we have to
> start considering how to deal and take care of out-of-spec SCMI firmware
> platforms that are actively deployed in the wild, in a consistent manner.
> 
> This small series introduces a simple framework, based on static_keys,
> that allows a user to:
> 
> [...]

Applied to sudeep.holla/linux (for-next/scmi/updates), thanks!

[1/3] firmware: arm_scmi: Ensure that the message-id supports fastchannel
      https://git.kernel.org/sudeep.holla/c/94a263f981a3
[2/3] firmware: arm_scmi: Add Quirks framework
      https://git.kernel.org/sudeep.holla/c/487c407d57d6
[3/3] firmware: arm_scmi: quirk: Fix CLOCK_DESCRIBE_RATES triplet
      https://git.kernel.org/sudeep.holla/c/7b487beab7cd
--
Regards,
Sudeep


