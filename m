Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9234606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 02:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Te1BHNjo;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vpPbsyMD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mVFhMdPaOpZaZhoFk4x/27qwSHFs/IDKrnB1S7WQ5Wo=; b=Te1BHNjo62afQq
	0WjqVPum+k2jjO3Ppp6Iuqz9RFfFVY35u8g+hicCyk1/jy+yKyujlE0s/kx+T1ixqq3GR9IfEzuX8
	/8iU1iNEjdMW3OexLEGaE51GsKUYZ1AgF5j8KyI0SGL3oAmHVnbFz6787+bpCHdv5c9fYB/0lP/14
	F7t8+td4lAP/s283sixoOSn/jRHeNEBUfXqJtQQoxdkx0agzP/s1TzRTBmNfC2bTbfmJJXV0fbI9D
	3aO1f+rOdB8YzEVcUeTTBNV6HK9j5AYmxhCcwx9y/PvmENIowPEWQLlJR3T3JtLjwjHtIIiIjst0l
	sRRdzAMGktIrZDyzUUpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP9he-0000000B4qa-1twi;
	Fri, 06 Nov 2026 02:29:18 +0000
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP9hc-0000000B4q4-3buz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 02:29:18 +0000
Received: by mail-dy1-x1332.google.com with SMTP id 5a478bee46e88-36f6295304dso186961eec.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 18:29:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793932156; x=1794536956; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mVFhMdPaOpZaZhoFk4x/27qwSHFs/IDKrnB1S7WQ5Wo=;
        b=vpPbsyMDyvXlJbES0nYy3W6sGcBHhhPru9EAU4gE6/XB7rzBHWf17mG6+Vy5ya6Lb4
         nxhc4JhJ/HF0mrZnI9Sa8FHOz49xNtE3cRSaz37+4vAE/WesRqru0Va53kIeabLOOyxB
         qLO/VI9LlQX+D3yaYJCwUL2VQEncqu21M6Ut7PYpx4LN8cLzeYWrskJYr7/m62jcQPi6
         uiNtycFxu5/8qU/PjLw+7cEdnGE8SlJboWv6vz5Zeyj0gDPv/OiVVswpHh8qBYIclnGL
         AYX1ukywU5hdwMt/1RLAwG8sm5E3E0LcB4UvOKPUmX8QhILcnmL1nTR0C8A4RsdxbbBp
         3iEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793932156; x=1794536956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mVFhMdPaOpZaZhoFk4x/27qwSHFs/IDKrnB1S7WQ5Wo=;
        b=euL6fFNYD2hbZJSFa9pehuRaD+l6skKddwfeWCBgTT3xcwb8njzR4miHWdQUClWLWy
         m0RKKXIS4+iJ4iQIMAl86N8HDvRk5MFbzldyXrqBqen+g+HDE8Lbtt/6E0F5N8vjrbqQ
         od8mkgxdst4+aBSqqfy/f2nrAviKrZ5UrdkpO/oi9AavPd8F8SRq4LV50+MJYywFs0LX
         InuHnUw2baW6DLTRIRKRG3TMYH0gvzxBkTX4v+bZJTZujHZTYv6lkzpYRxl9uXJP/I5x
         5o/rpp2nQRYlivQiZ9mUGssAKwAgbbDXmMptuLm0S7/Ctjla8xQNWQDJsL21qkfRe9Il
         PbEg==
X-Forwarded-Encrypted: i=1; AKwUvBy1eLQNi2jZdlRl6xyVuV/ltqY30Ua++CWEPNzDHxLHtOkuNE7XADQJjrhWFy8EaC40K2xGSlFRVEVMB3UIiaIc@lists.infradead.org
X-Gm-Message-State: APuU4Z+OL08PhNo1B73THq07jRPP8GxCoSJPe+521tsNM7MQ1RHJD6Tf
	BYyTaMQSPIfpnytC7En+UHjeqjCoageFLsTZgiqTKtMY/E2tk7qGpM4G
X-Gm-Gg: AYBFou0jRaWH3LKQvE062hBy0ucZ9h26L7Vx3pF9wX1RPGhlVUndEFMq5vZOAKO6ffY
	BxNCvAGHB85ZsO4qYi7BGwMs9ZVHE9BBNtqu8N8P6HYSKKI+rWMacPbrMD/qdgHP9BH8aDUk3/r
	6WdIPCGBtgR39wr/eGraPYKUEs9EDGm6wRWGOksFOii2t6WxbA3jsl1GlP7ykaMEY5LD2id4mCX
	DF7CuBcbGNnfxwM+tKbSQaiLZPtPl3E/aHPF5i0rBgGaTsoGA+zP+Ka9H6i4xFVjYlJibta6v8H
	lrDNm3+2VdCLw2CEAZg5g5nnZk+FxMzQTfaRu9GNXGyxvacGC5O+2lWa/HlVsfnJv/7QvUF8iUj
	kue4xnNYozP3XL0oh6Bd9Th3WQeH310QsCwOA4GvGoDYshyZZurnQDS3Ggoqi1UPDQaI1oWIRcM
	3d/xsAgGIQnyWi5JqPQYc/gK1krpax528F+g8Nol6AeAz/UGB9tK9gIjW3K5sEBXU2h3vsOlfI1
	NwiekRX+91c55EZz9ynrY3wUgWQGByx1TXvrjxswYLKseztoE0Ci3r0xPrRR5YvruLwiX5Y59pO
	Kk41O4bUY348pMe6Uzg5FxsU7WcScLNK+q/noRmO3YM1Rw==
X-Received: by 2002:a05:7300:f58b:b0:368:7c9d:1577 with SMTP id 5a478bee46e88-36f75e295e2mr1519316eec.20.1793932155955;
        Thu, 05 Nov 2026 18:29:15 -0800 (PST)
Received: from debian.prasanth ([103.183.205.43])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa8e3a47esm1700358eec.6.2026.11.05.18.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 18:29:15 -0800 (PST)
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
Date: Fri,  6 Nov 2026 07:59:05 +0530
Message-ID: <20261106022907.10735-1-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105152348.8567-1-prasanth.padarthi10@gmail.com>
References: <20261105152348.8567-1-prasanth.padarthi10@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_182916_893672_7F3212F9 
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


