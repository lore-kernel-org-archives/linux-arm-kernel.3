Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10A2ACD6E79
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 20:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gYLwgvNKXvDRPWw4zKqfVx/zhaITaNpCLoO94wyVGuQ=; b=PHwknVLTTV9RllB3yBzBSMH+fs
	KmCElrfDOdzKymaOBKDsV3/O7ZGaqpds/LVPiqO72wRNd2rPhB70GCfAUSpUrOAxVglm4ac+ool8r
	YFt56J91pYk9ojMgRabbaATfBjYWvDAuVEmK6XfX5WwHIesKLvTNZmLLUf3bKoUzAsZHh1Lt8r/L2
	hzY5NY7dChe5TJDGLbuuewUPVClrSDzDzpOz99idpjLhSAluADQjXgoAOrzwzisG8l/v7fShGID+b
	eO82TRnMJJs9o9I7qTy0tTgzO4gl56Gcqyg7TfoDWaWH4xonhf8kcYC/uoyBYXKWTPL2TlSe9kDOp
	q4UGHRTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWgPs-00000004Ltg-47ra;
	Mon, 08 Jun 2026 20:17:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWgPr-00000004LtV-0kKp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 20:17:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 50A6660098;
	Mon,  8 Jun 2026 20:17:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67A181F00893;
	Mon,  8 Jun 2026 20:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1780949866;
	bh=gYLwgvNKXvDRPWw4zKqfVx/zhaITaNpCLoO94wyVGuQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LRNPdm4pPONzaeTTJ6BY/e3B7ekZnIkbBl4TuWiTJDr0R+TPNZ1lmyrIcVzEGs7TU
	 cuvoP7Ezf2d9IMEWyPDmeeOUF68jKfr7ktB08BjX/jjEGzvgwqt75LILiE1PNwdn9F
	 1o+gbCaMck8fpWJl1axtEwiZzdx2jAEb9+ITEnYU=
Date: Mon, 8 Jun 2026 21:37:02 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
	james.clark@linaro.org, leo.yan@linux.dev, mike.leach@arm.com
Subject: Re: [GIT PULL] coresight: Updates for Linux v7.2
Message-ID: <2026060854-backstab-earlobe-b1c2@gregkh>
References: <20260608125424.283998-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260608125424.283998-1-suzuki.poulose@arm.com>
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

On Mon, Jun 08, 2026 at 01:54:24PM +0100, Suzuki K Poulose wrote:
> Hi Greg
> 
> Please find the updates for CoreSight self hosted tracing subsystem targeting
> Linux v7.2
> 
> Kindly pull,
> 
> Suzuki
> 
> ---
> 
> 
> The following changes since commit 7fd2df204f342fc17d1a0bfcd474b24232fb0f32:
> 
>   Linux 7.1-rc2 (2026-05-03 14:21:25 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/coresight/linux.git tags/coresight-next-v7.2

Pulled and pushed out, thanks.

greg k-h

