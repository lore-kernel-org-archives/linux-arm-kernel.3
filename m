Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FC61C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 16:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4XEKADoxDV0uaBCjdOtlNB13lhCbNCK+r7rIqp6/aqQ=; b=O2xofWAgTFypaW2AP2J0NmvFOc
	Z5GKZtIjU9w85ZnM5eXuh/s6jj0Ye0lX/n8CKXJn+RrfiVrF464OvhZdJ1KIVDtEyeDOjYZ8qEW7d
	MAMKcG59e3C7qG6N/8RNUustVtcjQNgGPbra4UW2/QgfkfcVKXnwQvuiTR/Y4BaIP4gPMqWyVeMP2
	ijN8Gty/hrnOydcyRo20JqtJtROXXPC056G8nATrAQRPJ77XgJmB9g0jWG97q9n7qDqPEoVhLpCS9
	HIesi8wd5cAvsnC1KkmPrMsov2uZ6nJoWUHgqZZgKxWcJPA31ozTNiOwl5kXuB3QheiV3Mf3sYxD1
	FrI+4VWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZApa-00000005ui7-46YE;
	Tue, 08 Jul 2025 16:06:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZACu-00000005nrT-0ReO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 15:26:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A77DA1595;
	Tue,  8 Jul 2025 08:25:55 -0700 (PDT)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 167B83F738;
	Tue,  8 Jul 2025 08:26:05 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: Cristian Marussi <cristian.marussi@arm.com>,
	Peng Fan <peng.fan@nxp.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>,
	Chuck Cannon <chuck.cannon@nxp.com>
Subject: Re: [PATCH v2 0/2] firmware: arm_scmi: add pm ops for scmi_power_control
Date: Tue,  8 Jul 2025 16:26:03 +0100
Message-Id: <175198830381.785998.16571714646012056824.b4-ty@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250704-scmi-pm-v2-0-9316cec2f9cc@nxp.com>
References: <20250704-scmi-pm-v2-0-9316cec2f9cc@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_082608_186923_966B18CB 
X-CRM114-Status: GOOD (  10.71  )
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

On Fri, 04 Jul 2025 11:09:34 +0800, Peng Fan wrote:
> Move information could be found in patch 2 commit log, hope it is clear
> 
> When testing on i.MX95, two consecutive suspend message send to the Linux
> agent, Linux will suspend(by the 1st suspend message) and wake up(by the
> 2nd suspend message).
> 
> The ARM SCMI spec does not allow for filtering of which messages an agent
> wants to get on the system power protocol. To i.MX95, as we use mailbox
> to receive message, and the mailbox supports wake up(interrupt is always
> enabled), so linux will also get a repeated suspend message. This will
> cause Linux to wake (and should then go back into suspend).
> 
> [...]

Applied to sudeep.holla/linux (for-linux-next), thanks!
(with some commit message changes and removal of #ifdef)

[1/2] firmware: arm_scmi: bus: Add pm ops
      https://git.kernel.org/sudeep.holla/c/76e65f7a0e0f
[2/2] firmware: arm_scmi: power_control: Set SCMI_SYSPOWER_IDLE in PM resume
      https://git.kernel.org/sudeep.holla/c/9a0658d3991e

--
Regards,
Sudeep


