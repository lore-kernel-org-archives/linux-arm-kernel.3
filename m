Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A63CC0218A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 21:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZeS284yiagAUt5myzqhlz9U/p7Feb1MPVxopSKm2pkQ=; b=C8qZGA25KLjwNn
	RZ/VpjSGz/x5Tf1sYxPxoUCIQ3WIWhtV9i4NERp61j1Ld+ZNAdpcs9C8k93s/vuGJZ50dUz6JQav+
	L9A73fc9E+LEsws+muDDSrMTSLftJfL8tUSztwI1kaEMbaXCRAmHG0NojAu0/kVwUa3rHlFeqgU/z
	sHiSsa/R+rZyygznS0dEAr6yG6bTUZInfXH0PZVVP+WHeeXLuSPOFsiKIT24LGyduUSSaBduSQieQ
	k7IWwlYq1OFIav0M2JWoaHvSCV1nOk+Nchqt3EFs1BAfDEQ0o69bgARitwcqSbo6kTeBVZx+c5vhy
	KrTxOZZdHOV1IKZ936cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tctTz-00000005s8n-46p5;
	Tue, 28 Jan 2025 21:50:55 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcsJr-00000005o13-1h9P;
	Tue, 28 Jan 2025 20:36:24 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-54024aa9febso6395626e87.1;
        Tue, 28 Jan 2025 12:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738096581; x=1738701381; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZeS284yiagAUt5myzqhlz9U/p7Feb1MPVxopSKm2pkQ=;
        b=DCiiGXsMQPW7xMmAdJq85VjVNm3FVf3RTtLaT3CDtsisyhPt7qJtk1YxB96QwrsLVe
         EAkA9lThWG+SxUtjuUHtfaIxt7cUZpVdcOUhbISWo8Wae/jJam0YsHQGgbKNHYEwX9Y2
         RWn9kocYSxE+1xrhoMDn1ec/laqttaUvkUXlZpjIyA9hP1SlfBsMd8IBCqCGWdeFC3Wi
         vg3eLQYgtEV4ExSr5q5LzEKI9PyrSuScVtAbBsDzyAuJPfESEecViN8x1EagiN9kYaDy
         DzxwIpD1OMohvrHpXWDQVLldigcM471WTj80Gismhi094GXqxIRGzlRbf1lp8EA1fui2
         WgfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738096581; x=1738701381;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZeS284yiagAUt5myzqhlz9U/p7Feb1MPVxopSKm2pkQ=;
        b=OT3PbSrfB6pd/wfRCR3tfb4qlwf/yjDpixg5YeVFYl3XmK9KauWELptuKSRbJEE/dB
         EwNyjDcf7VmvRIsnQFYzBMs/78WPjo8RTwL5pDDLzU2QWZkQeMXIWv+4QmeMRWpNxNIb
         qIhCFLuGHKZaJHQouMyiLNWl+x5E5rGQa5hHifIF/NlSkyQHht1SD7ZtXpfI4EeW1Jpm
         3zyYRDSI+IH1QhVRP0qrxkwLsbZKqbxsRewFskhWOLWrbESRZcLnuVbN2St+M73ipIy6
         +OEbCan2hT8zKNcXOQDP7Kevxy9bAn/IS/0cDZW0UlTblLEuzU00lgOdIZsJxhiqwX4w
         5cLw==
X-Forwarded-Encrypted: i=1; AJvYcCWk/rN5MYWJ7O65XUipKX6dJnqX32awVoBONLJ7aIp5NBOcgQYoX2Fh3Vy+VLPLvnBTVQ09+UoM3tYBDD1bzl0=@lists.infradead.org, AJvYcCXz5hfrD2g+QX2d9bngOiB2Dg3k2lKfBeTisiFj8ixncKiyPhA9oSj0pzsneCcS0gLvA7sd3mPizWJXoiaqHjhR@lists.infradead.org
X-Gm-Message-State: AOJu0Yxq1uV9QXqZEzW1oSBGcBX6J75atvTl0d8dni+2Z2SzVr4/OLIW
	V8/VDCDxVstXYt5jYM+8PtkuXMwHxw5+fWHNCdSPSOmU86jBKgDt
