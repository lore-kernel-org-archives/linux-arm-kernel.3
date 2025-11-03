Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B189FCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 12:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=N3mC2IrimTjppkhXo9GUUy1X4ukV/Q/7Ytq5A8GyzSw=; b=WMCiJGDhQb6hibt1OVVke3ahzB
	vPkbqAZfP46S12ecNJyeQC3ku/KPNHyWPBNNl2t0EUJdaOKecGm2SNFvtlwDPnF39xiAJPdrjT4tc
	xzs5Oc7RlF2d02rEP/4oQN9N0umpNl13l6UGayTZpgqKr9HoKa4imPInCkp3CnlrhXv5EwgYBfPPy
	4IzSmvwDLrD1nAGJ20HyM2FNmCiiTNEq3aDntngiXLHR8IMVUaMnf2retYCUu6D7lu1N7aM9IAg4b
	WznVBdAQTePV+gqa8uONqbSnqYYFlRAzlNN8ZqqbWLvcP2mlVs9jvn7QY4dgBRiVvdNauqSmh83QY
	XbWzimCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFu6N-00000009rWU-2VlG;
	Mon, 03 Nov 2025 12:56:03 +0000
Received: from server.couthit.com ([162.240.164.96])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFu6K-00000009rTP-48Ml
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 12:56:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject
	:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=N3mC2IrimTjppkhXo9GUUy1X4ukV/Q/7Ytq5A8GyzSw=; b=vpmKuyszMO0JHXCxcB4jw6giy/
	RP+CNNXBYo3crdrkF0RI8Xs1z1Yfc9QpALKfLQPZoIyn5Y1CldkDLEP4CKsE10imD9ulsinGjBq3y
	k81XRKIy7KbZupH324bZjB6bS9oJO5blv8i0sz7ZNyQZkz5tM76mB3AU2tbyUFEsAeQWOrdxdvOT5
	XANrGLLvvFOAJdrOT8hXJRvyfuG138RqFCKrYt2PjTShQOzmQZQuJTGzu1Bbw+SAULz78kWAQuWGt
	jvQLUVnJsA321xYrQ+N30A4nrWxb2q3VlNI/T6v45r0AxUV/f1Y/kfWhAGy4bmesxk26DbToJoAVq
	turj3K7w==;
Received: from [122.175.9.182] (port=36484 helo=cypher.couthit.local)
	by server.couthit.com with esmtpa (Exim 4.98.1)
	(envelope-from <parvathi@couthit.com>)
	id 1vFu5d-00000006SKR-2YOn;
	Mon, 03 Nov 2025 07:55:18 -0500
From: Parvathi Pudi <parvathi@couthit.com>
To: nm@ti.com,
	vigneshr@ti.com,
	aaro.koskinen@iki.fi,
	andreas@kemnade.info,
	khilman@baylibre.com,
	rogerq@kernel.org,
	tony@atomide.com
Cc: linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	danishanwar@ti.com,
	pratheesh@ti.com,
	j-rameshbabu@ti.com,
	praneeth@ti.com,
	srk@ti.com,
	rogerq@ti.com,
	krishna@couthit.com,
	mohan@couthit.com,
	pmohan@couthit.com,
	basharath@couthit.com,
	Parvathi Pudi <parvathi@couthit.com>
Subject: [RESEND PATCH] ARM: multi_v7_defconfig: Enable TI PRU Ethernet driver
Date: Mon,  3 Nov 2025 18:24:51 +0530
Message-ID: <20251103125451.1679404-1-parvathi@couthit.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - server.couthit.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - couthit.com
X-Get-Message-Sender-Via: server.couthit.com: authenticated_id: parvathi@couthit.com
X-Authenticated-Sender: server.couthit.com: parvathi@couthit.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_045601_051302_F2C6FD05 
X-CRM114-Status: UNSURE (   4.59  )
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

The Programmable Real-time Unit and Industrial Communication Subsystem
Megabit (ICSSM) is a microcontroller subsystem in TI SoCs such as
AM57x, AM437x, and AM335x. It provides real-time processing
capabilities for industrial communication and custom peripheral interfaces.

Currently, EVMs based on AM57x, AM437x, and AM335x use the ICSSM driver
for PRU-based Ethernet functionality.

This patch enables TI_PRUSS and TI_PRUETH as a module for TI SoCs.

Signed-off-by: Parvathi Pudi <parvathi@couthit.com>
---
 arch/arm/configs/multi_v7_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 12f706e2ded5..7f1fa9dd88c9 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -281,6 +281,8 @@ CONFIG_TI_CPSW_SWITCHDEV=y
 CONFIG_TI_CPTS=y
 CONFIG_TI_KEYSTONE_NETCP=y
 CONFIG_TI_KEYSTONE_NETCP_ETHSS=y
+CONFIG_TI_PRUSS=m
+CONFIG_TI_PRUETH=m
 CONFIG_XILINX_EMACLITE=y
 CONFIG_SFP=m
 CONFIG_BROADCOM_PHY=y
-- 
2.43.0


