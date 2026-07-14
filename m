Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 172CAC4450C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 16:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7hSQVE/cIukvsNk0ljJyDr/74Kucww0/yScCm8r2HLQ=; b=nS0sdRgpT44/NdZ7KxBnqUoK6W
	Jpm/t+v47gQtK7AopATnJiDhu93ARrYR6+XzzR+HAArMRTOi5E1tJpl2V1DacswbasT6V7enEimQq
	coHFWAih5ii3af2B+naQGckF+oLuhOWHVXVM+ZnRc8nJyFm5ZZlF6B+qGDeDeJdr7n2fHT6QjOUbD
	MTNNckXJghRJuq1spOI6vbNcqXSZtoCUiY1JcEy95K0Fn7cEXZK5R/gjjj8Ynsihnf05nbQ0k+7AF
	Q1clLmHGkFr4PnbDjM64Y1jcujgLgYs3VMMqw97vOZRxz9ODbqaOM0T3C9jFTrg772CijK5rSWUis
	xbQMXz+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjg5a-0000000Cesc-09yn;
	Tue, 14 Jul 2026 16:34:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjg5W-0000000Cerb-11we
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 14 Jul 2026 16:34:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=7hSQVE/cIukvsNk0ljJyDr/74Kucww0/yScCm8r2HLQ=; b=gSTIm1odZANovRoVRgLrFQAq3u
	QyB3oGmSocknuRlBWGVX8sSh9NhbRN7EWA0w2RHtH35GnO+S//uBOGIzYGM0OstTiP2zBcevFV8Ur
	2ko1nraH8fpcZL5U4bJ2pU+OssZ9gVNO/dqZ5gyxk4TMGWk4ooOD46p+ukD41d4+ghxRHphE7Mact
	gW9QzrieQq/JZFaLHnWRMAPg70ZS9ADTog0tfkM9uygQWEN+8L4ufscCNR8CxgwbksSWNvK5DlRjw
	TlymrlaiJ16MguqRQckf0MaT+MfIA43r2aUs3RI3vpLeramBxSWPaC73Pza9pf84z/qcatM8T6+2x
	nAn7f7hg==;
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjg5S-0000000Cgy8-3YRr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 16:34:28 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-493c5220cb7so7977225e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 09:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784046865; x=1784651665; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7hSQVE/cIukvsNk0ljJyDr/74Kucww0/yScCm8r2HLQ=;
        b=IQvBQL7VXmaxbnHUcFRKAH6lja7GlI7yv6OpTZ2I+F+0JOu8TzZ5hu+C7zRPZngXdd
         QYvTR6WETPjacLf3VnIdD97xwdVK30fxN9RZM1plCxVSKWrs2z0Y6qRbgbt20loYeo4k
         UjpJc20fWy8snqRezLG6zV8SVoWT/aQpq0ceaD6UPuwmeQjPB/0UqXM+qBfUU2/uYP+W
         /NlgLAQAYLVWOy+O/f8fejebgDMSyd9EywkEJCACUAY2410qlNS7cn10ws/sbozu5wsN
         VtRj0RwipX2IjGPsmjsCl55hMAAtoEWwJgDH22iZiV+bXB35SjdiJ+glB+C+Cvs1XXq+
         dmSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784046865; x=1784651665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7hSQVE/cIukvsNk0ljJyDr/74Kucww0/yScCm8r2HLQ=;
        b=kJQ48Mt/WeL/DQmJT5Mvwf2JYCyakcf4SDKsbKFUur6PpfK00YR1cR2gj3XvhrNWcL
         3aZBzJlxX8bsXObAbU2L7/ZWC6ajie7F6nbxicQtDQ08vGxpFOwZTwid4C/cMqPMoum+
         ZeKEjy+xUveBAUHxmK+N03CjEve7shV1f42hBGub+wMJQc+vsymO69HVBKpVQqUR0r46
         HpNdbVv+NhnicNfHP1oU4QOG0ZZPvfZd5LhQOBzZQpd1oRRzBUWmivGFnu5Yt8/ZnRSM
         Pkzoc5nB/0XKnY7Ak2NdUaHi5UW9MMlFb9VnQ2ZZBLMzMsxwDIrhgKpj5LLQg0WBgOef
         4EJQ==
