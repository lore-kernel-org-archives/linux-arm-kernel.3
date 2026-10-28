Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E91606A332
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 10:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qWRE02Qz;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UZXCsKsa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=5o/pZvqhbTecT88RxUKMYDf2DRxUNlJZBmhZdxERoUA=; b=qWRE02QziTijivO4PGXKB8sSrH
	lc5nms2BhKdhhjN6dvKBbx3xBfMo/heCpRUDET/hXmJQkk4jhqnFWy4ZgtdRh9vIYdO8+vtx+DvXu
	H3In8qok4D1Q4+34wYVUy4PcJG/qjZPK/4WM+dfwnPHFkDfmLRPXw4vdMhpGzaFDPEWibD7d7+Usk
	f6ETbRk04P4E8cVhZ57vI/P+kg0jHrtl5gtvRr0OzQ2Z9WgTnUGErZ4GsePPzDFEbGrKdDq9qORaO
	gyHmvQhR8hRNtAKk63OvBa/HykZ6eTlSMrmDDfQ0SeSMOKH+VEni42YZ5iKDWSZsKdoSdyk97+KnC
	VF1uubDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM13V-00000006lxR-3qUa;
	Wed, 28 Oct 2026 10:38:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM13U-00000006lwg-3L9u;
	Wed, 28 Oct 2026 10:38:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DFF5E60239;
	Wed, 28 Oct 2026 10:38:51 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793183931;
	b=zKzaIYGViITyXea3b72S/1APMs+HvOy/hC8C0wwKk2840p3paK+L6Xpyuj8ITTfV92IG
	 1WWy5ZjxDxXYf3VQ1Yngc1DwDZHBvONf8wEEMCcKQ6qs4Y2N94C/Jcyijyfh8YF5AFZpC
	 7BDxAQmos32ukEbaFR1qGQKOtYp+5T6EZsPeA1c15HUpK2IBPdcs59dBO1kTlaQnrPxNU
	 kJY25RuGXubO5MdXUAYO53J5V1uv2iV/awtrOO4F/g95/StnwzWO8DV8WY+JSl4fBKYX9
	 MXrXfkJbbpxAPTFxHe6cldiAUn4mJxbroZDQrSama1mJ8lNlQu98uM2HLi8pHcXTBYQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793183931;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=5o/pZvqhbTecT88RxUKMYDf2DRxUNlJZBmhZdxERoUA=;
	b=0gBGjJ18fgywABLfD5NZ2LA8xZJEOEbcp55xNBJbSy086oatxRwsIObkuqFDSmUeUQTi
	 8coya796fFkKGmJ2f5n9q6HJqEScUnYWmlH3mzJh/bY3xQRDJcO6DLM61DsqN+RutkDuD
	 SZQrP/pEft2QKPhQsSUj8d3oPKxBbEOM7ZpAigq+X3m7txAFUSerQBvHUC+uL9U0wRjPr
	 l6/HKFBCw45Ra8YT0pWxaD59mjWNww7L98kQ2IcOK13utSm5Dz5ujHsVebjbYLVcVMyYP
	 6ttSFZcKIGFQc4Pd7BbTMGT50xmv75YZXoKi1RERrOqkaWC/tWd9hP//QtH8XOM3ZHA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0CBDD1F031EA;
	Wed, 28 Oct 2026 10:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793183931;
	bh=5o/pZvqhbTecT88RxUKMYDf2DRxUNlJZBmhZdxERoUA=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=UZXCsKsaL/y4ohnuI04PKTlXgXG9IK+Z/AMJG8cPqPjQsX0lWBK5Zy/c5yygirCvb
	 VPd6nI2GrerNRJmkliT7lu97DZCQrnxUl6gEcaSQ8F1A/73xtwug7Nu4YobzrsB4VF
	 4qS9KCJko3LYfbErxhI2EjXPx6EusAyVQ/T8oKSQf6V3dqBCcY1xmtqdtk6zhNo2JA
	 hXSBhT6Op67Egp2y9CaqCjzyV13hRW/67Gv5mQN5azteJz98Jbdkpnj8E1aGJbTX6Y
	 T4C44GtcvGafXaCnqi1BNZ5B/jVcUGSmosomVx1B1x4yUeRWSzg+b3Vsnov+59Wf1f
	 Dj3JgABs0deZg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 5CF61453F3;
	Wed, 28 Oct 2026 10:38:50 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Subject: [PATCH v4 0/3] soc: mediatek: pwrap: mt6572 support + log level
 fixes
