Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49391CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 16:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j0HI7Qbv4YBpdM0sD1asnKafJxGNS4mdM3vEXgbaErs=; b=49w68u/slxH0w9Vvtu0XWegr78
	fj2lny8AhlKJ22jNi12Bcl7H7LerNn6R764WHW8lCuGpIElU8YwW91NWbRtYjjgt7G02cRlc/5VME
	SagzKcbVeLa0pF0X7oq0+RgVpd7UgpMtmUJyqlRHISMUN5GRMQL5yyU7P+nQpffjJOfjWnxfohSUI
	K7FGsRpKWuC2HWNETEeKf4mph/ZJ1ZPR+bH0l6Wzqha+fny8EepYFhlHo0z9batxN2lfvGmEbBxcN
	CHWa3owWEa4fjlLZoddtOClYHOv21EMwZVBRh3tlDk3JJaR84BiDXDnSaUndl5XHC97MlSw/5es4q
	l+Mkjixw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0jni-0000000B2C3-0qRV;
	Mon, 22 Sep 2025 16:54:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0jnh-0000000B2Bh-12TR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 16:54:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A43B8601AA;
	Mon, 22 Sep 2025 16:54:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14F26C4CEF0;
	Mon, 22 Sep 2025 16:54:02 +0000 (UTC)
Date: Mon, 22 Sep 2025 17:54:00 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: shechenglong <shechenglong@xfusion.com>
Cc: "will@kernel.org" <will@kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	xulei <stone.xulei@xfusion.com>,
	chenjialong <chenjialong@xfusion.com>,
	yuxiating <yuxiating@xfusion.com>
Subject: Re: =?utf-8?B?562U5aSNOiBbUEFUQ0hdIGNwdQ==?= =?utf-8?Q?=3A?= fix
 hard lockup triggered during stress-ng stress testing.
Message-ID: <aNF_KK9sY-a_weH5@arm.com>
References: <20250918064907.1832-1-shechenglong@xfusion.com>
 <aMvsxd8nHb5roC0o@arm.com>
 <2eeb109f50b34e628327972d1af57f5d@xfusion.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2eeb109f50b34e628327972d1af57f5d@xfusion.com>
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

On Fri, Sep 19, 2025 at 12:05:38PM +0000, shechenglong wrote:
> Okay, understood. Thank you! May I ask when the fix/patch is expected
> to be available?

If you send one, that could be really soon ;). See Mark's suggestions
for where to add the pr_info().

-- 
Catalin

