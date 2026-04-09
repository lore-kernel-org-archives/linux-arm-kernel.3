Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A8DCE9DE59
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 07:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5RvqEABb/R4d69OWzl8SOspPp4AZhhjnkLdrc56n6n0=; b=yXT8XsBt8g7Cv6UwU6hOb0x5lJ
	I5Yt73PAiejH53m1c9QtrGPb0ODcCKdZF1IqTN3ptcS8HcETxw2FiD6nTOW/DlJxhLxKT8H+vIn3c
	bKZnsk79c9r9y/9aE+0O6zPyLk2WJylpFCXVO+KOqgXtqQXrazOjm80+tTm98jfGgL5ZTEMMP/K+g
	Q6EiNury0irj/CsVC78aCULvUAUK92OdALjjnyecZbt/pvx8JLj0lMMT/zCfQQcGiwHiKniUg5y9X
	HBd9QCkcJI9fShBEizAwM7YHJk5DGYubdbltJ0PM8dQBehySPYfKchwkQm/sUGPGAL/o2i6PUM+y/
	TDPqXPrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAjiw-00000009psj-1Rs3;
	Thu, 09 Apr 2026 07:22:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAjiu-00000009psK-0Bmq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 07:22:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CA61F43BEE;
	Thu,  9 Apr 2026 07:22:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D861C4CEF7;
	Thu,  9 Apr 2026 07:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775719362;
	bh=MQb1+Jz5y5Ig3kVCSoDtWT7H8WWW5yDB7zkk7JBDwUo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q1zsWJxfTZ2UnakZqhLAUyGulBFoxIdQL5WsCy7JJ9x9ln76eAcO/oj/qEr0XA6Fs
	 r7wo4DK2J+MQOU5xJFC/Uyg2UiWZX67nRkknM5ozxrIc/i2C0tY9gLYqweQVTpVNQm
	 cJ+rGtPfscredyl00ZcxaB2WtkYUFLFFGcacG0jw=
Date: Thu, 9 Apr 2026 09:21:45 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: leo.yan@linux.dev, mike.leach@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	james.clark@linaro.org
Subject: Re: [GIT PULL] coresight: Updates for Linux v7.1
Message-ID: <2026040937-starboard-circling-cff9@gregkh>
References: <20260408213248.3825788-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260408213248.3825788-1-suzuki.poulose@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_002244_121171_6354B171 
X-CRM114-Status: UNSURE (   8.92  )
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

On Wed, Apr 08, 2026 at 10:32:48PM +0100, Suzuki K Poulose wrote:
> Hi Greg
> 
> Please find the updates for CoreSight self-hosted tracing subsystem targeting
> v7.1
> 
> Kindly pull,
> 
> Suzuki
> 
> 
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/coresight/linux.git tags/coresight-next-v7.1

Pulled and pushed out, thanks.

greg k-h

