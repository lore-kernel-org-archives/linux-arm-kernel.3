Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81771C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 17:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PG/z1baCojPuO4le7CXrUjhogclaWMbiGdswAWPTKTc=; b=gT7ahPnxY+Ozt9
	HVwXIAhTZWW6zBcF7LnOxTR0qlQCQdsuUX7h+LOrd+glc0YPceBsSXpXa4+WDH+v2gVZaTzzii+Ex
	JFAwoXs9A4ykYOhBPlO0T4qYOjl9ZagQ5WKggvHUBM/rkAqc7qSpA8N3PXCRTXGore4wMo5HKO8nn
	lrekYYDNG/h4dbbj4nZfFMiZ8R+bNI5q4wvkZyQSD1Pjtw94A7GH0wEG+/NC8QI33xPAFHzw/UkcW
	gfMcb83GjaptykOezmhfrWQGbL6w5Ub1wSACwcL1xeub//zAG8d2ERgGtiygIQWRJu78htpmL4H5d
	hxQLKINKp2v6PH8LcWlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY7AJ-0000000Cal3-2Tfr;
	Wed, 15 Jan 2025 17:26:51 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY791-0000000CaQH-2wuN;
	Wed, 15 Jan 2025 17:25:32 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-5401d3ea5a1so20037e87.3;
        Wed, 15 Jan 2025 09:25:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736961929; x=1737566729; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PG/z1baCojPuO4le7CXrUjhogclaWMbiGdswAWPTKTc=;
        b=b1yK6uYMRVsS13RmhgTwVZ3N8Feq+hvU2B/NaZCT1tsG6LEFyfO8kny49kVTCS6g/d
         2mACf9E0VFQmJ+k0rXbTH8N/vSWVfH0omo4L344gf/ZfL4OyTH/HqJm/6glX2qXSTdjw
         V+Lu7LxNduGPTn+4WNgEbVueI4jRt+KLbSmJT6mSTYotQ3xPhv8gvF3EIAohZw83Ow5y
         L3JxAbFfS/KVVB58v3vZti8ZRZ0KkBJ6YlPvuzDvFBXzOBH4g5Rb7DL6qkwMSEXu4gfW
         2KOrk+YVnsekBtfUWHP8A2z4BeG0eeu5SDI4q7PKJYkE5ZXNH2eRg53n2c385TkPxx/T
         yGag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736961929; x=1737566729;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PG/z1baCojPuO4le7CXrUjhogclaWMbiGdswAWPTKTc=;
        b=kizFIDtcr5N2x5tlyJIl7SX3TJzVNmESmEsZ3pkdkpGcxdRsxbFjneBctPveQohA54
         xbTDorCPx+QhT8nXDGCRYJXpQQ840PbtOtX2iBE03PWpxxm63TwrOr+EEt+CaYU9kOuM
         RoTwqXEszO4YEtQNZQwbxROG7FwhO6CFJIz+PinNeh7JXO+ZRUHhh7RL2C7HjE7liZIn
         YRiUv1isTqrd9/lAEybCj5kMDtItMSw5iAtTV/ajQqIRmEr/ouR1opkEynWPj78BU6WU
         EHkZpVjSE6zeRAFtFb3bNeAk9JvsSNSPjsxGZEbe5eR69dYPTV69tiVaIOllhNl0deCx
         dGtw==
X-Forwarded-Encrypted: i=1; AJvYcCVGZCJGn3iklUbaJBb+Esrts8s9MIaPVYMgS81NTgAOn/4TFvzThU2iTZxnQAFbywHdF6fub+ZQGCCbxPISoNq4@lists.infradead.org, AJvYcCVtZw7tZznpiMx+paF/Mp+UdGABE+p8r8yjptcKx/WlIq3cTuTBEXUXnWEXT0JeQFKNQKktJ/vyDYSvFw0jepc=@lists.infradead.org
X-Gm-Message-State: AOJu0YyhfJamrFpSEjZnQpucxFfMWjQLgMsFvqdQ9v/eMRD1zEeinq7T
	oyf11Bxerj7HJ9Ag88xW3ygVcMKoBNIvk3LEAB4GL9s7faawVCpn
X-Gm-Gg: ASbGnctdOoq5H5bgp59tlMXv5FWw9WyDEAZDwrq4BpmeaVudP2RpojFaXNTnFDPoySZ
	nGUS6iMmi+nYAwjx/33J7hR7yqNhqsCb+wABgefN4VjWWawu6lDodL/atJVmdVHo2Y+QeN8NA95
	X8Zq0e8SXQ+xZh+Dn5Rys+r1049MdcI2wq+7AjaI7QC8FSaoygoUysoa3FxROl9Wxw1HNkTBDyQ
	50v8rrefk1SjT8fAgFZFW3q76sHEHRgfmiL/EySpWoiLa9UVojyBC9lIQlM5/C9EzY7Df0ibSXJ
	rCoUdGV/16AjRhibdtn8Tn6j/lXQ1mtAT2xiN1iENaiO3buQLZ00
X-Google-Smtp-Source: AGHT+IFtcNnFisb7W8qriHPRdB3XZhFwcWwCCL/Jg5S8tXq5BqcpUH13lXdpxIr2CInw4dZiwF+IKQ==
X-Received: by 2002:a05:6512:31d3:b0:53f:6c6a:f99f with SMTP id 2adb3069b0e04-54284507063mr8355270e87.8.1736961928964;
        Wed, 15 Jan 2025 09:25:28 -0800 (PST)
Received: from razdolb.local (static.248.157.217.95.clients.your-server.de. [95.217.157.248])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428bea6778sm2105360e87.131.2025.01.15.09.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 09:25:28 -0800 (PST)
From: Mikhail Rudenko <mike.rudenko@gmail.com>
Subject: [PATCH v2 0/2] Allow non-coherent video capture buffers on
 Rockchip ISP V1
Date: Wed, 15 Jan 2025 20:25:04 +0300
Message-Id: <20250115-b4-rkisp-noncoherent-v2-0-0853e1a24012@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHDvh2cC/22NQQ6CMBBFr0JmbU2nYDGuuIdhUcoAE6UlLSEa0
 rtbWLt8P/nv7RApMEV4FDsE2jiydxnUpQA7GTeS4D4zKKkqVCWKrhLhxXERzjvrJwrkVmF6TbW
 tjb53BvJ1CTTw59Q+28wTx9WH71nZ8FgP4U2iVP+FG4qc6gzqaqixVLYZZ8Pvq/UztCmlH5bfp
 1m4AAAA
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
X-CRM114-CacheID: sfid-20250115_092531_742924_9D3328B4 
X-CRM114-Status: UNSURE (   8.75  )
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
Changes in v2:
- Fix vb2_dc_dmabuf_ops_{begin,end}_cpu_access() for non-coherent buffers.
- Add cache management timing information to patch 2 commit message.
- Link to v1: https://lore.kernel.org/r/20250102-b4-rkisp-noncoherent-v1-1-bba164f7132c@gmail.com

---
Mikhail Rudenko (2):
      media: videobuf2: Fix dmabuf cache sync/flush in dma-contig
      media: rkisp1: Allow non-coherent video capture buffers

 drivers/media/common/videobuf2/videobuf2-dma-contig.c   | 14 ++++++++++++++
 drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c |  1 +
 2 files changed, 15 insertions(+)
---
base-commit: 94794b5ce4d90ab134b0b101a02fddf6e74c437d
change-id: 20241231-b4-rkisp-noncoherent-ad6e7c7a68ba

Best regards,
-- 
Mikhail Rudenko <mike.rudenko@gmail.com>


