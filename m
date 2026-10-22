Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 162BB606A319
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 08:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jYTlr6ql;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=paitTs9q;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=AEhiFeJ3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qCWsWZXzlIkVJ1bwg/ctXg0ZlNLI2VEgz60sAmLxP3s=; b=jYTlr6qlP4cSHCz6ck+M5P/v18
	RTnT1d0KbeG2VUeV102nPKjtR6nzc2x+e6mSKFUf9Qv6WlwYk0zVe/AOVbNgMgHUCqcOqHZZQ9w3E
	Z34qVUr6Rr5A6VRHXWaLPX3xOBs64sFImSfp9FqSI/kyAOY2DXzTBHsOKueh0Khvx8xKlP/OK4klU
	O9V4txf4asvuJfD/M2bRYqlgLIOvX2MvmVLDD0HO6E8dj3FoXBBsNUEKSvMHy2I6zyQ/aGPgxBBzR
	4hIO/7WoqBC9gSka/Z6oVJNHHKEQJRTUDwMth86hPBn9vqKs6+JjnYhOtCFH+8XdjxTfLCmn8BYCs
	BUSdi3DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJnqq-0000000Dcuq-3CJG;
	Thu, 22 Oct 2026 08:08:40 +0000
Received: from fout-a3-smtp.messagingengine.com ([103.168.172.146])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJnqn-0000000Dcu3-2qy4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 08:08:39 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.phl.internal (Postfix) with ESMTP id 8A6A9EC0096
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 04:08:33 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Thu, 22 Oct 2026 04:08:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1792656512; x=1792742912; bh=qC
	WsWZXzlIkVJ1bwg/ctXg0ZlNLI2VEgz60sAmLxP3s=; b=paitTs9qANsKZvIo99
	GI9ouujB8FAtVpC/h3GDMex8Da/32VmqexeW6krGkzwe5DwZ4CQunnlklSp39gqg
	eE3a7/KlVTXyop/R0h8QWqSjkOZpsm9vN5f0SMmaQgMtM6627f6mAX1Okljyy5eO
	PwYkgrcDLi5GKb+rY4/Aa4caX1VOWcSSbzZycpC4QkHBoMkdn1mRzCCS4Y4ugTjT
	YJTpIEhqMkUKJhIMjPOGi+nW5wK35XSCWPG3zfnqagVdX8RTBoMR0mnOvZauMcBB
	WB1ajM3bxY+BXTlT0SUxog5zbCyF7ifBQ1/7h70KI7c1Tlqcv0N9pKCt8J7MML4Y
	CxMA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1792656512; x=1792742912; bh=qCWsWZXzlIkVJ1bwg/ctXg0ZlNLI
	2VEgz60sAmLxP3s=; b=AEhiFeJ3Ljdbt8HsMUcUNlitKocqLR2Vz8bjVGor3TEn
	patX7XSlMhaA74/KekMnUQ+gGzK4sxdgLYUQQQQHyzstD0quIzKgRaUGzrtdZfXk
	kFVkqlS2hc88Bc8Ezom/+N79nfsjby0FHUnzR5QBIzZ0GTkG3ZhELCiLGO+PEE7C
	BAALepJAfYFlj/tYdqcJgTS0qEE1G45BnuFDX+HHYsvqpeiQlQw76Ft4gYN2TGZa
	Bvc4wT+mX9D1nhtDEkFN+IghXcsT4iqyCLL3p/wto9kOMLlzUUWPwcAXtVu2nXQG
	njW3x7guhMgqjqOdel46ZMr7gP4iq8g3WgEe7SA9xQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792656512; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm1:rsa-sha256:iM7ey/7jldk06Gt2l+HEgN+dPgAIQmZ2DueoIJHZeUSekwt
	25Zmc6ua4FuIrZNPiO88rRW8UccWmljTLb1/Di5HizqskNml33Kwnx6frMS0l0m7
	vmo+Hbl7PIknMyWHWLjBNSJOtcdfTOiW0/luL3bGAbSNFyQdGmrQ6bbjNqW+uWnB
	cFXuEGrDZtYKg5R+aCJEkdGoHyFjCDpJVUll6vRA2haYoQWm8ZhsVjf+3NeJVAMx
	0A5gUxCzryj0iv3VA+KlKgEgA76UKFdM37HupQxj7L+Tk6pN7TZdqsBJQLC0IP1V
	k0iMaryzTZ0O4OebQ0GGy8uj2TraLLTqR+O/Ujw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=10;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:VBLg5YZtKwSL01YbU5JCaXHeChAmfQl8LIVHi09UDdQ=:036vB2x/PkQq8v8OBqvh3qALNh9htmEL0DcMl4FNkfo=;
