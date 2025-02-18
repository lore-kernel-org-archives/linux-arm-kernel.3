Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3A93C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 13:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1S+sSuWNNmrqRztYrpuEloXYZYpDhHH/xVAXcq4Ir0M=; b=Y4JEveBDrvJX4apjApN4S2P7Yv
	TrPhd3Qyr4AG74o1uRRjIumWjHA8+bLGVNLBgJdunVsSsYa4s1VQAkGwFv6KfU7zneKcItEeOcxZh
	C250vKhsxoTTQHf81bZNh6sgcyvkNjSLPPoxtDKN+9vE0PqqSm3USA+F704+ICgr8RiKWbKjuKGZh
	NMdNK4iXKCHSPDrqgIIhDb7QMDwBfpi9PFcCcdiaIG7wlJao6jHbJKkcqr1QW10/r2Q6OB3OiK+2D
	61eKDamzc1I3k+QtV2D3EMQTDmUubZ9i3dfoqarBJA4kDyDYHOTIWvkuaPFomj9p9PP80Lc1DRQNy
	N6iXq3UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkO7L-00000008PDj-26hu;
	Tue, 18 Feb 2025 13:58:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkO5r-00000008P0g-4AQG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 13:57:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B57D3152B;
	Tue, 18 Feb 2025 05:57:15 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9594C3F6A8;
	Tue, 18 Feb 2025 05:56:55 -0800 (PST)
Date: Tue, 18 Feb 2025 13:56:52 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, linux-pm@vger.kernel.org,
	Sudeep Holla <sudeep.holla@arm.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] MAINTAINERS: Update section for cpuidle-psci
Message-ID: <Z7SRpEE0UFHdSEmR@bogus>
References: <20250217140145.117086-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217140145.117086-1-ulf.hansson@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_055700_072282_021649CB 
X-CRM114-Status: UNSURE (   8.25  )
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

On Mon, Feb 17, 2025 at 03:01:45PM +0100, Ulf Hansson wrote:
> Add myself as a co-maintainer for the cpuidle-psci driver and the
> corresponding git-tree, which I am already using for this.
>
> Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: Sudeep Holla <sudeep.holla@arm.com>

Acked-by: Sudeep Holla <sudeep.holla@arm.com>

--
Regards,
Sudeep

