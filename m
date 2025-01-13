Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFE2FC02180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 19:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zQuLNus1VAxZrNBZ43k6Ya2LjBOws5SGp9azJjVVqPM=; b=fTAcnp0aQcM8P5Dxr2MeeGWbWK
	xKiSEURYZE7KVqHx/Tbntqo6+iNsXsQ3HQj8UgbIuE/zC9UfhLG6njtoRzAmeRhrmKhy+M3a2AqdM
	10jYvNWhRFSzAAP1jI+xmA3X1bv74+zDOfZK4c4i9Y724vsT/sWMi91sOMRZMMDVQXqjaPbqXuz63
	QagrnQHl1vzYI0meLj2RwA3s+QdO4h2SjhvCI8x67mtxnLuRX3ZX9kxsX1utXWhlh+f8fIcq5tvWe
	lsNp6iR5tGQNLEJDSXxwtagbJsn5ewellzVFI2YS/LzD5upsLo3LoYWMC9UNme9nftdBw7iKNKzz4
	96LE3wkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXQBA-00000006Ob4-0rkO;
	Mon, 13 Jan 2025 19:32:52 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXQ9t-00000006OHK-2JRs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 19:31:34 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-218cf85639eso126204295ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jan 2025 11:31:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736796692; x=1737401492; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zQuLNus1VAxZrNBZ43k6Ya2LjBOws5SGp9azJjVVqPM=;
        b=j3kpRKXRVbFdaru+LWkbdUO/PxCn/NFZS5GhVeWqkx2Hhc3qZ039tT74DlU8ySRlCA
         VVrdlSAZvLu6Ywbxo3B+Hn2/Pa1BXSgyddEtkPN2QBR0ZPGcslTpO/4Vrb5WvXoyqLTF
         tBl/L2nOk5joc1p7Ndg+UxM8101L80UxhknkbrXu5K09544eGa0kjuyMcM3/wI8Rtx+D
         6OARmeFiJBTfi03hPSl1L33JZq+oKWlvHLFRHWo/nTJn5d/+zCU/084th3iNxbktALol
         xR0rumOoVQBKetvGM77SXK2wiy3Fcm4qZwTFkxYvnl0weMxbzx4dAVOXsj+JqKTcqjm3
         0JFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736796692; x=1737401492;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zQuLNus1VAxZrNBZ43k6Ya2LjBOws5SGp9azJjVVqPM=;
        b=E6IwH9GDjk8CY1ZztSSGSTRBikhOjPBZfDj67e0LJGaI7QMK6s3u5V1DIuSRanhcB8
         efE1JXsfTh2Tk9nKeFtdb/e3MJOYPSa8S1ZKhnP4zGhlyo0PlO1cQhyMGGPHXN+0k3TG
         Us3A1cHWsROcQmOyn79xveelVAkdL8Fc4I0f0dbZnRbAjpjTOH4V01fSsKgst7OVBNEl
         FX1Ra9WmPWBcx7gspn0Kq1CZG/eL3apw9eTExAvKrHjweNkZ8Oqz0t27Jq3OOFiqpUUy
         oMTgPapGgPV1BHRlQydMvdZks7QUsKPiE2PSM6E1FMALA+e2p+AR8SwXtRhbP0GumaHO
         TYgg==
X-Forwarded-Encrypted: i=1; AJvYcCWaIvlBFbte2iSct3YmPSfHa5zquX+XNE227mNyRxOlE5NBBei5LrwEvCwSG9btdpbpPth/NBy36S8AC88N9d/q@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6i52e5fFg359GotZ7nMKc/FWfDDNDQcDx4HbcoC/DMLLy/VK+
	61l0I9nUEDGd2l8a8GFMmFjzE4sG7lzgNWPdlgUbMUs/jBmLdDLllO5zQJZui1ssrGF359JsJqt
	ZiUv6Bttn5Wftkjj6kyKPrw==
