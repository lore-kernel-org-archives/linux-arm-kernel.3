Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D0D0C61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 13:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Nrtawmz/l2kJlxf14lBuIRFXxza9PhF6FCdzs55q1I4=; b=xBg41eMGbBZLWK
	qBWw7DfzREZ1JPX3JC35EoBrZHkrkIr1IriUpqh31sgdxZlgY+9/59Otnzvsly8QXTFfgIMPKuDva
	GRfezHeWjBYFKmdG65Fgqu402+48kINHGPmmnbk4UNMNqn1Qwg+KdeprURumX86jXjX2IMTf0wW8s
	gDIPiblO+c7YD5ApPs24cfPYe++yiugeCiwI1bqsPLzMgRAnSrBWmP9hPAuW/x8k4upVjEXnY14JT
	Uhvj/6t0bHdBq2k0ngFxaCk21WHviExg8wPGuj/G4OcOfz0mAzjLgArOAq74FhOlYbom4rUwEEQJ0
	2HKjNFOd/ZJvj2IOhrXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzx1S-00000005utB-02T2;
	Fri, 28 Aug 2026 13:53:34 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzx1L-00000005uow-2xxz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 13:53:28 +0000
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=nAW61X2/KsfUrHv2WqkCt5+3ZFTAgwwKdDIGfKpdPGniI9rWa5n7V0v/b/5Bc5yy9JoUQjryGxRq+MOsx5ZndP94fWtqlwucrlgSiY0y44+88/ykzJ6IJex65T19hdCZpi5HH3HFGRVXILvJgXCuAi3ck1oL/f3WhavJ2SKbS5ECDgcncJV/fHRvT0UVujeDF4TrKsoXLO4zKtejANiiOyJaTZxNTFz79YX1nQmAPIzD9CO0O/v4v5XUWhjzNzhu+ji0rZYaCHTpZnCJAx6NxbZEwrSkVIVETBKuRa8F4DkvUCyJhncrpJCTrHi30EFyuNA6FQ2At0BM0w/6QXGurw==; s=purelymail2; d=purelymail.com; v=1; bh=/u8UW5KKLLAQ7lE94rbg2jTG076DDNl8pi0T5YsPqXc=; h=Feedback-ID:Received:From:Subject:Date:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1236780859;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Fri, 28 Aug 2026 13:52:50 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Subject: [PATCH 0/2] arm64: dts: mediatek: Fix pinfunc headers of two SoCs
Date: Fri, 28 Aug 2026 15:52:45 +0200
Message-Id: <20260828-mt6878-header-fix-v1-0-b70dc9b2479c@mentallysanemainliners.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MSQqAMAwAvyI5G7BFavQr4qG1UXNwoRURxL8bP
 M7AzAOZk3CGrngg8SVZ9k3BlAWMi99mRonKYCvrKrKE6+moIVzYR044yY0UoqltMK0bJ9DuSKz
 6f/bD+36Wt25kYwAAAA==
X-Change-ID: 20260828-mt6878-header-fix-8bd142b196cf
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Linus Walleij <linusw@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787925168; l=895;
 i=igor.belwon@mentallysanemainliners.org; s=20251104;
 h=from:subject:message-id; bh=/u8UW5KKLLAQ7lE94rbg2jTG076DDNl8pi0T5YsPqXc=;
 b=EE+2KyOZ6REjfgYNnoWEC37uIZ6e4QDtYry3/QrBnOwIYdh1aBk6en9BUD3pczEmQ4hkBgeLC
 6aJplp4Ho6iCA+hdjZ32rYfOKUzjhSReRMWQDYeA0WdH/WH5ZkkLNxo
X-Developer-Key: i=igor.belwon@mentallysanemainliners.org; a=ed25519;
 pk=i9++1bbnBwoyc3uhTaetGXS1TbBJoS0mcxT59GrpYh0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_065327_806719_9ADAF3D4 
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

Hi,

these pinfunc headers were including a header ('mt65xx.h') which is
outside of the search path (it's in dt-bindings), thus causing a
build failure (CI couldn't catch this since 6878/6893 don't have DTs
merged in yet). Use the correct path, following other SoC pinfunc
headers.

Best regards,
Igor

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
Igor Belwon (2):
      arm64: dts: mediatek: mt6878-pinfunc: Fix pinctrl header path
      arm64: dts: mediatek: mt6893-pinfunc: Fix pinctrl header path

 arch/arm64/boot/dts/mediatek/mt6878-pinfunc.h | 2 +-
 arch/arm64/boot/dts/mediatek/mt6893-pinfunc.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
---
base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
change-id: 20260828-mt6878-header-fix-8bd142b196cf

Best regards,
-- 
Igor Belwon <igor.belwon@mentallysanemainliners.org>


