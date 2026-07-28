Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A267FC53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 17:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:From:To:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=codNecv5Ga0OZsoKh5kIJHL+xXCveIbjgEFKKqPfpe8=; b=M7JYwv7eI8APw2svdCY9Y5R5t7
	0I+XjyZxjuiOV4ipOsFQv1IrEm+qPnPMXtukR2VX809FnEqbGwGxVHdMxvmfx/ZQa9U+Ap79M5QPf
	RMNq5lHt5zZMqUOL7BIf9YII06fOYC3O9ROSorOFTaZNOdW9M1U6xjXVCEved7iI60BEgSsim5VhP
	RCgQtYAnW/QSOezhntTe0WNTOzZd1rwaxRQjsayPuTToY8eVxAWCMRDjYNttK0qCyCcsFM4Pxuwky
	08ik2dUyiNsKRkHowCPbWFmYihehS/4kJU4k2yDuacYQx69+89gMGUZy0ycefEppE35BRjYYYVtR+
	aF6Sd53Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wolsq-0000000621w-0MZC;
	Tue, 28 Jul 2026 17:46:28 +0000
Received: from mail-43100.protonmail.ch ([185.70.43.100])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wolsm-0000000620G-3FaF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 17:46:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1785260780; x=1785519980;
	bh=codNecv5Ga0OZsoKh5kIJHL+xXCveIbjgEFKKqPfpe8=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=aHKU96SYX5aYfO8MimMWu+EC0RUV02MgOzfg14LusIjrJMTmglrvO/G3mpVoPBvcq
	 AeSPPEBZduIhyg9Zk6whmPdk24GBmqRE4oPnIcW3ALPnv3mC2UjK6ZG8x1a7n/anqu
	 N97EooEIOvyKAPgvSKo7sd+YBq+7v/kgNQMLnwgMjIORQuplcYeijqrV3zETuMM4Dq
	 eq6Awe9wN53mW99ArTyE2LdZrLT4Yug1d5PtB1wJVWGWXb5T37ZomkccuvFAAAkAE1
	 bNC3f79wlfTxJkRdj3F+eHEnPdz88sXMj1jOEw6iFYuNzHigthJIT4T8mY6AxCD8Nr
	 lSlcT8yTV+y9g==
Date: Tue, 28 Jul 2026 17:46:14 +0000
To: Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org
From: Cole Munz <Munzzyy1@proton.me>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Alexey Charkov <alchark@gmail.com>, Alexey Charkov <alchark@flipper.net>, Sebastian Reichel <sebastian.reichel@collabora.com>, Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: rockchip: rk3576: add cache hierarchy information to CPU nodes
Message-ID: <8a8f808a4c7b8325bc253add15e51b396a7d62d1.1785260742.git.Munzzyy1@proton.me>
Feedback-ID: 209578162:user:proton
X-Pm-Message-ID: 29d2fb200abbb3471881b4defe10ff7d7a3fe040
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_104624_966298_2C57018E 
X-CRM114-Status: UNSURE (   7.27  )
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

The RK3576 CPU nodes carry no cache properties, so cache_setup_of_node()
fails with -ENOENT on the first CPU. That error propagates out of
cache_shared_cpu_map_setup(), which discards the topology arm64 had
already derived from CLIDR, and the boot log gets

  cacheinfo: Unable to detect cache hierarchy for CPU 0

Add L1 i/d cache size, line-size and sets to all eight CPU nodes, plus
per-cluster unified L2 nodes wired up through next-level-cache. Sizes
come from the RK3576 datasheet: the Cortex-A72 cluster has 48KB L1 I and
32KB L1 D per core with 1MB of L2, the Cortex-A53 cluster has 32KB L1 I
and 32KB L1 D per core with 512KB of L2. Line size and associativity are
architecturally fixed per the Cortex-A53 and Cortex-A72 TRMs, so the
*-sets values follow as size / (line-size * ways).

With this applied, lscpu reports the full hierarchy instead of only the
level, type and shared_cpu_list:

 NAME ONE-SIZE ALL-SIZE WAYS TYPE        LEVEL SETS PHY-LINE COHERENCY-SIZE
 L1d       32K     256K    4 Data            1  128                      64
 L1i       32K     320K    2 Instruction     1  256                      64
 L2       512K     1.5M   16 Unified         2  512                      64

Tested-by: Alexey Charkov <alchark@flipper.net>
Signed-off-by: Cole Munz <Munzzyy1@proton.me>
---
 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 74 ++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts=
/rockchip/rk3576.dtsi
index e12a2a0cfb89..656513aa999f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -117,6 +117,13 @@ cpu_l0: cpu@0 {
 =09=09=09dynamic-power-coefficient =3D <120>;
 =09=09=09cpu-idle-states =3D <&CPU_SLEEP>;
 =09=09=09#cooling-cells =3D <2>;
+=09=09=09i-cache-size =3D <0x8000>;
+=09=09=09i-cache-line-size =3D <64>;
+=09=09=09i-cache-sets =3D <256>;
+=09=09=09d-cache-size =3D <0x8000>;
+=09=09=09d-cache-line-size =3D <64>;
+=09=09=09d-cache-sets =3D <128>;
+=09=09=09next-level-cache =3D <&l2_cache_l>;
 =09=09};
