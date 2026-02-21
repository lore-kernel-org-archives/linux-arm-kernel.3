Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74F83C61DE2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Feb 2026 12:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HxqjZ74O1Oo1/HZfWshbQKQcx3UlujgftjSBi1TAmiY=; b=ZybtM5oQo0AXMY
	22T8D198q/Ie7WDdVSZR0LLxUCy4hmxEP1sH7xq2kwltBAb63VryCdxHKyUIBk+tWUZies3ywjMDQ
	q3j46234basOuzl2QIv+sbeygqKm7cVslQcPMK2hIc5IzA17THmELMNacoo/TD2qds7ZyQkpR6qC8
	yyEMYO34fXozYaddhi+6ClWbEQRTll3K6CnMpU2gGeBLge5kYsouXL8+szGOAxRrCJvaa6jy/rVIo
	Kt42IzzL3HjYSv/v+xsU9SK+h66v8BGOjiSJWjZk2JOpkvvSiJnQ+gP1xZ6xEIVynH+OCFCYjg3JN
	irN1li0W2LDWTbc4NqYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtlhL-0000000G1cx-0uoQ;
	Sat, 21 Feb 2026 12:02:59 +0000
Received: from ms.puri.sm ([135.181.196.210])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtlhH-0000000G1bq-2ua8
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Feb 2026 12:02:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=puri.sm; s=smtp2;
	t=1771675369; bh=lElJz2q0mo7Dbf27ywzOet/wsoBKWaPVLwbz02KuJds=;
	h=From:Subject:Date:To:Cc;
	b=PePbW5/KKgzTyhAAvHH0RLr8d0GQIqE30UMFmYmDDASMHRzX8TwWh6x4wXmBptLGB
	 WzjiGkWxQKPvNqMFgmme/yNUrRHjCAcCzeBxZnBl2JDtDFzT02IXCpSrku4v4/N2vS
	 lK5RinxER8AKdcHHY+UQIPnbbABJzAPErYJ0pEMKgQ23THbSCWtwCKY6eteS3zgnNP
	 XKGQ5MCkZdO5Y8ojUXQ+ZCeAGRl8LBe6fXJxbpmuTaUF6RdhtXRPhPK06ZvVMUyhbB
	 pv/ybg2DLzG18rg+GqVY2iihmOA7poFTJ6vi35lnrJfq4bJODOfAsnmkkGZX4QHeMm
	 GzhVrgfq2Ju9g==
Received: from pliszka.localdomain (79.184.40.11.ipv4.supernova.orange.pl [79.184.40.11])
	by ms.puri.sm (Postfix) with ESMTPSA id 8AC571F511;
	Sat, 21 Feb 2026 04:02:48 -0800 (PST)
From: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Subject: [PATCH 0/2] arm64: dts: imx8mq-librem5: PMIC voltage changes
Date: Sat, 21 Feb 2026 13:02:09 +0100
Message-Id: <20260221-l5-voltages-v1-0-daa8aeedc86c@puri.sm>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MwQqDMAyA4VeRnBdmi1PwVcYOsaYaqHUkKgPx3
 dft+B3+/wRjFTboqxOUDzFZc4G7VRBmyhOjjMXga9/W3jtMDzzWtNHEhpGbrh2bENl1UIq3cpT
 P//Z8FQ9kjINSDvPvkSTvdl/INla4ri+fqr2PfAAAAA==
X-Change-ID: 20260221-l5-voltages-fe476d4cfe17
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: kernel@puri.sm, devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=744;
 i=sebastian.krzyszkowiak@puri.sm; h=from:subject:message-id;
 bh=lElJz2q0mo7Dbf27ywzOet/wsoBKWaPVLwbz02KuJds=;
 b=owEBbQKS/ZANAwAKAejyNc8728P/AcsmYgBpmZ7npDKhokjbX+6yemtwz/V5IQvX4zuTgt7ui
 UgasX+0Gv+JAjMEAAEKAB0WIQQi3Z+uAGoRQ1g2YXzo8jXPO9vD/wUCaZme5wAKCRDo8jXPO9vD
 /1VlEAC5LXbIBRnAzM+KiOwPzEIONlrtBGI2VaxRUQL6HXu3c5vUK7flltSoJ2fgbykdt3aZfTd
 FFgYvpRk/0Lg/2wKPbvJ8AK5W6f8yRGyHysD7lJ7My0evTHO0RO8h3RMbQ+dNrvPYDh9wNpXZup
 fnoeWqnV4VbmwIdww6uUjrXi20v3XTqK+QxjmA2TJXdkLfLy88mu01aUTL08L6TNRfREWtCBSMJ
 IgowFjJICHjat9SlEMoW8bUXhXpJWSO6qMaLvlHinVuBHp0UA0kIckxdTQ5PlomVCfSPyK/W5I6
 vqq6GRSZMW2ZVPZbDE7O1ax6MrCgNeMLlBNvmxt0B6d9trCxYCq1v0wSdM4UIzduACvlFh4962E
 GuUs7X0zwQhU2Z/caLB2CyamUkPl3E1DrBTnGZEJM5wpx3UJ3NA1cuAuXmjPHho2cz7lcm2ueCo
 ejfUkfJ8cKGinD8tWM74awMtvgtDGwjCkkcKGzN61duN6cPmNEDuJDVXKFFBmqtJOXL0Q7eb3SZ
 DW+wt2j939gnbysxyI72Z8r0/kTKHuVbLQhbPvPlI/125IKza6JZUa9zn9MypTqOXVDJNXE0obu
 98RDAl8Qt/KdtBXOZwcPP5e+1EoQ1urE+FZFqCXbT10aEVVe0zyZLxigsVm8x67KmqixgS1IKJ0
 o2j9iBn3TouUq1g==
X-Developer-Key: i=sebastian.krzyszkowiak@puri.sm; a=openpgp;
 fpr=22DD9FAE006A11435836617CE8F235CF3BDBC3FF
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260221_040255_893768_AF08900E 
X-CRM114-Status: UNSURE (   6.01  )
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

Simple changes to bump the voltages up to their nominal values to ensure
stable operation across all units.

Signed-off-by: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
---
Sebastian Krzyszkowiak (2):
      Revert "arm64: dts: imx8mq-librem5: Set the DVS voltages lower"
      arm64: dts: imx8mq-librem5: Bump BUCK1 suspend voltage up to 0.85V

 .../arm64/boot/dts/freescale/imx8mq-librem5-r3.dts |  2 +-
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi  | 24 +++++++---------------
 2 files changed, 8 insertions(+), 18 deletions(-)
---
base-commit: d79526b89571ae447c1a5cfd3d627efa07098348
change-id: 20260221-l5-voltages-fe476d4cfe17

Best regards,
-- 
Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>


