Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EAD0D44D5E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 13:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S/fydsM2O5CxZlPZ86HFX2vV5UFv4fQGWtN0bNA59As=; b=GK4nHN9XmNSxU5Ix666CIwsI+R
	coXoIN4SmhSxjHy5q7ikCiL1pEizGqQqF+FV7Bgm5cq+KU72BUsONVJICPZW2mMdarkTSu5UQvKl/
	681GVWkR+hffwhJlutqnKZi4NaR4wUEN8D8kMpMkBpO5xnovI2O4ed/KxChUu/GLP0tX5LlB4xdJa
	KPTNBq9+KIXUj6bC9T8KY4Hyz0W+UNJrYfZf/Gyv6obkpbdHC+n+yS1ruJbNdMteZ48xK0/LA3y07
	59OXN6Ieqvkdt2KjDbjLJg3GH945dU3qnRCuW98fWz91mjQXVke6JhvmLJKwa+dKfkhqmAqe58TzP
	4Q3T54lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8gDs-00000003RYn-3jn3;
	Wed, 06 Nov 2024 13:37:25 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8fiL-00000003LkC-19nK;
	Wed, 06 Nov 2024 13:04:57 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0B6BA475;
	Wed,  6 Nov 2024 14:04:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1730898275;
	bh=682rZ4W8M3E5mVOEB3/2mrEAAw15OgHnlpXKz526rA0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iF+f2JrOf8LKiTjHV1UChMRbmf6ckq9rA1BPUFp1xg1DRGXF+rkuI5950BTGfwpL+
	 Yu4AWc7mmgpAU2nekPMMSN1CPfv8fof6p/lUxd1J/aU5O1aWQByo6hUgRFK9fVFltt
	 vI+mieU5JY7lKw6pBcmWAlmuai8Wap7Qb23EoTFI=
Date: Wed, 6 Nov 2024 15:04:37 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: CK Hu =?utf-8?B?KOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
Cc: "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
	"christian.koenig@amd.com" <christian.koenig@amd.com>,
	"mchehab@kernel.org" <mchehab@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shu-hsiang Yang =?utf-8?B?KOaliuiIkue/lCk=?= <Shu-hsiang.Yang@mediatek.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"yunkec@chromium.org" <yunkec@chromium.org>,
	"linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	Yaya Chang =?utf-8?B?KOW8tembhea4hSk=?= <Yaya.Chang@mediatek.com>,
	Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	Teddy Chen =?utf-8?B?KOmZs+S5vuWFgyk=?= <Teddy.Chen@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"hidenorik@chromium.org" <hidenorik@chromium.org>,
	Shun-Yi Wang =?utf-8?B?KOeOi+mghuWEhCk=?= <Shun-Yi.Wang@mediatek.com>
Subject: Re: [PATCH v1 10/10] uapi: linux: add mediatek isp_7x camsys user api
Message-ID: <20241106130437.GA16791@pendragon.ideasonboard.com>
References: <20241009111551.27052-1-Shu-hsiang.Yang@mediatek.com>
 <20241009111551.27052-11-Shu-hsiang.Yang@mediatek.com>
 <ff96b314cdd3d52a14a5e91f79ec3097d04c4380.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ff96b314cdd3d52a14a5e91f79ec3097d04c4380.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_050449_461113_166A2D56 
X-CRM114-Status: GOOD (  14.67  )
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

On Mon, Oct 14, 2024 at 05:56:40AM +0000, CK Hu (胡俊光) wrote:
> Hi, Shu-hsiang:
> 
> On Wed, 2024-10-09 at 19:15 +0800, Shu-hsiang Yang wrote:
> > Add UAPI for MediaTek ISP platform, providing user-space
> > interfaces for the new camsys driver.
> > 
> > Signed-off-by: Shu-hsiang Yang <Shu-hsiang.Yang@mediatek.com>
> > ---
> 
> [snip]
> 
> > +
> > +/* MTK ISP camsys controls */
> > +#define V4L2_CID_MTK_CAM_USED_ENGINE_LIMIT	(V4L2_CID_USER_MTK_CAM_BASE + 1)
> > +#define V4L2_CID_MTK_CAM_BIN_LIMIT		(V4L2_CID_USER_MTK_CAM_BASE + 2)
> > +#define V4L2_CID_MTK_CAM_FRZ_LIMIT		(V4L2_CID_USER_MTK_CAM_BASE + 3)
> > +#define V4L2_CID_MTK_CAM_RESOURCE_PLAN_POLICY	(V4L2_CID_USER_MTK_CAM_BASE + 4)
> > +#define V4L2_CID_MTK_CAM_USED_ENGINE		(V4L2_CID_USER_MTK_CAM_BASE + 5)
> > +#define V4L2_CID_MTK_CAM_BIN			(V4L2_CID_USER_MTK_CAM_BASE + 6)
> > +#define V4L2_CID_MTK_CAM_FRZ			(V4L2_CID_USER_MTK_CAM_BASE + 7)
> > +#define V4L2_CID_MTK_CAM_USED_ENGINE_TRY	(V4L2_CID_USER_MTK_CAM_BASE + 8)
> > +#define V4L2_CID_MTK_CAM_BIN_TRY		(V4L2_CID_USER_MTK_CAM_BASE + 9)
> > +#define V4L2_CID_MTK_CAM_FRZ_TRY		(V4L2_CID_USER_MTK_CAM_BASE + 10)
> > +#define V4L2_CID_MTK_CAM_PIXEL_RATE		(V4L2_CID_USER_MTK_CAM_BASE + 11)
> > +#define V4L2_CID_MTK_CAM_FEATURE		(V4L2_CID_USER_MTK_CAM_BASE + 12)
> > +#define V4L2_CID_MTK_CAM_SYNC_ID		(V4L2_CID_USER_MTK_CAM_BASE + 13)
> > +#define V4L2_CID_MTK_CAM_RAW_PATH_SELECT	(V4L2_CID_USER_MTK_CAM_BASE + 14)
> > +#define V4L2_CID_MTK_CAM_HSF_EN			(V4L2_CID_USER_MTK_CAM_BASE + 15)
> > +#define V4L2_CID_MTK_CAM_PDE_INFO		(V4L2_CID_USER_MTK_CAM_BASE + 16)
> > +#define V4L2_CID_MTK_CAM_MSTREAM_EXPOSURE	(V4L2_CID_USER_MTK_CAM_BASE + 17)
> > +#define V4L2_CID_MTK_CAM_RAW_RESOURCE_CALC	(V4L2_CID_USER_MTK_CAM_BASE + 18)
> > +#define V4L2_CID_MTK_CAM_TG_FLASH_CFG		(V4L2_CID_USER_MTK_CAM_BASE + 19)
> > +#define V4L2_CID_MTK_CAM_RAW_RESOURCE_UPDATE	(V4L2_CID_USER_MTK_CAM_BASE + 20)
> > +#define V4L2_CID_MTK_CAM_CAMSYS_HW_MODE		(V4L2_CID_USER_MTK_CAM_BASE + 21)
> > +
> 
> Please give introduction of how to use these user space interface.

I'm very, very *not* thrilled by all this. It looks like a big pile of
hacks really. Every single parameter used by those controls needs to be
clearly documented, including explaining how they are used, in order for
us to review the API. I suspect that many of the parameters should
instead be handled through the ISP parameters buffers, or be controlled
from standard V4L2 APIs.

-- 
Regards,

Laurent Pinchart

