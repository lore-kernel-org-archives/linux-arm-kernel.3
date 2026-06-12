Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EF34CD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 20:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=; b=0KKDcWOkz9G9DfO1b+OCOSvNlD
	WHJhTOy6+vmc9D/WoXrXDX8O0OJ34bnKX0fd/GEJXJeUOrLyWlpGZyh7OD5PY2x7IqhZ8ZnHCOCIN
	Cgw8gvRooMYSrbCzv9sygP+nvSmfo4NOz87ewvRveYsahdGkK9HZgw/bx46n3+qfDEo6LtZcAC7dm
	1Lin5NKppjijsaF8t1l4tul/lI/bM4k4v6fkX+Wdi2Q75mdhFu5Zy1hOrjs/WVZUrpQJLZjLxZcsh
	sNl8H+IvDi5iOb2Ui2u5ZZiMog7NeiITc/2u8VM1hQ6OlZlTSm+gJGIRochvXBQJ9BjVLFcLM/xwV
	zihn0/FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY8SX-0000000BXm1-33cx;
	Fri, 12 Jun 2026 20:26:33 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY8ST-0000000BXkb-42N6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 20:26:31 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-45fd464d51fso788880f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 13:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781295988; x=1781900788; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=;
        b=aPZYiw/ANONrjy7EY5gJVHt14Rv5+6hBdeKInJUgf909DpnJmsSTwXHfHEzZc9V7zm
         hm2H+lwBSW3aqgTWHoEpVV7MLHwQ43zHr5qF4ZtDAvQPVA3ruxbw9bWQH2+M+s334lqk
         0TpwIl7C4iWf9++tie3gb+qcco1Iqp3tX+u1pd+ChA0v+SS8bvOcF6E2tTYoipEpWr0q
         lcJm1K9uP5j4H8rkgJ6Pp2XzFh2hRT7m3/VqdRXw84J76mc7y05Y5VX7RgMnPFs/ErAh
         ArwUf7s8dqOVGBM0HIgYkjOLGC+eW9URu3znxvyGuQefG+2Ek+d8LDc3Ud7IaLiOm2J0
         EPdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781295988; x=1781900788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=;
        b=p6gaYClA4/OTiwKdU6162pMbaLXEHDgjweMOtOHKzSoSQZo6T1bQKSuYX3ez5QqkhX
         d6jKS3Y5mCOsfJzevuZaI2ZygRRQ1On1o0XS1UPwIZJs+ifpZCDC1glujmOuGKrWAnec
         s079NR/oXBGSxMcRMPidDKPM8dwNaXFxVlr+P0P/FaD4qPm9RXN84H9lyLupgaPEOHiQ
         CnlREtm2H1P+lj/loPTaeE0wMT7q3sAQMYAAzGxsBT6KSaQ3MZV+R++XEwaiJyW1jJoa
         usnIhwCmS09vX2nafoPQ/qvGzsHsDWGzcfsMU3ACqyJPiGfSk963x4710GS0R9iXC/+4
         ZlwA==
X-Forwarded-Encrypted: i=1; AFNElJ8f4D6CrwSbW+Nu8jVH0L95LPeE+QJX9Xj6DnlhrSa2KwyB/BxARaFJRCAfDXLrAHUp6PJahUCyyw5DTyR1ELaV@lists.infradead.org
X-Gm-Message-State: AOJu0YxSTLd0ielDS383ldzoHhy9F47yVmfvrOvHmvcBLPa3kA5DPSpv
	GJVEhIk+RZNZ10SCBnyfPq22k95K6etbg0Un60judsKDzJxUIiy3FPWY
X-Gm-Gg: Acq92OF6zTvjkdZq8QwfSxJ/IXS83GV8lCUcffK07BZ6TMBFw3E2TF+WllOh5oRLHbP
	4h8G9+sOcATD1oTfiL5ooR5hK6sCW9XaZX8voH/y4hM22yaCHDEJNkfzNi0kPqoWUotOcW+Fcl7
	/LdYleW8jSm+eD2dbg7FUczwS5S3z9Pp1dq2Knb7KraLHr0weT8rzH8oRZTFN/+rOA6TONY48KP
	QsjPg4Df5TAq91Svz1aagmzXr2P6gzE8+v3t6jBA/gdV+GtemtQQWqep6U7bbdA1+AnMe2pr2LQ
	Dju46vnDMkfPk+mpt9lsUIVocevqeGur2oNHxCpXyfg74ijfOhyuK5U1RpcIIfEWnOQkxm5gSC/
	zebFcT7A4U9GNfl4s0+My4FV9NcMH1hEI4tAOez7bICt+XBm2yLIW/OBOvAEflTGyVGwwxIILjI
	ptUOUE0qksyA3fxZNG
X-Received: by 2002:a5d:59aa:0:b0:460:6731:6165 with SMTP id ffacd0b85a97d-4607796858emr866095f8f.22.1781295987798;
        Fri, 12 Jun 2026 13:26:27 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26434dsm9173261f8f.1.2026.06.12.13.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 13:26:27 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Fabien Parent <parent.f@gmail.com>,
	Val Packett <val@packett.cool>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Julien Massot <julien.massot@collabora.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v6 2/7] dt-bindings: input: mtk-pmic-keys: Add MT6392 PMIC keys
Date: Fri, 12 Jun 2026 22:04:07 +0200
Message-ID: <20260612200717.361018-3-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260612200717.361018-1-l.scorcia@gmail.com>
References: <20260612200717.361018-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_132630_050124_72837D2A 
X-CRM114-Status: UNSURE (   9.83  )
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

From: Fabien Parent <parent.f@gmail.com>

Add the binding documentation of mtk-pmic-keys for the MT6392 PMIC.

Signed-off-by: Fabien Parent <parent.f@gmail.com>
Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
index 140a862ecfbe..ff720588128b 100644
--- a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
+++ b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
@@ -31,6 +31,7 @@ properties:
           - mediatek,mt6357-keys
           - mediatek,mt6358-keys
           - mediatek,mt6359-keys
+          - mediatek,mt6392-keys
           - mediatek,mt6397-keys
       - items:
           - enum:
-- 
2.43.0


