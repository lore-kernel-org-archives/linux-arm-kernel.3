Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43263CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 15:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=82MqqdsC+UhY+UBntguCCrenAWnVDTXJX8WvqaSDmSI=; b=e6WMuhYf4FDZW6UjXzeFcOr06x
	iNkEc4Pvi9ePwii9/jp/K278J+8OegFmB9KeBe2cmQvRqx7e3rP5oKT/lrFZtEPwxSN8d0b0TSnfr
	dLGmWNG+uy/VWefaBfGklddLtT/Q7DxHHmyx/FLUkYttnIW0HA4S3PS1evmavni/r09kIPTjh/7Pb
	nkEyumVODcv95z/q/fIc46W7scuzVVCUuqPrxLKvyQf458oT/9ndztU8gJzLRrsTx8uo6HtOyPLdy
	/5kQVPbnZWoJLM5j9fzKxNXkdsPuHWzLZv/uimSjsVCs+mQRfzxkroxBxjOA8nekJofbFejZ5HWhY
	ge1zbqpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulUku-00000008G0h-43RK;
	Mon, 11 Aug 2025 15:48:12 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulT8L-00000007wPC-1VbG;
	Mon, 11 Aug 2025 14:04:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754921054;
	bh=mObt81GrRK+X8Psfo4s7r7KxlJhLpHXzeRP0v136YbQ=;
	h=From:Date:Subject:To:Cc:From;
	b=Ar/QfdpGhFIgKMPfBQO6fOB56tqH0MPqFO8JMMXqRnBSNjkwyWOD1Yh1qX/ju19JC
	 rmdiulGZIjBK/SS0YIVy0DXOlADWSiLaqMsylywhF73t2rFeEUmyVt/rXCLfhccO69
	 s7bCVd5cRefWnJmNHD/yACf4U0QW2upDYWx0sF00GB+/XoP2KIzQhQG+d4Oauk/Rdf
	 twEzz35wD9UTw61EqVsV+LPfa4cAuzAWv7UMCmvJ9b/PepGwOfjQ5OyBG+PlzgIQGo
	 mVrjjcImbfWv5/HMzchdcQTo0QvZrS+k19YmZP9Xkv0L0Trou73S279JOrsvVLZt8/
	 jcjcwiEP0dMoA==
Received: from [192.168.13.180] (unknown [IPv6:2606:6d00:11:5a76::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2866A17E0FA8;
	Mon, 11 Aug 2025 16:04:13 +0200 (CEST)
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Date: Mon, 11 Aug 2025 10:03:45 -0400
Subject: [PATCH v2] media: rkvdec: Remove redundant
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-rkvdec-redundant-pm-rebase-v2-1-90c47213fbbe@collabora.com>
X-B4-Tracking: v=1; b=H4sIAED4mWgC/x3MQQqDMBAF0KvIrDsQA0L0KqWL6Hx1EFOZtFII3
 r3B5du8QhmmyDQ0hQynZn2nCv9oaFpjWsAq1eSd71xoW7btFExskG+SmD587BVjzGBIP4bQAVG
 EanAYZv3d+fN1XX81p9RAbAAAAA==
X-Change-ID: 20250811-rkvdec-redundant-pm-rebase-ed9b885eeadd
To: Detlev Casanova <detlev.casanova@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_070417_562687_D023DEBB 
X-CRM114-Status: UNSURE (   9.36  )
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

From: Sakari Ailus <sakari.ailus@linux.intel.com>

pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
pm_runtime_mark_last_busy().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
Changes since V1:
  - Re-applied since the driver have been moved out of staging
---
 drivers/media/platform/rockchip/rkvdec/rkvdec.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index d707088ec0dc1f6a18b2d168ebdf20b443f2240e..445f7c92eee34f7d6f885bb519d9eb24313da548 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -765,7 +765,6 @@ static void rkvdec_job_finish(struct rkvdec_ctx *ctx,
 {
 	struct rkvdec_dev *rkvdec = ctx->dev;
 
-	pm_runtime_mark_last_busy(rkvdec->dev);
 	pm_runtime_put_autosuspend(rkvdec->dev);
 	rkvdec_job_finish_no_pm(ctx, result);
 }

---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250811-rkvdec-redundant-pm-rebase-ed9b885eeadd

Best regards,
-- 
Nicolas Dufresne <nicolas.dufresne@collabora.com>


