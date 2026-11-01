Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A729E606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 22:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CSyypfMS;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PCCDnJu5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=XRvRDso/7nPZytfvh9i/Caaj8XKSnRZSw/8wKdSxLLI=; b=CSyypfMS/ebp93
	52SdBKd7oEycD0yUeYryIjPN+f2pBoRBGN6A17SIxo4J1F1fOEfsa2v0WyTEAB2HmIbVFbbmdNn71
	A5/DSzHbsBWAjDPBATGhgV9u1t6j3PD2zODGwf7I3r5CcGnlxOf47Tr6t2WbPizpouB1n5qtjDFAX
	ftuF/Ns1B9RR9z3i+rwUbBLRR7s9BCrOxKY2sVi7BwpeO66G8gOVqEhLwXfP1em7+0c2GWLo8aenj
	vCtcaT/fSbAwVR8EbrQVIoSVr97v93XaSX5ssr+6cfikDJZs1Yauy7zGD9bggqq+gWzWtDUu7VVVf
	QqSvF2Th5JZbxnQxNcVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNe6G-0000000F8s9-2Y0Z;
	Sun, 01 Nov 2026 22:32:28 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNe6E-0000000F8rL-02YQ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Nov 2026 22:32:27 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-48e0d1da913so1766071f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Nov 2026 14:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793572344; x=1794177144; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XRvRDso/7nPZytfvh9i/Caaj8XKSnRZSw/8wKdSxLLI=;
        b=PCCDnJu5NRdUvqHtHa08205V1TtTl8ecdcdfqp+TRvhHyYm6NSa6ZDWubEflAq7V+W
         DuVAjbPbcSn48WFdiZaFMGmtSTyqEDd8O6NUPT95JflpA3Vjtx92NXC3sZYQITRwzeiE
         Epl4IPRu66NLZEsqyTMAXD94wBIjj1B3pOabOEYv7IBcQ4QVL+Z4eaTPDId/GyxDJSTM
         q1gNYMufqiLcXf5FD17Sed+S4F2YakhXBVu9nZ+ZFrSIfPC39RLQm+KRk9Zcy8IOhp+L
         zHIgKpK62N5wczDxiThIUcOKl6tQaRvTRDs6wGbFkIdkAcHkT/LKelxQ2LZ81INwoVz1
         PCow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793572344; x=1794177144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XRvRDso/7nPZytfvh9i/Caaj8XKSnRZSw/8wKdSxLLI=;
        b=W5ZmOnrBkqBLhxmqMh3oMJGC5iXqgu2iFSus4C3Za38ON+dT/4nweitgH/UznLJtE4
         Rzamcon0BOGeIowUl9gad5Pc0MX97rgdM3GOQcY7pCJrScjw1AYlMUiGTSC+QYCtcEuY
         pZphwIqDXsK+4Xx+L74I6Af5s8Sn9qeKwhmrStRs827XL+DCi1ihTrVSfU+iiS/4Sgis
         Cd+r6AILGLyluJ709yj6PS1luVz7O0F1P0vEWSkYcaYFlrItShtZ66a/PyK2SLhSXtnt
         arGQ+CnbDY7BTnJlmhe/S4LUG4NHehpPTyFlVvjvj4ff+GndBIpdF+3w8Nrt2xxmKrVG
         Rwtw==
X-Forwarded-Encrypted: i=1; AKwUvBzdIKaD/RAyIETuHQ0MyoYwuEz2wN8G2KoyDUg69OOJsUZu7ng0Qdppg6vLNACejET87Zk9xmyc9/ZFlEpQ6wUj@lists.infradead.org
X-Gm-Message-State: APuU4Z+JbdA79Q/61DxJzjRtsqMbyT5AsBt8Rjh5RsHdJzvN1yIeMGL3
	1FLlchHxAtQwmmVi+3qjg9cPBWH84K5KD+fLCwu2pa9wlBUciIq2u8zm
X-Gm-Gg: AYBFou0cbFK30HMjAEfLrsVGwYqiycRuPcqURk82APVtUwVxgslBUtQvV6jTHj7ltM3
	hwGtLAzklsdzCJJLolZ22z+yZDXShZLvRIWsO5UeuaKz2hTn84WYbgwu+qMX3Uti/t9PVvkSpu9
	msSWcFwpCsvGSr5B6/1jFn0W8l2MnAx3AyJgspEBVB2/wQrYbhdDj3OVw88T++U3KTXLko8mRHo
	sBFe2fgDvlBhYzf5VTTGbuUv3fArQLKF2qzrt4o5mWqaFqq0FpRWYyRmlHu/qU0F19K3yNZynr4
	gSytX7B4HiL7BBm8zSGROxwTxr3D3o3v6i4PnxjvyqIQ7TpfdRLkJ8h7SFSFnrmZGuvMuBpxZz8
	A4MlwjZXJN+1VblWZCOPFlXZRS4nPu2uL/V6TIO8/vk8NpnOTe2la8daWFr1PLH7sO0ZBnpeYZy
	lmgn026voEv1oHyMiLHjIe54nY3+2yPBI6GDTFo78vtzns6/R04LVX4kAHWcYxQRjTxcDmP+eZ8
	pmgUWvbBjJ/EmDiNZ7342gAPuDFiFQUS6gsygf0kJFAD/2zbkWWjfl33TbXFm0Z76hasruKcbVx
	bJDENbjtOesyi4cmLrf2ce2/HtPFQvyVXQbS8BrhwDq4LumOP89iPD7JM7nqDnM575oh+Lt/X9n
	DnUKEmrqv0A==
X-Received: by 2002:a5d:6308:0:b0:48e:884:affb with SMTP id ffacd0b85a97d-48e64cd42famr20330228f8f.24.1793572344037;
        Sun, 01 Nov 2026 14:32:24 -0800 (PST)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78f95sm14904805f8f.28.2026.11.01.14.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 14:32:22 -0800 (PST)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Andreas Kemnade <andreas@kemnade.info>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 7/7] ARM: imx_v6_v7_defconfig: drop the SY7636A MFD option
Date: Sun,  1 Nov 2026 22:31:25 +0000
Message-ID: <20261101223125.302001-8-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261101223125.302001-1-pmazzini@gmail.com>
References: <20261101223125.302001-1-pmazzini@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_143226_050879_74F0F6C8 
X-CRM114-Status: UNSURE (   9.89  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.1 (-)
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
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The SY7636A is no longer bound through an MFD.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 arch/arm/configs/imx_v6_v7_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6_v7_defconfig
index ed588add8d31..f02b5605e533 100644
--- a/arch/arm/configs/imx_v6_v7_defconfig
+++ b/arch/arm/configs/imx_v6_v7_defconfig
@@ -239,7 +239,6 @@ CONFIG_MFD_DA9062=y
 CONFIG_MFD_DA9063=y
 CONFIG_MFD_MC13XXX_SPI=y
 CONFIG_MFD_MC13XXX_I2C=y
-CONFIG_MFD_SY7636A=y
 CONFIG_MFD_RN5T618=y
 CONFIG_MFD_STMPE=y
 CONFIG_MFD_ROHM_BD71828=y
-- 
2.52.0


