Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07E9DFF885E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Apr 2026 08:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zRwWsMDd5Kf2yQpedEA3Ka2dLpgNvYvwuOL0uYq4mxY=; b=FwRvYeSBrpunDOIElTtmk3ooct
	80oBVD5yi3ImBjB4q7VT2Clejq/rUIpc9NU7a9XXw3ug0//vAKPWWe0S0z+3xBJkwcVYZqh7Zf/sk
	nPoLBvKksC4bolB9qqf3sK3dZFhYdgwO2CGe8f0IXAfP0KL4agaRlyDxuX/hpW8srKfTjmeBmtItk
	e9Mi3zHi8vc70q7F5pM4zPl60ogIf0F6+MPMYRiIlYeMNsTfpZN6V09IDhPZ2HTF/5l8n1m4DUay/
	YnY1o+1MMjAi213NEdM79SZmQcTVxpuoRkHT7ipe+OR/Cg8BKlX8RzP4Jk1gs01NV0081bWYGHwGo
	zAt0ivDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGuTF-0000000FLcy-1Asp;
	Sun, 26 Apr 2026 08:04:05 +0000
Received: from mail-24420.protonmail.ch ([109.224.244.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGuTC-0000000FLcf-0Pk4
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Apr 2026 08:04:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
	s=protonmail; t=1777190634; x=1777449834;
	bh=zRwWsMDd5Kf2yQpedEA3Ka2dLpgNvYvwuOL0uYq4mxY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=YfOBMiBlFqzHGJOjxlAZfJhM+LlwPeWbFI+h5WCdwdS1k7/MASQnDqX8/SS1YHOaa
	 h80SHYXVEqXWZxorhHVNKVHdYDQHBxWoGnA74lwsuiWe+lfO2NCJbUbdY7agFETMTP
	 NMmF6TCq4s6mLIyM0wUaUAD+VD5FX8C7TGymRy51xnIL3dPe0DJmFsnM8EmOoJNQUk
	 +IO1sj6l59CGFQ+5iy0ww+9ZlEIHpF6qFrwrJoAInWavBXj58+vLkDu55yKn7QEeo/
	 zdga0JorVh7T6+XuuI9BAofYT8A3fHdq8uoOJ1+aLya5BS44H8NUDULp3Vk2ueQkE7
	 pXF5JgTbW2i4g==
Date: Sun, 26 Apr 2026 08:03:50 +0000
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
From: Simon Ser <contact@emersion.fr>
Cc: Vishal Sagar <vishal.sagar@amd.com>, Anatoliy Klymenko <anatoliy.klymenko@amd.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Michal Simek <michal.simek@amd.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Geert Uytterhoeven <geert@linux-m68k.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Pekka Paalanen <ppaalanen@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v10 02/11] drm/fourcc: Add DRM_FORMAT_P230
Message-ID: <H2QJo49vDTIzQ-lKh3Prc1kUpAWzNfr94nyTapbtaxd1oSirvSvG-zD-p5HNHTgNIyWfZ78l00aWG6mPvjPpe48LEvfR8FiIZ1nNqLt_X5Q=@emersion.fr>
In-Reply-To: <20260423-xilinx-formats-v10-2-c690c2b8ea89@ideasonboard.com>
References: <20260423-xilinx-formats-v10-0-c690c2b8ea89@ideasonboard.com> <20260423-xilinx-formats-v10-2-c690c2b8ea89@ideasonboard.com>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: 1c1ebaad32201e7919aaf83f655aa205358a19bd
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_010402_928193_8DFCE131 
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

