Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94CAEC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Apr 2025 19:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pm6Ke0wkj25xIp2D+EIkTyl7FbF6j4pSl/QsQEKqKB8=; b=UzEbhCyuiz6rO/
	MyjBdV30JZIhZ47tCqljYL03Qh7uy5GSs0j5H0QY+96QRK09r3OQ1Rk/kFbdF3cfDHgYb+RSVFVDE
	Ni4QYMTUVeFwlqkr9cxqHmNnUOCY24VitjlV3cGSHB3YRimA7K/LpRypXKxyhDKtT65URkND/7PYk
	gUqFvX/6eAqQlUSCGcFh2NQkFThn7gjyCbzB73JlBRUUbjU2cOns8lSnjS5HN6jFi+Pui2EgPKjtz
	mD/aERRxh2XatwXHgcoN9A8CYObvMKEbkCtcXn2f7H7jvlc5Bd9KpkVzcilUMGu9RRqKwYCzc7+Al
	foUDDwEpQMRrwd95ez/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6a12-00000002uz8-2LJ3;
	Sun, 20 Apr 2025 19:07:44 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6Zuk-00000002ua1-3fU1
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Apr 2025 19:01:16 +0000
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=0xX/eF37cMhK7cmWjEm/0Fjxpgl2dGrqC8Ncj0HoRIUsN9iF0ur+EWqMzvZTIcLM1ii7hrfnhW/pfq/+pN8JD4jx5czfL8OzmxfyATqK1Bz+nPdfgPF1gPwe4Q867tqhEX2E0J4NlgIqXx8fCsCpQbg7eDq+AmeTkpNzl9Q2xoIbwHUugo/6PVweGDHdEfcZ9tGVZxdhL3deHJfpoTXEb+iDIRFObh9kYr91Wsa0CVCwiGls6KQejlQ+G6DteurXmoLKrifNjhYnwKC/FLYuOJdw8pMPY5KHU5SY+a3wMf9O3sDExxIZKXOJzcnSpB2qqer1es0MCNQ4Q4fU4z94vQ==; s=purelymail3; d=purelymail.com; v=1; bh=f31ZqoUi2cLrlBE6sOstnrARr8afP+5sSmKf/ykpvkU=; h=Feedback-ID:Received:From:Subject:Date:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1640089901;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Sun, 20 Apr 2025 19:00:40 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Subject: [PATCH 0/2] RESEND: watchdog: Exynos990 WDT enablement
Date: Sun, 20 Apr 2025 21:00:37 +0200
Message-Id: <20250420-wdt-resends-april-v1-0-f58639673959@mentallysanemainliners.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFVEBWgC/x3MMQqAMAxA0atIZgO11IpeRRykjRqQKomoIN7d4
 viG/x9QEiaFrnhA6GTlLWVUZQFhGdNMyDEbrLG1cdbgFQ8UUkpRcdyFV2x81QRvnIu+hdztQhP
 f/7Mf3vcDFeigy2MAAAA=
X-Change-ID: 20250420-wdt-resends-april-7617c6044d69
To: Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-watchdog@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745175638; l=1062;
 i=igor.belwon@mentallysanemainliners.org; s=20241206;
 h=from:subject:message-id; bh=f31ZqoUi2cLrlBE6sOstnrARr8afP+5sSmKf/ykpvkU=;
 b=aeMb1mip4EuNFqnut4/hMZguKoBKG/Zi7/f1mbPVfUPZVCbVdFvTE4znVX8+yT+f8d+8MRYBh
 DeRPJLpgeT8D/uu+14I3oXVub138Ah77Vj20pHmReqMqoGxPvVmOU8y
X-Developer-Key: i=igor.belwon@mentallysanemainliners.org; a=ed25519;
 pk=qKAuSTWKTaGQM0vwBxV0p6hPKMN4vh0CwZ+bozrG5lY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250420_120114_981452_A48E20D8 
X-CRM114-Status: UNSURE (   7.43  )
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

Hi all!
This series enables the two clusters of the Exynos990 watchdog timer
to be used. Weirdly enough, this SoC is missing the cl1 cluster, it has
the cl0 cluster and then jumps over to cl2. As such, new cluster index
code has been added to accomodate this oddity.

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
Changes in v2:
- bindings: Fix cluster-index limiting
- Link to v1: https://lore.kernel.org/r/20250217-exynos990-wdt-v1-0-9b49df5256b0@mentallysanemainliners.org

---
Igor Belwon (2):
      dt-bindings: watchdog: samsung-wdt: Add exynos990-wdt compatible
      watchdog: s3c2410_wdt: Add exynos990-wdt compatible data

 .../devicetree/bindings/watchdog/samsung-wdt.yaml  | 11 +++---
 drivers/watchdog/s3c2410_wdt.c                     | 39 +++++++++++++++++++++-
 2 files changed, 45 insertions(+), 5 deletions(-)
---
base-commit: bc8aa6cdadcc00862f2b5720e5de2e17f696a081
change-id: 20250420-wdt-resends-april-7617c6044d69

Best regards,
-- 
Igor Belwon <igor.belwon@mentallysanemainliners.org>


