Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 555DDC79F99
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 20:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xd5tQKQxHFRGotFcOXdpLOZw0W1C2jHEVuOQdyASEiE=; b=pPUgvGeK63hTKJ4NE2bYNKnO3f
	AkfOUeXgf1yVBCeA3/Ri5VAPwtbPltYnhnE+v67jIVzEt6NLmKowkj/CLaUSAzXuBMOnU1BpKTCNk
	bzRsapaS13iJ8NkJcVrc/DUS40NuIMxDS5+7fM6k9LK0WVdwzWiKF/DY3YhQvlqFFCUO5kGNWLtBI
	Rw+SJn7Z05I1PXEdDXrS4JYU1OyYL+Xz8FniENuQUrl0E8g4IbKqrfen09dlzqeY4yYWGBkUpW0Cn
	JKwOrTp15APQyT/j5RywY8ufojL2+LEz5KaIEdfHMCs1M0SSZxFeatJKRxAl+Cv84VdnPjQgY+Za2
	tM9XUIYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3gMe-00000007jgG-0AZ0;
	Mon, 07 Sep 2026 20:54:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3gMd-00000007jgA-2FYu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 20:54:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 97C67601DB;
	Mon,  7 Sep 2026 20:54:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D63AC1F00A3A;
	Mon,  7 Sep 2026 20:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788814490;
	bh=xd5tQKQxHFRGotFcOXdpLOZw0W1C2jHEVuOQdyASEiE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dRIpg4+cjz/LJPp8MxUEYl3ZCRk1kb+/hn7o8I3Rc1wGT/1J2IDbk56aw2K+lcBac
	 yafINQoKso2O6Q/7xNS4cbMVeKmgKpR3qfHSPYrxL/4/+TsLwDUiw3lU5lZdf+FQSZ
	 TKZnGZDqoaY9J8/k/mYa9qHtG71FFF0iDyH9O9gH0LKfTVdRET2SUkCn5mhuzKDJ6K
	 0SnAmUCtjFC/VxPqlUrqMpAH8Znz1bVd4yCuA9BnM2FyQy0loCHmm+j48ko7R2MRTw
	 LMnx/hVUyDicyrMmJODphzbjIwSoN8rGjkzUGA4CuCM74CRBxnXyeOij3pfIqHFlT7
	 Lsd0SKDWI2ilg==
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
To: Qiang Zhao <qiang.zhao@nxp.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] soc: fsl: qe: Fix sparse warnings in GPIO
Date: Mon,  7 Sep 2026 22:54:35 +0200
Message-ID: <178881446326.32908.2707847448430333820.b4-ty@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <6a84b38e766729676b375c93bf54c67ea455288d.1786080840.git.chleroy@kernel.org>
References: <6a84b38e766729676b375c93bf54c67ea455288d.1786080840.git.chleroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=2343; i=chleroy@kernel.org; h=from:subject:message-id; bh=6z7FgiQsA83jfG1X90ruIg/3wydjhrS28CflV2+zQjk=; b=owGbwMvMwCV2d0KB2p7V54MZT6slMWTNV+n3Z41iYHt67/Gh932K3ulPhB07Lqy7cM195tIEM U3/3+8udpSyMIhxMciKKbIc/8+9a0bXl9T8qbv0YeawMoEMYeDiFICJvF7G8FcuXuXU+Ve+axhf 63c8L41hj42PT376i7mr7Z+DbHfVFS9GhinVXzsvdkidUdg9aVGx7K4Sjalf53MeLXHd5mFqEj3 /Nj8A
X-Developer-Key: i=chleroy@kernel.org; a=openpgp; fpr=10FFE6F8B390DE17ACC2632368A92FEB01B8DD78
Content-Transfer-Encoding: 8bit
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


On Fri, 07 Aug 2026 07:35:52 +0200, Christophe Leroy (CS GROUP) wrote:
> A C=2 build on mpc83xx_defconfig provides following warnings:
> 
>   drivers/soc/fsl/qe/gpio.c:44:34: warning: incorrect type in assignment (different base types)
>   drivers/soc/fsl/qe/gpio.c:44:34:    expected restricted __be32 [usertype] cpdata
>   drivers/soc/fsl/qe/gpio.c:44:34:    got unsigned int [usertype] cpdata
>   drivers/soc/fsl/qe/gpio.c:45:34: warning: incorrect type in assignment (different base types)
>   drivers/soc/fsl/qe/gpio.c:45:34:    expected restricted __be32 [usertype] cpdir1
>   drivers/soc/fsl/qe/gpio.c:45:34:    got unsigned int
>   drivers/soc/fsl/qe/gpio.c:46:34: warning: incorrect type in assignment (different base types)
>   drivers/soc/fsl/qe/gpio.c:46:34:    expected restricted __be32 [usertype] cpdir2
>   drivers/soc/fsl/qe/gpio.c:46:34:    got unsigned int
>   drivers/soc/fsl/qe/gpio.c:47:34: warning: incorrect type in assignment (different base types)
>   drivers/soc/fsl/qe/gpio.c:47:34:    expected restricted __be32 [usertype] cppar1
>   drivers/soc/fsl/qe/gpio.c:47:34:    got unsigned int
>   drivers/soc/fsl/qe/gpio.c:48:34: warning: incorrect type in assignment (different base types)
>   drivers/soc/fsl/qe/gpio.c:48:34:    expected restricted __be32 [usertype] cppar2
>   drivers/soc/fsl/qe/gpio.c:48:34:    got unsigned int
>   drivers/soc/fsl/qe/gpio.c:49:33: warning: incorrect type in assignment (different base types)
>   drivers/soc/fsl/qe/gpio.c:49:33:    expected restricted __be32 [usertype] cpodr
>   drivers/soc/fsl/qe/gpio.c:49:33:    got unsigned int
>   drivers/soc/fsl/qe/gpio.c:297:17: warning: restricted __be32 degrades to integer
>   drivers/soc/fsl/qe/gpio.c:299:17: warning: restricted __be32 degrades to integer
>   drivers/soc/fsl/qe/gpio.c:302:17: warning: restricted __be32 degrades to integer
>   drivers/soc/fsl/qe/gpio.c:304:17: warning: restricted __be32 degrades to integer
>   drivers/soc/fsl/qe/gpio.c:308:18: warning: restricted __be32 degrades to integer
>   drivers/soc/fsl/qe/gpio.c:314:9: warning: restricted __be32 degrades to integer
> 
> [...]

Applied, thanks!

[1/1] soc: fsl: qe: Fix sparse warnings in GPIO
      commit: 5af2ccc8ec749d98d3d0bed4b9df25781d7f2d46

Best regards,
-- 
Christophe Leroy (CS GROUP) <chleroy@kernel.org>