=20
 =09=09cpu_l1: cpu@1 {
@@ -129,6 +136,13 @@ cpu_l1: cpu@1 {
 =09=09=09operating-points-v2 =3D <&cluster0_opp_table>;
 =09=09=09cpu-idle-states =3D <&CPU_SLEEP>;
 =09=09=09#cooling-cells =3D <2>;
+=09=09=09i-cache-size =3D <0x8000>;
+=09=09=09i-cache-line-size =3D <64>;
+=09=09=09i-cache-sets =3D <256>;
+=09=09=09d-cache-size =3D <0x8000>;
+=09=09=09d-cache-line-size =3D <64>;
+=09=09=09d-cache-sets =3D <128>;
+=09=09=09next-level-cache =3D <&l2_cache_l>;
 =09=09};
=20
 =09=09cpu_l2: cpu@2 {
@@ -141,6 +155,13 @@ cpu_l2: cpu@2 {
 =09=09=09operating-points-v2 =3D <&cluster0_opp_table>;
 =09=09=09cpu-idle-states =3D <&CPU_SLEEP>;
 =09=09=09#cooling-cells =3D <2>;
+=09=09=09i-cache-size =3D <0x8000>;
+=09=09=09i-cache-line-size =3D <64>;
+=09=09=09i-cache-sets =3D <256>;
+=09=09=09d-cache-size =3D <0x8000>;
+=09=09=09d-cache-line-size =3D <64>;
+=09=09=09d-cache-sets =3D <128>;
+=09=09=09next-level-cache =3D <&l2_cache_l>;
 =09=09};
=20
 =09=09cpu_l3: cpu@3 {
@@ -153,6 +174,13 @@ cpu_l3: cpu@3 {
 =09=09=09operating-points-v2 =3D <&cluster0_opp_table>;
 =09=09=09cpu-idle-states =3D <&CPU_SLEEP>;
 =09=09=09#cooling-cells =3D <2>;
+=09=09=09i-cache-size =3D <0x8000>;
+=09=09=09i-cache-line-size =3D <64>;
+=09=09=09i-cache-sets =3D <256>;
+=09=09=09d-cache-size =3D <0x8000>;
+=09=09=09d-cache-line-size =3D <64>;
+=09=09=09d-cache-sets =3D <128>;
+=09=09=09next-level-cache =3D <&l2_cache_l>;
 =09=09};
=20
 =09=09cpu_b0: cpu@100 {
@@ -166,6 +194,13 @@ cpu_b0: cpu@100 {
 =09=09=09dynamic-power-coefficient =3D <320>;
 =09=09=09cpu-idle-states =3D <&CPU_SLEEP>;
 =09=09=09#cooling-cells =3D <2>;
+=09=09=09i-cache-size =3D <0xc000>;
+=09=09=09i-cache-line-size =3D <64>;
+=09=09=09i-cache-sets =3D <256>;
+=09=09=09d-cache-size =3D <0x8000>;
+=09=09=09d-cache-line-size =3D <64>;
+=09=09=09d-cache-sets =3D <256>;
+=09=09=09next-level-cache =3D <&l2_cache_b>;
 =09=09};
=20
 =09=09cpu_b1: cpu@101 {
@@ -178,6 +213,13 @@ cpu_b1: cpu@101 {
 =09=09=09operating-points-v2 =3D <&cluster1_opp_table>;
 =09=09=09cpu-idle-states =3D <&CPU_SLEEP>;
 =09=09=09#cooling-cells =3D <2>;
+=09=09=09i-cache-size =3D <0xc000>;
+=09=09=09i-cache-line-size =3D <64>;
+=09=09=09i-cache-sets =3D <256>;
+=09=09=09d-cache-size =3D <0x8000>;
+=09=09=09d-cache-line-size =3D <64>;
+=09=09=09d-cache-sets =3D <256>;
+=09=09=09next-level-cache =3D <&l2_cache_b>;
 =09=09};
=20
 =09=09cpu_b2: cpu@102 {
@@ -190,6 +232,13 @@ cpu_b2: cpu@102 {
 =09=09=09operating-points-v2 =3D <&cluster1_opp_table>;
 =09=09=09cpu-idle-states =3D <&CPU_SLEEP>;
 =09=09=09#cooling-cells =3D <2>;
+=09=09=09i-cache-size =3D <0xc000>;
+=09=09=09i-cache-line-size =3D <64>;
+=09=09=09i-cache-sets =3D <256>;
+=09=09=09d-cache-size =3D <0x8000>;
+=09=09=09d-cache-line-size =3D <64>;
+=09=09=09d-cache-sets =3D <256>;
+=09=09=09next-level-cache =3D <&l2_cache_b>;
 =09=09};
=20
 =09=09cpu_b3: cpu@103 {
@@ -202,6 +251,31 @@ cpu_b3: cpu@103 {
 =09=09=09operating-points-v2 =3D <&cluster1_opp_table>;
 =09=09=09cpu-idle-states =3D <&CPU_SLEEP>;
 =09=09=09#cooling-cells =3D <2>;
+=09=09=09i-cache-size =3D <0xc000>;
+=09=09=09i-cache-line-size =3D <64>;
+=09=09=09i-cache-sets =3D <256>;
+=09=09=09d-cache-size =3D <0x8000>;
+=09=09=09d-cache-line-size =3D <64>;
+=09=09=09d-cache-sets =3D <256>;
+=09=09=09next-level-cache =3D <&l2_cache_b>;
+=09=09};
+
+=09=09l2_cache_l: l2-cache-cluster0 {
+=09=09=09compatible =3D "cache";
+=09=09=09cache-level =3D <2>;
+=09=09=09cache-unified;
+=09=09=09cache-size =3D <0x80000>;
+=09=09=09cache-line-size =3D <64>;
+=09=09=09cache-sets =3D <512>;
+=09=09};
+
+=09=09l2_cache_b: l2-cache-cluster1 {
+=09=09=09compatible =3D "cache";
+=09=09=09cache-level =3D <2>;
+=09=09=09cache-unified;
+=09=09=09cache-size =3D <0x100000>;
+=09=09=09cache-line-size =3D <64>;
+=09=09=09cache-sets =3D <1024>;
 =09=09};
=20
 =09=09idle-states {
--=20
2.55.0



