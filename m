Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AA79E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 19:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nf7kydvcPrvQg+69YiMmBljSiBHPNTdGX2EPiL3YRBI=; b=A0gKrNwlFSrDBvWSqVMCyBhOs6
	ZL+gDY2BNUyHVlUVqk26fMy88C2yoNgL9pYo9rJrHPTUgWPjhY8iIIEohuY1z+B+OeBVq8hxkTfFP
	CLD5fkBBa7TxhKnGqATW/DK2e9Z1f9XoH7/Zc9VaUqxKUeUS+iukozvxCP1s2++7hOFJ6M6P1SGcA
	RKMA8t8QjbQuUrlbMCho98Bqqgy2P7W1TzoHXxTylSN5UM4ZaMFYi/VlHAGsGmMrkIw7nGZR6Nkl4
	nIfRZazGU2bc2xALlzd5n4Cdfg/yAJUjsRE5aIZMoHoDT6qyOZzUqC+zJnLz1lpJXlqtIZCKDRq4O
	vGmCn8ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLp0x-00000001ftn-0Glz;
	Thu, 12 Dec 2024 19:38:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLozr-00000001fnB-1NTF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 19:37:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D85ED5C5F21;
	Thu, 12 Dec 2024 19:36:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6831DC4CECE;
	Thu, 12 Dec 2024 19:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734032234;
	bh=hdcrKAYIIyPuFXXVZ8CmtrVulXK1wrD6wxFqvScjbIs=;
	h=From:Date:Subject:To:Cc:From;
	b=bpplETQNFBZv3HutxSMXgLIil1ThPMeD04QQ2DMOeJ0r+ScUdezfQzVwoT/VNS9eP
	 UGaoiP+tUAn1WmE9KylxSd3hpasJ5E+RnIxke8vzzmPb4EmMDnsaLiYuJ1MWslCvQo
	 2cJ74G7RR4AATxRP7UH9XIpxEO7b2nKfW6qWh8o/wfWuXOTKD4zyZfvINCYSSFdk+h
	 d13ujdKmmUSJr+Adr3qNX/H4/KX36o3vWpr1+DPN6TG3Bt+U0vHaW0jSokCxRIprW6
	 T7RElRY8Ea0rMVm81sUDYq2wHC0624fCmzwTAqpjI3DUjzT8b0Skw6uV9IaLfw4nvn
	 JAqlAsxtozOtw==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 12 Dec 2024 19:36:32 +0000
Subject: [PATCH] arm64: defconfig: Enable Amazon Elastic Network Adaptor
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241212-arm64-defconfig-graviton-v1-1-86830c3d572b@kernel.org>
X-B4-Tracking: v=1; b=H4sIAD87W2cC/x3MPQqAMAxA4atIZgO2/oBeRRyKSWsGW0lFBPHuF
 sdveO+BzCqcYaoeUL4kS4oFpq5g3VwMjELFYBvbGWssOt2HDon9mqKXgEHdJWeK2DC5vuWezEh
 Q8kPZy/2v5+V9Py/IZeZqAAAA
X-Change-ID: 20241212-arm64-defconfig-graviton-0eda53e5d19d
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, soc@lists.linux.dev
Cc: Ryan Roberts <ryan.roberts@arm.com>, 
 Aishwarya TCV <aishwarya.tcv@arm.com>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-9b746
X-Developer-Signature: v=1; a=openpgp-sha256; l=1000; i=broonie@kernel.org;
 h=from:subject:message-id; bh=hdcrKAYIIyPuFXXVZ8CmtrVulXK1wrD6wxFqvScjbIs=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnWztnQFh2ayZYX2jrI3ujSzKsagUwM5yM6SNHfzN8
 whUygQWJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ1s7ZwAKCRAk1otyXVSH0JSHB/
 9qvkdRV1j2ni2DdfrXhTXK9fN9RAJkPBJQW3U3g1If9M3Zi9mtWDNNwJniXHWGqIKtmEUdpJ19YglK
 NdlpBuvkjC3OK0d1w0DPUBK5vxS5S7/0kM/TNPPRULWBs6PIeCuCUroeJsjQVBLwgOIF9N1iIy20eI
 W7EwvbzdGeTl0xPHH9iGuYomwjpu3U9BUgV/K0ToWB66MK8vN7hkGJfM469nlk0suhiLi/lP6oKOHQ
 XkKfUsijlTJK+6ZCAGV50tIg+calT0n3hpqV5OG5iFCZOZUH0j28XO1NxPZus3DHApjh8qTfi4+50O
 ZID6ifE3LAyZ+c+DSLAzGyygywDjjD
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_113715_412762_350DE262 
X-CRM114-Status: UNSURE (   8.32  )
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

The Graviton SoCs available in AWS use a custom network adaptor, enable
support for this in defconfig so standard defconfig builds can be used more
readily in CI. The driver is left as a module since it is relatively
unlikely these will be netbooted.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index c62831e6158633f07c1f3532fba62f09b31e7448..b48940b3d100dd03945a29735b8ba26b145d51ad 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -330,6 +330,7 @@ CONFIG_VIRTIO_NET=y
 CONFIG_MHI_NET=m
 CONFIG_NET_DSA_BCM_SF2=m
 CONFIG_NET_DSA_MSCC_FELIX=m
+CONFIG_ENA_ETHERNET=m
 CONFIG_AMD_XGBE=y
 CONFIG_NET_XGENE=y
 CONFIG_ATL1C=m

---
base-commit: fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
change-id: 20241212-arm64-defconfig-graviton-0eda53e5d19d

Best regards,
-- 
Mark Brown <broonie@kernel.org>


