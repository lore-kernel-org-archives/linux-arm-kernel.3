Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 674D8E64A85
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 12:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ff/Upt7A+Is7n/DdVWS7epXpf+qt1hVgVSgMPgn/0iM=; b=WyvQwUqFGGtyfJQqsZgigGDzi3
	080v5BWJKsvfBQiTCDGygYtrwD4yuBtwWIdaFxaVj7nHcqLVqcrQb16EczGOnDbj9eOltjiwzpq+I
	/37qyWE/NQgFTG1/ziw6MgCRjPj45eEEWAwlmCrF4M5cVdLBgU2V2P6PSLuDgtZvYzA5vGPhOL4py
	nFAnVk/sBm6sp0GEAGXKMyqIeDjon/znOkMPj0ZN946LdeEuexWONaYPVXLyTZ6hOadOxXo3bAPX9
	7S56Vhw7VqL9szYbZ6VcUBN6cC0SLsUsADJ4xpNcWMVQfGDf3WoerEI3I0Fo2H9ahr0Padq3KYqx2
	o/htdDQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIRxd-00000009QA5-1FiZ;
	Tue, 03 Dec 2024 12:25:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIRnN-00000009Nr2-3A3R
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 12:14:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4EBABFEC;
	Tue,  3 Dec 2024 04:14:53 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 946363F58B;
	Tue,  3 Dec 2024 04:14:24 -0800 (PST)
Date: Tue, 3 Dec 2024 12:14:22 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH 2/3] arm_ffa.h: add properties bit related direct msg
 version 2
Message-ID: <Z072HgItfbrUl9K2@bogus>
References: <20241125095251.366866-1-yeoreum.yun@arm.com>
 <20241125095251.366866-3-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241125095251.366866-3-yeoreum.yun@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_041425_833596_8845ED48 
X-CRM114-Status: UNSURE (   8.60  )
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

On Mon, Nov 25, 2024 at 09:52:50AM +0000, Yeoreum Yun wrote:
> From: Levi Yun <yeoreum.yun@arm.com>
> 
> According to FF-A specificaiton [0], There are flags to be used to
> check whether partition supports send/receive direct msg version 2.
> 
> Add related flags.
>

I will delay this to next release, this is not a fix.

-- 
Regards,
Sudeep

