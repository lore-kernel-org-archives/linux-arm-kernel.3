Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9392EE49BC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 20:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0SfS7It4rvjRfQ4WQvEi8GdAl8B6+kIRJmXbWAVgSfM=; b=n8/UqT9f1RUajYaeJuqxhgk7bi
	82nskVUdYpHPXJXqGTHpwbyfKKS4RvWDsl/Y+BqqG4firhTsjlRfb6nbmNtLhJjSewK6zXUF63sQE
	1YkLwe7pz1FQstkipg5iFEV8KogwNB9F7Tgtl+yPrK4hPftML/nRrQZo4JaPoId/LTpq0OxN10AfP
	eAfKWimv2zGSmcqhrG8BmSNzqrBmNJPl17Hbexr6p8VlzB4FtAOiKuX9CH/QRhvNqQPWLfv6FH/Q1
	3jAFBvFZCwKa46/mflmbACbYTb3xQdhiBrCFbQxrs1NkfFlPbvPScgPqYqlWxhsllzYpTwBipDpXO
	kogYquDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vagBy-00000005Gid-3B0E;
	Tue, 30 Dec 2025 20:19:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vagBv-00000005GhL-2RY5;
	Tue, 30 Dec 2025 20:19:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 083CE43653;
	Tue, 30 Dec 2025 20:19:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D7BEBC4CEFB;
	Tue, 30 Dec 2025 20:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767125977;
	bh=Z4EYAHZGekQfOTPPZ/bCzt9bocu5SLTKB2VfqWaqPQI=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=FuPDT1nx3mnhbx5G6nVRwGP+rZKcupMg1opSbM+WhfQGKspsTsikkcH1pfAoFAYm5
	 WstWU7fCgbElEXy0uiEPvNqZaf7hLC12Y9fM7Xi3irNv+FoXakDPDpFynLNJT8C8dT
	 eNe3EwjqmcyrPc0UlRzMPibHFSVCBXxpbgSw1b/9V99n4y4mwyRQNKZ3rWmex8j5go
	 SzUfF4cc7gCN9bcszXfkhJJiN6KM8OgifqAmb/fwBZXBvBN595CLPe64YnMC9aBfgi
	 d7WCrFRIjJfpznNY5//NgK2BoRXpzqgJoUBjD6cl6D+5hMy0IXbvFIevPDfDH2lX+E
	 SCg21RkqXajtQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C38A0EE0203;
	Tue, 30 Dec 2025 20:19:37 +0000 (UTC)
From: Ricardo Pardini via B4 Relay <devnull+ricardo.pardini.net@kernel.org>
Subject: [PATCH 0/3] arm64: dts: rockchip: Enable the NPU on some rk3588
 boards
Date: Tue, 30 Dec 2025 21:19:29 +0100
Message-Id: <20251230-arm64-dts-rockchip-rk3588-npu-enablements-v1-0-d38b182a59e3@pardini.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANIzVGkC/x2NywrCMBAAf6Xs2YU8Wg3+inhIk9UutduwUSmU/
 rvB4zAws0MlZapw7XZQ+nLlVRrYUwdpivIk5NwYnHGDdd5g1OXcY35X1DXNaeKCOvshBJTyQZI
 4vmghad6SC95kR5fRQOsVpQdv/9ftfhw/usSzmnsAAAA=
X-Change-ID: 20251230-arm64-dts-rockchip-rk3588-npu-enablements-1e2830d2e7b0
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ricardo Pardini <ricardo@pardini.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=878; i=ricardo@pardini.net;
 h=from:subject:message-id;
 bh=Z4EYAHZGekQfOTPPZ/bCzt9bocu5SLTKB2VfqWaqPQI=;
 b=owEBbQGS/pANAwAIATteP+Oex+3pAcsmYgBpVDPYd76x2JB906NyNHFhO6NnaxWsW+lO80Uql
 Ji2PwKD1t+JATMEAAEIAB0WIQSsGCMM9q/qytxIiJM7Xj/jnsft6QUCaVQz2AAKCRA7Xj/jnsft
 6UMPB/0aiS04N/PRQ7spsEThwruzr2esSQwAH9xDCV4eZcHZQTkVVHaH5RnanJ28d3fabRgZmSy
 1BmvrsltvRrqNQ3rI1Kay3RfkvZU2vn0IMEMA985DFXBjCEV43ZGCNMd2qX0JLBUZ73Q1lA4a3R
 gtXRZZqOyY368C6QyJWVjFWfQjPzWtt4X8DKKQzcWLpC6O2FJWCA1NHr/0gr6MOgpwSViPL9P+C
 fwKllrnSZeMRvupYc0FHxO5Z0JiGVY6fjB9mSAjzWSMszf6ZlvEB3ZLmfF2PdRTQKlH5FDx5KDl
 j0E+pA6o3ysj2lr2BwqUO0AVil5ptuiZRO96Ot1J6lQWk7Bz
X-Developer-Key: i=ricardo@pardini.net; a=openpgp;
 fpr=AC18230CF6AFEACADC4888933B5E3FE39EC7EDE9
X-Endpoint-Received: by B4 Relay for ricardo@pardini.net/default with
 auth_id=588
X-Original-From: Ricardo Pardini <ricardo@pardini.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_121939_649534_BDA680B4 
X-CRM114-Status: UNSURE (   7.21  )
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
Reply-To: ricardo@pardini.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

This series enables the NPU on a few Rockchip rk3588 boards.
In every case here, the required regulator was already described.

Signed-off-by: Ricardo Pardini <ricardo@pardini.net>
---
Ricardo Pardini (3):
      arm64: dts: rockchip: Enable the NPU on NanoPC T6/T6-LTS
      arm64: dts: rockchip: Enable the NPU on FriendlyElec CM3588
      arm64: dts: rockchip: Enable the NPU on Turing RK1

 .../dts/rockchip/rk3588-friendlyelec-cm3588.dtsi   | 34 +++++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi | 35 ++++++++++++++++++++++
 .../arm64/boot/dts/rockchip/rk3588-turing-rk1.dtsi | 34 +++++++++++++++++++++
 3 files changed, 103 insertions(+)
---
base-commit: 9448598b22c50c8a5bb77a9103e2d49f134c9578
change-id: 20251230-arm64-dts-rockchip-rk3588-npu-enablements-1e2830d2e7b0

Best regards,
-- 
Ricardo Pardini <ricardo@pardini.net>



