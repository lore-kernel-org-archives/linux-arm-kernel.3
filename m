Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 106D1C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 18:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bpXq6+eg5tvg1F9qpCoZtJ7h2TZAfgNg6/RIL3iNiQQ=; b=IdUsAMtL2NZiqEhUqDPJMR4DIJ
	AdisoV+n+1uSxz2denJ+ssuRH41rKt9PYZrcM+tnA4n293ufjjQTzG/8dAxFf5wt03hnN4TVBl4Ip
	v9UhgsUFcaWJWIOxrPc9PXFluA2Nhg75djO2V/zVLjDvSHdi/b6MRk2wef8R+Vp6khCA0L4+0hEOn
	nQtSHKP/qffvUlPMH9w6lhDPFyJO7NYXLcYKQ3pbQx2cWNttjzsuYaOQ5Y+LzmsFR7yqAyIQterAC
	/ShsCUf1EQX+bf5Afy7Z97v/pKY1IxHoaaPbYQZqsASPYcvazkhcZXG8UbO5G9wjYrIpDWoPfTG6m
	ycvI6y0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udvht-00000000Rmc-2Kvx;
	Mon, 21 Jul 2025 18:57:49 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uduvA-00000000OLq-0UW7;
	Mon, 21 Jul 2025 18:07:29 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3a528243636so2828369f8f.3;
        Mon, 21 Jul 2025 11:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753121246; x=1753726046; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bpXq6+eg5tvg1F9qpCoZtJ7h2TZAfgNg6/RIL3iNiQQ=;
        b=EgfYEZ8bdYaOMS5HMLXnBx4gSRdvLwXnUhz+ypXw0XlWgzZtObMumFcEqN/OuWCA3n
         3H5pUf1gHtOolbX4oNWRqc6BxlwB8Gcpmlbxx5ryzaiZ4u5de3oSH5Er+eYp/1wJZg8Z
         U0SYsBoY2prfPAfWLN0tdMmtwnaDOO/nGsRHJFO89q75WtCGKTaLl7jPdX6z2aq0MREq
         jaTSyvAGPWMHQW9WK0MYRbK56/Gsk4GowzjmP3sjtGAdgL2rRQ22N11w7gNsrK6DWRgs
         Pfgv2/0gbcQXwCILTVjELThSChE+D2TfRZYjXVIWlxryO1v1zfjNtsHByvOGMT9HT1o5
         KFkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753121246; x=1753726046;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bpXq6+eg5tvg1F9qpCoZtJ7h2TZAfgNg6/RIL3iNiQQ=;
        b=UWZLQYkiVS/V6PTsckRIfMu82R2Aicu9MtNVGQaIA5aYd5ffKp4VM1GblF9EkGeO8n
         RcOxyWSFlhmzuI548jpM/JX6asBDnluzuX8Vn+ZcUGyGLRGxUV1cK8YBHViZd9GKvQmG
         sZuZUeFOvcHPxwqDc9tOIWXpyTgkdqDxW0PZhBfa1zuOvbmCmL6W2oBMTPcYcTXnCXKb
         nddFqcjnpt1VmSJY0Froa5G/x1zH2+IsZmBuuvmmOntwjHnr8e+XYYnZi1ZIXqwua86m
         +G0bkP783i7WGYgCv9oG3b0wBwzc96rlbkLiiqcQGSeH/zgPNZeq+r2qPdZrD7ZkdbPY
         DB6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVTPr9SBxIz4go8vwBxuOOAdwDNJGYVTTLSYLXY/fHKFcxyGRNQmxXwfXltVK5Y2bGMCDQwX1qo8rQvpYOBRP+s@lists.infradead.org, AJvYcCXW5UsJNFQ7ZdYC6AOu/D/R9BYkBkfGC4D1sSghwdGQU9orfDDFg5aCSo6BbZKgbbPeuWrKh7fL6FPcgd8+HFc=@lists.infradead.org
X-Gm-Message-State: AOJu0YyOFgwsbmW5LXRFzdqaOXakroq1CcNWZ04EPmZ6jZ0OMUV7XEiQ
	LSrykvpx4eoUFVbLMsLxXeblBUu+E2c+oOth/bMRqhfcDkO3dcLYDoWhCeWsuw==
X-Gm-Gg: ASbGncvUa1vYAJmnErWwzoc0fSN63vMiTNaU8CVrkRAkD4wclkhJuiXMPIqAJuFJExI
	tVuuTutLL0Jxn/1BKbmLLdlEFbZJWX60sMmdqn2Ngj4cSfAihP+eE/5obNRoqsdaMV3fKfCgHbF
	2hsk7leBe7umuVriIXum8UF8Il6V0bm9mH4fLIsoGiys5C7SiBK8iDAhETJlHGYRpaqUtX+4i1U
	bixSzM/OKLGlMT6NCoTLEh5y10abYw9yh0P57wurSdd6VW0tpy0jA0JA5KU88SBpfFbrdhgD+R2
	5VNhslZxagid6SjLO+OxRfS3gWqzltzBCVUCEb6TiBMWJEcCeFmCAcewy6Zbpmf3NLioVFWipMk
	j18ZSlk6P3wnzcMlUnxavVOE=
X-Google-Smtp-Source: AGHT+IHLX+hGhgJq3pglvcmk9f8UypfiB0r68+BjcFY7GFFAJdEE4toG3w3gRJtCT/wiIl8UNiWi0Q==
X-Received: by 2002:a05:6000:2011:b0:3b7:5cae:52b3 with SMTP id ffacd0b85a97d-3b75cae530emr3707606f8f.57.1753121245802;
        Mon, 21 Jul 2025 11:07:25 -0700 (PDT)
Received: from Ansuel-XPS24 ([109.52.136.49])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3b61ca25443sm11183370f8f.9.2025.07.21.11.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 11:07:25 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stefan Roese <sr@denx.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v2 0/5] i2c: mt7621: improve support for Airoha
Date: Mon, 21 Jul 2025 20:05:51 +0200
Message-ID: <20250721180710.2116-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_110728_156767_14BA7C57 
X-CRM114-Status: UNSURE (   9.18  )
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

This small series improve support for Airoha SoC that use the
same MT7621 implementation. Some additional tweak are required
to better support it.

Also we add support for atomic variant of .xfer required for
some attached pheriperals on the Airoha SoC.

Changes v2:
- Fix compatible order for schema patch

Christian Marangi (5):
  i2c: mt7621: rework cmd/wait OPs to support atomic afer variant
  i2c: mt7621: clear pending interrupt on i2c reset
  dt-bindings: i2c: mt7621: Document an7581 compatible
  i2c: mt7621: limit SCL_STRETCH only to Mediatek SoC
  i2c: mt7621: make device reset optional

 .../bindings/i2c/mediatek,mt7621-i2c.yaml     | 14 +++-
 drivers/i2c/busses/i2c-mt7621.c               | 73 +++++++++++++------
 2 files changed, 64 insertions(+), 23 deletions(-)

-- 
2.50.0


