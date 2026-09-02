Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4148C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 01:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=31/BZ9+v2dfs1yDzN9wLbBwz+6/0mrXF/Wo/qgVhXGA=; b=3yPL6zWJUmaqavxby/xf0x/0Hw
	PkyKQa72px9p1/Q+NwuYSaFVb1yzN8xfej+nLZxSYmK/oMos6wTpNBW2ey6zvuPmOF+jy3ZAJRmH/
	cs1W69odQrP0CamWksX8ZwklwNgnnyGkj31PyZ9t2+58pl3r47yJ8HlQH+76SguMiaqC+D+y4kuiA
	1L2poWXKkRJ7snobY54mAqZSYaLrpIOTRtZQAwReHD5/40yN6A87PKEE6LkQVU0b0QwM1aBdY7dWz
	KL1kqYWLh0UpENJAa3TnTO0pNWM5ntHO/FzjPc9S9OtMm8X1KRiEOk6HBqm4ZwGvqWTKyPzFw98vj
	ldbl91cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1ZKs-0000000DbqK-2S86;
	Wed, 02 Sep 2026 01:00:18 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1ZKn-0000000DboF-0WTT;
	Wed, 02 Sep 2026 01:00:17 +0000
X-UUID: 9e99309ea66911f19a56ed5b684f684d-20260902
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:fda3c320-afd1-4ac7-b57f-a7ed671a4547,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:838c3939a74aa8bd2689a03263d7f5ee,BulkI
	D:nil,BulkQuantity:0,SF:81|82|83|102|865|898,TC:nil,Content:0|15|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 9e99309ea66911f19a56ed5b684f684d-20260902
X-User: liuxixin@kylinos.cn
Received: from [127.0.1.1] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <liuxixin@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1054009407; Wed, 02 Sep 2026 08:59:58 +0800
From: Xixin Liu <liuxixin@kylinos.cn>
To: pjw@kernel.org
Cc: linux-riscv@lists.infradead.org, atish.patra@linux.dev, anup@brainfault.org, will@kernel.org, mark.rutland@arm.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, liuxixin@kylinos.cn
Subject: Re: [PATCH v2 2/2] perf: RISC-V: store available counter mask as bitmap
Date: Wed, 2 Sep 2026 08:55:00 +0800
Message-ID: <reply.pjw.pmumask22chk.1787383200.git.liuxixin@kylinos.cn>
In-Reply-To: <460ddaff-bdad-0eb6-a504-1ea43689d6dc@kernel.org>
References: <cover.1786092600.git.liuxixin@kylinos.cn> <prpmask02cmap.1786092600.git.liuxixin@kylinos.cn> <93cab992-f808-8f3e-03a6-19d84baf38f3@kernel.org> <reply.pjw.pmumask22.1787042100.git.liuxixin@kylinos.cn> <cover.v2.1786434000.git.liuxixin@kylinos.cn> <prpmask02cmap.v2.1786434000.git.liuxixin@kylinos.cn> <460ddaff-bdad-0eb6-a504-1ea43689d6dc@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: patches/scripts/send-local.py
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_180013_452315_9828A7DA 
X-CRM114-Status: UNSURE (   3.34  )
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

Hi Paul,

Thanks for fixing those in your queued copy. I will run checkpatch.pl
--strict before send going forward.

Thanks,
Xixin


