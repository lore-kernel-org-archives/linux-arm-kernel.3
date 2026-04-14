Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E1CCF9D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 13:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4wKUMUC9tvVxWRE1fUr4hrcJnzrVuvMDesPVOAtflUU=; b=js4WUI0rJIPHgS8hqmHFYqA5Fh
	Na3jIdjerbBHN8o7VQrkhffGJqm5dzXG2bYM+PCUCK9dviFTQMDnXiigwWZI7+Vafie1ZPL56l/Ed
	VppOvWegWwJQoOezjlGxzMcQrpkr3ojoLzmoCtXEE6IWUBl4SsKoO75y/ZfcsGR1o0OZaKpE6M54c
	xk4XHF3zcxEv6olJx3HpWWHpaKXfNio8y2rQzlgGmGZq+q6MRNobELxSj1cEacxUb86eAORmaOBd/
	W17qe/rtX3428O63O2stngdDRqnjf9UBJfaATJ/TC66r8qyT/vW9z4vrK0IeF4UxFdk40r903DAhg
	HrVsuZ5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCdxQ-0000000HOBK-1obY;
	Tue, 14 Apr 2026 13:37:36 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCdxO-0000000HOAd-1ClE;
	Tue, 14 Apr 2026 13:37:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1776173850;
	bh=ayf5zG/G6GH6Q2i2FURWky/Hy7fjUhZYkpxYT8PUSqc=;
	h=From:Date:Subject:To:Cc:From;
	b=iRhX937xDwfd18VLFQNWaPFwFTT3dA8/EFD0kajpufG7z/HMzoqjUDOY9WBhQJM3n
	 yCe83aI6VjbQoAlAwECtMb1+s2f6+lhLWC/Ghpia7AVXfgllpCX5PU/mrIrABdQJhi
	 TrR4IJhXjHApFVEVhpAWmFW1U8C3Dt8fhjOh3smjd1LivB+/buvoiNCmk4Wh6oaw+F
	 aKY36FkTRntr9zdXZrwY9z/4/Dcp18toyp8apwc3UkTXleBQe4u4s9dvrfdHp+o+yO
	 3Wj1fOWJji3EU00yFFwzWnSokfBcGNHE9o/XzhYFBA2qI8vHL/G9/qqzpkRWsp72tY
	 3BPbV/+UY+zvg==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 287B817E1292;
	Tue, 14 Apr 2026 15:37:30 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
Date: Tue, 14 Apr 2026 09:37:22 -0400
Subject: [PATCH v3] arm64: defconfig: Enable Rockchip video decoder
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-rkvdec-add-defconfig-v3-1-a3b49b0ca4a2@collabora.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNQQ7CIBQFr9KwFlNoaawr72FcfODTorUYqETT9
 O5C3RgT43KS92ZmEtBbDGRfzMRjtMG6MUG1KYjqYeyQWp2Y8JI3ZcUF9ZeoUVHQmmo0yo3GdhQ
 BGAPJasMMSdebR2Mfq/Z4enO4yzOqKbvyordhcv65diPLuz+JyCijuxaE0JWUQtUH5YYBpPOwV
 e5KcibyT1HzQ8STSDdC8bbR0Er4Fi3L8gJCQHYFFwEAAA==
X-Change-ID: 20260325-rkvdec-add-defconfig-eaa11ab14f1f
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kernel@collabora.com, linux-rockchip@lists.infradead.org
Cc: Detlev Casanova <detlev.casanova@collabora.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_063734_484637_C46195A1 
X-CRM114-Status: UNSURE (   7.15  )
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

The Rockchip video decoder (rkvdec) provides hardware-accelerated video
decoding on Rockchip SoCs. Enable it as a module so that users of these
widely used platforms get video decoding support out of the box.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
Changes in v3:
- Update commit message
- Link to v2: https://patch.msgid.link/20260326-rkvdec-add-defconfig-v2-1-d65c296da9ba@collabora.com

Changes in v2:
- Update commit message
- Add missing CCs
- Link to v1: https://patch.msgid.link/20260325-rkvdec-add-defconfig-v1-1-89a55d3bb5c4@collabora.com
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index b67d5b1fc45b..4b3f31cb4a94 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -931,6 +931,7 @@ CONFIG_VIDEO_RENESAS_VSP1=m
 CONFIG_VIDEO_RCAR_DRIF=m
 CONFIG_VIDEO_ROCKCHIP_CIF=m
 CONFIG_VIDEO_ROCKCHIP_RGA=m
+CONFIG_VIDEO_ROCKCHIP_VDEC=m
 CONFIG_VIDEO_SAMSUNG_EXYNOS_GSC=m
 CONFIG_VIDEO_SAMSUNG_S5P_JPEG=m
 CONFIG_VIDEO_SAMSUNG_S5P_MFC=m

---
base-commit: bbeb83d3182abe0d245318e274e8531e5dd7a948
change-id: 20260325-rkvdec-add-defconfig-eaa11ab14f1f

Best regards,
--  
Detlev Casanova <detlev.casanova@collabora.com>


