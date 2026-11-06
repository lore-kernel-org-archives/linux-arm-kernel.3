Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE4A606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 02:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zYF+0z/A;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YfoE33O6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mVFhMdPaOpZaZhoFk4x/27qwSHFs/IDKrnB1S7WQ5Wo=; b=zYF+0z/AUQ1E4P
	aOg4v4S6kZjOnGrk8WdZ31TetUL7QIht1dz62LcmXeNzmt7ExKnGgblKNV6/dXKBNpVU/0zj8+tE1
	x8aqNRWpkDvhTSqZSQB3x2FbhlDo7toYpMROmveZRrkaJUDitRYe/xR6F81jskoD2E8x6k3ngJh19
	QXRH/e+ObOqp1rdhbHj2OFZvjYc7Ivmv35ja/k6J7456Mo5bz9WmLZkr2gnN5CWHQf1gbVMMsyS23
	ApkDOSFowWU6SNrGgTGp5auQ3v36eI6q2nkkeh34IhgzZC05Ea/Vfrc2dQ73eH0wqW5gHg5zQwVyM
	ycR5HgITCCeVCLe8x8UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP9hB-0000000B4hl-0xH4;
	Fri, 06 Nov 2026 02:28:49 +0000
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP9h8-0000000B4gF-09LT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 02:28:47 +0000
Received: by mail-dy1-x1332.google.com with SMTP id 5a478bee46e88-3514b90bb89so321614eec.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 18:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793932125; x=1794536925; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mVFhMdPaOpZaZhoFk4x/27qwSHFs/IDKrnB1S7WQ5Wo=;
        b=YfoE33O6Q3pToCUMIOjgKPwV5FGq+NvHCt/5TgVXY76z6pA6H2o3fR7K/KntMsmjDX
         bpHFLAsTep2ETwlKZdexN3eleiyLh0ORn8dPadU6y8bMZciZPcCpT5orjba0mDTOjHoj
         jLFdCXgiPZaRDUdL3fSYoXLZAg5tQ+RSXDjdIivs++D0X+qDZTJdUXI1UhfFIWogzZuu
         asZj2zgNW/cMXNcoV+HB02sDaTqMmu3JeKOyu0QzLP7eamKaahqd9kodQ7UvEHpXAR+A
         UzDB+TshxQF6xrYuyEB0GeGYaVXe0w3cinwek674/X2Tvv8iVWs1IP40R8mQJKVhztOP
         nPwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793932125; x=1794536925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mVFhMdPaOpZaZhoFk4x/27qwSHFs/IDKrnB1S7WQ5Wo=;
        b=GkFturWmjPuqM9OMS1gMX7vQgIxX2fplVEkNtWYNZGz3c6ogRu/nmR05kM/IO9HG8c
         i9citaLHTvI1n+ytNJ8XhaXjtqXRRw+4yVV7WUDjcQNFThHGCfz+g1qIYeEu5hA7nFmx
         qlNgoAaHQbYi4xF5AI5H4nceELpyUtdXSQrDeQWR1k2iJZoThGfnlZjNeFZWggx7nu/g
         GqxVKmH1R/kpaFMpmwzgQN9JkaB9ZRjq3YUIV3M4lEVDr/xgRWxFS1//DmWaAFxI9nHA
         TBajyfUHp1l4IwdH5fP6Ak74iAy42QMSNuVP03mXeOuhzM2wzkP2vakYkNDK0pd31mFL
         kRog==
X-Forwarded-Encrypted: i=1; AKwUvBxxUDi2m7rKl+35QCLQnH47iPPpvInBrJcZWTANn9hOaMMJdNUubPKPEWeyaoDMBGEAN1+M+D2KNM0ZZaxSJMII@lists.infradead.org
X-Gm-Message-State: APuU4Z8E0zdCTCQpV7spfPrrSpqIgLf5Mt0/5QM2V7BlnAmC+H0Bon53
	gilhudxfPOUrtq+FgOMGhv5ZXz4AOgHZ4IVUPp7hYGdjBSXzDWpVASDq
