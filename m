Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19544CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 14:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RlgkNdnWQ5dTMluE1r0no4k85o7lN8vC1qiDzEi0o1o=; b=UbmOmBVUXrxLUBiLLmyygWOORH
	geT+z1gcGJgkfW9Q3vpKIdhVdn6dydYn7oo3d4v0Xq6OhecLCWL5TVkBtEqvovrUnA9IRm+a5Dsjb
	5JjLdJ6dm+ZNoDgjlINinmT6tY0Bv0YAgdNSzRoXsoEn33VZdlFpZZ6S7F4MCSVVuxN0DF/GDdpmM
	+0sxOOREPeF/ahz7vwm3L31atTzeumONyNBlWTVhLXE+T1Xxq2kpS9XOC/dfeDij4TCOsGd2hO39E
	2i/1GcTOBfowycEufexdTHyJ/OBwIwiydJLfotnGrEoN4+vnrbN3GHpvaIHgomjfKr7oJtDMgltBF
	OWYKZYMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyAZd-00000004nA8-0ctz;
	Mon, 15 Sep 2025 14:52:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyAZa-00000004n8Y-1Lef
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 14:52:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D5CCC402EA;
	Mon, 15 Sep 2025 14:52:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86E63C4CEF1;
	Mon, 15 Sep 2025 14:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757947973;
	bh=RlgkNdnWQ5dTMluE1r0no4k85o7lN8vC1qiDzEi0o1o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FqXeQ9/qGMI3Xz8b/u13HhaAN30nR3xuJgGTTixqhp3D8kOkTbPhDQ0eAkP2tpKdO
	 VG1V3FMAvMrME64Dwpm0REXMmZVRGLdeMfrBrtTD9PW8tt4T64JlHtl08Q0s95xpSp
	 OOTrOKCMfiru9V78lj/zyVjLhjq49sukE654Q2UcDx+4SsLCLua3mLsVd//P2fOEMT
	 faryL7F97MuR9JJO6b4QrlI1vxbNwT/Ajuo1jVMmufOqBVJNNoSR8vPw3kkUAlc9Le
	 fud8gm6CdbgCD4H4zdIpa57utEou+HsfskAO9ETfJpaLhf23OJHbR47Hzh63kspoCx
	 tOraXDjDEu3YQ==
Date: Mon, 15 Sep 2025 15:52:46 +0100
From: Daniel Thompson <danielt@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: lee@kernel.org, jingoohan1@gmail.com, neil.armstrong@linaro.org,
	jessica.zhang@oss.qualcomm.com, deller@gmx.de,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	airlied@gmail.com, simona@ffwll.ch, fnkl.kernel@gmail.com,
	j@jannau.net, hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
	sven@kernel.org, alyssa@rosenzweig.io, neal@gompa.dev,
	support.opensource@diasemi.com, duje.mihanovic@skole.hr,
	dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
	platform-driver-x86@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v2 12/15] backlight: led_bl: Include <linux/of.h>
Message-ID: <aMgoPjEoogukj9uj@aspen.lan>
References: <20250715122643.137027-1-tzimmermann@suse.de>
 <20250715122643.137027-13-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250715122643.137027-13-tzimmermann@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_075254_377289_666F1695 
X-CRM114-Status: UNSURE (   7.44  )
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

On Tue, Jul 15, 2025 at 02:24:49PM +0200, Thomas Zimmermann wrote:
> Include <linux/of.h> to declare struct of_count_phandle_with_args().
> Avoids dependency on backlight header to include it.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>


Daniel.

