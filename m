Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 227C4CCF2E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 10:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=omFol1kBir27uCA/vjpJf7UGYllpXSc0axyEClWUjwE=; b=fD77wnnLEfypS8sy7HSuac/EzS
	pxjbt9iY2lcExI6iZGGIDW4mxoARlDYIRtrNPOjUFvFDoTv5RfzVQs+E4C62UCrNGjJ1hAOzbo9Iq
	FAdNVKtq7KVpcyues0U1n2NI4HXWzJHwChUVdpGlceiuf5Tl+hMd6EF37YnYXbjWoEUdOFUAfh1Pc
	vAi4rEGUms9N60ykAlq03Fo+28udjmsXiXkWQUVs776g/FNJmo4T00dVTopdmJ1efSrLD9UgT5MLX
	n2eooiS8B2jDPaQHrawsQf/8Xrcf0/joA09DZqCibJtHcokxWUA8bFgYBy8B/lnBrwp+3xgzfHxB9
	NeeyyDKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIkXB-00000007AiE-2GXo;
	Mon, 19 Oct 2026 10:24:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIkX9-00000007Ah2-24Ia
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 10:23:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8369543CD0;
	Mon, 19 Oct 2026 10:23:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 62758C2BCFC;
	Mon, 19 Oct 2026 10:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792405438;
	bh=EQ/IbfNS9nKNdAEu6jhHR5zYzZlCmz/vHhGduVDUTHY=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=hD+z2gltoW/k4FmSkPQdNNc4KTvEhagNVFWQlB/K8EL3YhFWDDajT7SE4R35jU1go
	 u7Rfj27VMEJVsB8fR+dp9xj6J9b8FDgENdXOOGWSJRkG5rnqVZzHAtoqH9C8DJ4RKR
	 eRa6ukXZrZYh0iatAhhFFvFFBr7ihNF1Y9SshEyJG/otyjtozsi23Mhs/7f9NwzWdp
	 x1w+cy/wCKd+1lSv21jn/hJx0PJHDwDsGT97l/ucjYcitpmD0Bl1xnJv5L2QFVZ0o9
	 v+YhSW45ULjOYKiFnqUXAp2w3RUsQ8JF0NuSSCYB/8vqUv2elRYB8jQcBVBf0fUspw
	 ZL2sULFcnsLXw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF7ABCCF2D3;
	Mon, 19 Oct 2026 10:23:57 +0000 (UTC)
From: Aiden Isik via B4 Relay <devnull+aidenisik.member.fsf.org@kernel.org>
Subject: [PATCH v2 0/5] arm64: dts: exynos: add initial support for Samsung
 Galaxy Watch FE
Date: Mon, 19 Oct 2026 11:23:46 +0100
Message-Id: <20261019-for-next-lucky7-v2-0-c4ecab4b1c4c@member.fsf.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALLv1WoC/2WNQQ6CMBBFr2K6dkhbRdSV9zAsGJiBqlAzBQIh3
 F3AuHL5kvffn1QgcRTUdTcpod4F55sF7H6n8iprSgJXLKystid9NjGwF2hoaOHV5c8xAYqRD5d
 YY4GkltVbiN2wFe/pl0OHD8rbNbMalQutl3G77M3q/erJX703oOFomdFiYjCzt5pqJIk4cOSlV
 Ok8zx/wV4ZVxQAAAA==
X-Change-ID: 20260815-for-next-lucky7-e5bf3950bdbe
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aiden Isik <aidenisik@member.fsf.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3551;
 i=aidenisik@member.fsf.org; h=from:subject:message-id;
 bh=EQ/IbfNS9nKNdAEu6jhHR5zYzZlCmz/vHhGduVDUTHY=;
 b=owEBiQJ2/ZANAwAIAUknAbLEetfrAcsmYgBq1e+6YjzaaPOzeBdhgf8S+2tZ8ccJTr788n1nN
 SbeCkHVQR2JAk8EAAEIADkWIQSDy8UkXGpc3JNbEaVJJwGyxHrX6wUCatXvuhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQSScBssR61+v+1hAAyy3DLescGXWNJZh8B+AdAfWdBRZxlE3
 38Dt+0/UzbzWuN7RVY5UHqJHK6iHb9AaZ0JKv8lO4SPKmhjQ/dmwwezLjnKaHaqZhF3qHk7r7od
 vjtif9aUFVWoKGlON94ARrFvfb0AnLEfvj0aWRkOmIYmsjx+gBiXarh4aewaBRvniN5lF7S1XyN
 lHWkE04UzYTcpJgQfuyTp2b8BpD3Zynv1Q0YnQI8xpap7q/hq3sC96W5h047GU0nuUVELxH1iG0
 sq5Yve+dEHP2MXe0+3yFg1prfzae/2tZTOp01Cm2sjCkiSdR8N0vZZE5HYQvf2lqgdaa56GAfxy
 V9QsKySOyn0OrMoUdEf0JGhqmEgnvqYr8JHXU3Cf9ScJylqr4Awv813Y7FO1F99WDuuAJ81ltI3
 LWITfKehVjKTzhGuRWvCGYZGH17XUgX8BNR86tVTWNsZBLKH5x7/1fDG/J0xFx6HfVFIvJq3eut
 G7eRz90KDKxoJm8/14TPq/Odmnq1K3xpLJVsU2/R6i7AV5A1Q7aul7TeW7zHI0ycX9+aGjGGpTr
 BgLgJnm0vViKvGF1SYK4ACjIGefSgB//rBZV7KucW5ALRybBo0RLNnWpkUBcKoyl7Nuk6ffAgPd
 Huj7PemM6FIyiSyDIQcbQhq2N5CymzQWZJj/AWytUNZ8EBq+Iftk=
