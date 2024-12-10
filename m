Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7ECCE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 10:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z6kc1AmuuPBpuKgCoagtecYxg4QKghDIy5A/MCAiBj8=; b=cNTwTm9RVjUnA36sq3Q4V3njYb
	okqepK4Ks8R6d8V31EtFyx5LkuvRefVQc8ify1UxPIJVWNMFgzw74qGQIW3dzYNEV75BJK9luM+wW
	SRSyYReE6sz7ZYNqwqLhl8nuR8Sd0trZNdnitreF4kFakIbRONn1HkpZn2So0uc0VJRe3rF+KcTbZ
	9Ga/bzRX8TTcc4n30bCR4zynZBuBE+iYI5LcBJAp/dZ2UedlDM7iNyPdEK8JHu2dSbXM5mjfuUuN4
	WtBN5JuZZyS9PoJpOwoLPgFng/U4Dv+lsRVQ+w7/GPyJ9MZcrqcO1V6xzCc9HtP/TbzxdHLUdsvIG
	tM4tRusg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKxLm-0000000B7S1-0hJs;
	Tue, 10 Dec 2024 10:20:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKxFP-0000000B5iR-16tO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 10:13:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A8F6D113E;
	Tue, 10 Dec 2024 02:14:10 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BF8A73F58B;
	Tue, 10 Dec 2024 02:13:41 -0800 (PST)
Date: Tue, 10 Dec 2024 10:13:39 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: ARM SoC Team <arm@kernel.org>, SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Arnd Bergmann <arnd@kernel.org>, Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL] firmware: arm_ffa: Fixes for v6.13
Message-ID: <Z1gUUz-I3HCQ7rNV@bogus>
References: <20241205114406.708710-1-sudeep.holla@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205114406.708710-1-sudeep.holla@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_021343_344452_A51A7BB1 
X-CRM114-Status: UNSURE (   5.98  )
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

On Thu, Dec 05, 2024 at 11:44:06AM +0000, Sudeep Holla wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 

Ignore this one, update v2 sent [1].

-- 
Regards,
Sudeep

[1] https://lore.kernel.org/all/20241210101113.3232602-1-sudeep.holla@arm.com/

