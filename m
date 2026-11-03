Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3047E606A327
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 02:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eNrwSHBy;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TCHdwEWB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=r7CZHsFtToEeDraAns18SBV26Wozlx1z/SodGdtdGHQ=; b=eNrwSHBycPr6dZ1FNiJ4TbcZdH
	ZDWAeH68kwxx0DsRAFcT3J3SZfwINeCY+sM0vCvhDfm9pmFmduLENGxIJkAN5ywYSn4vBp3+nG0Sq
	vNPfGqCzwq1aFPk1nj0AbwcJ4TzLkd9XJ0H41HSMeeStu+JA/XJKVqBocEwDColNFpUja1otECyF3
	h7N8cpq/WTx55hfw7+UdT87gKf+ClBQ9Nej/BTktg0KkypFzRmCl+VdGAxI9i1W8E/X3tAuXtR+18
	YQItYDMBL/0EnvsHE+l9P97zE7S2K2f9J5LgHn9XQeWBMaKcJPHnroFo6jGFdxVYZi4x7aDuCmWp2
	Cn3u9aFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO4AE-00000000rr5-1uc5;
	Tue, 03 Nov 2026 02:22:18 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO4AB-00000000rqf-0UNI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 02:22:16 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-3ae1b34e0d2so107912a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 18:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793672534; x=1794277334; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r7CZHsFtToEeDraAns18SBV26Wozlx1z/SodGdtdGHQ=;
        b=TCHdwEWB50Y4LGwQ1OKWHA9lZDCRQa9e1g6lxnxYpqlTF5SlrhywZEqKPCAtOH5tPJ
         O7HZ8lH6QRl01zjLKUVZw7lrheJNLtM2nvn9xOrfJH458hVpM4vtulj8Y5DGk0Xr4iMz
         twZgkRS5YKuIRY2GLeqe5Lw4o31QFiCnAL075egWskcvFCABseaFiQvM007LMFPrYH7h
         cZ1EcmppQ82hdXAdbaa7VOAgwpfQJZ+IVQ7BKTj4AE6lQvSJJwPHfmjD2W1IfElzBzC8
         fYcmQZzBEHYQWy9CMh3PuT2hwOLkNNWpOiQkJI2a3KajjR8bOvY8H1kPxzgdWTnEsxvh
         gPWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793672534; x=1794277334;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r7CZHsFtToEeDraAns18SBV26Wozlx1z/SodGdtdGHQ=;
        b=W7zHvDe+d7yeThJCf3fnaqq0RBBnbuOHV15ZuthBgWKyi0cyTLpX310kvXGK40rGOg
         9CtSuxXakxMt4MCm8Zsk1eFzUEZmY/uq5yJ7o9N8JXMDP/1N/z4gXfWwGn5Rvj0tnHyX
         wDlDRBDXljLFLLgC6aFaBncFkvlSuH7Zy4dOAIJ8qklTJEE2FRIAIiu0QgtTT5zi7Kk6
         rCzCFGJstdF60U+GdlWj1F79kW3w6AtVl9lQEnEpxfNXDnxW/pJVqWJZWLygjIxw6uyA
         5OMa+Uz8Lk/5lYHQeOdXDPW0CEnZOhIogG8e5jrQnjzqeVYZ6c8JiuPHRnZPvkC/apyP
         tz7w==
X-Forwarded-Encrypted: i=1; AKwUvBxlBiOkb4BpdpFsAKN9mv40Qp2+KtCR1KyZ9krk1nPc+xQpGaePTc8p96WGGSQdM++o2EpJo6cAf4jQoy4o3ksc@lists.infradead.org
X-Gm-Message-State: APuU4Z/1mvoTiesIlickl24qGRDjV9mTG3yjSPbVSm525zTelHYBVrVt
	RPMzCzp+SQ8aNxa0/id0cx29d2KXhX6YDDoedHO6Xq+/uGiu9vzSfAls