X-Forwarded-Encrypted: i=1; AHgh+RpzUhL1ibthhA9qpm8o6k6BqzUb9XUocxgfsTvbIIalt63AHKfnd0rERMJluuuJRm4ulwvaPn+ibcU/bvGXGc7v@lists.infradead.org
X-Gm-Message-State: AOJu0Ywd+HXV+v5HVhUkmQgUs9idrERZDTI/7GZnu1Id51ByXRYdOZzf
	6DGw+OptOynwmfEwII3WAsxhL/lPNZw0z9xuDZ2Q8624Z52HLtnmjV68
X-Gm-Gg: AfdE7ckKpiyfajup3GCnxdcxmOSpVQCSfjkqZGSOTu3fH2kASAjU2ActCBkPsJopGNy
	XnNSg+E1iq1wmwMvkz7eRIXsOBMpwZN2Gb+tnrh3fwEyOGg/Xe8+ftwjZi/R1NC+4Gdgeop0Rkv
	WTTi/fouACdtfJ1xHMFplxDN0tbMRNdfk0e/28G3hWt6zhKlTP8r8Lz0dYPsmj2HHhPfwdSv83F
	I8lx6HopgW9vFL43BssF4/SUjZr/z3ecyQslUjQrkWslkJuwRBSy3dbVqM4pdkG9H/hCz3LirCf
	LZEgM2FlgBWFKv3SpG5UnnUg8DzssSjkOC/0Y1PeBoEWRMA9ueq/zldOL8MiD6wK+kdK2QDPMo7
	n+3/WsvEoHeF8ccZsGcdri+bhMoJhvi/AMldmUh9vR1rkEvuqmSBMJQHN3n1vhQOUndHvfVIVhi
	YxDhyojDyahcrZM0w/Xi9emerylkj33sCRRMyLzOKei3abB/O44tpRqUtuIRbfw099zKg7o9PmW
	eJb7gldO766U3APgj8FH5GqHQ==
X-Received: by 2002:a05:600c:828c:b0:493:b8dd:9d68 with SMTP id 5b1f17b1804b1-493f87e6c8dmr141195505e9.10.1784046864939;
        Tue, 14 Jul 2026 09:34:24 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464a974csm11213909f8f.18.2026.07.14.09.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 09:34:24 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/3] dt-bindings: arm: fsl: add Variscite DART-MX8M-MINI Boards
Date: Tue, 14 Jul 2026 18:33:51 +0200
Message-ID: <3da78009acabb97ac871eb004319f08ebdcb7815.1784046629.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784046629.git.stefano.r@variscite.com>
References: <cover.1784046629.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_173427_138232_3456629E 
X-CRM114-Status: UNSURE (   9.42  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

Add DT compatible strings for Variscite DART-MX8MM SoM and Variscite
development carrier Board.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v2->v3:
 - 

v1->v2:
 - 

 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 6237fb2ae50e..648621348e55 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1064,6 +1064,12 @@ properties:
           - const: solidrun,imx8mm-sr-som
           - const: fsl,imx8mm
 
+      - description: Variscite DART-MX8MM based boards
+        items:
+          - const: variscite,var-dart-mx8mm-sonata # Variscite DART-MX8MM on Sonata Development Board
+          - const: variscite,var-dart-mx8mm # Variscite DART-MX8M-MINI SOM
+          - const: fsl,imx8mm
+
       - description: Variscite VAR-SOM-MX8MM based boards
         items:
           - const: variscite,var-som-mx8mm-symphony
-- 
2.47.3


