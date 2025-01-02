Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34D82E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 15:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MvUniu+rC/LY0sL67Gl27jE4Ox+C5ypY4CP7Iiv+jXk=; b=KZCxwHSNH3Nb/NBnht8rSRcljB
	C6ZJncTFaRUfoe+SVc4D8HkD+zhLvU71DZ9plCBzYzFC9pnF7xCcPPlcFOliXEM7CVA0D59kooo9R
	Cp9gO/HZMSFBqDWXetLU6fig30H0uoQeDnbmWQ/c/VuUWx2VE7ZKUDkAAp7M6eTpEnteUT5c3wQGI
	6VdEVNHaRavs2LrUDlMJ8b35t34c4EkvOTvLONoBvryHMj8rfZcxJzfJDMACpTkeooKz2NxVZDCpK
	mbuy03D+cPyDW7Y96R3LfHAzRwavIw6//DXqe3eOUrBix3e4Nzld1wl7Wf8BP8R6Fdg1xE2/qjEJe
	Nlcie3qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTNGz-0000000AinP-1pwb;
	Thu, 02 Jan 2025 15:38:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTNEy-0000000AiTP-3Qrt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 15:36:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 84CBA11FB;
	Thu,  2 Jan 2025 07:36:30 -0800 (PST)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6CC063F59E;
	Thu,  2 Jan 2025 07:36:01 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH] firmware: arm_scmi: Allow transport properties for multiple instances
Date: Thu,  2 Jan 2025 15:35:45 +0000
Message-Id: <173583209672.2166569.10777451109101759232.b4-ty@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241203193544.3895173-1-cristian.marussi@arm.com>
References: <20241203193544.3895173-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_073604_942408_283EEA9B 
X-CRM114-Status: UNSURE (   6.38  )
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

On Tue, 03 Dec 2024 19:35:44 +0000, Cristian Marussi wrote:
> Default SCMI transport properties values can be overridden with devicetree
> provided descriptors; in order to support multiple SCMI instances, make the
> properties-update happen on a per-instance copy of the original transport
> descriptor.

Applied to sudeep.holla/linux (for-next/scmi/updates), thanks!

[1/1] firmware: arm_scmi: Allow transport properties for multiple instances
      https://git.kernel.org/sudeep.holla/c/e501bfde6558
--
Regards,
Sudeep


