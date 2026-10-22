Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48DA360A263D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 05:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oNq5r3mN;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=erOZXdar
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aJhSp5FQgDQDLiRKd4qpwkqXiFacPMHlJzlZVfDeqvg=; b=oNq5r3mN2zYCQ8
	avouUDvVsXTJp0CcDU/UmGX7Ezb/psBBngfSMDzJEfvzbCuN/rWWYnQ3mCn/rimcjew2gXZSXr1SA
	TFC8pxPcesXDThD8tS24XNGd9iFXp5bs9b8WOAW51jh8Edky4yROfb0ks084PsizYxT96oL+3/JTL
	WEStLi21ttUp48RHIs1I5PAVQYjInt2y/VTSETU1NbA6aKYlI4u5yrY9RFTC1hdPY0ZF9/sXog04O
	5qAEj5YCPZ0NbvsLvxDB59hdwiglWSBirE+CUrvqYms4koNs/iD2Fuc5glq7bDwvXOxaKDKBHe+7K
	pzjGqny00Zi7YUI6V+Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJlKg-0000000DNiB-2V6f;
	Thu, 22 Oct 2026 05:27:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJlKe-0000000DNgX-2gDm;
	Thu, 22 Oct 2026 05:27:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2CC8B60210;
	Thu, 22 Oct 2026 05:27:15 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792646834;
	b=14SjCSBg2m+a6emjQ5IiA/PfRQvTEAcwPIVDQUhQp5DbEjdAKW/MR2loxysd3nMPhera
	 +Zae5x0VE4NGWiZOJxH5B/QTWfLZAcRmf8kKcZa/QrHAQNE4f5G3aT50b+i+0eRAUhVfM
	 2xZDzk4DXtcY9WecjfcCbNrYtrb7C/vm5RsQgFPdGY4TpORHVivptvxHsXSv7evjII7Xy
	 2fFoMa3zH+odUYRoxMocJqylm+i8FATZEPPTbIfHTtY8rEDDL0P85uaruR6KCl5/drWuo
	 dXtKDtTYZZ4w40e0YlEvfSo+AUqJhAWAK0cMAzpxuOZc48sDzVS+wvT0tsmeGj+/VgQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792646834;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=aJhSp5FQgDQDLiRKd4qpwkqXiFacPMHlJzlZVfDeqvg=;
	b=pj1Mdue1krE6TPI6PXIKtiz91+sEubM5lu6sbP+zLSovP+FQX0bUp8qISb6lRjGsI6Vq
	 R4LCkSqSl6re4boMk9HZexsbvBabQH4/f07gP7XKRmVpQkZQb/BX54Hr/SaajFYdz7Nww
	 FyLkJJSpdX+iUXkptgkNgwX2se8ieQylwW7V+OL63Dlk642zx5vzMZNzQTGmvVRCMZnzH
	 ja0c2FFqgV/Ihm2Zs3GzhUT9XAKAafoEfTKDWHISj22mOA29g6hCla5Bg4AHYuY31zZMV
	 I76QJbHy14mhEb8fyEBqyx11niKBAlo9FdYwNeiFH4wLd7CIGUcoHgpOFEuqGfjRzEw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DB18C1F000C2;
	Thu, 22 Oct 2026 05:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792646834;
	bh=aJhSp5FQgDQDLiRKd4qpwkqXiFacPMHlJzlZVfDeqvg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=erOZXdarjU7UXewRLGyVa4HXBWWvFOTUgo7HPqkDVfD6XYKvCV1X8KBypfUbda/lF
	 sQtRildmZqpudgHYF3oLRV/xIE0lFNMQ6FRHeHu9qzcxQ66lyaZCypXz6sg+aoi7nd
	 j5cLtJ05Vfb9NLNxK1JGaZJjbJXqTao94R0Cf3TGzIlR6uRS/M6S1NchQ4mQUzY+H6
	 XxQ20RmgcHZNhaVUmzJWvkIopV9PfOg69WBlaNQYS3zHDC+UMSVlXk/WucZSYrmhgq
	 Bws78IcFuOiofiOXwZA9xksDU6pgQFYpfP58Fwtky0JB+Z5XfqUDvknqIDXDhxU11L
	 xB6MsAFsnC0/A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 48493434E5;
	Thu, 22 Oct 2026 05:27:13 +0000 (UTC)
From: Zhentao Guo via B4 Relay <devnull+zhentao.guo.amlogic.com@kernel.org>
Date: Thu, 22 Oct 2026 13:27:00 +0800
Subject: [PATCH v12 2/6] firmware: meson: sm: Add video firmware loading
 SMC call
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261022-b4-s4-vdec-upstream-v12-2-616240978792@amlogic.com>
References: <20261022-b4-s4-vdec-upstream-v12-0-616240978792@amlogic.com>
In-Reply-To: <20261022-b4-s4-vdec-upstream-v12-0-616240978792@amlogic.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, Zhentao Guo <zhentao.guo@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792646831; l=711;
 i=zhentao.guo@amlogic.com; s=20251024; h=from:subject:message-id;
 bh=wZ/Fw+jH+tOBVIXbBc8zSjH7Kx36sATJ09qPRAeyKKk=;
 b=W+y4VY/oZ+d/v2st9z7kzOz8+zDimrATVD4uEFbPvPFcmKfAdJL+iPdXjmOr4VKVIwdS/Lf5+
 ORYnYIWBfJKAmpkXJSHaI4FBTDE62ksaJrcEDB2XOXbVvCWStqunkfH
X-Developer-Key: i=zhentao.guo@amlogic.com; a=ed25519;
 pk=5yfDKrjreXwcAoEUsdtWafy6YN500upXp/CgtnXjLVU=
X-Endpoint-Received: by B4 Relay for zhentao.guo@amlogic.com/20251024 with
 auth_id=555
X-Original-From: Zhentao Guo <zhentao.guo@amlogic.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: zhentao.guo@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Zhentao Guo <zhentao.guo@amlogic.com>

Add SM_LOAD_VIDEO_FW at SMC ID 0xb200000f in the command
table to load video firmware.

Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
---
 drivers/firmware/meson/meson_sm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/meson/meson_sm.c b/drivers/firmware/meson/meson_sm.c
index ab9751a59b55..887caa5c625d 100644
--- a/drivers/firmware/meson/meson_sm.c
+++ b/drivers/firmware/meson/meson_sm.c
@@ -48,6 +48,7 @@ static const struct meson_sm_chip gxbb_chip = {
 		CMD(SM_THERMAL_CALIB_READ,	0x82000047),
 		CMD(SM_A1_PWRC_SET,		0x82000093),
 		CMD(SM_A1_PWRC_GET,		0x82000095),
+		CMD(SM_LOAD_VIDEO_FW,		0xb200000f),
 		{ /* sentinel */ },
 	},
 };

-- 
2.42.0



