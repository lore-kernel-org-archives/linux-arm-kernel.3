Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D7E4CAC589
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 12:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d/JBwf7sWD6ixycarQrNkdPPWRrWCLO6JprJjl+jIkM=; b=DAc/kZG1eBeGa2P3qGLD7+qZwC
	F5fezEbb9T5RSIRfa/npNhHRhmQPV8YItvacyN/CTciqHaOF9sOjhCNoPig2cvwu/rWqH/Czwy3GL
	a2Kdziz/HvVGzd46oBHE98GfZXWGO7+z7WX9QOttWYwRsOzhTrLk7eSMDoGJSyDVQEcGrnQWxRFb1
	PdRnKPGEn2VFD0OW0NQLhGWK7SKh5pdA/4H5kNO0vXdiZt2Rygg0y5gDqdI7WtYrV9gQFNx3gbFgY
	VR3xas8rAoq+oKE91mop7ydByUEp+v9NGtfKUDqqymLj5t3Cl98thDZor/ifIwyyJPayx9480ly9f
	vOq3RVng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvacJ-0000000GrHM-05zj;
	Mon, 08 Sep 2025 12:05:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvYuo-0000000GJNF-1Zmr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 10:16:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 87E621692;
	Mon,  8 Sep 2025 03:15:52 -0700 (PDT)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6EE433F66E;
	Mon,  8 Sep 2025 03:15:59 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: Cristian Marussi <cristian.marussi@arm.com>,
	Peng Fan <peng.fan@nxp.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_scmi: Fix typo for scmi_perf_proto_ops
Date: Mon,  8 Sep 2025 11:15:56 +0100
Message-Id: <175732651445.3916791.4020244491858368527.b4-ty@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250831-scmi-cpufreq-v1-1-493031cf6e9b@nxp.com>
References: <20250831-scmi-cpufreq-v1-1-493031cf6e9b@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_031602_457623_681D2F12 
X-CRM114-Status: UNSURE (   6.09  )
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

On Sun, 31 Aug 2025 14:52:37 +0800, Peng Fan wrote:
> The name is power_scale_get, not power_scale_mw_get, correct it.
>

Applied to sudeep.holla/linux (for-next/scmi/updates), thanks!

[1/1] firmware: arm_scmi: Fix typo for scmi_perf_proto_ops
      https://git.kernel.org/sudeep.holla/c/72ca981dba5e
--
Regards,
Sudeep


