Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D2AEE6F060
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 14:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xfL5hbtlCy40Pj9gm4EfYW//zq7PdmyQW/+2ydQT1jw=; b=aHZBAVc7Pm1hxGNOsL0W0KsQTE
	cnttMALbaglPAkczGu5j2yOYcM9WYkD4Yik0kgNKtCPfRv8xE0XhnMnbWR0KKZfj6e8yagZvYmRek
	DZCYmeJe6EiTXA42ZAxjhxuZN6ppXsT2TNlSBot0eBzkpv1RLE4mKbNp/6noqzB8pzCe6VA4K+SSF
	Dpy/BoJgnhmVEnmbwV7UYIgp8ebX2OU+5M8AzbsAzyc8BMjVMOK3GsTxoEM34bhDiuZe//DgDenB6
	SAX5CYfgdFZA8TJYZXHiYNHqv+IRGDC+gUcmwcYeewGFaXGsFh3krTASr3qdOXp9G7UmD/Lby2lxI
	0xWgwdcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6sf4-00000007LQ0-2FF9;
	Fri, 01 Nov 2024 14:30:02 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6sZV-00000007KFK-40Iy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 14:24:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 10FFD5C0628;
	Fri,  1 Nov 2024 14:23:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05869C4CECD;
	Fri,  1 Nov 2024 14:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730471056;
	bh=9eJSBsDX1KEPOrBzjZskYTFJm1CTJz8fA/XLt1OpIv8=;
	h=From:To:Cc:Subject:Date:From;
	b=bDT1OGHAuCUOX83geBDrrex/2Wbius8C9uJlBz1UQpqHeZqsUPBIwBpxVqPSHrU9h
	 AIR5lz2JerpzIgrxCc/kcer0CTjgsK2e73bLndAHIi1YA0tHosN2V/ayjwe7sf5PED
	 ScN9b1YIZuUx8aQHJa/+tME+rBj1Iq9LqPE/9qSMPfjwaSafGFXVHwhdevWU/do0Hl
	 E0A6JMTZok+dpFXkOIVpS5HazoP+ipRD/WJsgR6ZV1SSYeslu+ZaA4zBULkdsO8M1U
	 koGS/Eg3/8tdGrAtGs2U3tsUwJh6/bgBO57BfFwvc/Uotui33XyKvqk4YOtlIUqhxu
	 y/ZbpgMIoqVgg==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@baylibre.com>,
	Fabien Parent <fabien.parent@linaro.org>
Subject: [GIT PULL] Qualcomm Arm64 DeviceTree fix for v6.12
Date: Fri,  1 Nov 2024 09:24:13 -0500
Message-ID: <20241101142414.737828-1-andersson@kernel.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_072418_075542_EE01ED43 
X-CRM114-Status: UNSURE (   7.67  )
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


The following changes since commit dfbe93f32c12f5628bd83303e10ba63621c259ae:

  arm64: dts: qcom: x1e80100: Fix Adreno SMMU global interrupt (2024-08-14 21:36:45 -0500)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-fixes-for-6.12

for you to fetch changes up to d92e9ea2f0f918d7b01cbacb838288bffccc8954:

  arm64: dts: qcom: msm8939: revert use of APCS mbox for RPM (2024-09-04 15:36:17 -0500)

----------------------------------------------------------------
Qualcomm Arm64 DeviceTree fix for v6.12

This reverts the conversion to use the mailbox binding for RPM IPC
interrupts, as this broke boot on msm8939.

----------------------------------------------------------------
Fabien Parent (1):
      arm64: dts: qcom: msm8939: revert use of APCS mbox for RPM

 arch/arm64/boot/dts/qcom/msm8939.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

