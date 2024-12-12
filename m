Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1068E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 17:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dltLruqP7O5bmKoDlnWyULqyvxpgOdBkI6FxBkRrfss=; b=wedJ2Eqj5KFlTviRGuE2BBEUfH
	MGTi35ig8Je8ebPd3GK5NkboReSdHnro0mq4ydfVbFAXIRKjNZL+K8YYfCXi8ykp/2wGcanC+7gk1
	t7DzZHUQB+mVJxypB+MR0vq4HyS43Y17xZtAbX++Edik90kbuHC9pbLWveLYXx8LZws4b/ENg6CQQ
	ssdH+jWp0+Ch2+ktM5FZ6zJrifO6akahXvMcKA4yNG1EwzNre16PhEoP25Yvmqrj5+spJ5eDzQ7Zt
	WJotzE1salnWWOzgBNyFAqJ1IEQwTi1DG6kVPAsz2taA2O/K0pJWuEJOgSk0kUh6GIxTUTF+HqnAM
	ewRKFObA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLn0x-00000001Bkk-1l1e;
	Thu, 12 Dec 2024 17:30:15 +0000
Received: from mail.8bytes.org ([85.214.250.239])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLm0z-00000000yAO-1Qol
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 16:26:14 +0000
Received: from 8bytes.org (p54921e31.dip0.t-ipconnect.de [84.146.30.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id E58F92C1F60;
	Thu, 12 Dec 2024 17:26:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1734020767;
	bh=Xp5JrddSBs5Q+K9hrJ7xzi5PnxULx5JCdXJ4Nwg/nMw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mFBkNUV5Ee8Dn1kQuqvi5q/23w+2frZIxInZl3Wp60aLDYi43ybQiSCM06z8nhxXT
	 ozJT+ZhUe31o3XKO74gSWIigQZPZiK5zzCvHAe0n4cAzYFIKMRgkr50j8sKMI9CNy2
	 ih9fANumpq/3yFVgqs/KoOjvQc0Qp25PKDFva9LSsQ7jrV+ogmgEaRt7huUo2RRKei
	 x11ZUVEf5RlfT1Bo8tv1S13WTTmicHBHl8yinPsYKwKY96AvcS3SEIGGlUzZ9EMbTG
	 v4gdsY7BCLnv1f5hhI70pzAPnFYikPUtJ9PCl/CrJgCg4Kasdi4yL8FO+XftDb/9xg
	 Wj0H7MhxXjWGA==
Date: Thu, 12 Dec 2024 17:26:05 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Will Deacon <will@kernel.org>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, robin.murphy@arm.com,
	kernel-team@android.com
Subject: Re: [GIT PULL] iommu/arm-smmu: Fix for 6.13-rc
Message-ID: <Z1sOndzI5_VxdxXe@8bytes.org>
References: <20241212095025.GA18975@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241212095025.GA18975@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_082613_592461_5A8D2150 
X-CRM114-Status: UNSURE (   5.92  )
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

On Thu, Dec 12, 2024 at 09:50:26AM +0000, Will Deacon wrote:
>   git://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git tags/arm-smmu-fixes

Pulled, thanks Will.

