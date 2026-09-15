Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE638C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 04:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	Content-Type:Content-Transfer-Encoding:Date:Message-ID:In-Reply-To:CC:To:From
	:Subject:Mime-Version:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OdSISjuIqSA6RYepZAaAaCWjG77KrftE0lv66a2jXvw=; b=BtFJTz0zCEo39LUPfeuQ02vp/S
	ngh8GcY+6MZgViW4cEmFDRUEakOKvrBAVfxRh9KbJHkmLXC/EjdIImIG88Eo5oyJ/KtI/4qQIDUwx
	4pT+nnysPNaYoF8vJ5gVy/Oq+HivAVYsQbiv75qD72eMRyMsbGlgU5nN7Jy7jCWqPInkXkeI3bstT
	j3/lp6ebDlCFMwSa+Z3buvqlv/Jexvt1zFfgO+WG3nf3X/ri0yAiVFH3PIRnHWglOeuWQfQ8NWkrK
	nFbbb6Zz9H4bFRGm+iFlRM6CyPezmu5e59C0r8cC5Tr7r1ikezdlER27LkyIynlx07hKTlq4M4+ZN
	rUtyQC3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6KSf-00000005B0D-1Mv8;
	Tue, 15 Sep 2026 04:08:01 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6KSd-00000005AzU-0yfl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 04:08:00 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20260915040752epoutp022426248c431b1ea4287f89c320c8c542~VYv6cyGLx1769817698epoutp029
	for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 04:07:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20260915040752epoutp022426248c431b1ea4287f89c320c8c542~VYv6cyGLx1769817698epoutp029
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1789445272;
	bh=OdSISjuIqSA6RYepZAaAaCWjG77KrftE0lv66a2jXvw=;
	h=Subject:Reply-To:From:To:CC:In-Reply-To:Date:References:From;
	b=NcPihEs1TfRQ59cHSonA5j/EPpgLb5qujoeUpgHgdid70UIm1yUmsUNrAZDCUy+Ia
	 3y5W8VNIoUB/8pnv4BkBA2Ic+oxjUC6Mec6qHDovDwFJlAqjwa3lfdNJzPWuhe6WWj
	 n0UnRs4e5hXqsunuUxePIzUzDowkkVTsQJ5hMkGI=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20260915040752epcas5p47fcc897074cf61be2ce564034328bf4d~VYv58on9T2618626186epcas5p4W;
	Tue, 15 Sep 2026 04:07:52 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.41.41]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4hkT540Vs3z3hhT9; Tue, 15 Sep
	2026 04:07:52 +0000 (GMT)
Mime-Version: 1.0
Subject: RE: [PATCH 1/1] lib/stackdepot: add __irq_svc to irq text section
 to filter it from traces
From: Maninder Singh <maninder1.s@samsung.com>
To: Andrew Morton <akpm@linux-foundation.org>
CC: "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "linusw@kernel.org"
	<linusw@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>,
	"kmehltretter@gmail.com" <kmehltretter@gmail.com>, "vbabka@suse.cz"
	<vbabka@suse.cz>, "elver@google.com" <elver@google.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Rohit Thapliyal <r.thapliyal@samsung.com>,
	Hariom Panthi <hariom1.p@samsung.com>
X-Priority: 3
X-Content-Kind-Code: NORMAL
In-Reply-To: <20260914205531.2894876437403f43e300b5b4@linux-foundation.org>
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20260915040750epcms5p6e4690c118a20ca82e53c239c8129e29b@epcms5p6>
Date: Tue, 15 Sep 2026 09:37:50 +0530
X-CMS-MailID: 20260915040750epcms5p6e4690c118a20ca82e53c239c8129e29b
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
X-CMS-RootMailID: 20260914103226epcas5p4832171ae7e2b5e19ab4eaaf66a6e6768
References: <20260914205531.2894876437403f43e300b5b4@linux-foundation.org>
	<20260914103218.1125401-1-maninder1.s@samsung.com>
	<CGME20260914103226epcas5p4832171ae7e2b5e19ab4eaaf66a6e6768@epcms5p6>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_210759_430776_5889283D 
X-CRM114-Status: GOOD (  13.35  )
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
Reply-To: maninder1.s@samsung.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

> fyi, this choice of subject may cause the relevant maintainers to
> delete the email unread.
>=20
> >=C2=A0=20arch/arm/kernel/entry-armv.S=20=7C=202=20++=0D=0A>=20=0D=0A>=20=
Those=20maintainers.=0D=0A>=20=0D=0A>=20This=20is=20an=20ARM=20patch,=20so=
=20label=20it=20that=20way=21=0D=0A=0D=0AYES=20right.=20Sent=20patch=20with=
=20correct=20subject=20line=20to=20address=20ARM.=0D=0A=0D=0AThanks.

