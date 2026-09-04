Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0428BC79F80
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 09:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QucwaclOjyYHopgW8/mLC1xI5HcNHu4T0BXjt5NsW50=; b=g9IPEz7GqvHYr0eiYX5Wjz7nUH
	AlAJcla7kdC04rBRCgUMAa00H5iYH2RD2DkQdNF9rXeWy0ZYrUPpX3aQSZ5DZajj6UnadJNLIinY8
	y0PdbW9ot8xfdd2DHBgXkPXefejrWeaJE1Fz8lKfTismBJ//695kkXXsKvdCjxuf3BJ1sUW9cn1vl
	n9kmgF9S2SeAX3Yzb5A46P4udpgreu/sGqSdJcA+43RnMBBM87Q+98u1ZFDuFGZZ8KsoYUVTvEdpX
	Hqled/tuHtbhLs3aSu+a1RuYOKpvyYqWLOPxndttrktR4M9ro52AdfJcfBCKSzFI0luwVOA3TqR5g
	nIrf8Q8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Pz6-00000001Un5-3DJJ;
	Fri, 04 Sep 2026 09:13:20 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Pz3-00000001Ulf-2aju
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 09:13:19 +0000
X-UUID: d88b31dea84011f19a56ed5b684f684d-20260904
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:cfa902b0-1f0a-4bf3-8060-1d9ab420d2fe,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:7db8b62,CLOUDID:6472706a6be62be334e54d3a4e77b7ad,BulkI
	D:nil,BulkQuantity:0,SF:81|82|83|102|865|898,TC:nil,Content:0|15|50|99,EDM
	:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d88b31dea84011f19a56ed5b684f684d-20260904
X-User: liuxixin@kylinos.cn
Received: from [127.0.1.1] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <liuxixin@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1127481883; Fri, 04 Sep 2026 17:13:08 +0800
From: Xixin Liu <liuxixin@kylinos.cn>
To: sudeep.holla@kernel.org
Cc: arm-scmi@vger.kernel.org, cristian.marussi@arm.com, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, liuxixin@kylinos.cn, mturquette@baylibre.com, sboyd@kernel.org
Subject: Re: [PATCH v2 5/5] clk: scpi: use PLATFORM_DEVID_NONE for scpi-cpufreq
Date: Fri, 4 Sep 2026 15:55:00 +0800
Message-ID: <reply-scpi-hardening-v2-ping.20260904.liuxixin@kylinos.cn>
In-Reply-To: <20260728-cuddly-alpaca-of-serenity-c0c824@sudeepholla>
References: <cover.v2.1785200642.git.liuxixin@kylinos.cn> <fb51cfbfbb41.v2.1785200642.git.liuxixin@kylinos.cn> <20260728-cuddly-alpaca-of-serenity-c0c824@sudeepholla>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: patches/scripts/send-local.py
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_021318_326708_AB332F7D 
X-CRM114-Status: UNSURE (   4.54  )
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

Hi Sudeep,

Just a gentle ping on this v2 series from 2026-07-28.
Dropping the 5/5 cleanup on apply is fine with me.
Could you please apply the rest when you have a chance?

Thanks,
Xixin Liu


