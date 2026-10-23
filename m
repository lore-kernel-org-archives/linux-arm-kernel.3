Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04BF9606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 07:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AcaghKZe;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=At5IDPwb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=lDP6DNxZLMCCTvykxNYnugjrNL0G0a+2sCTH3kjJCeo=; b=AcaghKZeaJc3TY7PyVYqln2qgp
	ry050P4hWOI6rzI2RHKiaB81Iz7Z0/2b3BldwfC5WZYx5Lnows82S8FQsZAomDZ4OIXorAMBKFLoL
	qeYGnxIoEwAnPG2M5Zt/2tTEH4Z05wYlN8NThRYXmv96G2sQZ3U8qDS2qTjGjE2ibBDe5+2f/AoE7
	k73IfyD504rlMRzBj9fQgI4aGYeVk38KKojS8QMXH6ffym29Tf3cjZdcvBYsPb1s5A6ZmKa2HbeOK
	sXiDoqmTR1rIC9aVdIm00WJu76yqyuji48CzGnV66M2AHgo/f/HIUYQ/ykdq2kfnI73DFmnTC/dai
	YnPaXa/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKA94-0000000FpRy-1NnE;
	Fri, 23 Oct 2026 07:56:58 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKA91-0000000FpPn-23Ob
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 07:56:56 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-3ab60ff4273so544402a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 00:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792742214; x=1793347014; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lDP6DNxZLMCCTvykxNYnugjrNL0G0a+2sCTH3kjJCeo=;
        b=At5IDPwbr9HunpECIaioGQGJDyX+hN1vdj9EHG5jJ2uee7AR1+ne9zLQISwFKz3A4v
         2uLB++rC7GT/CAZL8cuiC6AFoELYWvy5LgbuVGcsaj9lwNfeIj2oZeQNSE96yIsIfd+c
         KCtH62/BYqudKA2XzSA9+0RG+GFVqKOEq3nzE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792742214; x=1793347014;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lDP6DNxZLMCCTvykxNYnugjrNL0G0a+2sCTH3kjJCeo=;
        b=uXt6Rhabycbc3YJrHKh/rfs5EZhigbuSJeIwlGWhUeM+OOQ29Vv/XsouHG2gnK/gc1
         dRGx2TsCL/p5dEp0lJ0HoeU8kskS+oyYjOWbz9k4hmRKN9VkQ4K/u5LK9mRWcVSrx0R0
         4KnHwOBaTklUqHy8fhAWDOmSvzr6dadMe1UBUeHt03qjWxqXn0CEZayrQkBMmWgx1vf4
         jDgQwiwTJXg5Sf4MRSzXBQj6rnQLVUpE7q2d2wuiqLIc+f+WBQ5ZW2XfNDVq7RjI6AGb
         1nFEzpgLRb0xwi75aJsVsbqZerdg+AuUcpPoiQgNOcZYaiBDsF/UhWVxK6mqWJZgMG9Q
         RJAQ==
X-Forwarded-Encrypted: i=1; AKwUvBza5K41FR2InzqL/Q+Lq9Fm7+Au0/Nb5aPpObVdBWBgxazztIIO+GtCrNBUXRRNf2g7fnkyqHnexwJxlhip1F5r@lists.infradead.org
X-Gm-Message-State: AFq9FYL+VIypnasNOpCArEpphMX+kZ0F+oartrqU4N9BT2LV9Ikz8qoO
	7S0ZFr+idy7mBbm+d68xULMS502lg/x9vWdYwt84LP9GLt0eGi03Oe0VimlOt0mQbg==
X-Gm-Gg: AYBFou2Aj07OCWoJz2LNiTll9gB06y4gH5YQhK6j42GJbv0rlJX9fY7DSjYlGwULbjC
	VM4sWIq3pso94z8FYqSyORFBeazz0eRSyhhUlec3ub9MOac0gD1ekiZiRk8g7qafIwWtcIRIVEv
	dM4N6OEOo3UW7ixcp2jNan1rz9Q/vWfXib/J3QO2HfXnVRXjrRCwbDX1l29rprnsg+jb8AccKPj
	69woNj3/idKQ3im6DXj79GfT2/BwJ7lBdD1fVimLQ7JaWFIlRp2KFFwKK+79BY7VwA8A24/Mmp5
	DDmbg1U1vFOMqO5PfM3oeQZy3LlV1lUc18g5VKdTqRDxs2NbM0qh+hlczRQLM+ZJSRXa7oeH2O5
	huKdeGBr80CraXlYG68DC5RyG3BlzDfkebUcdS18cgwzLYxklUNLYTxhKHbKhCeAWLSs19hrFBc
	Wmlj4uIW2vNJqTyhpGV+UhySlF7mmMFYTRKMENoH2t9u29Iv25YeX38ZwMuwfslfcyJB8h8UoDx
	Garf3jlLm0gcaddflYLF0zEa9IaEAtPRsK6DK5WZT30ffLt+NpfhHFmneIwQ9Hqro96J9DYFUs3
	J+OH4CAhOgbSHdOL9gnYQrS3iH7535E1KiAETFw=
X-Received: by 2002:a17:90b:5246:b0:3ac:8fff:5a1b with SMTP id 98e67ed59e1d1-3adce7dd700mr1102279a91.34.1792742214339;
        Fri, 23 Oct 2026 00:56:54 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2a00:79e0:203d:7:2210:4aae:b72d:9083])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adca08e785sm2483537a91.0.2026.10.23.00.56.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:56:53 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: Yunfei Dong <yunfei.dong@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Fei Shao <fshao@chromium.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 0/2] media: mediatek: vcodec: Fix NULL source address handling in decoders
Date: Fri, 23 Oct 2026 15:55:18 +0800
Message-ID: <20261023075642.3671805-1-fshao@chromium.org>
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_005655_569014_A58D7640 
X-CRM114-Status: GOOD (  10.02  )
X-Spam-Score: -2.4 (--)
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
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Both the stateful and the stateless decoder workers peek the source
buffer and, if vb2_plane_vaddr() returns NULL, finish the m2m job without
returning the buffer. The buffer stays at the head of the ready list, so
the same job is scheduled again and fails the same way. In the stateless
decoder the media request is also never completed.

The two fixes are split because they fix different commits, and the
stateless fix also has to complete the media request.

Changes in v2:
- Call media_request_manual_complete() instead of
  mtk_vdec_stateless_cap_to_disp() to avoid dequeuing a capture buffer
  that may be in use by the core workqueue on MediaTek LAT platforms.

Fei Shao (2):
  media: mediatek: vcodec: Return source buffer on NULL va in stateful
    decoder
  media: mediatek: vcodec: Complete request on NULL va in stateless
    decoder

 .../vcodec/decoder/mtk_vcodec_dec_stateful.c  |  4 +++-
 .../vcodec/decoder/mtk_vcodec_dec_stateless.c | 22 ++++++++++++-------
 2 files changed, 17 insertions(+), 9 deletions(-)

-- 
2.56.0.257.gf7497c7d27-goog


