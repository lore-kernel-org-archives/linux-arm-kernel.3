Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C5A810A62EC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 14:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m+sNoheho1OrFl4QBII3exZTKJg8TKL0T5hDuECTkLo=; b=x0MJBWoTyasUK4Nl80CKxheeS6
	9zRlfzArMcpe65SqOcIi/fmEnUzRBkzZ1vc2gV20ahmFhL9xS5i2nEyus21odrtj+xSsOveh0MEkZ
	CgDFGGBhtIj5H3vZaRiCoKh7NvH5RY5wP+AotIZKRW0EuQXMGhtVTs01zcKiTYBMcNdMm22qWUFxT
	sX6DILhJtpxLhQEf+1X2kdQtquny4S1hIDeV+eY/You3q8oY+ZkplAV33y1rkhXw42VSaqodNx21U
	Yqoq/8Ydl6dmQKWRlAtjlGV15HVlx/BXqLCELILywA875Fh+LOCLv+3UCuuYLJeel9gOC8B74SWqA
	Ag1967xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5lfa-00000005djY-0h83;
	Thu, 26 Mar 2026 14:26:46 +0000
Received: from mail-4323.protonmail.ch ([185.70.43.23])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5lfW-00000005djB-3uIn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 14:26:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
	s=protonmail; t=1774535198; x=1774794398;
	bh=m+sNoheho1OrFl4QBII3exZTKJg8TKL0T5hDuECTkLo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=DoS9cEClyno2/RZIqQZcV5U/T9aKFKlY15dR6v6FQZHcG9zhSQHsehnabaUTGwaAq
	 d9QIqhI5KuvjDX1D1yjAT3tMexeWnm39VNsAOp8ZDZU+e8skfAdGY4AlPjbmtFHDMn
	 Z94mydzAEX40tQmmKY9256ReGEfaZtk90UjabzM8YE+0lKaYcs26akbayYtHC/JPpg
	 Rn6Zr0gbs1ACeh4FIPpq3Hyj8IgBrtkDX9dCR2d+493fuP+CB6y6qP1Tib/3tszJYB
	 5CfcD0xx7LhP6rAn6z9Fd86YPKHnE/bO1hQWrrbPp2n7HtWyET2YfkSJRXAsXNyqj3
	 013jZ0bte9flw==
Date: Thu, 26 Mar 2026 14:26:29 +0000
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
From: Simon Ser <contact@emersion.fr>
Cc: Vishal Sagar <vishal.sagar@amd.com>, Anatoliy Klymenko <anatoliy.klymenko@amd.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Michal Simek <michal.simek@amd.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Geert Uytterhoeven <geert@linux-m68k.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Pekka Paalanen <ppaalanen@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v9 02/11] drm/fourcc: Add DRM_FORMAT_XV20
Message-ID: <aocdbgbLe5WhUEOGeLg3P7fRDM8i72H9zBuUnoAjjsuvBLfMPofrPtaUEjII_43KXf1wCbv1G9UutJKMkWLaEcBSnrlUV78Wrhu6l_Z0xi8=@emersion.fr>
In-Reply-To: <20260325-xilinx-formats-v9-2-d03b7e3752e4@ideasonboard.com>
References: <20260325-xilinx-formats-v9-0-d03b7e3752e4@ideasonboard.com> <20260325-xilinx-formats-v9-2-d03b7e3752e4@ideasonboard.com>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: d647f5d8f1d869e3931ef15cf27673cf762af5d1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_072643_560693_DC9A7267 
X-CRM114-Status: UNSURE (   8.43  )
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

On Wednesday, March 25th, 2026 at 15:02, Tomi Valkeinen <tomi.valkeinen@ide=
asonboard.com> wrote:

> XV20 is 2 plane 10 bit per component YCbCr 2x1 subsampled format. XV20
> is similar to the already existing P030 format, which is 2x2 subsampled.

I don't know for sure the multi-planar YCbCr format name scheme we're
using, but here are my observations looking at P, Q and S formats:

- The first digit indicates sub-sampling. 0 for 2x2, 2 for 2x1, 4 for none.
- The two other digits indicate bits for the Y channel, one of 10, 12, 16.
  One exception: Q401 indicates reverse order for Cb and Cr planes when com=
pared
  to Q410.

P030 is a bit of an outlier here since it's the only one with multiple
Y samples. NV formats are also multi-planar but seem to use a completely
separate scheme.

Given the above I'd say what would make most sense to me is to use P230:
keep the last two digits and change the first one to indicate that the
only difference is the sub-sampling. Does that make sense to you?

Simon

