Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59C5CE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Dec 2024 02:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lY+bpoGbSqA5dQMkhBlSwu7qgeb2Y0X+I/8GVHLM1bo=; b=2PjHWhPIen2hQxBbzAadakWejX
	jYltz4l/yPhJtXFIx1CXm2hZdYuwqUfhTzkV+4Mw84ozHBs/48T+OysIpeFZULiNBKcJNvC0Tuno7
	yXSMkXNfK7YSbUhIAF8lQiCykjwxZ3TjkfEuGZuTId1eRQ16WBNRp0hKKv+pc30MVoULOyWQ6Zf/u
	xP/lSIE7YWn07AsLLcrPOlOIsDNbJPZ6VT6FLVrLX+Mxe6KbmPzjC78B8HBYtUaqC/Pw8JpuNkOWZ
	fMaESw852yGU7bV1KYXv+pT+MkI2q3/jERxSGrLDQHPJZ/YZjO+1ebq6FPoCL3hNNc22vURdu6ilt
	N25AmLrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQdhb-0000000Eys6-0sSD;
	Thu, 26 Dec 2024 02:34:19 +0000
Received: from mx.treblig.org ([2a00:1098:5b::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQdbn-0000000ExzC-28Oz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Dec 2024 02:28:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=lY+bpoGbSqA5dQMkhBlSwu7qgeb2Y0X+I/8GVHLM1bo=; b=Lvk7K3qwM8PdCJGk
	FQUoE/GZa5+rEjYNTalXgsvQTZVGXA6vuPeDQwjNFV9851mwVM+RniwKx93fYRKDLGErxZkI7W8F7
	q7euGFuEo04xmuQ6PRg1wa7cUn4wFbvg1bS9jr9LFfXNzS77ffAYtS1zMe1tDg5NUTdOBiqZlk7FW
	ITDZ6JzwY5gwhApnB3hkcDl343gxGBVooBvvH1jz0qyd8c0C23gd7Gp2HMNpNm/k1ULypNEQXAWko
	Y/afsMl+rdzgEQeIBUX+oT9bkB3Ww5peoZRZdH4dlHZsp5T/k9iy15sRSGmqilOk9jh3nan8gISJG
	oQP3d/1xgLh7BNUTEA==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1tQdbN-007F0L-25;
	Thu, 26 Dec 2024 02:27:53 +0000
From: linux@treblig.org
To: p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	deller@gmx.de,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 0/7] gpu: ipu-v3: Remove unused functions
Date: Thu, 26 Dec 2024 02:27:45 +0000
Message-ID: <20241226022752.219399-1-linux@treblig.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241225_182819_554317_31B377BA 
X-CRM114-Status: UNSURE (   6.27  )
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

From: "Dr. David Alan Gilbert" <linux@treblig.org>

Hi,
  This set removes a bunch of functions in ipu-v3 that
have been unused for a long time (since 2012-2017).

  No changes to functions are made, just full deletions.

  Build tested only.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>


Dr. David Alan Gilbert (7):
  gpu: ipu-v3: ipu-ic: Remove unused ipu_ic_task_graphics_init
  gpu: ipu-v3: Remove unused ipu_rot_mode_to_degrees
  gpu: ipu-v3: Remove unused ipu_idmac_channel_busy
  gpu: ipu-v3: Remove unused ipu_image_convert_* functions
  gpu: ipu-v3: Remove unused ipu_vdi_unsetup
  gpu: ipu-v3: ipu-csi: Remove unused functions
  gpu: ipu-v3 ipu-cpmem: Remove unused functions

 drivers/gpu/ipu-v3/ipu-common.c        |  38 ---------
 drivers/gpu/ipu-v3/ipu-cpmem.c         |  23 ------
 drivers/gpu/ipu-v3/ipu-csi.c           | 108 -------------------------
 drivers/gpu/ipu-v3/ipu-ic.c            |  73 -----------------
 drivers/gpu/ipu-v3/ipu-image-convert.c |  48 -----------
 drivers/gpu/ipu-v3/ipu-prv.h           |   2 -
 drivers/gpu/ipu-v3/ipu-vdi.c           |  11 ---
 include/video/imx-ipu-image-convert.h  |  32 --------
 include/video/imx-ipu-v3.h             |  14 ----
 9 files changed, 349 deletions(-)

-- 
2.47.1