X-ME-Sender: <xms:fsTZamDCCiGL-CaDdP379PxqTvMCDsOd__52AE8awZrXQbWunXKPVw>
    <xme:fsTZarXWRQiA-eRPcc8A6dt2lNUwncgLSV0tWb0ShOr7WpNPwP8C-GeWRhGSZeL9o
    gWsogNb3-vXQqYT75r49T7GJu2DWCrqP1YJuJLXsDo01pflzQU65gWj>
X-ME-Proxy-Cause: dmFkZTFhNJk4VCqz6DYoNlXTSkJrnGFc5admzae8p8EL2R8LQluaUApHOMwtUK97WfxmCO
    cKgys9XYom4tF6WqSdustQCIWxgJrAetY0hGgGaIoXA7CKM42YJgfuv2EeF1UHPFKscL4m
    NEZefm4wPilajjgG/Cp4e1Np2mlHUIpmpwBgTRI5lkqXpqKIYoLkVam8vOlgKbLDhaY3JM
    96qEUHWp3A56ZjLLY36zQ8vNkLIkzBURD09BHMn3b+nO0ZEr8NO/HRXiB86a4OhVFFJLMI
    SlmwBTGv1HMMTJaQ5yW1KP1niP4TSjGyzYCzJbwn+CXQh8f8CuSYOSQ/tuvUgpuQWDUkfg
    l1DFpthnVh/KnRmO5qnZ5zlaWt1ehGUuDGrXadK40D+eR4MH5ECSL9S9OxEQvYbRhpbqxb
    2MPsZ/mS5NWrZG4X6+CHMwvStQQW8sINmLMAibhh2NN2Ab86jnTI0jGaDGrZp7OUCE7RkI
    lnDBKHpa22ls5xnZ2vp7xpf/0CIlzBeDnLKTs6JgMcLwS1fO7ydLEOPBRnWf71GTF80xWo
    o4S1UMft8Bx+S/YSIHVMjuVFudUbtvhSw7q8C0um6+lfl8We5o7V0soJRoMyi0Yp1ntfxo
    kE+THAbIZ8j5rL8hSgVZIqjMf3tSjp8BuD4FyO606jWHEPBCiQTOiDB+KpXQ
X-ME-Proxy: <xmx:f8TZavuMwy8djJw7D0dDBl1ysndNZpZHnrZVm2jNX9sb6CmY6Gdyug>
    <xmx:f8TZanVvfcMrQPE4M5DU4QNrRqh58thiCUy1Nu5yL6SdO9AojJiwqw>
    <xmx:f8TZarElesdIdwjKcYcn-VMwEZrDkFp0vl6KqGfh0gEe4QPipFtbJg>
    <xmx:f8TZap08rG8GBaM7JAy4lt8_PRxsjgrLPZRA4mzn2NVNJ9fT8R0coQ>
    <xmx:gMTZaoli7a0deJm3p66BEiXs2gOJoU_MjbjIXj-pWIv0mDx6VaEYXCXA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 02C6432A0097; Thu, 22 Oct 2026 04:08:30 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Thu, 22 Oct 2026 10:06:59 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <6c776ba1-f114-44c3-96ee-938dcd7ac82d@app.fastmail.com>
