Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24491C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 21:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RSGCHKCFM/SKDqv72fs+p/ZaA05OeObGBlBfO75wcyI=; b=0EZY43J86eY6XpxcIhaGaA85BW
	vfDDd0LbR2hwrZQo9I630KDbxWQAAO+LzRF2n3YoO6rUWunyc9iuUHofzgq9OeXXA+Kbanv4W6at6
	RCbVcTPzcQ6TINfLp8wjfPHFrkBH3/iM1zhQ9pI9bvE+mbSnvh/gxiCfJFbHH8oVcfqPTRr6CGI4W
	AYxQbHl6y9uXYtHSCrPGmRLgqtrtocahHR8PnmshS3EpPrE+4VlGNg/c6JPAJ+Uc0AAfFDbTFL9G0
	wbUt+xAVgwJ/LZp1VNh3jpY7WnvtHU/CdD67m0kAP7MngXWnFoiDUY4+3pX2M+RPQd5cMiJLeHMkr
	+vxRO0Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuIA5-000000043A4-2w4H;
	Mon, 17 Mar 2025 21:38:17 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuI8P-000000042y6-2bez
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 21:36:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 403D2A48D7F;
	Mon, 17 Mar 2025 21:31:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF7ABC4CEE3;
	Mon, 17 Mar 2025 21:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742247392;
	bh=7oJ67FGuy24OY5JnIvvaiToTkGVyKeKv7Zed5BlGRqA=;
	h=From:To:Cc:Subject:Date:From;
	b=YwO+IchAy9nQp7J4ocK+lwOzNtG2/E7BCoqYK9kByGm8YBWx0B/wOehOeEDT3g5C7
	 iw1VDnzhyNoUg+wRIF8IHLAvc+DlD9k5J+F+aJ6fUKKf3pWNNBJDHvQH03aGX4u4Kz
	 Cy1zPVzF64PNbV+4LguSQfYOYgpvqAs/AohhKrDJLkdGEKT8rHZr7zPAxFCLxgXZjH
	 p1CW3YYKWDp5gGMJeDUcYI4vgI733eJy6nCponWYZzpk8yq/1pQY9PjHrko/Bh+sbb
	 /cstzWe0SbRGcL34Nsiy+SIbAEyu2kmlc/XCGNOLrXuA0SBimKlHqTZ8YROz7elJ+K
	 z0Eg0UjrSrRXw==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Sanjay Chitroda <quic_ckantibh@quicinc.com>
Subject: [GIT PULL] Qualcomm Arm32 DeviceTree updates for v6.15
Date: Mon, 17 Mar 2025 16:36:30 -0500
Message-ID: <20250317213630.2029212-1-andersson@kernel.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_143633_721499_7A672272 
X-CRM114-Status: UNSURE (   6.55  )
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


The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm32-for-6.15

for you to fetch changes up to adbbdcf4b2d6556721b580385ba387baca5c26ee:

  ARM: dts: qcom: ipq4018: Switch to undeprecated qcom,calibration-variant (2025-03-03 22:36:52 -0600)

----------------------------------------------------------------
Qualcomm Arm32 DeviceTree updates for v6.15

Cleanup indentation issues and a deprecated WiFi property.

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      ARM: dts: qcom: ipq4018: Switch to undeprecated qcom,calibration-variant

Sanjay Chitroda (1):
      ARM: dts: qcom: Fix indentation errors

 arch/arm/boot/dts/qcom/qcom-apq8074-dragonboard.dts | 4 ++--
 arch/arm/boot/dts/qcom/qcom-ipq4018-ap120c-ac.dtsi  | 2 +-
 arch/arm/boot/dts/qcom/qcom-ipq4018-jalapeno.dts    | 4 ++--
 arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk07.1.dtsi  | 2 +-
 arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi            | 2 +-
 5 files changed, 7 insertions(+), 7 deletions(-)