X-Google-Smtp-Source: AGHT+IFTTR9jWVG4vVEvgyv+yC8hp1O0OmOvPiyAoIVKcAx8u7/sqAUQ1P0efNDOYAB1okcT0cVybvPbu9xCmAhOiA==
X-Received: from plkl13.prod.google.com ([2002:a17:902:d34d:b0:212:10e4:fc1a])
 (user=jingzhangos job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:cccb:b0:216:4d1f:5c83 with SMTP id d9443c01a7336-21a84010cb0mr327348885ad.47.1736796692096;
 Mon, 13 Jan 2025 11:31:32 -0800 (PST)
Date: Mon, 13 Jan 2025 11:31:26 -0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.1.688.g23fc6f90ad-goog
Message-ID: <20250113193128.1533449-1-jingzhangos@google.com>
Subject: [RFC PATCH 0/2] KVM: arm64: vgic-its: Enhance debugging with debugfs
 and tracepoints
From: Jing Zhang <jingzhangos@google.com>
To: KVMARM <kvmarm@lists.linux.dev>, ARMLinux <linux-arm-kernel@lists.infradead.org>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Jing Zhang <jingzhangos@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_113133_590729_0BFC7C98 
X-CRM114-Status: GOOD (  12.76  )
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

This patch introduces two significant enhancements to the debugging
capabilities of the KVM VGIC ITS for ARM64 systems:

* Debugfs Interface for ITS Tables:
  A new debugfs interface is added, accessible at
  /sys/kernel/debug/kvm/<vm_name>/vgic-its-state@<its_base_address>.
  This interface exposes the internal ITS tables, allowing developers
  to inspect the mappings between Event IDs, Interrupt IDs, and their
  associated target processors. The information is presented in a clear,
  tabular format, making it easy to understand the current state of the
  ITS configuration.
* Tracepoints for ITS Commands:
  Tracepoints have been added to cover all major ITS commands. These
  tracepoints provide detailed information about each command execution,
  including device IDs, event IDs, collection IDs, and other relevant
  parameters. This allows for fine-grained monitoring of ITS activity
  and facilitates debugging of complex interrupt routing scenarios.

Motivation:

The ITS is a critical component for interrupt routing in virtualized
environments, but its complexity can make it difficult to debug and
optimize. The current lack of visibility into its internal state hinders
the ability to diagnose issues related to interrupt delivery, performance
bottlenecks, and configuration errors.

This patch addresses these challenges by providing tools to:

* Inspect ITS Table Mappings:
  The debugfs interface allows developers to directly examine the ITS
  tables, verify the correctness of mappings, and identify potential
  misconfigurations.
* Monitor ITS Command Execution:
  The tracepoints provide a detailed log of ITS command activity, making
  it easier to understand the flow of interrupt routing and pinpoint the
  root cause of issues.
* Improve Debuggability:
  By combining the static view of the ITS tables with the dynamic
  information from tracepoints, developers gain a comprehensive
  understanding of the ITS's behavior.

Implementation Details:

The debugfs interface is implemented using the seq_file interface to
present the ITS table data in a user-friendly format.
Tracepoints are defined using TRACE_EVENT and DECLARE_EVENT_CLASS macros
for efficient tracing. Tracepoints are strategically placed within each
ITS command handler function to capture relevant information.
The patch includes necessary modifications to the KVM Makefile and VGIC
header files to incorporate the new functionality.

---

Jing Zhang (2):
  KVM: arm64: vgic-its: Add debugfs interface to expose ITS tables
  KVM: arm64: vgic-its: Add tracepoints for VGIC ITS commands

 arch/arm64/kvm/Makefile              |   2 +-
 arch/arm64/kvm/vgic/trace.h          | 135 ++++++++++++++++
 arch/arm64/kvm/vgic/vgic-its-debug.c | 234 +++++++++++++++++++++++++++
 arch/arm64/kvm/vgic/vgic-its.c       |  58 ++++---
 arch/arm64/kvm/vgic/vgic.h           |  33 ++++
 5 files changed, 430 insertions(+), 32 deletions(-)
 create mode 100644 arch/arm64/kvm/vgic/vgic-its-debug.c


base-commit: 9d89551994a430b50c4fffcb1e617a057fa76e20
-- 
2.47.1.613.gc27f4b7a9f-goog