X-Gm-Gg: AYBFou2OhHbrnzCZvW5iFW89qOkgNLXt51X5AzfNx/Z+OejRjhqXxdUwCdpToIVDR0+
	VBG4nPorVud0F0Ved0ZTczcNGNH25C25tqAUQCH4a+h9uUiO4dAJI/NxLyn//pJ5vx6cUTSzNlc
	ZOYjF2u6AgMqPCaZs5uhZJDMJmclt5C2LBJsAwX1XQ4c8e3yapgB007Yqeu5dFUUj8XQgtOL7RS
	DIxVOGduzgGMX8XPVUhryCwCzdPt4ZX+16G9iMlaAImW8CLGF+r74WSFsf9sPCIogU6NwGun2Zm
	omvqL4QWrU8E5Thvg8dRgfJASiAXw2jaVo29YA2pRHPB4/M3+8t1AsDvK6mFHszp0evO1TtlM0O
	+4bCxlfRAv3BD1vGQ0H43t4ZQhSuZ3pLFr3Dz3eUY/5jX7ffx1aiaDf/d7Z4n5do9Z4Z4DWtM0R
	Qy2wHUhYn2VLl+4V4fwbGqUftlFTQMQ3sZpS0XFsFNYWl/wYfwNLEfqx7LijIxXWiZ/APwEchdB
	ZZFlAMFdl9yNCwEJP6kxN3L9unyY9pf5218ZK9QMSX9Or606SKCp5KxVDGKgNmiMUE+0njUlOew
	cqyFx2xYeNEpJYzi0pGqKsoMmcDx9zfBlI5X/ogpgcITxA==
X-Received: by 2002:a05:7301:929:b0:369:ef63:ea95 with SMTP id 5a478bee46e88-36f76814c3bmr1285854eec.6.1793932124917;
        Thu, 05 Nov 2026 18:28:44 -0800 (PST)
Received: from debian.prasanth ([103.183.205.43])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa8e3a47esm1697186eec.6.2026.11.05.18.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 18:28:44 -0800 (PST)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: linusw@kernel.org
Cc: andrew@codeconstruct.com.au,
	joel@jms.id.au,
	ryan_chen@aspeedtech.com,
	billy_tsai@aspeedtech.com,
	brgl@kernel.org,
	tan.siewert@9elements.com,
	linux-aspeed@lists.ozlabs.org,
	linux-gpio@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [PATCH v4 0/2] Aspeed GPIOP handover with managed controller lifetime
Date: Fri,  6 Nov 2026 07:58:33 +0530
Message-ID: <20261106022835.10709-1-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105152348.8567-1-prasanth.padarthi10@gmail.com>
References: <20261105152348.8567-1-prasanth.padarthi10@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_182846_087663_75B81AE7 
X-CRM114-Status: GOOD (  13.56  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series continues the AST2600 global-to-local GPIOP passthrough
handover work, rebased on v7.4-rc1. It adds a shared pinctrl lifetime
fix before the G6 handover change.

The registration lifetime issue was identified by automated review:
the G6 callback data is devm-allocated, while the shared helper used
unmanaged pinctrl registration. Patch 1 switches registration to
devm_pinctrl_register(), ensuring unregister runs before earlier
devres allocations are freed. Patch 2 retains the v3 handover logic.

Changes since v3:
- Add managed registration as a separate prerequisite patch.
- Keep the handover implementation unchanged.
- Add KASAN lifecycle testing in QEMU and on B650D4U hardware.
- Update validation statements to distinguish lifecycle and power tests.

Validation:
- Shared helper and G4/G5/G6 objects compile-tested with W=1 on ARM.
- G7 SOC0 object compile-tested using ARM COMPILE_TEST; this was not
  an ARM64 build or G7 runtime test.
- Generic KASAN boot and one unbind/rebind cycle passed in AST2600
  QEMU and on physical B650D4U hardware. Controller entries disappeared
  on unbind and returned on rebind; a subsequent debugfs pins read
  succeeded. No KASAN reports were observed in the captured tests.
- The final v4 source tree matches the tested v3 tree plus the
  managed-registration change; only commit order and messages differ.
- Earlier remote power-on/off and physical-button power-on testing
  used an OpenBMC 6.18.24-based kernel, not this v7.4-rc1 test kernel.

The unfixed runtime comparison has not been performed. Concurrent
readers, probe-failure injection, mixed-pair forwarding, protected
writes and SCU510[28] hardware handling remain unvalidated. Existing
questions about probe-time normalization policy and concurrent SCU
writers also remain open. Electrical measurements are outside the
scope of this lifecycle test.

Supplementary procedure, exact source/config and logs:
https://github.com/prasanthp20/asrock-b650d4u-bmc-support/tree/64eaccfde9ac4ec35646c0b7a8663486775b5d3b/docs/experiments/03-pinctrl-lifecycle-kasan

Previous version:
https://lore.kernel.org/r/20261105152348.8567-1-prasanth.padarthi10@gmail.com

Please review the shared lifetime fix and the GPIOP handover policy.


Prasanth Kumar Padarthi (2):
  pinctrl: aspeed: Use managed pinctrl registration
  pinctrl: aspeed: Hand over global GPIOP passthrough to local mux
    controls

 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 145 ++++++++++++++++++++-
 drivers/pinctrl/aspeed/pinctrl-aspeed.c    |   3 +-
 2 files changed, 143 insertions(+), 5 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.47.3


