Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D625CD6E56
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 09:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j2ClisWBsJN6oKxDvmkUZLOrb+GmAmbBsM5VjRJdbOA=; b=g15UN4E16PJwwuMtXQJFbPmMAc
	jp6UZEk5HnoMDsJenaasMuvLssl+uKBYTH8TDb7Lb6r1gUSmSFurYvjcwsYQX5jvASk7QC9t+aDhs
	az/FDeQt4nqzucNYtv5JANEH32JCW4bFQFN2iiTKs4xGf+4vfYuCdO1YgoJ1mFZrUoOWVlXXAcQP3
	aJz0rcIlLFNepmP2VwpySXQyrDuT2fejekSQdo/bFZwQB9TMkLR/t7GUXMP55L02LA3uW1Dcl5OOd
	JEq60dmoya0i7EnCvVof9JrKpvp7wVdYag+TXFcwYfR0W45kycJLGUwa90UUxRO++Ycsec/ntyJkk
	JjIMXovQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTz9f-0000000AVb3-2AK0;
	Mon, 01 Jun 2026 09:41:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTz9d-0000000AVab-3AyD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 09:41:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EF36E60018;
	Mon,  1 Jun 2026 09:41:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92B3E1F00893;
	Mon,  1 Jun 2026 09:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780306912;
	bh=j2ClisWBsJN6oKxDvmkUZLOrb+GmAmbBsM5VjRJdbOA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SA5wPr46OGRYVU+kDH9qwBFg/rH4gpCroiTWSeihbgTsuiEU4R0aTcKGgJb2UxR71
	 RRTZ96wWYy9zCNz0SMguYXIk0LmUcLFe1Am1SF4rLSyLgcRCbyAxod/GRglg/U/Ob7
	 W8CrpfR0jZbavsbOPYvjRMqWiDCdPbOgXntIsRDmF1fzGBX8ASon3dbvd7AEaf2P3i
	 X/b8IHYaMBfxN0cawKhFmOhOfdoFP8OdjO98cKzLuW6zU63M3UMyIyaGJurgctSlpR
	 R+pcucpFws+jFAOxlhV/3E0BTULsjQtSpaLW3GdTm1+uJ5CuI3Hudcsli3dzr5Et/g
	 J4OlVt091aVpg==
Date: Mon, 1 Jun 2026 10:41:49 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Gyokhan Kochmarla <gyokhan@amazon.de>
Cc: stable@vger.kernel.org, gregkh@linuxfoundation.org,
	Sudeep Holla <sudeep.holla@kernel.org>, sebastianene@google.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: firmware: arm_ffa: Align RxTx buffer size before mapping
Message-ID: <20260601-spicy-weightless-chachalaca-a2aceb@sudeepholla>
References: <20260601092918.11031-1-gyokhan@amazon.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601092918.11031-1-gyokhan@amazon.de>
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

On Mon, Jun 01, 2026 at 09:29:18AM +0000, Gyokhan Kochmarla wrote:
> From: Sudeep Holla <sudeep.holla@kernel.org>
> 
> commit 0399e3f872ca3d78044bb715a73ea645806d2c7b upstream.
> 
> Commit 83210251fd70 ("firmware: arm_ffa: Use the correct buffer size during
> RXTX_MAP") advertises PAGE_ALIGN(rxtx_bufsz) to firmware when mapping the
> buffers but the driver continues to stores the minimum FF-A buffer size
> in drv_info->rxtx_bufsz which is used elsewhere in the driver.
> 
> Align the size before storing it so that the allocation, validation and
> FFA_RXTX_MAP all use the same buffer size.
> 
> Fixes: 83210251fd70 ("firmware: arm_ffa: Use the correct buffer size during RXTX_MAP")

Because of the fixes tag, it was already backported/queued to v7.0, v6.18
and v6.12. May I ask what was the intention of posting ?

-- 
Regards,
Sudeep

