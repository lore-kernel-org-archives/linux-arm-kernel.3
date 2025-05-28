Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77923C5B54E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 11:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=c0iW/U/nUqvOQ7J0H4VgNkdwQTWLfOhImt9apFskbxg=; b=Kbupc2ab7SrLtDcUq82jvfKXtU
	5QH++fSPXeBkl18+cHJYtvnWsaVk2nUHNvH+6wl7rNPG0hqb+jkDgr/HabPG7FCNY0R+c6XgtMIio
	MZkRmBma98IlP2snSdVUnqBj1af9eeZnpdv8CWUXNE3h6YEWqqOW2Xfa+zZz2mQvYa8AXGoASd0V4
	frEz5rDBZl3S8Qg2Wxe1wiiNqGAePon6Ft6qXFgepUNR1hlNcSWwfrtVbfEz1N4ES0Zwh0j/19PJF
	6aTM52AUGVeEIc4jSLvziJI+rkWC8SJE16kDoKDP6UzdEJq+nB2g8QLyrCfBdTGv7dcXIskHUtDSY
	F0l/ZKFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKEj6-0000000CwzJ-2YwO;
	Wed, 28 May 2025 11:13:40 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKEVi-0000000CvnU-2VEo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 10:59:51 +0000
DKIM-Signature: a=rsa-sha256; b=wC/syr52wMuulMUWKYZxuolTsF1tja0scH6jnxyivCHhSz4RbP050A+IKhYWyLEeD0dl68gxeCGSr6HA/WNGCBCyEL/7WQkQsimaNr/P3Nd2+H6tdnLyN7Q2HIb0CJJhVIPx7oYur2I+mhqdIcQALbp5rV4bcAX9NZGibeH8Amrbxb5rYC+pwsxCTGwoTMha2ujuruVgzXI9qZvurbzli3X+6WfACbKwCN19XicIKo8ohPqwCssUxmx3Dsc50TrmFOQP/ux+QxkQS8LJyzsbOI7W8ysnrNMyWHfF5sVUJfXAGBqwGhRWB23Ec22lu4ncif5Ru7IYKGLuIF08zNw2aQ==; s=purelymail3; d=purelymail.com; v=1; bh=ACJQEalUXxRkfOQcf468xb3czMGJCzQRNaMVwiWd02I=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 68229:10037:null:purelymail
X-Pm-Original-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 715274949;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Wed, 28 May 2025 10:58:23 +0000 (UTC)
From: Umer Uddin <umer.uddin@mentallysanemainliners.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/1] Enable CMU_HSI1 for Exynos990
Date: Wed, 28 May 2025 11:58:20 +0100
Message-ID: <20250528105821.158140-1-umer.uddin@mentallysanemainliners.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_035950_710266_3BF58B8D 
X-CRM114-Status: UNSURE (   6.20  )
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

Hi all.

This series enables a new clock block (CMU_HSI1) for the Exynos990
SoC. This clock block provides clocks for the DesignWare MMC
Controller, PCIE subsystem and UFS subsystem.

This patch depends on the following series:

[CMU_HSI1] https://lore.kernel.org/linux-samsung-soc/20250528105252.157533-=
1-umer.uddin@mentallysanemainliners.org/

Best regards,
Umer Uddin.

Umer Uddin (1):
  arm64: dts: exynos990: Add CMU_HSI1 node

 arch/arm64/boot/dts/exynos/exynos990.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

--=20
2.47.2


