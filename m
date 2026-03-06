Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDC94F0182F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 12:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gegZ9SG2L3nOQJJmvEQTFjDNAgWMFAacpiJJTUXKdvI=; b=DryWpqwBmgpm3T03Ip6W463oms
	zFF0G9C4ToP0wJrBJgh5thkucvcoSBKlr81H4D2h+5vP49RCvPMjEHg/PdI4K6N8gv5SJCjroatwC
	eAcr1bSSiBrvkrcLo5XfVM1oiAL9mf96UrmTZy+Q/XlGc/4B/GjQCB3Ia+SUev8meS7GRNwOx0ttr
	Jw5SURAgSdoR+T3Ahwybyt2D7IAIoZSnnPmMOHcpKYcKLOVsiBeh5CEfjjy8dpw7KgIYt+vw+g49N
	TnfP89Q/aTl9g6g6eklVdMSujcCL4hgoG745vfhVw+z+Ve2vlqkTzU2LatBidkdFZ21VeExRikMnl
	J2M5Cozg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyUPX-00000003elH-4A3I;
	Fri, 06 Mar 2026 12:36:08 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyUPU-00000003ekV-1l5v
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 12:36:06 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260306123558euoutp0157fab1e54db70a1b4c7816b4ad6061ff~aQLcG26812225622256euoutp019
	for <linux-arm-kernel@lists.infradead.org>; Fri,  6 Mar 2026 12:35:58 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260306123558euoutp0157fab1e54db70a1b4c7816b4ad6061ff~aQLcG26812225622256euoutp019
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1772800558;
	bh=gegZ9SG2L3nOQJJmvEQTFjDNAgWMFAacpiJJTUXKdvI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sLaiao33xhUOgGnDGBAnaOEIpORJl6kQOkBg+H5o1IQDzTP99ueXcBg9Zjn6EykTP
	 JtxxU5K9H82tphiwb+ji+BnS9OjIZH0WKHAeZvNdy6CqNa3PgHtwRaS8D3gLDCAax3
	 IqiB9WMz02wupUBKdm7p46fppFApRj2wvPTAWs3w=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260306123557eucas1p1f4157568a9856c4fbe0b08e6c1a11548~aQLbsktHx1284812848eucas1p11;
	Fri,  6 Mar 2026 12:35:57 +0000 (GMT)
Received: from AMDC4515.digital.local (unknown [106.120.51.28]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260306123556eusmtip1874801b0bb1d934e665cc7522deb78ed~aQLazW1zx1557315573eusmtip11;
	Fri,  6 Mar 2026 12:35:56 +0000 (GMT)
From: Mateusz Majewski <m.majewski2@samsung.com>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Mateusz Majewski <m.majewski2@samsung.com>,
	linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Bartlomiej Zolnierkiewicz
	<bzolnier@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, "Rafael J.
 Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, Rob
	Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Alim Akhtar
	<alim.akhtar@samsung.com>, Sam Protsenko <semen.protsenko@linaro.org>, Anand
	Moon <linux.amoon@gmail.com>, Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v4 0/7] Add initial Exynos850 support to the thermal
 driver
Date: Fri,  6 Mar 2026 13:35:42 +0100
Message-ID: <20260306123543.1748910-1-m.majewski2@samsung.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260303090211.673143-1-m.majewski2@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260306123557eucas1p1f4157568a9856c4fbe0b08e6c1a11548
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20240911121149eucas1p29b9ccf99a545cfaa924b122cd8dd3183
X-EPHeader: CA
X-CMS-RootMailID: 20240911121149eucas1p29b9ccf99a545cfaa924b122cd8dd3183
References: <CGME20240911121149eucas1p29b9ccf99a545cfaa924b122cd8dd3183@eucas1p2.samsung.com>
	<20240911121136.1120026-1-m.majewski2@samsung.com>
	<DGIAUIFPUHN8.35B5MNEUK1JW5@linaro.org>
	<20260303090211.673143-1-m.majewski2@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_043604_910620_DF7000F4 
X-CRM114-Status: GOOD (  15.64  )
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

> Honestly not sure. If any other patches are merged that conflict with
> this series, I definitely can resolve the commits (for now it applies
> just fine to next-20260227, though I haven't compiled the result yet).
> Correct me if I am wrong, but I don't recall anything to be done in this
> series otherwise. If there is interest in this series, I can retest this
> on the other boards and re-submit this later this week.

I see that others are working on different SoCs actively and that my
series conflict with theirs. Probably would make more sense to
re-submit/rebase when the dust settles, unless somebody wants to use
these patches now (I am assuming that you are just cleaning up the
review queue for now).

(Also, I somehow managed to break threading by sending my previous
message with only In-Reply-To: and without References:. Sorry about
that...)

Kind regards,
Mateusz Majewski

