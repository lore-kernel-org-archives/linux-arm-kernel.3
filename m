Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7652B606A335
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 10:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2y9XYPrk;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QIHEe237
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=HgK6TVEOIn7zC6QKoOXzNuY0fBSDuFNEIC1XiOj99ZA=; b=2y9XYPrkzWzrdG
	yYpr4nsR9bjXZXrKPfL94E5plp9aOz2jNh7U+2sH9RWfpCfj4bQe0OWkiqHbTOXjvrkJi32HeyHGY
	crF9lPR2i5dPLqZc38wX2KMyxWCGH6iwip4p+lPBoMTD2+oDAUD7M3pBVMX6RkNxqm2b2PtF2YwZJ
	6J4CKkdjFVel0+R9ekZ3EfcP1QsBTWQESKtbWwWstZfWRAMOlTm1cLToS8+TGMZ2MHnOvk3T5ZCzi
	0W7OA+MyAFib94P68HYDuiOYRcFpe1t5xswzSLzZB3OTbs6hma4knVelWhO0cbqE22MgcgA5R4pRK
	uwTdaVLOrebhrp6aKvjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGuz-0000000Bre5-1HEY;
	Fri, 06 Nov 2026 10:11:33 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGut-0000000Bra5-45tI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 10:11:32 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4a208d93758so4512195e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 02:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793959885; x=1794564685; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HgK6TVEOIn7zC6QKoOXzNuY0fBSDuFNEIC1XiOj99ZA=;
        b=QIHEe237UYHNhljv9BLQdtASjUsyDehYAEC9aCB30SNlC4jvBwpepToHkvLHDACd+R
         3KwKKsO3/ONBXr+6oa1poGdVHYaO4wuh10kkowL0ZGCQkxh5EpJgGlnIdV1Mjnbm1azU
         Gn5GsIn78xvKSgR8TurKa6NhpOA/Z+6IMbgg52CMpH/LX+zBMm7Cl6EinFjjjwRQ5cje
         utfgU4yK6Ylegso9ixFW9gMajGK9COYOAyj2RPcWe25kTiZFtYZSPof7WBglhodJgG5D
         gHUNgNDoS/5SVlB6G6EBDKAOKpqv4GoxbzWedF3VO+4fK5Ndk/YVJ5jw9lg0zSjuXex0
         uJtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793959885; x=1794564685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HgK6TVEOIn7zC6QKoOXzNuY0fBSDuFNEIC1XiOj99ZA=;
        b=B4o/M7ekbF5AvWudFoMDq9nfkogdsTyH8ayNNu0MTpkPpCTXWLOnh9NBq2C6sHXmgQ
         F2Ml14squGEeGz97dY0jRIEnqHuA3I17ZvZwlGd9VlLsSTdY43RrNrD4izLdAQUGVqVz
         TK5QFHcjl04Ik4/JNVbdjqJhibWR6PiP0LHSPIFwTRSL6NfFsORyHAvPVHwzeSE400sA
         UknjcUYntgoYsmVO+Yk7HH0aQ0nXlOFzyBz7fBDMPBGj4iCtHWQKONWzdmq+4OKtm08n
         7U1+isKEjgOfRLTq7gsCUXQ6bW5Pb+I2eOg1yL0iLsKrFNPPy1GKfDpDhiKBEa7KbD8J
         BOUg==
X-Gm-Message-State: APuU4Z+0X0HHdb8XsauHdNvzMwhPVU6KB65dgCrdftZcUVWXOA0pMuPm
	5N4M1EoQajvbRCMeLogK7ngNhrY9YrgeVmFYlXCxOL9/HprLJTkcQ8PV
X-Gm-Gg: AYBFou0o0ayhy8Bpc2uKHb1V0W7zrRfnH8uas/2O2d+tpZfQ13qGqQao3fz0EsJLU9i
	fiocaMI/HZJkFxk3nFCQKvEwIpc8lSZ70OQteIg+GsGh1ly5aXN60U4nkZtz9oyb3FChHUhgl2x
	whTbN6rX3qJRUWFwqpAUnrYER4ttkeGI4brYhtN2N+XNrDJxxWKaO5bGwkv4TGDr1tnm5Kfljz4
	vPmN4tWeDX6NRWiRjT3gaowcAWPI2ycbNLdK+aUCv59dDNOH6MBCQ5+ciGgfyQJ7Xsot9CsPs51
	dlBAMEd7+xnJ+kqI42vnzgom8wvpJxOmrH4pL5zcZeg16C0epQI9uHKlD/qN6a9HZZynqMeHINT
	f6HAFRXYKQrfnD1thHNPDMsdGN/BOeJ0EdcL0NkctBLS0OlPsQdKyfVSgwBLDfoyDAAUTEGoL5c
	PBPHdwuwuHqQ3wqDMOrx8iosNpF8SP224pF2VAn4uu5DSCDn63688cYZ9P4JuGpmcWGWxl6Y+80
	V9a/hJiS1y4Zwa04rRM6TQJJxt0ljmTjNxvLyn848GULW1+CmDEYC6I8Gh6f4/3cEiL2TyCvX9E
	5XuEcthTIB2e5cs4oh7nSVksbWGh+3XOBFIeCnX5cDe+hiWtIZ8HeYEJ
X-Received: by 2002:a05:600c:818e:b0:4b3:9540:47a6 with SMTP id 5b1f17b1804b1-4b6dff86e38mr29665595e9.28.1793959884838;
        Fri, 06 Nov 2026 02:11:24 -0800 (PST)
Received: from dev.Default ([86.127.229.203])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b6e168f73fsm49575965e9.5.2026.11.06.02.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 02:11:24 -0800 (PST)
From: Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>
To: Navid Ghahremani <ghahramani.navid@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	stefandoesinger@gmail.com,
	krzk@kernel.org
Subject: Re: [PATCH v2 00/24] ARM: zte: Add support for Sanechips ZX279128S and ZTE ZXHN H3600
Date: Fri,  6 Nov 2026 11:11:23 +0100
Message-Id: <20261106101123.3887079-1-isasmendi.agus@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_021128_043560_13E2A679 
X-CRM114-Status: GOOD (  10.28  )
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Navid,

I have been working on the same board on my side. I applied this
series on net-next (0822d2fe3826) and RAM-booted it on my ZXHN H3600
(256 MiB). Working: SMP and CPU hotplug, clocks, all LEDs and keys,
pinctrl, both PCIe ports (MT7915 enumerates), MDIO with the ZX5201
and the internal PHYs, ethernet on lan1/wan, and nft flowtable
hardware offload including a DNAT+masquerade flow. Not tested: LAN-LAN
bridging, WiFi traffic, USB devices, flash writes.

I found two issues in the board DT and one in the PCIe PHY driver;
replied separately on 24/24 and 11/24.

Two offers:

- Clock driver: Stefan asked for it to be data-only on top of his zx
  clock framework. I have a ZX279128S driver in that form (based on
  clk-next), happy to share it for v3.

- WiFi offload: on my own driver I have the WiFi path offloaded to the
  packet processor (the IDM rings between the MT7915 and the PP).
  Would you be OK with me porting it on top of your driver, as a
  follow-up series once yours is in?

Tested-by: Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>

Thanks,
Agustin

