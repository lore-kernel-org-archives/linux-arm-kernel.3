Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB261606D818
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 22:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PtYCCgaH;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IEz+b/MV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=79uHJ8ZCxEjX3Q9dAac97eiJ3y7h4HXgB24A6lnJl+k=; b=PtYCCgaH0aVMobRjpVN97gosrL
	LVQPLj+vJUv0gQhLMPS867LVnhvHuoE3hOlcrFO6ivwO1eL8+w1TgH2N97sn23JMANOXyUvNsBDIa
	1fOh90J9Axgk1th3o+qyKGtKcA7Jj3Ev7t6lMb0COYnHeBrt/cF95fVp99BmM8Vq0w0klMB10VOaa
	uBO9TgIEQ8F7JGRAi/oEez4jKllix6YECQ7WlmnZfPiITLuO60/tYNT7H9lLh+g0lCF3dSMjRr9Y9
	Bzjds9iFp35ha7JQrs5g00XUuUOmsCWCE40SMgKxRX9x+tI/ito8nsuENeeE8ED65U7un5Dinajq5
	Y6jQDl7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP62R-0000000AoMe-1XS7;
	Thu, 05 Nov 2026 22:34:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP62O-0000000AoLq-32ep
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 22:34:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 13820438E4;
	Thu,  5 Nov 2026 22:34:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA0BC1F0089F;
	Thu,  5 Nov 2026 22:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793918068;
	bh=79uHJ8ZCxEjX3Q9dAac97eiJ3y7h4HXgB24A6lnJl+k=;
	h=From:Subject:Date:To:Cc;
	b=IEz+b/MVF5XZesrMeI3b/J/eDfZkVvdLpox3VH5vXAUu9elqCIOj9OEOddiDlZnh4
	 Gshj294kL3EKJyhpgyiWSqHwqgZmEWTTWVGuY+bg3Z4OoTF9V2fCTmBI57Gl+StJEb
	 XwSGm46iIMJMFwszRNa6wYljLvZ5TRmErqzsGFz6t2zECqvTDzTP52D+Lhot4fSI9P
	 lozNCJKIVRjkGTXJ/MlRx3FL3q8R0iCdy60SMBWgshqrZODE+n8J+/zCcyXcGdsoIF
	 5kCqVLiu81FF/HcNO/FwjOhgv4oq4EhccMTq2KysHroS+ItyiKiFYOB4PCk9TQlyYM
	 lP/mZ34gXeXsQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
Subject: [PATCH 0/7] ARM: dts: arm: Another batch of warning fixes
Date: Thu, 05 Nov 2026 16:34:13 -0600
Message-Id: <20261105-dt-vexpress-dts-fixes-v1-0-66615c3c8ec3@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMQQqDQBAEvyJzzoCrUcSvhBzctdXxoGFHRRD/7
 hhvXRTVBymiQKlODorYRGWeDNwroTA0Uw+W1piyNCudSwtuF96w/yJUbSt3skO5qULw+du7DgV
 Za/4vLP18H9bVjwjLfUbneQF6Dp8oeQAAAA==
X-Change-ID: 20261105-dt-vexpress-dts-fixes-a8ccb34b1fe5
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
 Sudeep Holla <sudeep.holla@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Andre Przywara <andre.przywara@arm.com>, Linus Walleij <linusw@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is a batch of schema warning fixes mainly for 32-bit Arm, Ltd 
boards. While all these are 32-bit Arm fixes, vexpress-v2m-rs1.dtsi is 
included by vexpress-v2f-1xv7-ca53x2.dts which is 64-bit platform. Patch 
2 fixes the last DT schema warning on 64-bit Arm Ltd boards. Yay! For 
32-bit boards, this cuts the remaining warnings in ~half.

I verified the config-bus devices still probe after moving 'mcc' node 
with arm/vexpress-v2p-ca15-tc1.dts on QEMU.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
Rob Herring (Arm) (7):
      dt-bindings: arm: vexpress-sysreg: Add "mcc" child node
      ARM: dts: arm/vexpress: Move "arm,vexpress,config-bus" node into sysreg node
      ARM: dts: arm/vexpress-v2m: Move regulator and led nodes out of bus
      ARM: dts: arm: Use standard node names
      ARM: dts: arm: Add missing "#dma-cells"
      ARM: dts: arm/vexpress: Fix Cortex-A15 GIC compatibles
      ARM: dts: arm-realview-eb-mp: Move "pmu" node to top-level

 .../devicetree/bindings/arm/vexpress-sysreg.yaml   |   8 +
 arch/arm/boot/dts/arm/arm-realview-eb-mp.dtsi      |  20 +-
 arch/arm/boot/dts/arm/arm-realview-eb.dtsi         |   8 +-
 arch/arm/boot/dts/arm/arm-realview-pb1176.dts      |   8 +-
 arch/arm/boot/dts/arm/arm-realview-pb11mp.dts      |   6 +-
 arch/arm/boot/dts/arm/arm-realview-pbx.dtsi        |  10 +-
 arch/arm/boot/dts/arm/integrator.dtsi              |   2 +-
 arch/arm/boot/dts/arm/integratorap-im-pd1.dts      |   2 +-
 arch/arm/boot/dts/arm/integratorap.dts             |   2 +-
 arch/arm/boot/dts/arm/integratorcp.dts             |   4 +-
 arch/arm/boot/dts/arm/mps2-an385.dts               |   2 +-
 arch/arm/boot/dts/arm/mps2-an399.dts               |   2 +-
 arch/arm/boot/dts/arm/mps2.dtsi                    |   4 +-
 arch/arm/boot/dts/arm/versatile-ab.dts             |  11 +-
 arch/arm/boot/dts/arm/versatile-pb.dts             |   4 +-
 arch/arm/boot/dts/arm/vexpress-v2m-rs1.dtsi        | 146 +++++-----
 arch/arm/boot/dts/arm/vexpress-v2m.dtsi            | 322 ++++++++++-----------
 arch/arm/boot/dts/arm/vexpress-v2p-ca15-tc1.dts    |   9 +-
 arch/arm/boot/dts/arm/vexpress-v2p-ca15_a7.dts     |   9 +-
 arch/arm/boot/dts/arm/vexpress-v2p-ca5s.dts        |   4 +-
 arch/arm/boot/dts/arm/vexpress-v2p-ca9.dts         |   2 +-
 21 files changed, 298 insertions(+), 287 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261105-dt-vexpress-dts-fixes-a8ccb34b1fe5

Best regards,
--  
Rob Herring (Arm) <robh@kernel.org>