X-Developer-Key: i=aidenisik@member.fsf.org; a=openpgp;
 fpr=83CBC5245C6A5CDC935B11A5492701B2C47AD7EB
X-Endpoint-Received: by B4 Relay for aidenisik@member.fsf.org/default with
 auth_id=956
X-Original-From: Aiden Isik <aidenisik@member.fsf.org>
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
Reply-To: aidenisik@member.fsf.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi there,

This patchset adds initial support for the Exynos5515 SoC, along with
support for the Samsung Galaxy Watch FE (codenamed lucky7), which uses
this SoC.

Support for the following is added:
- Bootloader framebuffer
- Both CPU cores
- Memory
- Generic timer
- Watchdog timer
- CMU_TOP, CMU_FSYS, CMU_PERI clock management units
- ChipID

Currently, these device trees support booting the device to an initramfs.

There are quite a few regions of reserved memory, where usage of them
can crash the system and/or cause unexpected behaviour. Currently, most
of them are named "misc-rmem@addr". They will be given names as their
accompanying device drivers are added and their purpose becomes apparent.
If you would like them named feel differently, feel free to let me know.

The VGIC maintenance interrupt seems to be unavailable on this SoC.
I cannot find any reference to it, nor usage of it, anywhere.
It *could* very well still exist, but it is a mystery for now (and also
not a *huge* deal on a low-power SoC designed for smartwatches).

I am getting checkpatch warnings on this patchset advising to check
MAINTAINERS as new files were added, but I am ignoring them as the
entirety of arch/arm64/boot/dts/exynos is covered already.

This patchset depends on [1] for drivers and device tree bindings.
Note: This dependency was merged into the linux-watchdog tree.

[1] https://lore.kernel.org/all/20260821-for-next-lucky7-watchdog-v4-0-d070cee5009f@member.fsf.org/

Kind regards,
- Aiden Isik

Signed-off-by: Aiden Isik <aidenisik@member.fsf.org>
---
Changes in v2:
- Fix patchset title
- Fix DCO email
- Fix style issues reported by dt-check-style in strict mode
- Added patches which were accidentally dropped in v1
- Fix reserved memory and make all memory accessible in the memory node
- Remove redundant PSCI 1.0 cpu_* function IDs
- Extend GIC registers to correct size
- Correct GIC unit address
- Correct CPU unit address
- Document unavailable VGIC maintenance interrupt
- Remove references to dependencies which have since been merged to this tree
- Link to v1: https://patch.msgid.link/20260817-for-next-lucky7-v1-0-42ffb2b71ba2@member.fsf.org

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Peter Griffin <peter.griffin@linaro.org>
To: Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Aiden Isik (5):
      dt-bindings: soc: samsung: exynos-sysreg: Add compatibles for Exynos5515
      dt-bindings: soc: samsung: exynos-pmu: Add Exynos5515 compatible
      dt-bindings: arm: samsung: Add lucky7 board binding
      arm64: dts: exynos: Add initial support for Exynos5515 SoC
      arm64: dts: exynos: Add initial support for Samsung Galaxy Watch FE

 .../bindings/arm/samsung/samsung-boards.yaml       |   6 +
 .../bindings/soc/samsung/exynos-pmu.yaml           |   1 +
 .../soc/samsung/samsung,exynos-sysreg.yaml         |   3 +
 arch/arm64/boot/dts/exynos/exynos5515-lucky7.dts   | 219 +++++++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos5515.dtsi         | 189 ++++++++++++++++++
 5 files changed, 418 insertions(+)
---
base-commit: 993e1bec85faedf90c5d27480793084e54357c09
change-id: 20260815-for-next-lucky7-e5bf3950bdbe

Best regards,
--  
Aiden Isik <aidenisik@member.fsf.org>



