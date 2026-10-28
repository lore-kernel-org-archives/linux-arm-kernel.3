Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9866E606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 10:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TAAh9PwO;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u1lLMUf1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=fJvqHOk07FUa6s5/fD4Hq7cD2mBklo9gU81ggaCJZwE=; b=TAAh9PwOLnWXG3
	qJE5kzHjo6jSQaAQbDBnVoVvYWIfnTV7NwdGRkaoGHXTYX50w8ueBKq9GhexVxVJeOjj/P6hOwSBl
	Q6URvyFScaXlqtIw69FWfOFHzcFkwbMdf+gD9FRLVLb+K8jM8uemyCoe5lm2X3x2hwZg0jZ2XM0fL
	f+JDCljSBHh/Wh6kMG2YP617Ya487a3lipZOYt8Bj71HwqDuLjvQNLmGXfelkCX+WlqGVlwp3ENwc
	RWHvgNc5YfCbWh0WLvJRn1v7Ng3iNTwusbpSGURz5UdAoxncI4XHdB3RUhzENPXVloz+muUYpXyks
	phiOyP+rC1lxbtMwB61A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM0zO-00000006lc8-3l4u;
	Wed, 28 Oct 2026 10:34:38 +0000
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM0zN-00000006lbX-1TTU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 10:34:38 +0000
Received: by mail-dy1-x1332.google.com with SMTP id 5a478bee46e88-3550c917fd3so1152271eec.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 03:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793183676; x=1793788476; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fJvqHOk07FUa6s5/fD4Hq7cD2mBklo9gU81ggaCJZwE=;
        b=u1lLMUf15URu6373vjeKsLbdD6E+qcB1b2SA/y1r/ExpGtXff+0zDHGCR5JV2/am60
         wCrQUSJxC7SSoXimFNbEPRvtAtz5qhaDE7xstTMcx2YfF3XiWtq9tsKX4xOwIDPbG1X+
         uUnQURRRq7V1K+AjegnE5GG2e0xwwF/cRwUlN2pBGyrSWuk4KwL6w6nA5VYgQWprCIL2
         AG93WH4fUio6Emim2TeUKIkC+jHeuX29IT8xx4faI4bvTvtwzKi2bImrjrHqKGreFusU
         8tQRUi23gdAmYm/rO+mR4roV8lsA9jSQlrZ70VvySEEVOwwZQCpYWG5mAxMWRK/bskKo
         iIvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793183676; x=1793788476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fJvqHOk07FUa6s5/fD4Hq7cD2mBklo9gU81ggaCJZwE=;
        b=bt7wCN8D2RIXfJJuQcoX8YuwGfYRNtBdm0u3jBmIofMaN6EIn+URpWjkR1P+YMYRKa
         zhhC0rfiTvFWV6ZlcZVotEKFGee17UnuEoX4lq8RBEVR95lxHwVx3ljDprpCLmNvgOUi
         zcstN2nPCE3ehuGDc2TXr9lYQ+xZv8xeLKs9rHU9VyIbS3nabb2e4ZHGNI646E62SqFP
         iuFtXeCnaqkNMwebvp2lprUHQTgc3iEceLn1+qZrzlmWXUWSx1mPGj4APl2z77ML3gFA
         p5hapR5zeUvDpWQkHrVKw/bkbnNssPJ+11Bw117j9rYDJZK4Tt59xZO9c45t/wGauBgb
         rKug==
X-Forwarded-Encrypted: i=1; AKwUvBzbvN9RMfypWWwSBWPBOMAOIFebitPz32KgfFDr/cWXWePcHw+tDN5puGFIOJBHT2+N2DxituCGKrpKbZu9CeC8@lists.infradead.org
X-Gm-Message-State: AFq9FYJjpJow/qfPYhWkK1TXfDMY4JBcKfuRphRReTOIvXphhCIjD3KQ
	ZASA5+OpOLAjWTNu5hKXPp6xzQowXRYL4X24/eFpRt4cGhFZmLSNud//
X-Gm-Gg: AYBFou22JLvS4KH/I/P5u+6ClJiGoLn+R7XDGkGBEfg4J2frrzyoHZd6jtJt9x5MYKt
	bKbE0Y+g4uXOQQD6LRDIhv3oqRWd49UkP9GJhGt4d2yNcZz5qbEdXyxil1XvO+19TfeQKCWgdzu
	7VF6C/wYVqpzvS+Lh7GG+v+vJmrRRzXhJefg2HO3AOiPx75Y07+MyyScH4iTUiKYZJsmGljb6bC
	gVZDnm+KRZZr2q8GBDTsIaACIYDQDBWKz+/Xsf3abvSYbGyl2hjmxdFipMQ3anqA/VgFmqM70v+
	5D6bb25d5UIRE7EbbcaezXPKLuDNnDIYB6b9xDv9BswAtaBQmO7D8nNXMnaj+elliLPMPG5mWs3
	37X9Ev3s+Xyxx0OV9Or1bEW0i0Jf+W4Hdkv4LPOU3m4YI4xfcZ0ibYZ6u+kK+d63S92pxil57KZ
	bSceZi39JlATe1SwP/h2eZgVNkn+uMbg8eT+4egSyH2L8mjL1H7cq68ufF3Vd1IRKL/bpmUrHJ6
	FX8+q5LQ/J9pNrI7mMJO3rlLLo+2b4L9Pb3j3jt0BWkUwCTO0iTigoi5wABeCevrtyhOmXl4gru
	ea9CUxKiuKLm3SzY5x/e9gEuJk2Ei2SQtI6+f1WdeSxqV7wMXcY=
X-Received: by 2002:a05:7300:2406:b0:35c:8b96:94d9 with SMTP id 5a478bee46e88-36a203bd31bmr2926356eec.19.1793183675982;
        Wed, 28 Oct 2026 03:34:35 -0700 (PDT)
Received: from localhost.localdomain ([103.177.252.84])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a2399b05dsm5723047eec.25.2026.10.28.03.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 03:34:35 -0700 (PDT)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: mani@kernel.org
Cc: angelogioacchino.delregno@collabora.com,
	bhelgaas@google.com,
	kwilczynski@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-pci@vger.kernel.org,
	lpieralisi@kernel.org,
	matthias.bgg@gmail.com,
	robh@kernel.org,
	ryder.lee@mediatek.com,
	sreekuttan2156239@gmail.com
Subject: Re: [PATCH v4] PCI: mediatek: Fix integer truncation and handle oversized resources
Date: Wed, 28 Oct 2026 10:34:00 +0000
Message-ID: <20261028103400.2532-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <kfnxuro5xf4mhokabg773zcyp7otcjxwpzcn3dlo6y3kpv4uv4@bne4qf3vcif5>
References: <kfnxuro5xf4mhokabg773zcyp7otcjxwpzcn3dlo6y3kpv4uv4@bne4qf3vcif5>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_033437_390685_6A781D19 
X-CRM114-Status: UNSURE (   8.06  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Mani,
 
Thanks for the review.
 
I've addressed your comments in v5:
 
- Removed the redundant zero-size check.
- Changed `fls64(size - 1)` to `fls64(size)`.
- Kept the full resource size calculation and added validation to reject oversized windows rather than silently clamping the size order.

 
I'll send the updated patch shortly.
 
Best regards,
Sreeraj

