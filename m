Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAAECD185F1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 13:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aePOC97pBHo3LyNl9Tw2Gam8zqiOWiBjiaEyFML+7TU=; b=1cLX0c3EbGIMeyhg5NRcJs3+HO
	bKb8HNjdhZ/brNJnz5itgJlgva90Oexz+Nm56ZmeBa8/yeiifQPSmRyjWnDwmToSV2u7CH3KHmGD1
	+L49Hnw/4iOrEnAUxoHl6uI5D/uZ90JQAhsq/26BJUsankmv/guBiP7t+mj0QvtFL0vmu5lZkiwd2
	35HjjSU6ahBpyCHpU5mAnipdQJ9qbTYsWItr4ttO2McBsQwycncFouYSKrg0eaOsYxtij2vPCG+nQ
	wuFdPMu/W1h3+YAt0uSThOAsL/8dM3PWsnzb4Ro/IIYepjjJnkLqbM+vmhwqb3thqKDugIPq3XKjd
	EDs4MAIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdpkh-0000000H6cB-0Ue0;
	Thu, 08 Jan 2026 13:08:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdpkc-0000000H6ZD-47pM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 13:08:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 41A2E40D72;
	Thu,  8 Jan 2026 13:08:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C8F6C19422;
	Thu,  8 Jan 2026 13:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767877710;
	bh=BEFqASubnMhLuZshwv8XM1o9a6Rbhxs2caSt9SThpyQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XRMBic0G5unXBBKtPVKjxLP9Y21Uw1rOGHGXAdcJY+W+/4GY/AZXl7TsdSOv37RbZ
	 61xlZT8ixVHx4g0L7GbF8oKbMcBXdHa1+IeoRUWXbiPWkRSz0ps/8caEufs/g/hbCK
	 e8Vai3kIOSHV5bLEhiY2zY2bOZ/DBYQ/+HufR7NfR7BmbGxuvhwjPgVZl/hEw6WRIA
	 sRmxBoImpSjAgoDKZr9nnHFIcrk26Nl614qIhniVpDlqNKzx6YcIengo4fXZfhtcnn
	 9tSX4XKE1fv2yFOpANCggDXjuem8gpXLQRZDD95/UN6ftHrv8eq49KkKXgV7oqEgjp
	 7PYEnxduZarrQ==
From: Dinh Nguyen <dinguyen@kernel.org>
Date: Thu, 08 Jan 2026 07:08:11 -0600
Subject: [PATCH v3 3/3] dt-bindings: net: altr,socfpga-stmmac: remove TODO
 note
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-remove_ocp-v3-3-ea0190244b4c@kernel.org>
References: <20260108-remove_ocp-v3-0-ea0190244b4c@kernel.org>
In-Reply-To: <20260108-remove_ocp-v3-0-ea0190244b4c@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Mamta Shukla <mamta.shukla@leica-geosystems.com>, 
 Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: bsp-development.geo@leica-geosystems.com, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, netdev@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1088; i=dinguyen@kernel.org;
 h=from:subject:message-id; bh=BEFqASubnMhLuZshwv8XM1o9a6Rbhxs2caSt9SThpyQ=;
 b=owEBbQKS/ZANAwAKARmUBAuBoyj0AcsmYgBpX6xGixoksxcAk+BFIhc7a5PDFAUf6fYBGoSrA
 QcXF26GOf6JAjMEAAEKAB0WIQSgeEx6LKTlWbBUzA0ZlAQLgaMo9AUCaV+sRgAKCRAZlAQLgaMo
 9HqGEACCdtcSvnQAfq+6jLL6yfY2+XXhl5DnzWzojSs6HegHQ0ZbpDwfCGPrifVoSJXFmkD7nr0
 CltAAh4vut2VGb3rI9/x+5N01I14VcqhnKhiABEFf3YYyHYOi824DJ2sVosKuYycm3GRvHPqw7l
 wkxNNjK1DLhriPS0GSjbmBllVOwdtIYAi/MUFrybzDAT1eVKd0Nt6WUifwwx4GOR48aXPzXOImT
 iSGrytZczmKbxCRNR91MYOQPNpaupejVUiv+qk49e1Wvo5/zw1j2c8P+x4kbgIQ5hsI7I95CtY1
 Om6E9OJDZeEBg+fH+EYZAhwfRIueYWLKPi/LkJENvBkJxPWODdxTipNv5+tjfO3iV6PjjivYz2w
 2sj8/XjplvBsA2a7A30BB9KLxqqcLFubf24+DoFqOmNh3pBTAoezTfZoU6NfTk+uKKTGoh5uYZ8
 D7D+HbKQ3qJ+rSbt9PX/m+uzA4FaYZsJjR9plqPHYuXRPQfW3PfkrlZzH89f9PcSNPH3OD0k6dO
 AxxEjPE/Ky/2CCNxN+NF6DStkntbtUTJkVuCZbRwZM333eIaZWMKZmgNfizBOd4w5mUhg7Qw63D
 Zm6KHOdH9e1jh8H+4ABegP6ar0SPeJbLGeIPvccBNiypKQZGMgBtF/g0tpvcKWyBXt6ccVLmyPo
 UDCLYSxQxcxiDTA==
X-Developer-Key: i=dinguyen@kernel.org; a=openpgp;
 fpr=A0784C7A2CA4E559B054CC0D1994040B81A328F4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_050831_085636_223E73AF 
X-CRM114-Status: UNSURE (   8.60  )
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

The 'stmmaceth-ocp' will no longer be used as a reset-name, going forward
and 'ahb' shall be used.

Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
v3: Addressed Rob Herring's comments and updated commit header/message
v2: Introduced
v1: n/a
---
 Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml b/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
index fc445ad5a1f1a..8e7077d4319eb 100644
--- a/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
+++ b/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
@@ -13,8 +13,6 @@ description:
   This binding describes the Altera SOCFPGA SoC implementation of the
   Synopsys DWMAC for the Cyclone5, Arria5, Stratix10, Agilex5 and Agilex7
   families of chips.
-  # TODO: Determine how to handle the Arria10 reset-name, stmmaceth-ocp, that
-  # does not validate against net/snps,dwmac.yaml.
 
 select:
   properties:

-- 
2.42.0.411.g813d9a9188


