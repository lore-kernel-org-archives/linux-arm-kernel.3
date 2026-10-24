Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB6A606A326
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Oct 2026 15:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=W/lX9C3X;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SAkN1DWe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ANXPqZSHJyzWuXCvN2vxk67OVN57MUfNQmVBTDzT6pM=; b=W/lX9C3XfUsfKwFFdPj5HByTsx
	xxeckAmNycxKhWhfQCeWXdIhvkHB/cDIe8bLfkt1Sz1tVBi+lq5JeXhVnDiFn4ifJT/OFhwCcWZ4S
	Vqk317LEdeKDrmvh9qKvxRUwE5LDZLWdzjbOap1zXBstdoH7hig9wyUhEbTxKcNxd/MrbkpeDwgFP
	8eNI2amAvPBPlT46NZS5HlkhBNRks6LOI+MviMEfWLyYtmAcvRZbLyHLn2/0jifYzRo3NelgtAkkO
	vjGgg1XDSA4faCbN65jKFaNnsrKHJX6YmhG7AuyR01TNahF+fzzBSqLNja1Z0133LO0iiE9tNOQjo
	vDWGAR9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKdsk-00000000KDq-2Bxx;
	Sat, 24 Oct 2026 15:42:06 +0000
Received: from mail-dy1-x132c.google.com ([2607:f8b0:4864:20::132c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKdsi-00000000KD7-0zLJ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Oct 2026 15:42:05 +0000
Received: by mail-dy1-x132c.google.com with SMTP id 5a478bee46e88-369f33df08eso142144eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 24 Oct 2026 08:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792856523; x=1793461323; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ANXPqZSHJyzWuXCvN2vxk67OVN57MUfNQmVBTDzT6pM=;
        b=SAkN1DWeUMR2+62uScy2E/UX+5SxrO5OBETxy4Bmab9W/LojRPd/KVHHP13FaK+CXa
         71ptkwrf5IFXF+lIYupTb6tq3s5mHCi3d6rXEAxDtRDK9eNGyBLXxByoRyaxQR9GnuHm
         f0mjeGjQBNeGxbdD0vhxHcWQDQ+/mqhVdAa1lkBSMFDRghi/vnhEzO5yyHEUWfQ5g7Ls
         +LbqaNXZ/fKGodvClJ2vUKi9RAEKuOmrnTn6k8NPzDlkwL7WUahpUmtRg9z73h0/TyXV
         B3P1mVi4Tqzt8EQxfx48J50IZ5dcKUAazfURYRbuZ0lQxDsbacDw1+lfhcglDnA3J2nY
         VjiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792856523; x=1793461323;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ANXPqZSHJyzWuXCvN2vxk67OVN57MUfNQmVBTDzT6pM=;
        b=reXV+IJHWiVcNx8V3ws5lKbtWpBoEZ4ukyOA66cMZ1Vr4j9bVaV2jWi4Z3/sZO+OfO
         tgFaV7pJwwHEnKZpHQWhS50K0xnQVyyU2pOavolYgSJNB8klmk2n1G5N6MX0kenhQ0Z5
         iyh4i0Z4w0eiCOkoNkhimlkQIO9Zl0tylmR4d2GfAexOOOvd52lq065LuJ9SpGaj0dWW
         osKsFCKROjhozJpC04LR+bF6pyJnvmrxjvVXPOuyeoE/I5A2BA/3ex+xuE/zbj36k2E2
         iSBZJI0g+Q9qKEpxr/Qvdo+G8SU+DiY2A5yJTfRnRoNlrXtfuWxMRVyE3074XVgnA1jF
         HJnA==
X-Forwarded-Encrypted: i=1; AKwUvBzc13z9a+4OKfkrBgujXisONBdu8v3ybL2h/4yKpST41FN5AaYyw0BtLp7KCeoKPE8F3f/h8HccQKCoKUDWQ+yE@lists.infradead.org
X-Gm-Message-State: AFq9FYLPymfRo9hEkoImnDxcugfIRAvnNUOQwQOsqRf8qC9ZlqvFcdhu
	KUSc4/h0cUq7Oyqik6Qang5pfjm73A85LVtbUqSBunVmjUilxJ97bZKd
X-Gm-Gg: AYBFou17GljWjBYpX56B06+lN5hjusy8PKUeq0rBpKRxFb5kiP3Veqq3BTmnzoF3FS1
	+Frj+eXgRp+dBeDTJ9s+QoT59m1ZjR/wMFXnamLuoVJ9kJzvAj/0kYrz5YcT+l0sOaxVzTsfbp9
	lZI53TaZnRQxofsrbYLlT/tDoA59H+XCXK9UPbIeCUP3f1bZ18isKJrftEsMyge6ShX+Xwk8x6t
	+9IqEOtFyZ/q69itKhqwyZZ5qn1lFzxQa69oZXi/toVk2z5ltAQ6dvfCgyDGcixWl+i8ikE9hFY
	z2hIfy2UWbCLN/NlWyShNyMZiXY0iRTpRW9Kus+V471IDzGKybw8NNGIhsgpN11HdIQttF8paV9
	Ncfkwt3sSOpJMr6mM+E/tO8gc4GXYg/F2jclE6y1OzuRqkSRBG0UoVIDH+yyTukdP2BZwIQca6C
	cU3bmIX29TY+Q00UmA66e+TyFEJKe3zBiY3Pa/ymVSbIuSrUugEN5lQRq2+02x9bW9mReSfpiit
	n/wWLi1b7HUkTWOoWdVtofK0bnanJ+3nnfFD1CYLmprlGOrlCY/m9id4A==
X-Received: by 2002:a05:693c:880c:20b0:369:2040:cc88 with SMTP id 5a478bee46e88-369e86144a3mr3470823eec.20.1792856522555;
        Sat, 24 Oct 2026 08:42:02 -0700 (PDT)
Received: from plex ([2406:6d00:a27c:4200:aab8:e0ff:fe02:33c1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8daf444sm7766450eec.18.2026.10.24.08.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 08:42:02 -0700 (PDT)
From: Chris Scott <gilroyscott1970@gmail.com>
To: netdev@vger.kernel.org
Cc: lorenzo@kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	pawlik.dan@gmail.com,
	zhengping.zhang@airoha.com,
	Chris Scott <gilroyscott1970@gmail.com>
Subject: [RFC net-next 0/3] net: airoha: npu: keep NPU-shared DMA buffers in the NPU window
Date: Sun, 25 Oct 2026 01:41:47 +1000
Message-ID: <20261024154150.45733-1-gilroyscott1970@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261024_084204_281410_81232459 
X-CRM114-Status: GOOD (  14.89  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The EN7581 NPU can only address host DRAM at 0x80000000-0xbfffffff;
higher addresses alias the lower 1 GiB, as confirmed by Airoha [1].
On boards with 2 GiB of RAM nothing keeps the buffers the NPU reads
and writes inside that window:

- the mailbox buffers are streaming-mapped kzalloc() memory, which on
  arm64 bounces through swiotlb; on W1700K the swiotlb pool is at
  0xff6cf000, so the NPU version query reads back 0.0 and mt76 does not
  bind NPU offload (this is the issue behind the earlier "use coherent
  DMA for mailbox messages" / cacheline-buffer postings [2]);

- the coherent buffers mt76 allocates on the NPU device (NPU TX/RX
  rings, HW-RRO and TXD buffers) currently land in the window only
  because of early-boot allocation order; reserving low DRAM away makes
  the SoC hang right after mt7996 firmware load.

Patch 1 adds an optional "dma" shared-dma-pool region to the NPU
binding. Patch 2 attaches it as the NPU device coherent pool, so every
coherent allocation on the NPU device comes from the window. Patch 3
moves the mailbox to per-core coherent buffers, which then come from
that pool.

Streaming mappings are deliberately left alone. Packet buffers are only
passed through to the WiFi DMA engine; restricting them with a
restricted-dma-pool or a bus DMA limit forces swiotlb bouncing and cost
~22% of host-path WiFi TX in testing, and the default swiotlb pool is
itself outside the window on these boards.

Sent as RFC while net-next is closed; I will repost as v1 once it
reopens. Feedback on the approach is welcome, in particular whether a
reserved coherent pool is the preferred way to express the NPU window
rather than a dma-ranges based limit.

Testing: Daniel tested this series, backported to OpenWrt kernel
6.18.57, on a Gemtek W1700K (EN7581 + MT7996, 2 GiB) with a 16 MiB
pool: the pool is assigned at 0xbf000000-0xbfffffff, the NPU version
query is correct, all three bands and MLO come up and there are no
warnings. I tested the equivalent of patches 2 and 3 on the same board
with 6.18.55 and 7.3-rc6: all mt76 NPU rings/RRO/TXD buffers come from
the pool (~10.7 MiB used), host-path and offloaded WiFi throughput are
unchanged versus no pool, and boot still succeeds with low DRAM
reserved away. On net-next the series was build-tested with W=1
(airoha and mt76 incl. MT7996_NPU, at each patch), checkpatch --strict
and dt_binding_check.

mainline en7581.dtsi does not have an NPU node yet, so there is no DTS
change here; boards using the WLAN offload need a 16 MiB pool, others
only need the mailbox (1 MiB is plenty).

Tools: patch 1 was originally written with Codex and patch 3 with
Cursor; patch 2 was written with Claude (Anthropic), which was also
used to rebase patches 1 and 3 onto net-next and rewrite their commit
messages.

[1] https://lore.kernel.org/r/atCRsquzA1UxSpCc@mediatek.com
[2] https://lore.kernel.org/r/20260809152813.585797-1-pawlik.dan@gmail.com

Chris Scott (1):
  net: airoha: npu: attach a coherent pool in the NPU window

Daniel Pawlik (2):
  dt-bindings: net: airoha: npu: add DMA pool memory region
  net: airoha: npu: use coherent memory for mailbox messages

 .../bindings/net/airoha,en7581-npu.yaml       | 40 +++++----
 drivers/net/ethernet/airoha/airoha_npu.c      | 83 +++++++++++++++----
 include/linux/soc/airoha/airoha_offload.h     |  3 +
 3 files changed, 95 insertions(+), 31 deletions(-)


base-commit: 734bef548a96e8774d6eef5dfa2026c6edc4e80b
-- 
2.53.0


