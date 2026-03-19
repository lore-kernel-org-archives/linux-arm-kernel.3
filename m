Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B944D109023F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 15:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zRwWsMDd5Kf2yQpedEA3Ka2dLpgNvYvwuOL0uYq4mxY=; b=46mzbhuSBGqQTMdsTlb+DWJP30
	4yhMaBG0gArdu6dky5nb9CWmwyR0uWax7g2dMULvI/K73D2TDBPaMuQhwIbmJyQnCzW0jZj81BYRk
	8ucj9UZKgHTFC5hOzKpZC3ysadcrb3dcrKmWDn1CGMHstsRql30br6UXyNP2/ZLY8gh/KnFE6WM0+
	pkNoRMWcqg9pEWgChVhsXYX37TM5IxDcYGIx6fvwzwfexg4o7Y/+EHLN/608ikGN/zd2aN5eMD55p
	UWwidIOEj+MySYW8w5hDlR4iB17irgXNU9qeOU8sxBv2jt8KcvNAhRF4g+FasrNZApE7yf+/Bm31a
	Hz3opO0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3FC7-0000000AuFU-0iL4;
	Thu, 19 Mar 2026 15:21:55 +0000
Received: from mail-24420.protonmail.ch ([109.224.244.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3FC4-0000000AuEX-274A
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 15:21:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
	s=protonmail; t=1773933707; x=1774192907;
	bh=zRwWsMDd5Kf2yQpedEA3Ka2dLpgNvYvwuOL0uYq4mxY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=lpLs5MoWSLMPshfY8mDWAAtuWnhNjAJLnbOUvpaCs+fa4brd+62ef5oQPbCofQ+P8
	 JDztgoo1HuT+ZUAgQN8yDEBpw9aL68mIeonYtUb2P7hQH9zivCmtUDiYrT0Fa/WprX
	 3hQBisrnoO7gx3I8R+kjNK7+YBOO641WYa2DklXTvAe5URhWzaE6gW2W9i7eCIOOHr
	 XLm+yALzmVm9JgpEQhGX8qdFaYgM0Jpkt/pLv7JQN+vWlUnMzZL2ah0Qf1ugdVO+yi
	 U3IuSWbLytJkDbuBnrcgjUUXdJSaymh5wnokULcMs+2iiC2WfgX+aOEk27tP2e5bGz
	 lrVkcNE38rhtA==
Date: Thu, 19 Mar 2026 15:21:43 +0000
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
From: Simon Ser <contact@emersion.fr>
Cc: Vishal Sagar <vishal.sagar@amd.com>, Anatoliy Klymenko <anatoliy.klymenko@amd.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Michal Simek <michal.simek@amd.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Geert Uytterhoeven <geert@linux-m68k.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [PATCH v8 06/11] drm/fourcc: Add DRM_FORMAT_XVUY2101010
Message-ID: <ylgbwImdBAhbbTKiTvS6-hmqPs0kxSFTB5bvlM1TzeTCgaJK7AJfdEPJJwaIR7fHdgyOJBmxO_p4cNTfrLXe16Cwj5m2El5e4uog20Qxw8c=@emersion.fr>
In-Reply-To: <20260128-xilinx-formats-v8-6-9ea8adb70269@ideasonboard.com>
References: <20260128-xilinx-formats-v8-0-9ea8adb70269@ideasonboard.com> <20260128-xilinx-formats-v8-6-9ea8adb70269@ideasonboard.com>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: 45e84e170336b2f5386496980d02a320d185e866
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_082153_143177_F11114F6 
X-CRM114-Status: UNSURE (   2.90  )
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

Reviewed-by: Simon Ser <contact@emersion.fr>

