Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF840CD4F52
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 10:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T+jsCET9SqK665tKcu+hwjTRT1iWn79hywVX1OJApCA=; b=p0x75aJkAinV2yLGk0wikjUyWl
	w2C4HsfhSPTmQ4tk/kuFq/PQwD2wecv703kYQFqUM/ZoUa4QEkPXzfm7hSNQmIx7zzCh/Ytk+rF1e
	w05HsTIMtdoH0hOTb5H9lEw0yZACn65eXcayGqIrNrFTx28fO9Pfmo8ngJFQNN3h9RHiqRMcgx7RQ
	YaEA3FbzwJgmV907wP2K555ppCxWRKyIjtdLIodiqyiqzD4vE80kj5sXobZjLTrY73xhHjb26CB00
	jNOPsD5cMzwED8otdlLfUxa4DgmXXUL4JWztHMfdUki1HwAcFFXbl4zyMfVKzNSTH+5sE99wT4MVs
	moY39POA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOvHf-0000000FFzV-3I2K;
	Mon, 18 May 2026 10:33:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOvHe-0000000FFyb-40cp
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 18 May 2026 10:33:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=T+jsCET9SqK665tKcu+hwjTRT1iWn79hywVX1OJApCA=; b=gWzjMRipsWlecT6VHWXGEHle/L
	OPM3pfU3J89JAX777LzNtr7BWlzKwnkmSc1BO2qFRGQl5qrkOTTeuAQ1PH5hyaY7H7AQrzRMlqc8I
	p7nByEQZM6oKXkuNpcLVRQzA1HqjzZDboKkxqA9F2VrPFpjHuGe/Wk48buFMMXCPWQQxwNgpqK9wJ
	fpZ1mD/hOCfx+8ONgPIF4q4ouSfOMiYDxxRCrB02viwaERvGbp2iqnLLqI7IOt8BNWJTqU5pW1/GD
	4ixUqzHLmd0nmmEFhf5gG+wMI5MI65CzcO8vi5oPz4ijg+FndY/IUEWHCU7iuHgY/0jxm/hYE0yQE
	cRxBsKlg==;
Received: from leonov.paulk.fr ([185.233.101.22])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOvHa-0000000AmFA-3ORL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 10:33:13 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 0183A1F80044
	for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 10:33:09 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 83288B40830; Mon, 18 May 2026 10:33:09 +0000 (UTC)
Received: from collins (unknown [192.168.1.64])
	by laika.paulk.fr (Postfix) with ESMTP id 52A59B407FF;
	Mon, 18 May 2026 10:25:02 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arash Golgol <arash.golgol@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: [PATCH 16/16] media: sun6i-isp: Add support for frame size enumeration
Date: Mon, 18 May 2026 12:24:51 +0200
Message-ID: <20260518102451.417971-17-paulk@sys-base.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518102451.417971-1-paulk@sys-base.io>
References: <20260518102451.417971-1-paulk@sys-base.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_113311_292178_EF32B622 
X-CRM114-Status: GOOD (  12.24  )
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

This implements the enum_framesizes operation, which reports support for
even sizes.

Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
---
 .../media/sunxi/sun6i-isp/sun6i_isp_capture.c | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c
index 372b9331bd6d..e638ec32c7cd 100644
--- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c
+++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c
@@ -452,6 +452,26 @@ static int sun6i_isp_capture_enum_fmt(struct file *file, void *priv,
 	return 0;
 }
 
+static int sun6i_isp_capture_enum_framesizes(struct file *file, void *fh,
+					     struct v4l2_frmsizeenum *frmsize)
+{
+	if (frmsize->index)
+		return -EINVAL;
+
+	if (!sun6i_isp_capture_format_find(frmsize->pixel_format))
+		return -EINVAL;
+
+	frmsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
+	frmsize->stepwise.min_width = SUN6I_ISP_CAPTURE_WIDTH_MIN;
+	frmsize->stepwise.max_width = SUN6I_ISP_CAPTURE_WIDTH_MAX;
+	frmsize->stepwise.min_height = SUN6I_ISP_CAPTURE_HEIGHT_MIN;
+	frmsize->stepwise.max_height = SUN6I_ISP_CAPTURE_HEIGHT_MAX;
+	frmsize->stepwise.step_width = 2;
+	frmsize->stepwise.step_height = 2;
+
+	return 0;
+}
+
 static int sun6i_isp_capture_g_fmt(struct file *file, void *priv,
 				   struct v4l2_format *format)
 {
@@ -522,6 +542,8 @@ static const struct v4l2_ioctl_ops sun6i_isp_capture_ioctl_ops = {
 	.vidioc_s_fmt_vid_cap		= sun6i_isp_capture_s_fmt,
 	.vidioc_try_fmt_vid_cap		= sun6i_isp_capture_try_fmt,
 
+	.vidioc_enum_framesizes		= sun6i_isp_capture_enum_framesizes,
+
 	.vidioc_enum_input		= sun6i_isp_capture_enum_input,
 	.vidioc_g_input			= sun6i_isp_capture_g_input,
 	.vidioc_s_input			= sun6i_isp_capture_s_input,
-- 
2.54.0