Date: Wed, 28 Oct 2026 12:37:49 +0200
Message-Id: <20261028-6572-pwrap-v4-0-1780c58d2097@protonmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23NTQ6CMBCG4auQrq2hPxRw5T2Mi1KmUqOUtFg1h
 LtbMEaILr9knncG5MEZ8GiXDMhBMN7YNg6+SZBqZHsCbOq4EU2pSHNCschyiru7kx3mqiSZYEr
 XlKEIOgfaPObY4fje/ladQfVTYbpojO+te87fApnuPmG+DAeCU1wXkElWKp2D3nfO9ra9SnPZK
 ntFUz3Qpc9WnkZfgSR1kRJVkOqvZ19f0vV/Fr3guSgrwbmQ6seP4/gCiA/uhDsBAAA=
X-Change-ID: 20260712-6572-pwrap-4c91563cfd23
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Flora Fu <flora.fu@mediatek.com>, Alexandre Mergnat <amergnat@baylibre.com>, 
 soc@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Roman Vivchar <rva333@protonmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793183929; l=1859;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=rJSpPVEVPd0aF8LzZm8VDw4PaJi/3ZvOaWXpH7hlhls=;
 b=2v0NrIKTGEwX1A5XYHkOaJuwQKzzo2fV2ckeeI/DM5UdabuqfcoyLQJlDC0Ln0egcudaPuE8I
 vFTkIO6uwbxDfZGyHXcNxRykDseZXINxapSKlk8azImrEvgRDCa133R
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: rva333@protonmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-14.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_REPLYTO_END_DIGIT,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This patch series adds support for the mt6572 pwrap.

All known mt6572 devices use mt6323 PMIC, which is already supported
by the upstream drivers. mt6572 also shares SoC-specific init with
mt2701.

Patch 1 adds dt-bindings compatible.
Patch 2 fixes improper log levels in the driver, improving UX when
debugging.
Patch 3 adds mt6572 support.

Tested on various mt6572 devices without any failures.

Note: this series was reviewed since July, but still wasn't applied.
Pings and resend for MediaTek maintainer were unanswered. Could the SoC
maintainers consider picking this up directly? The series cleanly applies
to v7.3 tag.

Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
Changes in v4:
- Send to soc@kernel.org, no other changes
- Link to v3: https://patch.msgid.link/20260924-6572-pwrap-v3-0-64769b6446ac@protonmail.com

Changes in v3:
- Pick up Krzysztof's tag
- No other changes, resend
- Link to v2: https://patch.msgid.link/20260715-6572-pwrap-v2-0-bea1d801c81b@protonmail.com

Changes in v2:
- Fix typo in patch 2 commit message ('Errors paths' -> 'Error paths')
- Drop unused registers in pwrap driver and use existing mt2701 array
- Also clarify mt6320 register usage
- Link to v1: https://patch.msgid.link/20260714-6572-pwrap-v1-0-d8e5a39cf7ef@protonmail.com

---
Roman Vivchar (3):
      dt-bindings: soc: mediatek: pwrap: add mt6572
      soc: mediatek: pwrap: use correct log level
      soc: mediatek: pwrap: add mt6572 support

 .../bindings/soc/mediatek/mediatek,pwrap.yaml      |  1 +
 drivers/soc/mediatek/mtk-pmic-wrap.c               | 71 +++++++++++++---------
 2 files changed, 44 insertions(+), 28 deletions(-)
---
base-commit: 8cd9520d35a6c38db6567e97dd93b1f11f185dc6
change-id: 20260712-6572-pwrap-4c91563cfd23

Best regards,
--  
Roman Vivchar <rva333@protonmail.com>