X-Gm-Gg: AYBFou0YiVB4y5tI9be8/gT9Y2kjdHSUV7hJwhHmMQcBtvJ/bdqy7r74jarCPtUF4Wb
	lPlHxzVsclo2pRacAfrWb0vM4fwt7NiesG9fffDTgfFkUks/i/JmwhpNtGQdW2Nf3r5Cb42DKpw
	mclWy5DX5lGQ94MuI+/iWBgeW5RlAjnbraagZs3O8OZ8NZeVMrl5qslPZnn4FZH/2ONttfzXLau
	Kinhp4zEnvStXfPSyAlUSZW012Os0az5S7Z+eVi//YEvdnfiZj9PoUXKRwfyHW1PSdp0olF7/gQ
	iKAlSRfgZo0zqFrM/wZtBVpcgYueas8Y0IgNHoAkXm7opznyNn6WPrHINy7X8qREYFEsjS+Jj9e
	iU96pE3ygG/2dkcQRQRI+QYv2WXt9+c6/rKVfiKWqCg/lug0pUhc0UVT7vXXBvGa8nO+kAQzDTQ
	SMq3VeFUQmkQIveHtTW3tcFREPPklae4upXRW3xf3xOdE1QaXSdMHeiouqb7DwqfZtMgCLhF/Yg
	5j/4q1/fbd6NjCAq+e5/JJqqfCuOXhX0MRCz9lA6kstdkTLc6ReQt6AO1RlzpezBr9Mzqlv4Q/m
	fSH+UErQW4ixLB6lsKIiMF8eAqoIyPwSGEzex6gcKqSk2JaGEEi/bvgy9B6Cj2sjxZPYvNYE6KY
	RPqXwbgJNTjKkd+E=
X-Received: by 2002:a17:90b:55ce:b0:3ae:3f20:7058 with SMTP id 98e67ed59e1d1-3ae897bafd5mr6113235a91.36.1793672533832;
        Mon, 02 Nov 2026 18:22:13 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c7dea24sm1570124a91.5.2026.11.02.18.22.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 18:22:13 -0800 (PST)
From: Shan-Chun Hung <shanchun1218@gmail.com>
To: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	vkoul@kernel.org,
	Frank.Li@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	kees@kernel.org,
	gustavoars@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Cc: Shan-Chun Hung <shanchun1218@gmail.com>
Subject: [PATCH 0/2] dmaengine: ma35d1-pdma: Add MA35D1 PDMA driver
Date: Tue,  3 Nov 2026 10:22:00 +0800
Message-Id: <20261103022202.2139674-1-shanchun1218@gmail.com>
X-Mailer: git-send-email 2.25.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_182215_158032_266FB85F 
X-CRM114-Status: GOOD (  10.90  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series adds the PDMA controller driver and DT binding for the
Nuvoton MA35D1 SoC.

The driver supports memcpy, slave scatter-gather and cyclic transfers,
and a per-channel timeout configured through
dma_slave_config.peripheral_config. The timeout is needed by the
MA35D1 UART driver, to be submitted separately.

Tested on the MA35D1 SOM board with Linux v7.4-rc1, using local
(not yet submitted) QSPI and UART patches that use this PDMA driver.

Signed-off-by: Shan-Chun Hung <shanchun1218@gmail.com>

Shan-Chun Hung (2):
  dt-bindings: dma: nuvoton,ma35d1-pdma: Document MA35D1 PDMA controller
  dmaengine: ma35d1-pdma: Add MA35D1 PDMA driver

 .../bindings/dma/nuvoton,ma35d1-pdma.yaml     |  72 ++
 drivers/dma/Kconfig                           |  12 +
 drivers/dma/Makefile                          |   1 +
 drivers/dma/ma35d1-pdma.c                     | 780 ++++++++++++++++++
 include/dt-bindings/dma/ma35d1-pdma.h         | 113 +++
 include/linux/dma/ma35d1-pdma.h               |  24 +
 6 files changed, 1002 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/nuvoton,ma35d1-pdma.yaml
 create mode 100644 drivers/dma/ma35d1-pdma.c
 create mode 100644 include/dt-bindings/dma/ma35d1-pdma.h
 create mode 100644 include/linux/dma/ma35d1-pdma.h

--
2.25.1


