Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 845D5C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 07:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=owIGpNBE0f+3opMEaSi1ARrm2VRHzZIkFS2Hdo8xNPs=; b=lk7059XZL0lNGs91LU3aMStp18
	YPx99Mmvb1LNhcqTeHhvusy9HwrjAZ1Uz6P3QZMxWmu5UcWlTq+qK+gFqAuGPkFRkFofzFNLkKYEH
	Z4g0BdJ4X5IPU5l4XkaWgu0o4fST9z+RfEB0cQz8P3PImXSd95moBOpubusi1Paxv2zEa+qRqRGiC
	b1FGNsHtj6GLIRC+DjBWN7NF9YsNTKyeBrOj1ej81QUT9htRlVpJRfotwkEhxOpO8nU0ymm2x0Hy4
	5sGRQeon493qqES72j8Qtrmlxp4AYx5mRgt0X+Uswm7/tj54z4hCdHPly+N7pktMFax9qSQZ970D9
	E0irqisA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwb9U-00000009GFN-3xfx;
	Wed, 19 Aug 2026 07:56:00 +0000
Received: from www2881.sakura.ne.jp ([49.212.198.91])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwb9S-00000009GE7-1jdw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 07:55:59 +0000
Received: from x1 (KD059132154071.au-net.ne.jp [59.132.154.71])
	(authenticated bits=0)
	by www2881.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 67J7tPHY079161
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 19 Aug 2026 16:55:26 +0900 (JST)
	(envelope-from kohei@enjuk.jp)
DKIM-Signature: a=rsa-sha256; bh=owIGpNBE0f+3opMEaSi1ARrm2VRHzZIkFS2Hdo8xNPs=;
        c=relaxed/relaxed; d=enjuk.jp;
        h=From:Message-ID:To:Subject:Date;
        s=rs20251215; t=1787126127; v=1;
        b=KbHCSHSOSHC4FlZVDv73c2vawGAtjjAnC2BKhxTZBOq8rkQH2k6G6eL+WWKilBwz
         UmEJqkODyrRSpdN4yOzQfleB5f6wMwbfllh5tTSBb11Is5Hk/TyD5STKW8IyQxDg
         VsOugZ+k5JKj+ETQOUz92sLp8tmRBNbKAjS4MjK3fa8C1r3QAInzSLy1eb/4CV4m
         g5HqK+MDW/FyTmHtlFFYT3bUWne+apZ1JmfYE/9gaPzafrM2OboAMdpRs/TwUNdj
         cL2SKTRxgANRc3j2TryR/1x/gek6ot5xuXa1W9/GCJlAaL8tzFRzOvypllD4KXLg
         tiKmiFuXY7+gnBTkM/p+BA==
Date: Wed, 19 Aug 2026 16:55:23 +0900
From: Kohei Enju <kohei@enjuk.jp>
To: Li Jun <lijun01@kylinos.cn>
Cc: sudeep.holla@kernel.org, cristian.marussi@arm.com,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] firmware: arm_scmi: pm: use SIMPLE_DEV_PM_OPS for pm
 struct
Message-ID: <aoVgAv8iNxPmWsUw@x1>
References: <20260819061530.2391788-1-lijun01@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260819061530.2391788-1-lijun01@kylinos.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_005558_689702_B081629F 
X-CRM114-Status: UNSURE (   6.50  )
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

On 08/19 14:15, Li Jun wrote:
> use SIMPLE_DEV_PM_OPS for scmi_dev_pm_ops,and add the value of
> .freeze .thaw .poweroff .restore.if these address are null, may cause
> error in s4.

Could you elaborate on the S4 error you observed?

Also, the concerns raised by Sashiko look valid to me.

