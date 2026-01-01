Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91030EED630
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Jan 2026 17:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ORfvsqx4UE5O1g3UOm82dG8zwfz76Jq06vLhLGSaWT4=; b=oSrnpKI8zBD95LHC1EB29Ow8D/
	o1tJmLR1i1KWiPCyX5cy+pzs7n+AmU+59MJZoGrXqmP7e1NyRPH66HnSLPEnvaa1w1T6fSbqkM0Da
	vDnnB2pv57G8GPhBbzTH5zWMPvwf5c9yKYMOz0wf6hkHGuYVVGQWPOYVtFH1jmnhBkXWrardOrqL6
	0dX/4AbDzxj3o9J6RQPzmLZHB2ISktWjrgiGKgIFwr0AMoKeoNm2XHctj/QYFksHqyQIkIRAw3lRW
	xFMtn2NUmuTZD72A2C/q6ECl28CMbhJwPTI1XtYITPgg8+3LqJDQOqFwxSqvcTrvJepOWp1XscFbK
	nwlW4KIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbMkL-00000007Ozg-2x6Q;
	Thu, 01 Jan 2026 17:46:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbMkJ-00000007OzM-21n8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Jan 2026 17:46:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AE02C497;
	Thu,  1 Jan 2026 09:45:51 -0800 (PST)
Received: from usa.arm.com (e133711.arm.com [10.1.197.51])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 16D633F694;
	Thu,  1 Jan 2026 09:45:57 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH] firmware: arm_ffa: Tie FF-A version checks to specific features
Date: Thu,  1 Jan 2026 17:45:50 +0000
Message-ID: <176728946851.116364.4298369516797239525.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251016094111.946236-1-sudeep.holla@arm.com>
References: <20251016094111.946236-1-sudeep.holla@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260101_094559_584252_C333CA69 
X-CRM114-Status: UNSURE (   6.19  )
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

On Thu, 16 Oct 2025 10:41:11 +0100, Sudeep Holla wrote:
> The FF-A driver currently performs loose comparisons when checking the
> supported FF-A feature, which can inadvertently treat future or
> intermediate revisions as compatible.
> 
> Replace generic `version {>,<} FFA_VERSION_1_*` pattern checks with
> feature-specific macros that clearly express which functionality
> depends on FF-A versioning.
> 
> [...]

Applied to sudeep.holla/linux (for-next/ffa/updates), thanks!

[1/1] firmware: arm_ffa: Tie FF-A version checks to specific features
      https://git.kernel.org/sudeep.holla/c/f183b1dda4fc
--
Regards,
Sudeep


