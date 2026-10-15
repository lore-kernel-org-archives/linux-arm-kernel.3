Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65DBDCC6B33
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 17:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d21bForzayElN3WfrMmEo3BsmxbiVJsUom+3Ksb035s=; b=VGQxMfJf0QnerPk7LXz8RFuAAk
	HdOnWtw3FE6bcSO51goILGw/anSxdiOrA2jl/ZK68exQfCsYNKesnWOqC0Uv4LFUeAqWsnUgSk279
	k/qtbxUCT4+sSDgY2/vqB/qgqpeVVqqtejCpcXdNlk/qg+z/9XT8bdJXkNBywpJovD9nK5TrxCbOz
	fNzjGSBprgEmRSecpUbWO12rFO23ZJTS6ZOBdN2p5LdvvUowzAd7d06fAwJ8IMN9Vtt7Hqh0X2PhF
	Iuhalpjb6+uyJLXL8p/dWw79H7/lvif0tGVRKqwWeENDapx3SSi6h64hIcX6v0o/TluewVP3iPjPK
	s1+G5t7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHPfo-000000013of-0bQB;
	Thu, 15 Oct 2026 17:55:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHPfl-000000013nC-3stY;
	Thu, 15 Oct 2026 17:55:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2D17F60234;
	Thu, 15 Oct 2026 17:55:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C730EC2BCF5;
	Thu, 15 Oct 2026 17:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792086920;
	bh=mGfO8kBmNFsGLWeCA35XjVmhXjh+nOoiN5ErDOAAE84=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=mmGl0Bgll3ts9xqQe0MbSgyJOGnBHm2cHtuMPdzt97KSTOZS2j57GEiLN49fp1WkX
	 L6XImog2Bkz8t5LoglQ8Yr4KzCP9l7KT+qzY7u8xBJPv6iCZ2305Fm8OhJmn7K862d
	 PbSrpETjd41Qid3pt+Z/dSQM/xUpX/QNTmYYPgacsapEF1rvQNgbX/ceyHllY3az+X
	 ECQbS5MyfZVBEo0FAg1pta8gW53lzx1Ry9JpFZLL4/MfRJHstZ22eEyaftWKWUx1Qu
	 b43hSWcET9YOTXA1tX/cIW9XydpvC7OTI+6kLW6ldDHJRJ4LMX2Goz3jqD49Y8wDm1
	 AMr0YgADFx2vw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94477CC6B38;
	Thu, 15 Oct 2026 17:55:20 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Date: Thu, 15 Oct 2026 19:54:09 +0200
Subject: [PATCH v6 1/4] arm64: dts: amlogic: t7: Add cooling cells to all
 CPUs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-add-thermal-t7-vim4-v6-1-37d1c954390c@aliel.fr>
References: <20261015-add-thermal-t7-vim4-v6-0-37d1c954390c@aliel.fr>
In-Reply-To: <20261015-add-thermal-t7-vim4-v6-0-37d1c954390c@aliel.fr>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2150;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=pWfl7HrfY/sohfU3J31MDc3TckJ5tV1lL5L4g5UHqnU=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQ9ZF4RL7iPpni/7yLXnJ8ZCf41X2xIIdUtnPH+3S3Sy1N
 YDFQrG7o5SFQYyLQVZMkaV/ruWJd5ePnvm6Rz0FZg4rE8gQBi5OAZjIJSuGf+atK6OEFB7/T3YQ
 1997bfG5h5n3ondOPG0UccDw7+5g/8UMv9lnNSvvuvJVbP48k3M3K+tONNwMvpDHwRNy8fDm0Bk
 H+jgA
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openpgp;
 fpr=DFD863F61375BF917F0012173953305EF1D0EC3E
X-Endpoint-Received: by B4 Relay for linux-kernel-dev@aliel.fr/default with
 auth_id=744
X-Original-From: Ronald Claveau <linux-kernel-dev@aliel.fr>
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
Reply-To: linux-kernel-dev@aliel.fr
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Ronald Claveau <linux-kernel-dev@aliel.fr>

Add #cooling-cells = <2> to all CPU nodes (both little and big cluster)
to allow them to be used as cooling devices in thermal zone mappings.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index 6894c06a836bc..8aa85aab30469 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -63,6 +63,7 @@ cpu100: cpu@100 {
 			i-cache-size = <0x8000>;
 			i-cache-sets = <32>;
 			next-level-cache = <&l2_cache_l>;
+			#cooling-cells = <2>;
 		};
 
 		cpu101: cpu@101 {
@@ -77,6 +78,7 @@ cpu101: cpu@101 {
 			i-cache-size = <0x8000>;
 			i-cache-sets = <32>;
 			next-level-cache = <&l2_cache_l>;
+			#cooling-cells = <2>;
 		};
 
 		cpu102: cpu@102 {
@@ -91,6 +93,7 @@ cpu102: cpu@102 {
 			i-cache-size = <0x8000>;
 			i-cache-sets = <32>;
 			next-level-cache = <&l2_cache_l>;
+			#cooling-cells = <2>;
 		};
 
 		cpu103: cpu@103 {
@@ -105,6 +108,7 @@ cpu103: cpu@103 {
 			i-cache-size = <0x8000>;
 			i-cache-sets = <32>;
 			next-level-cache = <&l2_cache_l>;
+			#cooling-cells = <2>;
 		};
 
 		cpu0: cpu@0 {
@@ -119,6 +123,7 @@ cpu0: cpu@0 {
 			i-cache-size = <0x10000>;
 			i-cache-sets = <64>;
 			next-level-cache = <&l2_cache_b>;
+			#cooling-cells = <2>;
 		};
 
 		cpu1: cpu@1 {
@@ -133,6 +138,7 @@ cpu1: cpu@1 {
 			i-cache-size = <0x10000>;
 			i-cache-sets = <64>;
 			next-level-cache = <&l2_cache_b>;
+			#cooling-cells = <2>;
 		};
 
 		cpu2: cpu@2 {
@@ -147,6 +153,7 @@ cpu2: cpu@2 {
 			i-cache-size = <0x10000>;
 			i-cache-sets = <64>;
 			next-level-cache = <&l2_cache_b>;
+			#cooling-cells = <2>;
 		};
 
 		cpu3: cpu@3 {
@@ -161,6 +168,7 @@ cpu3: cpu@3 {
 			i-cache-size = <0x10000>;
 			i-cache-sets = <64>;
 			next-level-cache = <&l2_cache_b>;
+			#cooling-cells = <2>;
 		};
 
 		l2_cache_l: l2-cache-cluster0 {

-- 
2.49.0



