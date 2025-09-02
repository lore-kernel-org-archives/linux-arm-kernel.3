Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AEC6CA1005
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 15:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WYJ19TsFV+2Qqe9FAZF07Fv9E8KGb0hwWGVoVvOLLcg=; b=NVf6JRu1C0e30B3aEK+v4IQVrR
	RVKovEI5/5F6fu4460tZxxeZeSw6gaSmuJ+hS5LBTEL73xu7HlgJSwe+fzivM4IbaRTp96Bej/XeW
	0Jf+kat1NpLjLfHeP/0ckxch+/KHdCDnCaoLKL1Pe/k7DKtDVI4nRA2WDC45xJeWV/uRm7Cbem7+D
	Aw8z4Y9R4iIPb/Fgw0G3B8akQtfGi6LllR2uluTIckSXv37VTZz3W8nNsf4HC032GiKU8uS5Yc/NU
	fi0LLVIGXwFjtDan077aLjfKKQASUkYLdnIgHIMoXkMds/l1n3Z414bVLhQ2D/Zy2EwAKg2ulnVuH
	kwP+aRXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utT6T-00000000itd-1zTi;
	Tue, 02 Sep 2025 15:39:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utPhD-0000000H5C7-0xPd;
	Tue, 02 Sep 2025 12:01:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9D21941862;
	Tue,  2 Sep 2025 12:01:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9911C4CEF4;
	Tue,  2 Sep 2025 12:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1756814464;
	bh=WYJ19TsFV+2Qqe9FAZF07Fv9E8KGb0hwWGVoVvOLLcg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D6dxhHirthDmmOONEd0DoBqRC7rq8jKelt97VFAbd0Er4DlNAtdmyBdRGOIe6SZ07
	 9UoUAnsnafz4GEokavFcEW5M/7Qpu8MO418TDzZD9XhJ3aNjeb8yOunwlnVBtB5dsd
	 L00zQm2Y6Hw8sZZ+IhYHpdx0/YycZ6QPKhGzKvCY=
Date: Tue, 2 Sep 2025 14:01:01 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
	Mason Chang <mason-cw.chang@mediatek.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Frank Wunderlich <frank-w@public-files.de>,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-stable@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Chad Monroe <chad.monroe@adtran.com>
Subject: Re: [PATCH linux-stable 6.12 0/3] thermal/drivers/mediatek/lvts:
 pick fixes into 6.12 stable tree
Message-ID: <2025090239-gondola-exes-8e13@gregkh>
References: <cover.1756568900.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1756568900.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_050107_283782_1FA97AF6 
X-CRM114-Status: GOOD (  12.09  )
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

On Sat, Aug 30, 2025 at 04:56:46PM +0100, Daniel Golle wrote:
> Temperature readings on the MT7988 are severely abnormal and inaccurate
> on some devices when using the default commands.
> Patches to fix this have been posted and merged for Linux 6.17, however,
> missing a Fixes:-tag they have not been picked into the Linux 6.12 stable
> tree which already comes with the driver support for MT7988 and hence
> suffers from this problem.
> All 3 commits apply cleanly on top of linux-6.12.y, so cherry-pick them
> now, adding the appropriate Fixes:-tag.

They also need to go to 6.16.y as if you upgraded you would have a
regression :(

I'll go queue them up there now as well.

thanks,
greg k-h