Subject: [GIT PULL 0/4] SoC updates for 7.4
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_010838_255527_717DFF94 
X-CRM114-Status: UNSURE (   9.39  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

At 1252 non-merge changesets, the 7.4 cycle is rather large for the SoC
tree, and most of that is arm64 devicetree updates, with smaller changes
for riscv, 32-bit arm and drivers than the last few times. In both
drivers and devicetree updates, Qualcomm has by far the most contributions
including two new SoCs and 22 of the 81 new boards, followed by NXP
with 19 new machines.
Other new SoCs include the Apple M4/A18pro and Google Tensor 5.

There are a couple of trivial conflicts between the soc/dt and
soc/drivers branch from a driver that ended up getting merged along
with the DT changes, and from defconfig changes in a previous bugfix
branch.

I had originally planned to include a larger update[1] for 32-bit Arm
to remove most of the remaining legacy board files that were recently
deprecated. As the idea was to still have them in the LTS kernel and
there was some confusion whether that would be 7.3 or 7.4, we ended
up deferring that branch to 7.5, and the associated drivers likely
won't be dropped until 7.6.

The contributions came from 309 individual developers, the most common
ones being the usual names:

     49 Marek Vasut
     43 Krzysztof Kozlowski
     40 Abel Vesa
     36 Krishna Chaitanya Chundru
     31 Thierry Reding
     29 Francesco Dolcini
     21 Lad Prabhakar
     21 Frank Li
     19 Svyatoslav Ryhel
     19 Judith Mendez
     18 Dario Binacchi
     17 Chancel Liu
     16 Janne Grunau
     15 Yureka Lilian
     15 Luca Weiss
     14 Mukesh Ojha
     13 Peng Fan
     12 Taniya Das
     12 Joachim Eastwood
     12 Geert Uytterhoeven
     12 Chuan Liu
     11 Linus Walleij
     11 Konrad Dybcio

The dirstat is:

   0.4% Documentation/devicetree/bindings/arm/
   0.7% Documentation/devicetree/bindings/clock/
   0.1% Documentation/devicetree/bindings/input/
   0.1% Documentation/devicetree/bindings/power/
   0.1% Documentation/devicetree/bindings/soc/starfive/
   0.1% Documentation/devicetree/bindings/soc/
   0.2% Documentation/devicetree/bindings/
   0.1% arch/arm/boot/dts/marvell/
   2.7% arch/arm/boot/dts/nvidia/
   2.1% arch/arm/boot/dts/nxp/imx/
   0.2% arch/arm/boot/dts/nxp/vf/
   0.1% arch/arm/boot/dts/qcom/
   0.1% arch/arm/boot/dts/renesas/
   0.8% arch/arm/boot/dts/st/
   0.1% arch/arm/boot/dts/ti/omap/
   0.1% arch/arm/boot/dts/
   0.1% arch/arm/mach-omap2/
   0.3% arch/arm/mach-s3c/
   0.5% arch/arm/
   0.1% arch/arm64/boot/dts/allwinner/
   0.1% arch/arm64/boot/dts/amlogic/
   3.1% arch/arm64/boot/dts/apple/
   0.2% arch/arm64/boot/dts/broadcom/
   0.2% arch/arm64/boot/dts/exynos/
  12.1% arch/arm64/boot/dts/freescale/
   0.3% arch/arm64/boot/dts/google/
   0.1% arch/arm64/boot/dts/marvell/
   0.1% arch/arm64/boot/dts/mediatek/
   1.0% arch/arm64/boot/dts/nuvoton/
   3.9% arch/arm64/boot/dts/nvidia/
  41.0% arch/arm64/boot/dts/qcom/
   5.8% arch/arm64/boot/dts/renesas/
   5.7% arch/arm64/boot/dts/rockchip/
   2.5% arch/arm64/boot/dts/st/
   0.3% arch/arm64/boot/dts/tesla/
   1.5% arch/arm64/boot/dts/ti/
   0.1% arch/arm64/configs/
   0.5% arch/riscv/boot/dts/spacemit/
   0.2% arch/riscv/boot/dts/starfive/
   0.2% arch/riscv/boot/dts/thead/
   0.1% arch/
   0.9% drivers/firmware/arm_scmi/transports/
   0.8% drivers/firmware/arm_scmi/
   0.2% drivers/firmware/qcom/
   0.1% drivers/firmware/xilinx/
   0.2% drivers/input/keyboard/
   0.5% drivers/memory/tegra/
   0.2% drivers/memory/
   1.2% drivers/soc/amlogic/
   0.1% drivers/soc/apple/
   0.1% drivers/soc/fsl/qe/
   0.2% drivers/soc/mediatek/
   0.7% drivers/soc/qcom/
   0.1% drivers/soc/renesas/
   0.1% drivers/soc/samsung/
   0.1% drivers/soc/starfive/socinfo/
   0.3% drivers/soc/tegra/fuse/
   0.1% drivers/soc/tegra/
   0.2% drivers/
   1.8% include/dt-bindings/clock/
   0.3% include/dt-bindings/reset/
   0.2% include/linux/
   0.1% include/
 1235 files changed, 95202 insertions(+), 11056 deletions(-)

       Arnd

[1] https://lore.kernel.org/lkml/2afd5f78-0174-4955-8c1b-be18aea3800b@app.fastmail.com/

