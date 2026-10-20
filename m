Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9BB606A319
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 23:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=e0aCBjfM;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NL00w4KL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Kel4RSYESjXcs8Dg40JwYXjmWcDIJY09nOoIQY6d2LQ=; b=e0aCBjfMYWy7Putk7xitH6gQhV
	QGK599s5reawi9tVwJJrmApmgPO5dIWBqZCyYaUKsR5ZHqB08GdSv/Yig1Ecyl2POqGUgXwYT6m9S
	Kz1vatYWs4mDuiXf8bnxQnFGGlIpsKJfISSFE0NupJ14xlz1j10nfQM6K9FAN7wC4nKlW3YdwY5yG
	wZYNeBoVzzNBJsIEkknMelcthruQk8TQ9QO1vpO92C9Te6JSbzbFB7aZZ9rpXCbrpjvd63kjxrKB5
	bFmFsgTj1W8P8R29QR1MJOSNncaV8GYKlwvqDQs3pqpuZwYCnPXr/0edTC4uN1znBsgl6h2H7s7wL
	O6KSALuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJJe2-0000000ApfM-0mPL;
	Tue, 20 Oct 2026 23:53:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJJdz-0000000Apeu-3zST
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 23:53:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5A4DE43759;
	Tue, 20 Oct 2026 23:53:23 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792540403;
	b=YrbyLersiFbL+bsZNjvQXg/p3/jq0iYO8cn5Xql/g84tRs91sGvTNKJYsEU3jZX2mMn/
	 WqFLzI2VMVAgHE/pnFI/1yNrs7bXvSbJBvYor3pvxVnb7sMwINytwQEsRxK0moUCsqg7X
	 enXWbnsXQ1hPdyhikXf29fIbBP9Jp68RD4etcYt6636ggbozafKe82Sc96jr2DttCC8aW
	 aJSbplXdpVHh26D7aXqALQ60qh6sxCPcxdQ9OgzA1Xu3sPqZufpgeUlvuhYgiWNXvPCuX
	 tiTGNjCuOOAunCN7Mbp7a+3TSa/l3eIwRkftcqvsYilAVyu9QFdThZJbQacdoqFzQjw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792540403;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=Kel4RSYESjXcs8Dg40JwYXjmWcDIJY09nOoIQY6d2LQ=;
	b=Yv2mv6uX3fyY2grTI0SlymEzU2bvzI/KXD9Abf0zyeZEdvGtXYyhqlyNmuGkQ/4MZKOL
	 h+Hy0DEHZHOCVwJ08mrgsgCxRw3xcUquqVuNiMAal7p7Pr6ipvQ8jW6bdiIJurseS1v/n
	 KtKh4fE1UKuxonz3m7ojtuKp4aZNiK3mOOYH0vNN7huLt1DjX0s/Ej2eI1NyE7YBLOKrH
	 wAS7VHHLwsU2SaiN9GT2t24fZRVqJlNGLVYaVuzbevijQLuM65YzCE84RGFL10SuITAoE
	 TA0doHrGOCtTJoqjd1ahp36wlwDkcHSwAYjYtwgDoojIOxO+L7lHu/4s4V9tiT+QnDg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2AA161F000CB;
	Tue, 20 Oct 2026 23:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792540403;
	bh=Kel4RSYESjXcs8Dg40JwYXjmWcDIJY09nOoIQY6d2LQ=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=NL00w4KLJBC3iawsBoUNIOGnDmsbentUZwRLGedSaHsGa9t4RVY2KjUFffgp27rPQ
	 Z40ynxLvfdl3x/j66cgPICq3uWnf8WuCulSKp0FUofWyQOLCtgQWpKf3JIbckTiJLg
	 l8hJ8AUXxIZhVUuy3n//6G8hriAZdCmDv3SJ/PEvXctWP5HbPFau+S3CR7EfCD38/S
	 uC8TBOm8vPUZfqugmaUDVfsD7iPeYHkr8QD6kw6Wyamm0KOstP1GnK42B8XRrFHbWn
	 6aAbwTc0w94fv3xyrBds9AcvF6pcyzFRU685VL3lTGWteL6B/7WT7Yj051nQrbGFsV
	 Yn8/elM8VaQww==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 7EC4543263;
	Tue, 20 Oct 2026 23:53:21 +0000 (UTC)
