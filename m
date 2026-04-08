Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8237B10F9964
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 17:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8lD3E5HRMlsQCD5VggpYU550MonPPB+IkA0OZi4jWtI=; b=xc0le0bo4CY7didxb0ByhX9GPE
	Cq1S6vs3R5ooZgVHc2CszPwT3lSfIrm4kHmKz2TffClB8R1tdvxLBGPtY9+M/LaKaotGvB7rsY2V4
	rbkfoR1wcYoaruGLtWiQK4xn0w1nJF8xuX0y7Xu99pMkZT9peh1ElpY8LZTV1EdIAU4ehiVOyi7Ix
	0EkWuWv1RXiOX7X8kR6n6NciZVtd5YSVNTTG2nYjHAHFk9QXH69wY1pYfOKmNzfthXeDcg+hRfa7J
	UvNx5+qozGVLkcO7Q2Fc/q+zq8/PfmaUrOVWjTnQY8Xt4aj4JBj79HZZiWyDy2wcN3pNQrgNC6mB+
	oiNW2/Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAWeM-00000009BFI-1M3N;
	Wed, 08 Apr 2026 17:25:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAWeJ-00000009BEv-0J4R
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 17:25:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 49B8F2D95;
	Wed,  8 Apr 2026 10:24:59 -0700 (PDT)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0D62F3F641;
	Wed,  8 Apr 2026 10:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775669105; bh=PlRA8QfdMUAitutbdSmBZYJ4KOb7Lyoj5je3W40Rf1g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=giFTE8mN0nSUnk3L/Kghd5hCcCRFf7ICkTEYqy4RLQttthDSXVV7LXCDQihrxfr2j
	 9U8ej9kmpzkEC2xuEJWnRu3NTufh6tGa5lYdWF7U7I/DHirnMSGfPTaK/eDxUdqWWM
	 QP5eXyZILG/RZulGqK2AFdecP1icu3bedTpFAODM=
From: Catalin Marinas <catalin.marinas@arm.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Will Deacon <will@kernel.org>,
	Haoyu Lu <hechushiguitu666@gmail.com>
Cc: Len Brown <lenb@kernel.org>,
	Ilkka Koskinen <ilkka@os.amperecomputing.com>,
	Russell King <rmk+kernel@armlinux.org.uk>,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] ACPI: AGDI: fix missing newline in error message
Date: Wed,  8 Apr 2026 18:24:53 +0100
Message-ID: <177566909299.3319453.9218685711243749152.b4-ty@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260407033117.100-1-hechushiguitu666@gmail.com>
References: <20260407033117.100-1-hechushiguitu666@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_102507_262881_85E692A9 
X-CRM114-Status: UNSURE (   7.32  )
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

On Tue, 07 Apr 2026 11:31:15 +0800, Haoyu Lu wrote:
> Add the missing trailing newline to the dev_err() message
> printed when SDEI event registration fails.
> 
> This keeps the error output as a properly terminated log line.

Applied to arm64 (for-next/acpi), thanks!

[1/1] ACPI: AGDI: fix missing newline in error message
      https://git.kernel.org/arm64/c/b178330b67ab

