Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA83606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 16:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EN/G7f4e;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=V5N5cJoE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=8OcV7m+TUCHXLjsYXeJ+5OT+7xEIy8F/NuFzFSLHyvo=; b=EN/G7f4eFu2V893smQLHp3ap77
	3nwtb8fZ7lcJvmnmhjSo9/vh9js0cYNQMbtvoh3furVo4OXZ3R9bsWQQ2iHbKF1bxryJTNtcwu1AE
	kVZnUBq7arYNJxzsvENl20Y6LiGLhyzGJTWWj1HeEYROPwKldsEvXect/EGG4VbNqNRnmQEZ4y0TI
	LdOiKG3ffST/9YlDSPe8vw4BS64E1901KmqNse8t1sF62sWx7+EWT5BtUjWW9E3MAZD0yzB9AxtCU
	5BbkwtnhJNVlW4mlkYZ6z5wKiRe+Ath9pGz6T6p8l4b/7QWsmHWFdz2wZghz1cv9WiarFDgsLiU6O
	b8pYG7ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLjzb-00000005Lg7-068P;
	Tue, 27 Oct 2026 16:25:43 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLjzX-00000005Lf1-2wSW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 16:25:41 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so7428165e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 09:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793118337; x=1793723137; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8OcV7m+TUCHXLjsYXeJ+5OT+7xEIy8F/NuFzFSLHyvo=;
        b=V5N5cJoE73r1/LA3Yp+DeLOo90HsNc6bOekL5R+ZsUHIB80DBzvyfBMJ4JzJX1hhTY
         Tadi6XqsgyPyrMubpaDau3xr6CcSla8+46IAhkvY0x740Qk2CG8RUcbkFU8cKYLKhQMl
         VSog/XzsVJZ0V87nn19W5nV0Fp07/10X0Me7l+yz5AP3u1hPG6RDfn5FV9+T/ewuwgNR
         v/6+x3z1TOidMKNpGPOxs94H1Z0WWTsI+C1/p9mBo1mZBZd+CKggJOM1VW4H++8LhEC8
         ShfAaXdIS0EIVSZf0R5PyrTG4nei/5/qLaIGN2jEIrkXAgeC7JuGhp6nj8y8GTkzLZKS
         MvmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793118337; x=1793723137;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8OcV7m+TUCHXLjsYXeJ+5OT+7xEIy8F/NuFzFSLHyvo=;
        b=GkpVUXTVjLycfGDV0PrOelR19WHXs/3HhESGLwrc6eMuESviq3foH2IhyEPA5Yf9tr
         N5sP+v7+0aFSIV709kF0sY0WJAMSTUYGg2WJ6Ro+n/+2xZUeu8XI4FCLjzKOR6Dk84XM
         NriNDINNxL81RmQCTgK9QL+zxI5nkQNVRnKbAc0GwI914bzHv0Fu5S6mjzJX/iayxD0V
         u/rRUwPguouYmQUZzvD6kAz7wLXRaDERueO7Uu602RSNbH9jWpl5B72WNooUFDipHJ6/
         +9euu3oonyWMU7DY/Iz6W7uH7I88LWwvhUMK2x5VAnVXuL20auGm/nUUX5i5YtAyEBVO
         ufbQ==
X-Forwarded-Encrypted: i=1; AKwUvBzQXgenm8F1lUjmsusxmJo6mFcD/78Xj+myqOlcsTW618fzCcwg06l/jbNqNvmJAfUKTGnz2uiDWj9oR7N0UKHE@lists.infradead.org
X-Gm-Message-State: AFq9FYK+8IZLwgYA5Uw7CsObUOHwelpFtSU0VlUx9IQV03ZC3ZU26GFR
	kw34eq+F+JoKyf1PdZwANA+NZcnH1a5RROV1+Drqt4zinXqotNna63cvfmTX2MUsffM=
