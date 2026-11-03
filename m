Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6110606A324
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 04:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Da7t47Pp;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=F6NYyGD5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=PGfNJvt0jz4lC2WFoydgyKQ9YHvmNk2PJYm3FO57IiU=; b=Da7t47PpYiIqUdIH892Y2Po7b2
	qjfO8msOo7qxBfUF2wM5UtJA2oPIWK5ls124nEQxkU56EUHZCCgO5dxkWyIZu1KFR/9HVNd/mNPdt
	gBorhUYbSR0byUhoMgopQ1op1VO9CzFaumDWWuob2nwXQhpnOva3QMh99TB86araUED1W90kUtvpH
	GG5X52TYTGNb3zlV5GPHO4uAG9u8N8/c/dV5vpDTTOpLJiLehTU/siOv9/24+uLBgVV2/c4tfouW8
	OLzLMJc+ybanjYyozeWj558JBcfoccI0v4M6p+If8I5cZ4Z8/jxUXzg52BI7MI6MXpHFeKdiSq7pI
	/7eQpXhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO66M-000000012cg-49gn;
	Tue, 03 Nov 2026 04:26:29 +0000
Received: from mail-dy1-x1345.google.com ([2607:f8b0:4864:20::1345])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO66A-000000012b0-1BJ4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 04:26:18 +0000
Received: by mail-dy1-x1345.google.com with SMTP id 5a478bee46e88-36637676140so5143378eec.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 20:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793679973; x=1794284773; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PGfNJvt0jz4lC2WFoydgyKQ9YHvmNk2PJYm3FO57IiU=;
        b=F6NYyGD5ECGJtGsQpIhG8rwZfGVTIGcqtL9iN+6SypEa96sNpIO0bem4Z9uERPVy3Q
         +surFJb+0QUyD2Nsxi7z3wsgqa7Q1d8sVxx3mOziRjFcwzy5AZVKMTbeuKRnZlI8xzcC
         YbM0uRw7BvdJ8Un+gZzV0qJUBPXdlmDa4kboUbRuSRvF3glFiQjQHRut8Cxho4bPYEK1
         G5VECiiwzg8C/gNsxpgot72dAC9I49327FlFE+k9XOqV4JTDhPuKsqQm9pk9N2sgftZq
         FibQIT+MtHF5u9EiPQkskb4cbV2cUoxGgyCi8GAHhpKKzvVdOrVbz0241cFXXE4arcvr
         4AyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793679973; x=1794284773;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PGfNJvt0jz4lC2WFoydgyKQ9YHvmNk2PJYm3FO57IiU=;
        b=CJJ+EhjLDrF3+dGTcOIG1rg7a+z3sIU+5xSP64Z6nKHYp468Ey6D0+NQ52Av5LQbEr
         +vZdO99Uq2RfLidFqoOvpv7BXvY4RwA+ytQKJFSsOs+BefKiwY1rqBYYJLuZ1O6lfNtJ
         n26JjjvQyYsKyYIiC1SMZ0K/81PHwcGiRGgFIebojikbjWqYUMY/Sx2qQwNcssQzm0oI
         ZS1uzAGlyjUfBytytZYkY/DyEU/PJ4drY9oh3BJzhXYQuQQH9CaiHKQEggbysJY+qClj
         MLgBqYhC9yr/dV/m4Q89Cm6sez4vdC9sgtg4tZvO4dpKgYCXJXUd+6ZStWcDIxgfyvav
         iIMQ==
X-Forwarded-Encrypted: i=1; AKwUvBx4xqDqhKOPzk5LoapQqjt0l67paBBcas8Co7u1W3eftWDSlUavxaYcfqp2ywbVMbXoq/M3kAyu4AcmT/8uOI5W@lists.infradead.org
X-Gm-Message-State: AFq9FYK/VZ9TShd0+PPQuqHSoAS6xjOu3cglKWc6B076jOngSgfrFa4j
	u2gXmYJ5FWNG/MtfCC1w0lk3Wu8ZLEqMNL7QerqjjhsgildypZV6oa+iACnU3wVaDJv0kMZ17Cz
	DDVop4Iz+/bVMChe7FZC5hgoZKtEm16WZQg==
X-Received: from dybb7.prod.google.com ([2002:a05:693c:6087:b0:35d:1771:4816])
 (user=vamshigajjela job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7300:c01c:10b0:36a:50ec:db3f with SMTP id 5a478bee46e88-36a50ecdd21mr16735703eec.7.1793679972480;
 Mon, 02 Nov 2026 20:26:12 -0800 (PST)
Date: Tue,  3 Nov 2026 09:56:04 +0530
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261103042608.387626-1-vamshigajjela@google.com>
Subject: [PATCH 0/3] spmi: Add SmartDV SPMI controller driver and bindings
From: vamshi gajjela <vamshigajjela@google.com>
To: Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Jim Wylder <jwylder@google.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Vamshi Gajjela <vamshigajjela@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_202614_519033_DEC7614D 
X-CRM114-Status: GOOD (  11.30  )
X-Spam-Score: -9.5 (---------)
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
X-Spam-Status: No, score=-21.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Vamshi Gajjela <vamshigajjela@google.com>

This series adds Device Tree bindings and a controller driver for the
SmartDV IP Solutions MIPI System Power Management Interface (SPMI) master
controller ("smartdv,spmi").

This IP is integrated in Google Tensor SoCs starting with the G5
generation (codename: laguna, canonically written as "lga",
"google,lga-spmi") to communicate with on-board Power Management ICs
(PMICs).

The controller supports MIPI SPMI v1.0 and v2.0 non-data bus commands
(RESET, SLEEP, SHUTDOWN, WAKEUP), register read/write, extended register
read/write, and extended register read/write long transfers up to 16 bytes.

Patch 1/3 adds the "smartdv" vendor prefix to vendor-prefixes.yaml.
Patch 2/3 documents the Device Tree bindings for the SmartDV SPMI
controller ("smartdv,spmi" and "google,lga-spmi").
Patch 3/3 adds the spmi-smartdv controller driver.

Vamshi Gajjela (3):
  dt-bindings: vendor-prefixes: Add smartdv
  dt-bindings: spmi: Add SmartDV SPMI controller
  spmi: Add SmartDV SPMI controller driver

 .../bindings/spmi/smartdv,spmi.yaml           | 126 +++++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |   7 +
 drivers/spmi/Kconfig                          |  10 +
 drivers/spmi/Makefile                         |   1 +
 drivers/spmi/spmi-smartdv.c                   | 525 ++++++++++++++++++
 6 files changed, 671 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spmi/smartdv,spmi.yaml
 create mode 100644 drivers/spmi/spmi-smartdv.c

-- 
2.56.0.317.g454f8302e1-goog