From: Michael Reeves via B4 Relay <devnull+michael.reeves077.gmail.com@kernel.org>
Subject: [PATCH v2 0/2] arm64: Add KVM support for newer Apple Silicon CPUs
Date: Wed, 21 Oct 2026 10:53:19 +1100
Message-Id: <20261021-apple-m3-m4-kvm-v2-0-04905152cc2a@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO/+12oC/3WOQQ6CMBBFr2K6drQUAurKexgWnXaAKgXSYqMh3
 N0W1i7fzP8vf2GenCHPboeFOQrGm3GIII4Hpjo5tARGR2aCizLj/AJymnoCm4Mt4BUsYIVXFJQ
 XqDSLrclRYz6b8VHv7N/4JDUnTUqg9ATo5KC6dNJONvN5127C+E6xzvh5dN9tWciS7v+IkAGHC
 rFQ2OS6zPHeWmn6kxotq9d1/QE4rRLf5wAAAA==
X-Change-ID: 20261008-apple-m3-m4-kvm-b7b9b2e34bcd
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>
Cc: Myria Sarvay <myrialsarvay@gmail.com>, 
 Yureka Lilian <yureka@cyberchaos.dev>, Fuad Tabba <fuad.tabba@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org, 
 kvmarm@lists.linux.dev, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Michael Reeves <michael.reeves077@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792540400; l=1504;
 i=michael.reeves077@gmail.com; s=20261008-m3-m4-kvm;
 h=from:subject:message-id;
 bh=G8igJOGmolem0kocmF21BJtoXeYx1AMIyTFUWr2XhNg=;
 b=3/imRnUx82pjDBOxQMAxCwDKByTwQ/pGjZVTqRy7jTjfXcIpKtcapYnyJgcn0m0DpETbDD76T
 CByrM5Dp/QaBW1o/MLetC4O2gExoXOB0vaJrXCtXkvMWIPOsb/Elnyr
X-Developer-Key: i=michael.reeves077@gmail.com; a=ed25519;
 pk=oi7WuppQ1A+qFZp9DdfIwDnpC3WZ+XY6fJK1upV/CSY=
X-Endpoint-Received: by B4 Relay for
 michael.reeves077@gmail.com/20261008-m3-m4-kvm with auth_id=1131
X-Original-From: Michael Reeves <michael.reeves077@gmail.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: michael.reeves077@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

This series enables KVM support on Apple Silicon M3 (base, Pro and Max),
base M4, A18 Pro and M5 Pro CPUs.

The first patch adds the CPU part numbers and MIDR definitions.

The second patch adds these CPUs to the existing Apple Silicon PMU and
broken SEIS workarounds. It also enables TDIR detection so KVM can trap
guest DIR accesses without trapping all common registers.

This series was developed from testing on:
- Apple M3 and M3 Pro by Michael Reeves
- Apple M3 Max by Myria Sarvay and Yureka Lilian
- Apple M4, A18 Pro and M5 Pro by Yureka Lilian

These tests also confirmed that the SEIS workaround is still needed.

---
Changes in v2:
- Add A18 Pro and M5 CPU IDs and workaround coverage.
- Add all to has_vgic_v3 for TDIR detection
- Document testing confirming SEIS workaround still needed
- Link to v1:
  https://patch.msgid.link/20261008-apple-m3-m4-kvm-v1-0-7bb4cbf3d63b@gmail.com

---
Michael Reeves (1):
      arm64: Apply existing Apple Silicon CPU workarounds to newer CPUs

Myria Sarvay (1):
      arm64: Add CPU part numbers for newer Apple Silicon CPUs

 arch/arm64/include/asm/cputype.h | 28 ++++++++++++++++++++++++++++
 arch/arm64/kernel/cpu_errata.c   | 12 ++++++++++++
 arch/arm64/kernel/cpufeature.c   | 12 ++++++++++++
 3 files changed, 52 insertions(+)
---
base-commit: a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
change-id: 20261008-apple-m3-m4-kvm-b7b9b2e34bcd

Best regards,
--  
Michael Reeves <michael.reeves077@gmail.com>