X-Gm-Gg: AYBFou2/tLQmVxkDefGdXDWy3xkViWFpsP8SaUSOihroNYeUnwEt1VO603PVGsr1RYK
	wj6PpDeyrb2LRafdHLB/hN/GghjmAGJ3HGQuX6yPPgLrj83ScYcaKzb2+LoG3jZVG0nrj+snkd7
	Ix1VJ/md6yjy93d335VeuCvbYb+Sn3OZH0USz//KeZ7dCQ2+UYLpJbyagXAtlOQdpQdUJnWK1dV
	477RyuEBGZS8YhDM+gybHSpEwCepugpo3xyFUBKrZKNZAIkmUfMuucKPANHRQ34REAVyyG19w8l
	UHyRkc2KEEenHxBolv49lLdLbugGG0Paz7Z96AXLmT8LdfYi2kzUHv4EYcIX5cTyXu5Whap0KPQ
	JTG+VdpB8nqrOvzyqK8EqUCvcCbQVBSVjAXwboh0/N7Ix6wauXtzVb/lyDcrm7T4CYpvnPQqbN2
	57z4nU2+3DfxixHTYEMSlsiXt+iwDXt1i4uiEbsP6UP857ITd2Hqep72Vp15cBpjbrlyFtCm1Tf
	AJxS5Ob0PBE7Mb2Sywuw4V3Beudg6YYa1lG4GqhAkoatmXsDUZXe6inCWgJp5msZRIBqh+NoVg0
	FF1l/IT+ULH7DxiwvWoXB/DwhheTKuSvIyvq7WDCbdE=
X-Received: by 2002:a05:600c:530d:b0:4a1:c27d:e1a8 with SMTP id 5b1f17b1804b1-4a7c100c816mr76768845e9.10.1793118337316;
        Tue, 27 Oct 2026 09:25:37 -0700 (PDT)
Received: from localhost (p200300f65f19a90461358920bbb0c5ad.dip0.t-ipconnect.de. [2003:f6:5f19:a904:6135:8920:bbb0:c5ad])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a9301b6968sm115485e9.8.2026.10.27.09.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 09:25:36 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] remoteproc: elf_loader: Make rproc_elf_load_segments() more generic
Date: Tue, 27 Oct 2026 17:25:19 +0100
Message-ID: <cover.1793117996.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=724; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=yA71phFGI7EdUzfKSsZthD23p/0J3Coj+je0F1nEXik=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq4NBvSK8H2PN79QFIb53PEqUXlq2S6UgvHblFM 3fLU/YgcDKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCauDQbwAKCRCPgPtYfRL+ TqKMCACZfihv0KZEC6jP+ubBQtpsGPs1Cf6qHCbCICL6ZJamGVN4AZzK7Qqj5eO8KnTW/f/teJC EAbMuo1qT1O8t8TbvCo33u6K9dWYBKEUN79V+IHZdXShryweitzNTku3wCE0jgiaCsPJ9noCEMl NxPZnk1/u53JitDtDs6J8ZkB8T+TrfQLZmx5M9w0dotwxiOfGKpnCI0ioe29b9eBeMFCCter2mZ zf8SkXj+ciGyNpIdhuJ5/joaOy0s/aHTVZjORONlyaCi4qUUuCr2lwThaWP9JWVQV1fs/Vmob6O 0hK5Q9FfzhkkaALPaBPjmNqM7T8cl4w23c2s6yIi0cpzg5zd
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_092539_762943_50FB7F6C 
X-CRM114-Status: UNSURE (   8.07  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello,

changes since (implicit) v1 (available at
https://lore.kernel.org/linux-remoteproc/cover.1793008847.git.u.kleine-koenig@baylibre.com):

 - Add Reviewed-by: tags for Peng Fan
 - Fix checkpatch warnings pointed out by Mathieu

Uwe Kleine-König (2):
  remoteproc: elf_loader: Create new callback for copying segments to
    remote cpu
  remoteproc: imx_dsp_rproc: Implement .memcpy_tova()

 drivers/remoteproc/imx_dsp_rproc.c         | 120 ++++++---------------
 drivers/remoteproc/remoteproc_elf_loader.c |  64 ++++++-----
 include/linux/remoteproc.h                 |   4 +
 3 files changed, 71 insertions(+), 117 deletions(-)


base-commit: bd1ecbb61afefc6a8b876ccbc31e9228b44e9eab
-- 
2.47.3


