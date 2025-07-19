Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3AE5C83F34
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Jul 2025 13:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6tRD2NjwF/ZY6OMgZJ+7iJIY+EsBKkYIsMF0P2zsbU4=; b=DGjbzpPRyPWYD38dI1pZRt5bR8
	g8NrJ8rLfG9g+AES5SgmJ3XUFiB+Jdo/3eBot2U65r8mYJPZhISCiZudzTWpE5+kFVjsOEy1O6BAu
	tfItvUgrfU4SB3uey20lKTv4ecuk7ewVfYMdX5cL5sVy+JntHcOJC18tvgGMfmYshOwSOG4Cc5fnd
	LfWScRZiys5DuhMpVw5fv9+rhQi9j04kAY3bku1gRDyeLo+PZndW1njIU9DCrzCrSfb4hRejtzflr
	MIKRayAg0erPqrTsc+A6T8LGY95cQOld//bbpOC9u3UiRK4MXGxLZ5Nxd5WSL1B2yuH15NjAb+Hon
	PfbnKinQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ud7C8-0000000EHDh-1AsM;
	Sat, 19 Jul 2025 13:01:40 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ud778-0000000EGSY-32kB;
	Sat, 19 Jul 2025 12:56:31 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-45555e3317aso17775375e9.3;
        Sat, 19 Jul 2025 05:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752929789; x=1753534589; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6tRD2NjwF/ZY6OMgZJ+7iJIY+EsBKkYIsMF0P2zsbU4=;
        b=GNrZZPG3/vC2O7ZLXaxJg/FqEbJly7dUBcgH2wlAfxi5kX5jrv1ChsZorh3P3JqQ0t
         t1QyLPWKlhpSMZ6NBmHOMrY7gB3N/4SVY63pb8llnO2nwAAZ+9eRvQ1yY1DTnTY9lF5o
         +gbVtPAJ5edA9wyYDdXVvYiq9YlrZxj+8buaQq8GLuMb2pAyQAZWh3QRyi+gcQyjMDQM
         7dMqbqNumVAgP0EVxbhTR2rfy1aJZKTH/JI9f8geI7DHmfyO3z/9s5ZehwupnMvd9Wos
         Pq7UfmwRqkex8+f5NN5Ckz+sTz+cKjNB5FHAiMIwYgsDdA6DkYjLLmYraJ1eSnjvtrCI
         b9sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752929789; x=1753534589;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6tRD2NjwF/ZY6OMgZJ+7iJIY+EsBKkYIsMF0P2zsbU4=;
        b=wX/kj1JUPLGLmPxTGINR2fFoAvln0u6WfIsu47XByfUx8cHy+oNjSRWERPrvD62miT
         CbufwTaLikEvrQvZaBV+TLDxO6xk68Z8/BV9pAcKPEBquuFaCU9BIu1ztIVTQFkmXsVA
         GVkFWQot/o2nszb7++TmoTljQhZmowFWXGQ6MUN/mEWXHW73YabIyrvyPSmrESt/+rpv
         L0LGMdDerKD4R/5ZHstEc9CP290A7WX9dcYAiqEqKRh93Xxy0UkQ/9r3KxYQepu2KD/A
         +BozBylq06bAn7kbULgc5lhWvgMgCjxm19yI+wvT8AH/f4TBoo1gqPyKoHcqWlqNB08F
         rEpg==
X-Forwarded-Encrypted: i=1; AJvYcCUNr76G1kI0nbaS1ZPHZaogBgqJEf0JSy2G7bFyyoHagcXALmkBUzcVxC8PZzetF0Hr+VQDH9wELgCwUG+WjbhE@lists.infradead.org, AJvYcCXurTjfnRiCsWcYvbZNiLIotkUlhpwd+ijUCN0q+e8+pbZ9XzH4Y1qQXUZTBknQ5alL28+49jUdtp/fyPBp/dc=@lists.infradead.org
X-Gm-Message-State: AOJu0YxPRqCG1cZk9Hr5iqEvZgNzB5P4AujuXcWRwrbXFe5uvCdFsNrh
	r8EbcgZmaiL8guiCtE8UQEzri1ekiz5ICze/VKTWsOGIfACiu0vLVxA0
X-Gm-Gg: ASbGncvoa8q1lbTBwfQM+4HY4m/hX5hlPRXwErrBPxlhDd8ISpWbwb/jjAJf3vRpXEe
	qk56Zq7SuasJa5861rTJhiXHMfyFn7ZUm8m+PGqIKEqHdZ257dfuoaryuKGA7pH6QXjLqEY+eDV
	WIBRXIaUT+Es97smSuzBkiK3UhRLpaFws4aSbmH46AAI+KrT+P/OlvtzfQX+pr1BfpIzepO87Sd
	JDtBp1XkymDCt6RZJMfJQCpY2hhlrVWAJiMxBmV6j/6h9o9s9+b2B1M6i71IlJmhq9qiqa16vq5
	RRay0WcuXioiEqgqvAhpY79ucWk6ugMhkTLrUpJCs9Ybjp0glJz8FYoM9HSkr6Ab5eQiFKtGjhz
	Uxr+xjiWcXqkun51DmA+sM2PwKzvJPXkPi2+f83jytPSU9dC5C36OfB1THMSmT5DKTG13w3JUbe
	jE
X-Google-Smtp-Source: AGHT+IHVyPkrAti3KBxeHDF8a+lPaonZM2AISJ3Gso95EOaofsGKgLel2/059sZfO6yPadPZS8bCNQ==
X-Received: by 2002:a05:600c:3b88:b0:456:25aa:e9c0 with SMTP id 5b1f17b1804b1-4562e355c9bmr144021685e9.14.1752929788390;
        Sat, 19 Jul 2025 05:56:28 -0700 (PDT)
Received: from Ansuel-XPS24 (host-212-171-170-230.retail.telecomitalia.it. [212.171.170.230])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4562e81ccb4sm106688005e9.17.2025.07.19.05.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Jul 2025 05:56:27 -0700 (PDT)
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
Subject: [PATCH 0/5] i2c: mt7621: improve support for Airoha
Date: Sat, 19 Jul 2025 14:56:10 +0200
Message-ID: <20250719125617.8886-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250719_055630_765561_2EA487F1 
X-CRM114-Status: UNSURE (   8.58  )
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


