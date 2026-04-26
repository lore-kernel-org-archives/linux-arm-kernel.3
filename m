Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13966FF885E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Apr 2026 08:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zRwWsMDd5Kf2yQpedEA3Ka2dLpgNvYvwuOL0uYq4mxY=; b=WdKz+iXZHOfOcGTHQ5G9pxOwgH
	FuEO69QNaPA5Z8ytJW8IdGImpxTouNi72DDnRLJmDWqE5D5EjhGf+AooZpamNB3r6L7Avp9YolOU2
	hk/70fAYSjfL3bLKQlCJnwdH10swpg5rQUR3zq2iqziVaH697gOBy6Q9DR+9m+wZfxbVuaktySjSf
	xAsZizoMV59jmgPMj+BlZ07KHtmMUf4oShS+Q/avcMFlLZJyRbvPOAqWHbvSKUZBrxOgb9bFLNSQ6
	Cn/mg4VmjGUre9ydog5xHuw5WjUh8Cpb2JUe5dsbP0YtB5rISkcdbPSrVe770ybv82pVzVloCFsp6
	YxKVMG9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGuUW-0000000FLjD-2gq3;
	Sun, 26 Apr 2026 08:05:24 +0000
Received: from mail-4318.protonmail.ch ([185.70.43.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGuUU-0000000FLis-2tVF
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Apr 2026 08:05:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
	s=protonmail; t=1777190719; x=1777449919;
	bh=zRwWsMDd5Kf2yQpedEA3Ka2dLpgNvYvwuOL0uYq4mxY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=WMXgWCqCJ/7Xb48ijUqafvDUBgCd0z86K+APwniTvg1Cg0LrUx9+PScwMBpeP4uxa
	 jWzwDXkpX3JyrZaCoJj9G7wWJPRZ2gLOSRCogXqgzc7GYa3sBVlDTKAlynJF38vwnf
	 gekbodsxtch7KKoUGL51nQiSGwgYL0GBvFlK/ihctE3HLuLrtb7NHp+9hXnKn6zBZn
	 Vl6MQCA0suTId3Wh0lx0n92lLIUN77fS/g9KXTdkMy8K4xtOHfjZHhYI4NvoDpBMPn
	 TQoVprL3rNjA8YG+P6gn5EZYKxJrUhFlqQ2rMfQs4VhoAXIq2jmPf7mzX0wE4ztCUf
	 JETR39HCq9rVw==
Date: Sun, 26 Apr 2026 08:05:15 +0000
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
From: Simon Ser <contact@emersion.fr>
Cc: Vishal Sagar <vishal.sagar@amd.com>, Anatoliy Klymenko <anatoliy.klymenko@amd.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Michal Simek <michal.simek@amd.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Geert Uytterhoeven <geert@linux-m68k.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [PATCH v10 05/11] drm/fourcc: Add DRM_FORMAT_T430
Message-ID: <VA0NYRaJ0iQ1QCxWnRFLMh9x3Jf757mXB8N44Yi4hohJxGjMe34UHsDdxUpMSkLyKhzBlXY7uj4fIkd9FE1VBd3ZC0DKdkJpPaN7A_-2z4w=@emersion.fr>
In-Reply-To: <20260423-xilinx-formats-v10-5-c690c2b8ea89@ideasonboard.com>
References: <20260423-xilinx-formats-v10-0-c690c2b8ea89@ideasonboard.com> <20260423-xilinx-formats-v10-5-c690c2b8ea89@ideasonboard.com>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: d0e099f4c50983dac4eec8186294db13ed8244c6
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_010522_867922_4D8D1A75 
X-CRM114-Status: UNSURE (   2.49  )
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