X-Gm-Gg: ASbGnctubl8oleEEqj+7O3yR4yWNnqF0ltFoMlomiC9P3DrJNaT1pd4mD5RlB5NMpiH
	nNQ0XO/NlTxC5See+idtAlVRqINE0wJ0cCgVK91099WNYxXOJV8W++twpo8XlbSez0spSao4ePe
	zVSDJSt7xr6xreeRhTJWy4Q9wrF5GiVPWVInt7rcPKcoLLxsOlHE5PdIL/e6RWQTLV3Pi8cEqJP
	HNd2kncLcl3esyNEbZvA5mXgkC5+7r3NqPk9SVuHeGppiVubIHCIQ3BsXdXdGebtH+02SROMavI
	EII8VDFQjfBwEdHRQhRRxjuAp7VuAWe4qMoKtNKIEnxrmoIOTej9gMqH8WvowPjqyjEEnStA5CG
	J/JuInxp4GwQ=
X-Google-Smtp-Source: AGHT+IHcthjhhWNVY7ur0ZzUoR3bMalPrCYYX+hqCRvtnsfoAcW/QdYT3x+76JRzqpm9R+ts44luCw==
X-Received: by 2002:a05:6512:3d2:b0:53e:383c:dfa9 with SMTP id 2adb3069b0e04-543e4c0323bmr115743e87.30.1738096579828;
        Tue, 28 Jan 2025 12:36:19 -0800 (PST)
Received: from razdolb.local (static.248.157.217.95.clients.your-server.de. [95.217.157.248])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543c822fcb0sm1778361e87.55.2025.01.28.12.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2025 12:36:18 -0800 (PST)
From: Mikhail Rudenko <mike.rudenko@gmail.com>
Subject: [PATCH v3 0/2] Allow non-coherent video capture buffers on
 Rockchip ISP V1
Date: Tue, 28 Jan 2025 23:35:50 +0300
Message-Id: <20250128-b4-rkisp-noncoherent-v3-0-baf39c997d2a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKY/mWcC/3XNTQ7CIBCG4as0rMUwA/2JK+9hXFA6bYkKDTRE0
 /Tu0q660OU7yTzfwiIFS5FdioUFSjZa73LIU8HMqN1A3Ha5GQpUgBJ4q3h42Dhx553xIwVyM9d
 dRbWpddW0muXXKVBv3zt7u+cebZx9+OwrCbbrBpYCBP4GE/A81WqoVF+DRHMdXto+z8a/2AYmP
 CBQ/kGQCy6aUhJoVALwiKzr+gWSROXf/QAAAA==
X-Change-ID: 20241231-b4-rkisp-noncoherent-ad6e7c7a68ba
To: Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Mikhail Rudenko <mike.rudenko@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_123623_447480_1FEC4D10 
X-CRM114-Status: UNSURE (   9.34  )
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

This small series adds support for non-coherent video capture buffers
on Rockchip ISP V1. Patch 1 fixes cache management for dmabuf's
allocated by dma-contig allocator. Patch 2 allows non-coherent
allocations on the rkisp1 capture queue. Some timing measurements are
provided in the commit message of patch 2.

Signed-off-by: Mikhail Rudenko <mike.rudenko@gmail.com>
---
Changes in v3:
- ignore skip_cache_sync_* flags in vb2_dc_dmabuf_ops_{begin,end}_cpu_access
- invalidate/flush kernel mappings as appropriate if they exist
- use dma_sync_sgtable_* instead of dma_sync_sg_*
- Link to v2: https://lore.kernel.org/r/20250115-b4-rkisp-noncoherent-v2-0-0853e1a24012@gmail.com

Changes in v2:
- Fix vb2_dc_dmabuf_ops_{begin,end}_cpu_access() for non-coherent buffers.
- Add cache management timing information to patch 2 commit message.
- Link to v1: https://lore.kernel.org/r/20250102-b4-rkisp-noncoherent-v1-1-bba164f7132c@gmail.com

---
Mikhail Rudenko (2):
      media: videobuf2: Fix dmabuf cache sync/flush in dma-contig
      media: rkisp1: Allow non-coherent video capture buffers

 .../media/common/videobuf2/videobuf2-dma-contig.c  | 22 ++++++++++++++++++++++
 .../platform/rockchip/rkisp1/rkisp1-capture.c      |  1 +
 2 files changed, 23 insertions(+)
---
base-commit: c4b7779abc6633677e6edb79e2809f4f61fde157
change-id: 20241231-b4-rkisp-noncoherent-ad6e7c7a68ba

Best regards,
-- 
Mikhail Rudenko <mike.rudenko@gmail.com>


