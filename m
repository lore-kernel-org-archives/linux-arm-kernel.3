Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31EE1C5DF85
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 08:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gLcNOWCMOr5tDmMmAR/CIVfLqNQBUcdL8r9yPFgjpKg=; b=jlkfU+8PTyfUe0sIJdr1tp3ufl
	5MuByHLWeuCESz7abk/yZSsU2ff1mpXZnZbqlEFakCjq6oojMWwoCAxjsQTyo7e+A4QPbkutnhjiw
	TUXdl/nmRC/Hup2CVkUE3NukO9C3EA4jpI1ekF5JiG0oorC/m2jmJ2fJMDs4vBVKwEKfABQElhbeh
	6+iOQbPm++VBciw5oRlqqT/Qx4syZzY9L3MwDCM4VL+efHC9wDV1x2Oz09Ce7eTfk6kHIxw8uDh86
	WMaG37d7dUSMsIwGVLd6qVc6s5lkUgpmUtNICX2YOKWk1wKzLauS2JCIx4YerVP0fw+sEesScfyXB
	MG/6onaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwbgW-00000009JS4-0CgX;
	Wed, 19 Aug 2026 08:30:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwbgU-00000009JRx-2UC9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 08:30:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 05A656020E;
	Wed, 19 Aug 2026 08:30:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE1C21F000E9;
	Wed, 19 Aug 2026 08:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1787128204;
	bh=gLcNOWCMOr5tDmMmAR/CIVfLqNQBUcdL8r9yPFgjpKg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=0M1fiIogoFUMYzAdVMsmt9i4lbPYGyIbYxlsjPezL705DyD0DAt8jqcmhV80EL1nW
	 enM/2WgRBrTRSMF6grp6+zwg9IzTvVQgfcUHRqHFCIMimRYX2AsgFQpVMfn1sTA14d
	 X2murec/4mmoxDMO/3fR/3Z9YiD2XkV2bp70jeHM=
Date: Wed, 19 Aug 2026 09:58:26 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	coresight@lists.linaro.org, leo.yan@linux.dev,
	james.clark@linaro.org, mike.leach@arm.com
Subject: Re: [GIT PULL] coresight: Updates for Linux v7.3
Message-ID: <2026081915-cassette-implicate-91a5@gregkh>
References: <20260807230057.119105-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260807230057.119105-1-suzuki.poulose@arm.com>
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

On Sat, Aug 08, 2026 at 12:00:57AM +0100, Suzuki K Poulose wrote:
> Hi Greg
> 
> Please find this pull request for CoreSight subsystem targeting v7.3.
> Almost all of them are fixes to the existing code, along with a MAINTAINERS
> update for HiSilicon PTT driver.
> 
> Kindly pull
> 
> Suzuki
> 
> 
> 
> The following changes since commit 8cdeaa50eae8dad34885515f62559ee83e7e8dda:
> 
>   Linux 7.2-rc2 (2026-07-05 14:44:06 -1000)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/coresight/linux.git tags/coresight-next-v7.3
> 

Sorry for the delay, now pulled and pushed out.

greg k-h

